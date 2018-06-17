create or replace PROCEDURE SIMULACION_TRANSACCION AS 


aleatorio number;

usuario_id number;
moneda_id number;
cartera_id number;

fecha date;

BEGIN
 
    SELECT CURRENT_DATE INTO fecha from dual;
   
    SELECT dbms_random.value(0,2)
    INTO aleatorio
    FROM dual;
    
    SELECT id_moneda
    INTO moneda_id
    FROM (SELECT id_moneda FROM moneda ORDER BY DBMS_RANDOM.VALUE)
    WHERE rownum=1;
    
    SELECT id_usuario
    INTO usuario_id
    FROM (SELECT id_usuario FROM usuario ORDER BY DBMS_RANDOM.VALUE)
    WHERE rownum=1;
    
     Begin
        SELECT id_cartera
        INTO cartera_id
        FROM cartera
        WHERE id_usuario=usuario_id and id_moneda=moneda_id;
        exception 
        when no_data_found then
        cartera_id := 0;
     End;
    
    --Si no existe la cartera entonces la crea, si existe le suma el monto de la compra
    IF cartera_id = 0 THEN  
    
        INSERT INTO CARTERA
        (id_usuario,id_moneda,cantidad)
        VALUES
        (usuario_id,moneda_id,aleatorio);
        
        INSERT INTO TRANSACCION
        (tipo,fecha,datos_monedas,id_cartera,id_moneda)
        VALUES
        (1,fecha,datosm(aleatorio,1),seq_cartera.CurrVal,moneda_id);
        
    ELSE    
    
        UPDATE cartera
        SET cantidad = cantidad+aleatorio
        WHERE id_cartera = cartera_id ;
        
        INSERT INTO TRANSACCION
        (tipo,fecha,datos_monedas,id_cartera,id_moneda)
        VALUES
        (1,fecha,datosm(aleatorio,1),cartera_id,moneda_id);
    
    END IF;

--DBMS_OUTPUT.put_line(moneda_id)--;
--DBMS_OUTPUT.put_line(usuario_id);
--DBMS_OUTPUT.put_line(cartera_id);



  NULL;
END SIMULACION_TRANSACCION;