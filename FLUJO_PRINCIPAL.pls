create or replace PROCEDURE FLUJO_PRINCIPAL AS 
BEGIN

--PASAR ESTO A PROCEDURES?
--CREATES ESTRUCTURAS
--CREATES TABLAS
--CREATES TRIGGERS

/*Inserta las monedas y mercados, al terminar inserta los usuarios y una cartera a cada uno
con 20 unidades de la moneda del sistema (katanacoin)*/
INSERT_MONEDASYMERCADOS();--Esto debe ejecutarse una sola vez al igual que los creates

/*Proceso de compra y ventas de divisas*/
--ASINCRONIA();

  NULL;
END FLUJO_PRINCIPAL;