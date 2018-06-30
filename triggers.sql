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

--Id de un usuario cualquiera
usuario_id number;

--ID moneda recien insertada
id_moneda_r number;

--Var con string katana
katana varchar2(6) := 'KATANA';

--Precio de las moneda de compra y de venta
precio_compra number;

BEGIN

    id_moneda_r:=seq_moneda.CurrVal;

    /*Inserta cada moneda en un mercado*/
    INSERT INTO mer_mon (id_moneda,id_mercado) VALUES (id_moneda_r,seq_mercado.CurrVal);


    --Crea una cartera a un usuario aleatorio
    IF id_moneda_r!=23 THEN
    
        --Trae un usuario cualquiera
        SELECT id_usuario
        INTO usuario_id
        FROM (SELECT id_usuario FROM usuario ORDER BY DBMS_RANDOM.VALUE)
        WHERE rownum=1;
        
        --Inserta la cartera con 10 unid de la moneda
        INSERT INTO CARTERA
        (id_usuario,id_moneda,cantidad)
        VALUES
        (usuario_id,id_moneda_r,10);
    
    END IF;
        
    

    --Si la moneda es distinta de dolar entonces mete la moneda en el mercado dolar con un precio de dolar
    IF id_moneda_r != 1 THEN
       
        --Selecciona precio en dolares entre 100 y 1000 para la moneda
        SELECT dbms_random.value(100,1000)
        INTO precio_compra
        FROM dual;  
    
        --Inserta la moneda x en el mercado de dolar con un precio en dolares inicial
        INSERT INTO mer_mon (id_moneda,id_mercado,historico_precio) VALUES (id_moneda_r,1,historial(historialp(precio_compra,sysdate)));
                                       
    END IF;
        
END;
/
CREATE OR REPLACE TRIGGER tri_mercado
BEFORE INSERT ON mercado
FOR EACH ROW
BEGIN
   :NEW.id_mercado := seq_mercado.NextVal;
END;





