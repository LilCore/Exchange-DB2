CREATE OR REPLACE PROCEDURE SIMULACION_TRANSACCION AS 
--Define si sera una compra o una venta
aleatorio number;

--ID del mercado
mercado_id number;

--Nomrbe del meracdo
mercado_nombre varchar(5);

--ID de la moneda
moneda_id number;

--ID del usuario que hace la transaccion
usuario_id number;

--Fecha del dia actual
fecha date;

--ID de la primera cartera a revisar
cartera_id number;

--ID de la segunda cartera a revisar
cartera2_id number;

--Cantidad disponible que tiene la cartera con la que se va a comprar
cantidad_disp number;

--Cantidad a vender/comprar
cantidad_ventacompra number;

--ID de la moneda que tiene su propio mercado
mercado_ventacompra_id number;



BEGIN
 
    --Selecciona un numero ramdon entre, 1 o 2 para identificar una venta o una compra 
    SELECT ROUND(dbms_random.value(1,1.9))
    INTO aleatorio
    FROM dual;
    
    
    --Trae un x mercado(se comprará/venderá la moneda de dicho mercado)
    SELECT id_mercado,nombre_mercado
    INTO mercado_id,mercado_nombre
    FROM (SELECT id_mercado,nombre_mercado FROM mercado ORDER BY DBMS_RANDOM.VALUE)
    WHERE rownum=1;
    
    --Trae una x moneda correspondiente al mercado anterior(se comprará CON dicha moneda o se venderá dicha moneda)
    SELECT id_moneda
    INTO moneda_id
    FROM (SELECT id_moneda FROM mer_mon WHERE id_mercado=mercado_id ORDER BY DBMS_RANDOM.VALUE)
    WHERE rownum=1;
    
    --Para forzar las transacciones
    --mercado_id:=35;
    --mercado_nombre:='KTN';
    
    --Trae un usuario cualquiera
    SELECT id_usuario
    INTO usuario_id
    FROM (SELECT id_usuario FROM usuario ORDER BY DBMS_RANDOM.VALUE)
    WHERE rownum=1;
    
    --Trae la fecha del dia actual
    SELECT CURRENT_DATE INTO fecha from dual;
        
    
    --Verifica si es una venta o una compra    
    --Compra la moneda del mercado con la moneda
    IF aleatorio = 1 THEN 
    
        --Verifico si el usuario tiene una cartera con la moneda que se usará para comprar
         Begin 
            SELECT id_cartera,cantidad
            INTO cartera_id,cantidad_disp
            FROM cartera
            WHERE id_usuario=usuario_id and id_moneda=moneda_id;
            exception 
            when no_data_found then
            cartera_id := 0;
        End;
        
        --Verifico si el usuario tiene una cartera con la moneda que va a comprar
        SELECT id_moneda
        INTO mercado_ventacompra_id
        FROM moneda
        WHERE abreviatura=mercado_nombre;  
             
        Begin 
            SELECT id_cartera
            INTO cartera2_id
            FROM cartera
            WHERE id_usuario=usuario_id and id_moneda=mercado_ventacompra_id;
            exception 
            when no_data_found then
            cartera2_id := 0;
        End;
        
            --Si contiene una cartera con la moneda que se usará para comprar
            IF cartera_id != 0 THEN
                      
                --Selecciona un numero ramdon entre 0.1 y la cantidad de la moneda a vender que esta en la cartera  
                SELECT dbms_random.value(0.1,cantidad_disp)
                INTO cantidad_ventacompra
                FROM dual;
                
                    --Si compro con todos los recursos
                    IF (cantidad_disp-cantidad_ventacompra) <= 0 THEN 
                        DELETE FROM cartera
                        WHERE id_cartera=cartera_id;
                    END IF;
                
                --Se resta la cantidad con la que se compró
                UPDATE cartera
                SET cantidad = cantidad-cantidad_ventacompra
                WHERE id_cartera=cartera_id;
                
                --Compra
                INSERT INTO TRANSACCION
                (tipo,fecha,datos_monedas,id_cartera,id_moneda)
                VALUES
                (1,fecha,datosm(cantidad_ventacompra,1),cartera_id,mercado_ventacompra_id);
                            
                
                    --Verifica si tiene una cartera con la moneda que esta comprando
                    --No tiene cartera de la moneda a comprar 
                    IF cartera2_id = 0 THEN
                
                        --Ya que no tiene cartera de la moneda que se esta comprando se inserta una nueva
                        INSERT INTO CARTERA
                        (id_usuario,id_moneda,cantidad)
                        VALUES
                        (usuario_id,mercado_ventacompra_id,cantidad_ventacompra);
                        
                        --Venta
                        INSERT INTO TRANSACCION
                        (tipo,fecha,datos_monedas,id_cartera,id_moneda)
                        VALUES
                        (2,fecha,datosm(cantidad_ventacompra,1),seq_cartera.CurrVal,moneda_id);
                                                       
                    --Tiene cartera con la moneda a comprar
                    ELSE
                    
                        UPDATE cartera
                        SET cantidad = cantidad+cantidad_ventacompra
                        WHERE id_cartera=cartera2_id ;
                        
                        --Venta
                        INSERT INTO TRANSACCION
                        (tipo,fecha,datos_monedas,id_cartera,id_moneda)
                        VALUES
                        (2,fecha,datosm(cantidad_ventacompra,1),cartera2_id,moneda_id);
                       
                    END IF;
                                            
            END IF;
        
        
    --------------------------------------------------------------------------------------------------------------------------    
    --Vende la moneda del mercado con la moneda
     ELSE      
                           
        --Verifico si el usuario tiene una cartera con la moneda que va a comprar
        SELECT id_moneda
        INTO mercado_ventacompra_id
        FROM moneda
        WHERE abreviatura=mercado_nombre;  
             
        Begin 
            SELECT id_cartera,cantidad
            INTO cartera_id,cantidad_disp
            FROM cartera
            WHERE id_usuario=usuario_id and id_moneda=mercado_ventacompra_id;
            exception 
            when no_data_found then
            cartera_id := 0;
        End;
        
        --Verifico si el usuario tiene una cartera con la moneda que se va a comprar
         Begin 
            SELECT id_cartera
            INTO cartera2_id
            FROM cartera
            WHERE id_usuario=usuario_id and id_moneda=moneda_id;
            exception 
            when no_data_found then
            cartera2_id := 0;
        End;
     
         --Si contiene una cartera con la moneda que se usará para comprar
            IF cartera_id != 0 THEN
                      
                --Selecciona un numero ramdon entre 0.1 y la cantidad de la moneda a vender que esta en la cartera  
                SELECT dbms_random.value(0.1,cantidad_disp)
                INTO cantidad_ventacompra
                FROM dual;
                
                    --Si compro con todos los recursos
                    IF (cantidad_disp-cantidad_ventacompra) <= 0 THEN 
                        DELETE FROM cartera
                        WHERE id_cartera=cartera_id;
                    END IF;
               
                --Se resta la cantidad con la que se compró
                UPDATE cartera
                SET cantidad = cantidad-cantidad_ventacompra
                WHERE id_cartera=cartera_id;
                
                --Compra
                INSERT INTO TRANSACCION
                (tipo,fecha,datos_monedas,id_cartera,id_moneda)
                VALUES
                (1,fecha,datosm(cantidad_ventacompra,1),cartera_id,moneda_id);
                               
                
                    --Verifica si tiene una cartera con la moneda que esta comprando
                    --No tiene cartera de la moneda a comprar 
                    IF cartera2_id = 0 THEN
                
                        --Ya que no tiene cartera de la moneda que se esta comprando se inserta una nueva
                        INSERT INTO CARTERA
                        (id_usuario,id_moneda,cantidad)
                        VALUES
                        (usuario_id,moneda_id,cantidad_ventacompra);
                        
                        --Venta
                        INSERT INTO TRANSACCION
                        (tipo,fecha,datos_monedas,id_cartera,id_moneda)
                        VALUES
                        (2,fecha,datosm(cantidad_ventacompra,1),seq_cartera.CurrVal,mercado_ventacompra_id);
                                                       
                    --Tiene cartera con la moneda a comprar
                    ELSE
                    
                        UPDATE cartera
                        SET cantidad = cantidad+cantidad_ventacompra
                        WHERE id_cartera=cartera2_id ;
                        
                        --Venta
                        INSERT INTO TRANSACCION
                        (tipo,fecha,datos_monedas,id_cartera,id_moneda)
                        VALUES
                        (2,fecha,datosm(cantidad_ventacompra,1),cartera2_id,mercado_ventacompra_id);
                       
                    END IF;
                                            
            END IF;       
        
    END IF;             
     

  NULL;
END SIMULACION_TRANSACCION;