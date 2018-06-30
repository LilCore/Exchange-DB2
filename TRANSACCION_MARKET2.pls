create or replace PROCEDURE TRANSACCION_MARKET2 AS 
--Define si sera una compra o una venta--
compra_o_venta number;

--ID de la moneda-- 
moneda_id number;

--ID del mercado al cual pertenece la moneda--
mercado_id number;

--ID del mercado como moneda(id de la moneda)--
id_monedamercado varchar(5);

--ID's de las carteras de intercambio
id_cartera1 number;
id_cartera2 number;

--Cantidades de las carteras de intercambio
cantidad_cartera_1 number;
cantidad_cartera_2 number;

--Precios en dolares de las monedas en la transaccion
precio_moneda1 number;
precio_moneda2 number;

--Cantidad a vender/comprar
cantidad_ventacompra number;

--Id de los usuarios para revisar existencia de carteras de compra/venta
user_id1 number;
user_id2 number;

--ID de la primera transaccion insertada
id_transaccion number;

--Contenedor
contenedor number;

fecha date;
BEGIN
 
    --Selecciona un numero ramdon entre, 1 o 2 para identificar una venta o una compra 
    SELECT ROUND(dbms_random.value(1,1.9))
    INTO compra_o_venta
    FROM dual;
        
    --Trae una cartera y datos de ella
    SELECT id_moneda,id_cartera,cantidad,id_usuario
    INTO moneda_id,id_cartera1,cantidad_cartera_1,user_id1
    FROM (SELECT id_moneda,id_cartera,cantidad,id_usuario FROM cartera WHERE cantidad>0 ORDER BY DBMS_RANDOM.VALUE)
    WHERE rownum=1;
    
    --Trae un mercado a el cual pertenece la moneda y el id de ese mercado como moneda
    SELECT m.id_mercado,mon.id_moneda
    INTO mercado_id,id_monedamercado
    FROM mer_mon mm
    INNER JOIN mercado m ON mm.id_mercado !=1 and mm.id_mercado = m.id_mercado and mm.id_moneda=moneda_id
    INNER JOIN moneda mon ON m.nombre_mercado = mon.abreviatura 
    WHERE rownum=1;
             
    --Trae el precio en dolares de la moneda 
    SELECT HP.precio  
    INTO precio_moneda1
    FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = moneda_id) HP
    WHERE HP.fecha=(SELECT MAX(HP2.fecha) FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = moneda_id) HP2);--debe ser el ultimo 
                         
    --Trae el precio en dolares de la monedamercado
    SELECT HP.precio 
    INTO precio_moneda2
    FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = id_monedamercado) HP
    WHERE HP.fecha=(SELECT MAX(HP2.fecha) FROM THE(SELECT historico_precio FROM mer_mon WHERE id_mercado = 1 and id_moneda = id_monedamercado) HP2);--debe ser el ultimo 
      
    
      
    --Selecciona un numero ramdon entre 0.1 y la cantidad de la moneda 1 
    SELECT dbms_random.value(0.1,cantidad_cartera_1)
    INTO cantidad_ventacompra
    FROM dual;  
   
    --Trae una cartera con la otra moneda
    SELECT id_cartera,cantidad,id_usuario 
    INTO id_cartera2,cantidad_cartera_2,user_id2
    FROM (SELECT id_cartera,cantidad,id_usuario FROM cartera WHERE id_usuario!=user_id1 and
        id_moneda=id_monedamercado and cantidad >= (precio_moneda1/precio_moneda2*cantidad_ventacompra) ORDER BY DBMS_RANDOM.VALUE)
    WHERE rownum=1;
    
    
    --Trae la fecha del dia actual
    SELECT CURRENT_DATE INTO fecha from dual;
        
   
        --Compra con la moneda 1 la moneda 2
        IF compra_o_venta = 1 then
               
        --Moneda que se está comprando
            INSERT INTO TRANSACCION
            (tipo,fecha,datos_monedas,id_cartera,id_moneda)
            VALUES
            (1,fecha,datosm(precio_moneda1/precio_moneda2*cantidad_ventacompra,precio_moneda2),id_cartera2,id_monedamercado);
                
            id_transaccion := seq_transaccion.CurrVal;   
                
            --Moneda con la cual se está comprando   
            INSERT INTO TRANSACCION
            (tipo,fecha,datos_monedas,id_cartera,id_moneda,numero_transaccion_asociada)
            VALUES
            (2,fecha,datosm(cantidad_ventacompra,precio_moneda1),id_cartera1,moneda_id,id_transaccion);
            
            --Se altera la primera transaccion con el id de la ultima transaccion
            UPDATE TRANSACCION 
            SET numero_transaccion_asociada = id_transaccion + 1
            WHERE numero_transaccion = id_transaccion; 
 -------------------------------------------------------------------------------------------------------------------------       
        --Compra con la moneda 2 la moneda 1
        ELSE
            
            --Moneda que se está comprando
            INSERT INTO TRANSACCION
            (tipo,fecha,datos_monedas,id_cartera,id_moneda)
            VALUES
            (2,fecha,datosm(precio_moneda1/precio_moneda2*cantidad_ventacompra,precio_moneda2),id_cartera2,id_monedamercado);
                
            id_transaccion := seq_transaccion.CurrVal;   
                
            --Moneda con la cual se está comprando   
            INSERT INTO TRANSACCION
            (tipo,fecha,datos_monedas,id_cartera,id_moneda,numero_transaccion_asociada)
            VALUES
            (1,fecha,datosm(cantidad_ventacompra,precio_moneda1),id_cartera1,moneda_id,id_transaccion);
            
            --Se altera la primera transaccion con el id de la ultima transaccion
            UPDATE TRANSACCION 
            SET numero_transaccion_asociada = id_transaccion + 1
            WHERE numero_transaccion = id_transaccion; 
        
        END IF;
       
    
     
          --Suma o resta de las carteras, indiferentemente quien compre o venda
           /* UPDATE cartera 
            SET cantidad = cantidad - cantidad_ventacompra
            WHERE id_cartera=id_cartera1;   
             
             Begin
                SELECT id_cartera
                INTO contenedor
                FROM cartera
                WHERE id_usuario=user_id1 and id_moneda=id_monedamercado;
                exception 
                when no_data_found then
                contenedor := 0;
             End; 
             
             IF contenedor !=0 THEN
                 UPDATE cartera 
                 SET cantidad = cantidad + precio_moneda1/precio_moneda2*cantidad_ventacompra
                 WHERE id_cartera=contenedor; 
                 
             ELSE
                  INSERT INTO CARTERA
                 (id_usuario,id_moneda,cantidad)
                  VALUES
                 (user_id1,id_monedamercado,precio_moneda1/precio_moneda2*cantidad_ventacompra);         
             END IF;
             

              UPDATE cartera 
              SET cantidad = cantidad - precio_moneda1/precio_moneda2*cantidad_ventacompra
              WHERE id_cartera=id_cartera2;
              
  
             Begin
                SELECT id_cartera
                INTO contenedor
                FROM cartera
                WHERE id_usuario=user_id2 and id_moneda=moneda_id;
                exception 
                when no_data_found then
                contenedor := 0;
             End;
             
              
              IF contenedor !=0 THEN
                 UPDATE cartera 
                 SET cantidad = cantidad + cantidad_ventacompra
                 WHERE id_cartera=contenedor; 
             ELSE
                 INSERT INTO CARTERA
                 (id_usuario,id_moneda,cantidad)
                  VALUES
                 (user_id2,moneda_id,cantidad_ventacompra);         
             END IF;*/
     
  NULL;
END TRANSACCION_MARKET2;