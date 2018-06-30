create or replace PROCEDURE TRANSACCION_LIMIT AS 
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

--Precios en dolares de las monedas en la transaccion
precio_moneda1 number;
precio_moneda2 number;

--Nuevo precio en dolares de la moneda a comprar
nuevo_precio_moneda number;

--Nueva cantidad con la que se esta comprando
nueva_cantidad_moneda number;

--ID de la primera transaccion insertada
id_transaccion number;


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
                
                
                --Trae el precio en dolares de la moneda con la que se está comprando
                SELECT HP.precio  
                INTO precio_moneda1
                FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = moneda_id) HP
                WHERE HP.fecha=(SELECT MAX(HP2.fecha) FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = moneda_id) HP2);--debe ser el ultimo 
                       
                
                --Trae el precio en dolares de la moneda que se está comprando
                SELECT HP.precio 
                INTO precio_moneda2
                FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = mercado_ventacompra_id) HP
                WHERE HP.fecha=(SELECT MAX(HP2.fecha) FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = mercado_ventacompra_id) HP2);--debe ser el ultimo 
                
                
                --Calcula un nuevo precio en dolares para la moneda a comprar           
                SELECT dbms_random.value(precio_moneda2/2,precio_moneda2*2)
                INTO nuevo_precio_moneda
                FROM dual;
                
                
                --Calcula una nueva cantidad con la que se está comprando en base al nuevo precio de la moneda de compra
                nueva_cantidad_moneda := (nuevo_precio_moneda/precio_moneda1)*(cantidad_ventacompra*precio_moneda1/precio_moneda2);
                
                              
                --Verifíca si la nueva cantidad de monedas aun existe dentro de la cartera    
                IF  (nueva_cantidad_moneda) > cantidad_disp
                THEN 
                NULL;
                END IF;
                    
                    
                --Se resta la cantidad con la que se compró
                UPDATE cartera
                SET cantidad = cantidad-nueva_cantidad_moneda
                WHERE id_cartera=cartera_id;
                     
                                                            
                --Venta-moneda (comprando con)(esto es una venta)
                INSERT INTO TRANSACCION
                (tipo,fecha,datos_monedas,id_cartera,id_moneda)
                VALUES
                (2,fecha,datosm(nueva_cantidad_moneda,precio_moneda1),cartera_id,moneda_id);               
                                                                     
                    --Verifica si tiene una cartera con la moneda que se está comprando
                    --No tiene cartera de la moneda a comprar 
                    IF cartera2_id = 0 THEN
                
                        --Ya que no tiene cartera de la moneda que se está comprando se inserta una nueva
                        INSERT INTO CARTERA
                        (id_usuario,id_moneda,cantidad)
                        VALUES
                        (usuario_id,mercado_ventacompra_id,cantidad_ventacompra*precio_moneda1/precio_moneda2);
                        
                        --Compra-moneda (compra de)
                        INSERT INTO TRANSACCION
                        (tipo,fecha,datos_monedas,id_cartera,id_moneda,numero_transaccion_asociada)
                        VALUES
                        (1,fecha,datosm((cantidad_ventacompra*precio_moneda1/precio_moneda2),nuevo_precio_moneda),seq_cartera.CurrVal,mercado_ventacompra_id,seq_transaccion.CurrVal);
                          
                         id_transaccion := seq_transaccion.Currval;      
                                             
                         --Se altera la tabla con el id de la ultima transaccion
                        UPDATE TRANSACCION 
                        SET numero_transaccion_asociada = id_transaccion
                        WHERE numero_transaccion = id_transaccion - 1;                      
                                                       
                    --Tiene cartera con la moneda a comprar
                    ELSE
                    
                        UPDATE cartera
                        SET cantidad = cantidad+(cantidad_ventacompra*precio_moneda1/precio_moneda2)
                        WHERE id_cartera=cartera2_id ;
                        
                        --Compra-moneda (compra de)
                        INSERT INTO TRANSACCION
                        (tipo,fecha,datos_monedas,id_cartera,id_moneda,numero_transaccion_asociada)
                        VALUES
                        (1,fecha,datosm((cantidad_ventacompra*precio_moneda1/precio_moneda2),nuevo_precio_moneda),cartera2_id,mercado_ventacompra_id,seq_transaccion.CurrVal);
                        
                        id_transaccion := seq_transaccion.Currval;      
                                             
                         --Se altera la tabla con el id de la ultima transaccion
                        UPDATE TRANSACCION 
                        SET numero_transaccion_asociada = id_transaccion
                        WHERE numero_transaccion = id_transaccion - 1; 
                       
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
                              
                               
                --Trae el precio en dolares de la moneda con la que se está comprando             
                SELECT HP.precio  
                INTO precio_moneda1
                FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = mercado_ventacompra_id) HP
                WHERE HP.fecha=(SELECT MAX(HP2.fecha) FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = mercado_ventacompra_id) HP2);--debe ser el ultimo
                
                --Trae el precio en dolares de la moneda que se está comprando             
                SELECT HP.precio  
                INTO precio_moneda1
                FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = moneda_id) HP
                WHERE HP.fecha=(SELECT MAX(HP2.fecha) FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = moneda_id) HP2);--debe ser el ultimo

                 --Calcula un nuevo precio en dolares para la moneda a comprar           
                SELECT dbms_random.value(precio_moneda2/2,precio_moneda2*2)
                INTO nuevo_precio_moneda
                FROM dual;
                
                
                --Calcula una nueva cantidad con la que se está comprando en base al nuevo precio de la moneda de compra
                nueva_cantidad_moneda := (nuevo_precio_moneda/precio_moneda1)*(cantidad_ventacompra*precio_moneda1/precio_moneda2);
                
                              
                --Verifíca si la nueva cantidad de monedas aun existe dentro de la cartera    
                IF  (nueva_cantidad_moneda) > cantidad_disp
                THEN 
                NULL;
                END IF;
                    
                --Se resta la cantidad con la que se compró
                UPDATE cartera
                SET cantidad = cantidad-nueva_cantidad_moneda
                WHERE id_cartera=cartera_id;
                     
                                                       
                --Venta-moneda (comprando con)(esto es una venta)
                INSERT INTO TRANSACCION
                (tipo,fecha,datos_monedas,id_cartera,id_moneda)
                VALUES
                (2,fecha,datosm(nueva_cantidad_moneda,precio_moneda1),cartera_id,mercado_ventacompra_id);               


                    --Verifica si tiene una cartera con la moneda que esta comprando
                    --No tiene cartera de la moneda a comprar 
                    IF cartera2_id = 0 THEN
                
                        --Ya que no tiene cartera de la moneda que se esta comprando se inserta una nueva
                        INSERT INTO CARTERA
                        (id_usuario,id_moneda,cantidad)
                        VALUES
                        (usuario_id,moneda_id,(cantidad_ventacompra*precio_moneda1/precio_moneda2));
                        
                                  
                        --Compra-moneda (compra de)
                        INSERT INTO TRANSACCION
                        (tipo,fecha,datos_monedas,id_cartera,id_moneda,numero_transaccion_asociada)
                        VALUES
                        (1,fecha,datosm((cantidad_ventacompra*precio_moneda1/precio_moneda2),nuevo_precio_moneda),seq_cartera.CurrVal,moneda_id,seq_transaccion.CurrVal);
          
                   
                        id_transaccion := seq_transaccion.Currval;      
                                             
                         --Se altera la tabla con el id de la ultima transaccion
                        UPDATE transaccion 
                        SET numero_transaccion_asociada = id_transaccion
                        WHERE numero_transaccion = id_transaccion - 1; 
                                                       
                    --Tiene cartera con la moneda a comprar
                    ELSE
                    
                        UPDATE cartera
                        SET cantidad = cantidad+(cantidad_ventacompra*precio_moneda1/precio_moneda2)
                        WHERE id_cartera=cartera2_id ;
                        
                        --Compra-moneda (compra de)
                        INSERT INTO TRANSACCION
                        (tipo,fecha,datos_monedas,id_cartera,id_moneda,numero_transaccion_asociada)
                        VALUES
                        (1,fecha,datosm((cantidad_ventacompra*precio_moneda1/precio_moneda2),nuevo_precio_moneda),cartera2_id,moneda_id,seq_transaccion.CurrVal);
                       
                        id_transaccion := seq_transaccion.Currval;      
                                             
                         --Se altera la tabla con el id de la ultima transaccion
                        UPDATE transaccion 
                        SET numero_transaccion_asociada = id_transaccion
                        WHERE numero_transaccion = id_transaccion - 1; 
                       
                    END IF;
                                            
            END IF;       
        
    END IF;             
  NULL;
END TRANSACCION_LIMIT;