create or replace PROCEDURE CALCULO_PRECIO_MONEDA AS 

ultima_moneda number;
nuevo_precio number;
fecha date;

BEGIN

ultima_moneda := 32;

--Trae la fecha del dia actual
SELECT CURRENT_DATE INTO fecha from dual;
        
--Esto esta incompleto
    WHILE ultima_moneda != 1
    LOOP
    
        Begin 
            SELECT AVG(t.datos_monedas.precio)
            INTO nuevo_precio
            FROM transaccion t
            WHERE t.fecha>(sysdate - 1 / 1440) and t.id_moneda = ultima_moneda
            GROUP BY t.id_moneda;
            exception 
            when no_data_found then
            nuevo_precio := 0;
        End;
        
        DBMS_OUTPUT.put_line(nuevo_precio);
        
        IF nuevo_precio!=0 THEN
        
            INSERT INTO 
            THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = ultima_moneda) 
            VALUES
            (historialp(nuevo_precio,fecha));
        
        END IF;
        
        
        
        ultima_moneda:=ultima_moneda-1;
    END LOOP;


  NULL;
END CALCULO_PRECIO_MONEDA;