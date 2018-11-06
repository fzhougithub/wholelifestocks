create schema pf;

-- mkdir /Users/frank.zhou/postgres/data/test
create tablespace test owner "wls" location '/Users/frank.zhou/postgres/data/test';

create database test with owner='wls' encoding = 'utf8' tablespace = test ;

-- Tablespace: fz

-- DROP TABLESPACE fz;

CREATE TABLESPACE fz
  OWNER "frank.zhou"
  LOCATION '/Users/frank.zhou/postgres/data/fz';

ALTER TABLESPACE fz
  OWNER TO "frank.zhou";

-- Database: fzdb

-- DROP DATABASE fzdb;

CREATE DATABASE fzdb
    WITH 
    OWNER = "frank.zhou"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = fz
    CONNECTION LIMIT = -1;

-- Table: public.tmp_bar_t1

-- DROP TABLE public.tmp_bar_t1;

CREATE TABLE public.tmp_bar_t1
(
    seq integer,
    flag character(1) COLLATE pg_catalog."default",
    low numeric,
    high numeric,
    volume numeric
)
WITH (
    OIDS = FALSE
)
TABLESPACE fz;

ALTER TABLE public.tmp_bar_t1
    OWNER to wls;

-- Table: public.symbol_list

-- DROP TABLE public.symbol_list;

CREATE TABLE public.symbol_list
(
    symbol character(6) COLLATE pg_catalog."default" NOT NULL,
    name character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT symbol_list_pkey PRIMARY KEY (symbol)
        USING INDEX TABLESPACE fz
)
WITH (
    OIDS = FALSE
)
TABLESPACE fz;

ALTER TABLE public.symbol_list
    OWNER to wls;


-- Table: public.pf_bars_t1

-- DROP TABLE public.pf_bars_t1;

CREATE TABLE public.pf_bars_t1
(
    symbol character(6) COLLATE pg_catalog."default" NOT NULL,
    seq integer NOT NULL,
    flag character(1) COLLATE pg_catalog."default",
    high numeric,
    low numeric,
    volume numeric,
    CONSTRAINT pf_bars_t1_pk PRIMARY KEY (symbol, seq)
        USING INDEX TABLESPACE fz
)
WITH (
    OIDS = FALSE
)
TABLESPACE fz;

-- Table: public.pf_bars_t1_info

-- DROP TABLE public.pf_bars_t1_info;

CREATE TABLE public.pf_bars_t1_info
(
    symbol character(6) COLLATE pg_catalog."default" NOT NULL,
    seq integer NOT NULL,
    step numeric,
    s_date date,
    e_date date,
    CONSTRAINT pf_bars_t1_info_pkey PRIMARY KEY (symbol, seq)
        USING INDEX TABLESPACE fz
)
WITH (
    OIDS = FALSE
)
TABLESPACE fz;

ALTER TABLE public.pf_bars_t1_info
    OWNER to wls;

ALTER TABLE public.pf_bars_t1
    OWNER to wls;


-- FUNCTION: public.show_up_candidates()

-- DROP FUNCTION public.show_up_candidates();

CREATE OR REPLACE FUNCTION public.show_up_candidates(
	)
    RETURNS SETOF character 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

declare
  ref refcursor; 
  r char(6);
  v_symbol char(6);
  v_seq integer;
  v_final numeric;
  v_before_final numeric;
begin
  open ref for  select symbol,seq,volume from pf_bars_t1 where (symbol,seq) in (select symbol,max(seq) from pf_bars_t1 group by symbol) and flag='x';
  loop
      fetch ref into v_symbol,v_seq,v_final;
        EXECUTE 'SELECT volume FROM pf_bars_t1 WHERE symbol = $1 AND seq = $2' into v_before_final using v_symbol,v_seq-1;
        if v_before_final < v_final then
          r:=v_symbol;
          return next r;
        end if;
        EXIT WHEN NOT FOUND;
  end loop;
 return;
end;

$BODY$;

ALTER FUNCTION public.show_up_candidates()
    OWNER TO wls;

create table pf_bars_t1_set ( stime date,etime date,step numeric) inherits(pf_bars_t1);

-- The table is according to tushare.get_hist_data(symbol) function, pandas dataframe
create table s_history(
symbol char(6),
tdate date,
o numeric,
c numeric,
h numeric,
l numeric,
v numeric,
primary key (symbol,tdate)
);

create table s_basic(
symbol char(6),
name char(10),
industry varchar(20),
area varchar(20),
pe numeric,
outstanding numeric,
totals numeric,
totalAssets numeric,
liquidAssets numeric,
fixedAssets numeric,
reserved numeric,
reservedPerShare numeric,
esp numeric,
bvps numeric,
pb numeric,
timeToMarket  date,
undp  numeric,
perundp numeric,
rev  numeric,
profit numeric,
gpr numeric,
npr numeric,
holders integer,
primary key(symbol)
);

-- FUNCTION: public.s_history_finalday(character)

-- DROP FUNCTION public.s_history_finalday(character);
-- FUNCTION: public.s_history_finalday(character)

-- DROP FUNCTION public.s_history_finalday(character);

CREATE OR REPLACE FUNCTION public.s_history_finalday(
	v_symbol character)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

declare
r text;

begin
  select case when max(tdate) is null then '1990-01-01' else max(tdate) end into r from s_history where symbol=v_symbol;
  return r;
end;

$BODY$;

ALTER FUNCTION public.s_history_finalday(character)
    OWNER TO "frank.zhou";

-- FUNCTION: public.s_history_finalday(character)

-- DROP FUNCTION public.s_history_finalday(character);

CREATE OR REPLACE FUNCTION public.s_history_finalday(
	v_symbol character)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

declare
r text;

begin
  select case when max(tdate) is null then '1990-01-01' else max(tdate) end into r from s_history where symbol=v_symbol;
  return r;
end;

$BODY$;

ALTER FUNCTION public.s_history_finalday(character)
    OWNER TO "frank.zhou";

create unique index u1_pf_bars_t1 on pf_bars_t1(symbol,flag,bar_s,bar_e);

create type s_history_type as (tdate text,open text,close text,high text,low text,volumn text);


