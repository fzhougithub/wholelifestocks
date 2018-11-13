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

-- Below function took long time, lots of tricky, better keep it before recall all of the logic
-- FUNCTION: public.update_pf_bars_t1(character)

-- DROP FUNCTION public.update_pf_bars_t1(character);

CREATE OR REPLACE FUNCTION public.update_pf_bars_t1(
	v_symbol character)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

declare
  r integer;
  n integer;
  l_symbol text;
  l_seq integer;
  n_seq integer;
  l_flag character;
  l_high numeric;
  l_low numeric;
  l_volume numeric;
  l_bar_s date;
  l_bar_e date;
  n_cnt integer;
  i integer;
  query text;
  ref refcursor;
begin
  execute 'select count(1) from pf_bars_t1 where symbol=$1' into n using v_symbol;
  if n=0 then
    execute 'insert into pf_bars_t1 select $1,index,bars_flag,bars_h,bars_o,bars_v,to_date(bars_s,''yyyy-mm-dd''),to_date(bars_e,''yyyy-mm-dd'') from tmp_pf_bars_t1 on conflict (symbol,flag,bar_s,bar_e) DO NOTHING' using v_symbol;			 
  else
    execute 'select symbol,seq,flag,bar_s,bar_e from pf_bars_t1 where symbol=$1 and bar_s=(select max(bar_s) from pf_bars_t1 where symbol=$1)' into l_symbol,l_seq,l_flag,l_bar_s,l_bar_e using v_symbol;
	execute 'select count(1) from tmp_pf_bars_t1 where to_date(bars_s,''yyyy-mm-dd'') >= (select max(bar_s) from pf_bars_t1 where symbol=$1)' into r using v_symbol;
	if r>=1 then
--	  execute 'delete from pf_bars_t1 where symbol=$1 and seq=$2' using l_symbol,l_seq;
--	  execute 'insert into pf_bars_t1 select $1,$2,bars_flag,bars_h,bars_o,bars_v,to_date(bars_s,''yyyy-mm-dd''),to_date(bars_e,''yyyy-mm-dd'') from tmp_pf_bars_t1 where bars_s=(select max(bars_s) from tmp_pf_bars_t1)' using l_symbol,l_seq;
--    else if r>1 then
--	  query:='select tdate,o,c,h,l,v from s_history where symbol=$1 order by tdate';
--	  open ref for execute query using v_symbol;
--	end if;
      query:='select bars_flag,bars_h,bars_o,bars_v,to_date(bars_s,''yyyy-mm-dd''),to_date(bars_e,''yyyy-mm-dd'') from tmp_pf_bars_t1 where to_date(bars_s,''yyyy-mm-dd'')>=(select max(bar_s) from pf_bars_t1 where symbol=$1) order by to_date(bars_s,''yyyy-mm-dd'')';
      open ref for execute query using v_symbol;
      execute 'delete from pf_bars_t1 where symbol=$1 and seq=$2' using l_symbol,l_seq;
	  i:=0;
      loop
	    fetch ref into l_flag,l_high,l_low,l_volume,l_bar_s,l_bar_e;
	      EXIT WHEN NOT FOUND;
		  n_seq:=l_seq+i;
		  execute 'insert into pf_bars_t1 values($1,$2,$3,$4,$5,$6,$7,$8)' using l_symbol,n_seq,l_flag,l_high,l_low,l_volume,l_bar_s,l_bar_e;
          i:=i+1;
	  end loop;
	end if;
  end if;
  return i;	
end;

$BODY$;

ALTER FUNCTION public.update_pf_bars_t1(character)
    OWNER TO "frank.zhou";

create view pf_bars_t1_now as select * from pf_bars_t1 where (symbol,seq) in (select symbol,max(seq) from pf_bars_t1 group by symbol);

create view pf_bars_t1_desc as select * from pf_bars_t1 order by symbol,seq desc;

create view s_history_finalday as select * from (select *,row_number() over (partition by symbol) as rown from s_history_desc) t where rown<2

create view s_history_desc as select * from s_history order by symbol,tdate desc;

create table candidate(symbol char(10),cdate date,type char(10),comments text,primary key(symbol,cdate,type));

CREATE OR REPLACE FUNCTION public.show_bar_big(direction character
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
  v_h_final numeric;
  v_h_before_final numeric;
  v_v_final numeric;
  v_v_before_final numeric;
begin
  if lower(direction)='up' then
    open ref for select symbol,seq,volume from pf_bars_t1 where (symbol,seq) in (select symbol,max(seq) from pf_bars_t1 group by symbol) and flag='x';
  elsif lower(direction)='down' then
    open ref for select symbol,seq,volume from pf_bars_t1 where (symbol,seq) in (select symbol,max(seq) from pf_bars_t1 group by symbol) and flag='o';
  end if;
  loop
    fetch ref into v_symbol,v_seq,v_v_final;
	  EXIT WHEN NOT FOUND;
      EXECUTE 'SELECT volume FROM pf_bars_t1 WHERE symbol = $1 AND seq = $2' into v_v_before_final using v_symbol,v_seq-1;
      if v_v_before_final < v_v_final then
        r:=v_symbol;
        return next r;
      end if;
  end loop;
  return;
end;

$BODY$;

ALTER FUNCTION public.show_up_candidates()
    OWNER TO wls;

CREATE OR REPLACE FUNCTION public.show_tripple_break(direction character
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
  v_higha numeric[] := array[1,2,3];
  v_high numeric;
  v_high3 numeric;
  v_high2 numeric;
  v_high1 numeric;
  v_low numeric;
  v_low3 numeric;
  v_low2 numeric;
  v_low1 numeric;
  v_v3 numeric;
  v_v2 numeric;
  v_v1 numeric;
  v_volume numeric;
  i integer;
  v_symbol char(6);
  v_seq integer;
  v_row integer;
  p numeric;
begin
  if lower(direction)='up' then
    open ref for select symbol,high+low,volume,rown from (select *,row_number() over (partition by symbol) as rown from pf_bars_t1_desc where flag='x') t where rown<4;
    loop
      fetch ref into v_symbol,v_high,v_volume,v_row;
	    EXIT WHEN NOT FOUND;
		case v_row 
		  when 1 then 
		    v_high1=v_high;
			v_v1=v_volume;
			v_high2=0;
			v_high3=0;
		  when 2 then v_high2=v_high;v_v2:=v_volume;
		  when 3 then 
		    v_high3=v_high;v_v3:=v_volume;
			
		    if v_high3>0 and abs((v_high2 - v_high3)/v_high3)<0.02 and v_high1 >= v_high2 and v_high1>=v_high3 then
		      return next v_symbol;
		    end if;
		end case;
	end loop;
  elsif lower(direction)='down' then
    open ref for select symbol,low,volume,rown from (select *,row_number() over (partition by symbol) as rown from pf_bars_t1_desc where flag='o') t where rown<4;
    loop
      fetch ref into v_symbol,v_low,v_volume,v_row;
	    EXIT WHEN NOT FOUND;
		case v_row 
		  when 1 then 
		    v_low1=v_low;
			v_v1=v_volume;
			v_low2=0;
			v_low3=0;
		  when 2 then v_low2=v_low;v_v2:=v_volume;
		  when 3 then 
		    v_low3=v_low;v_v3:=v_volume;
		    if v_low3>0 and abs((v_low2 - v_low3)/v_low3)<0.02 and v_low1 <= v_low2 and v_low1<=v_low3 then
		      return next v_symbol;
		    end if;
		end case;
	end loop;
  end if;
 return;
end;

$BODY$;

ALTER FUNCTION public.show_up_candidates()
    OWNER TO wls;


create type r_min_max as (v1 double precision,v2 double precision);

create table pf_bars_pr as select * from pf_bars_t1 limit 0;
create table tmp_pf_bars_pr as select * from tmp_pf_bars_t1 limit 0;

alter table pf_bars_pr add constraint pk_pf_bars_pr primary key(symbol,seq);
create unique index u1_pf_bars_pr on pf_bars_pr(symbol, flag, bar_s, bar_e);
