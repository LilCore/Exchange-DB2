create or replace PROCEDURE ASINCRONIA AS 

  ln_dummy number := 0;

BEGIN

 ln_dummy := ln_dummy + 1;


loop
  --DBMS_JOB.SUBMIT(ln_dummy, 'begin TRANSACCION_MARKET(); end;');
  --DBMS_JOB.SUBMIT(ln_dummy, 'begin TRANSACCION_LIMIT(); end;');
  --DBMS_JOB.SUBMIT(ln_dummy, 'begin TRANSACCION_MARKET2(); end;');
  DBMS_JOB.SUBMIT(ln_dummy, 'begin TRANSACCION_LIMIT2(); end;');
  COMMIT;
end loop;  
  
END ASINCRONIA;