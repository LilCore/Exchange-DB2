create or replace PROCEDURE FLUJO_PRINCIPAL AS 
BEGIN


INSERT_USUARIOS();
INSERT_MONEDASYMERCADOS();

/*Proceso de compra y ventas de divisas*/
--ASINCRONIA();

  NULL;
END FLUJO_PRINCIPAL;