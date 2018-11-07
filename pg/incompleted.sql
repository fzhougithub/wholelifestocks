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
  v_low3 numberic;
  v_low2 numeric;
  v_low1 numeric;
  i integer;
  v_symbol char(6);
  v_seq integer;
  v_h_final numeric;
  v_h_before_final numeric;
  v_v_final numeric;
  v_v_before_final numeric;
begin
  if lower(direction)='up' then
  open ref for select symbol,high,volume from (select *,row_number() over (partition by symbol) as row from pf_bars_t1_desc where flag='x') t where row<4;
  loop
      fetch ref into v_symbol,v_high;
	    EXIT WHEN NOT FOUND;
		if t_symbol <> v_symbol then
		  i=0;
		  v_higha
		  t_symbol=v_symbol;
		  
        EXECUTE 'SELECT volume FROM pf_bars_t1 WHERE symbol = $1 AND seq = $2' into v_v_before_final using v_symbol,v_seq-1;
        if v_v_before_final < v_v_final then
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
