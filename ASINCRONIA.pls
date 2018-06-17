CREATE OR REPLACE PROCEDURE ASINCRONIA AS 

  ln_dummy number := 0;

BEGIN

 ln_dummy := ln_dummy + 1;


loop
  DBMS_JOB.SUBMIT(ln_dummy, 'begin SIMULACION_TRANSACCION(); end;');
  COMMIT;
end loop;  
  
END ASINCRONIA;