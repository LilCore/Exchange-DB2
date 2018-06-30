-- TDA'S
Create or replace type tarjeta as object
(banco varchar2(50),
numero number(20));
/
Create or replace type datosm as object
(cantidad number(20),
precio number(20));
/
Create or replace type historialp as object
(precio number(20),
fecha date
);
/
Create or replace type historial as table of historialp;
/
Create or replace type favoritop as object
(id_moneda number(20));
/
Create or replace type favorito as table of favoritop;
/
Create or replace type tarjetas as varray(3) of tarjeta;
/
Create or replace type telefonos as varray(3) of number(20);