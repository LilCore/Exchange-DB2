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
BEGIN

   INSERT INTO mer_mon (id_moneda,id_mercado) VALUES (seq_moneda.CurrVal,seq_mercado.CurrVal);

END;
/
CREATE OR REPLACE TRIGGER tri_mercado
BEFORE INSERT ON mercado
FOR EACH ROW
BEGIN
   :NEW.id_mercado := seq_mercado.NextVal;
END;





