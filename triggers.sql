CREATE OR REPLACE TRIGGER tri_usuario
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
   :NEW.id_usuario := seq_usuario.NextVal;
   :NEW.dni := seq_dni.NextVal;
END;
/ 
CREATE OR REPLACE TRIGGER tri_cartera
BEFORE INSERT ON cartera
FOR EACH ROW
BEGIN
   :NEW.id_cartera := seq_cartera.NextVal;
END;
/
CREATE OR REPLACE TRIGGER tri_orden
BEFORE INSERT ON orden
FOR EACH ROW
BEGIN
   :NEW.numero_orden := seq_orden.NextVal;
END;
/
CREATE OR REPLACE TRIGGER tri_transaccion
BEFORE INSERT ON transaccion
FOR EACH ROW
BEGIN
   :NEW.numero_transaccion := seq_transaccion.NextVal;
END;
/
CREATE OR REPLACE TRIGGER tri_moneda
BEFORE INSERT ON moneda
FOR EACH ROW

BEGIN
    :NEW.id_moneda := seq_moneda.NextVal;    
END;
/
CREATE OR REPLACE TRIGGER tri_moneda_after
AFTER INSERT ON moneda
FOR EACH ROW

DECLARE
--Id del usuario 
usuario_id number(10);

--Fecha del dia actual
fecha date;

--Precio de las moneda de compra y de venta
precio_compra number;
precio_venta number;

--Id de la moneda del mercado
id_moneda_mercado number;

secuencia_cartera number;

id_transaccion number;
BEGIN

    /*Inserta cada moneda en un mercado*/
    INSERT INTO mer_mon (id_moneda,id_mercado) VALUES (seq_moneda.CurrVal,seq_mercado.CurrVal);

    --Si la moneda es distinta de dolar entonces mete la moneda en el mercado dolar y le crea una transaccion
    IF seq_moneda.CurrVal != 1 THEN
    
        INSERT INTO mer_mon (id_moneda,id_mercado) VALUES (seq_moneda.CurrVal,1);
                 
        /*Por cada moneda se le asigna a un usuario aleatorio una moneda con esa cartera*/     
        --Trae un usuario cualquiera
        SELECT id_usuario
        INTO usuario_id
        FROM (SELECT id_usuario FROM usuario ORDER BY DBMS_RANDOM.VALUE)
        WHERE rownum=1;
           
        --Inserta una cartera con 10 unid de la moneda al usuario cualquiera
        INSERT INTO CARTERA
        (id_usuario,id_moneda,cantidad)
        VALUES
        (usuario_id,seq_moneda.CurrVal,10); 
        
        secuencia_cartera := seq_cartera.CurrVal;
                     
        --Trae la fecha actual
        SELECT CURRENT_DATE INTO fecha from dual;     
            
        --Selecciona un numero ramdon entre, 100 y 1000
        SELECT dbms_random.value(100,1000)
        INTO precio_compra
        FROM dual;
                     
        --Simulo una compra-venta, no será necesario restar de la cartera
        
        --Transaccion de la moneda a insertar
        INSERT INTO TRANSACCION
        (tipo,fecha,datos_monedas,id_cartera,id_moneda)
        VALUES
        (1,fecha,datosm(10,precio_compra),secuencia_cartera,seq_moneda.CurrVal);
        
        --Transaccion venta-dolar
        INSERT INTO TRANSACCION
        (tipo,fecha,datos_monedas,id_cartera,id_moneda,numero_transaccion_asociada)
        VALUES
        (2,fecha,datosm(10,precio_compra),secuencia_cartera,seq_moneda.CurrVal,seq_transaccion.CurrVal);
        
        
        id_transaccion := seq_transaccion.CurrVal;
        
        --Se altera la tabla con el id de la ultima transaccion
        UPDATE transaccion 
        SET numero_transaccion_asociada = id_transaccion
        WHERE numero_transaccion = id_transaccion - 1;
    
    END IF;
     
END;
/
CREATE OR REPLACE TRIGGER tri_mercado
BEFORE INSERT ON mercado
FOR EACH ROW
BEGIN
   :NEW.id_mercado := seq_mercado.NextVal;
END;





