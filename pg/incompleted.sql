CREATE OR REPLACE FUNCTION public.show_suprt_v(
	direction character)
    RETURNS SETOF character 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

declare
  ref refcursor; 
  r char(6);
  v_flag char(1);
  v_symbol char(6);
  v_rown integer;
  v_high numeric;
  v_volume numeric;
begin
  open ref for select symbol,flag,(high+low),volume,rown from (select *, row_number() over (partition by symbol) as rown from pf_bars_t1_desc limit 10) t where rown<6;
 
 ----- need to be think about and implement below. 
  loop
    fetch ref into v_symbol,v_flag,v_high,v_volume,v_rown;
	  EXIT WHEN NOT FOUND;
	  if lower(direction)='up' then
    	  case v_rown
	        when 1 then
		    when 2 then
		    when 3 then
		    when 4 then
		    when 5 then
	      end case;
	  end if;
	  if lower(direction)='down' then
    	  case v_rown
	        when 1 then
		    when 2 then
		    when 3 then
		    when 4 then
		    when 5 then	  
	  end if;
  end loop;  
  return;
end;

$BODY$;