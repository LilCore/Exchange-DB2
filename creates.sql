-- CREATE DE TABLAS --
CREATE TABLE usuario( 
id_usuario number(10) NOT NULL CONSTRAINT pk_id_usuario PRIMARY KEY ,
nombre varchar2(50) NOT NULL,
apellido varchar2(50) NOT NULL,
correo varchar2(50) NOT NULL,
contraseña varchar2(10) NOT NULL,
dni number(10) NOT NULL,
tarjetas tarjetas NULL,
telefonos telefonos NULL,
monedas_fav favorito NULL
)nested table monedas_fav store as fav;


CREATE TABLE cartera( 
id_cartera number(10) NOT NULL CONSTRAINT pk_id_cartera PRIMARY KEY,
id_usuario number(10) NOT NULL,
id_moneda number(10) NOT NULL,
cantidad number(10) NOT NULL
);


CREATE TABLE orden( 
numero_orden number(10) NOT NULL CONSTRAINT pk_numero_orden PRIMARY KEY,
estado number(1) NOT NULL,
tipo number(1) NOT NULL,
datos_monedas datosm,
id_cartera number(10),
id_moneda number(10) NOT NULL
);


CREATE TABLE transaccion( 
numero_transaccion number(10) NOT NULL CONSTRAINT pk_numero_transaccion PRIMARY KEY,
tipo number(1) NOT NULL,
fecha date NOT NULL,
datos_monedas datosm,
id_cartera number(10),
id_moneda number(10) NOT NULL
);


CREATE TABLE moneda( 
id_moneda number(10) NOT NULL CONSTRAINT pk_id_moneda PRIMARY KEY,
nombre varchar2(10) NOT NULL,
abreviatura varchar(5) NOT NULL
);


CREATE TABLE mercado( 
id_mercado number(10) NOT NULL CONSTRAINT pk_id_mercado PRIMARY KEY,
nombre_mercado varchar2(10) NOT NULL,
predicciones historial
)nested table predicciones store as pred;


CREATE TABLE mer_mon( 
historico_precio historial,
id_moneda number(10) NOT NULL,
id_mercado number(10) NOT NULL
)nested table historico_precio store as hist;




-- ALTER TABLE DE FOREIGN KEYS
ALTER TABLE cartera
ADD CONSTRAINT fk_usuario_cartera
FOREIGN KEY (id_usuario) 
REFERENCES usuario(id_usuario) 
ON DELETE CASCADE;

ALTER TABLE cartera
ADD CONSTRAINT fk_moneda_cartera
FOREIGN KEY (id_moneda) 
REFERENCES moneda(id_moneda) 
ON DELETE CASCADE;

ALTER TABLE orden
ADD CONSTRAINT fk_cartera_orden
FOREIGN KEY (id_cartera) 
REFERENCES cartera(id_cartera) 
ON DELETE SET NULL;

ALTER TABLE orden
ADD CONSTRAINT fk_moneda_orden
FOREIGN KEY (id_moneda) 
REFERENCES moneda(id_moneda) 
ON DELETE CASCADE;

ALTER TABLE transaccion
ADD CONSTRAINT fk_cartera_transaccion
FOREIGN KEY (id_cartera) 
REFERENCES cartera(id_cartera) 
ON DELETE SET NULL;

ALTER TABLE transaccion
ADD CONSTRAINT fk_moneda_transaccion
FOREIGN KEY (id_moneda) 
REFERENCES moneda(id_moneda) 
ON DELETE CASCADE;

ALTER TABLE mer_mon
ADD CONSTRAINT fk_moneda_mer_mon
FOREIGN KEY (id_moneda) 
REFERENCES moneda(id_moneda) 
ON DELETE CASCADE;

ALTER TABLE mer_mon
ADD CONSTRAINT fk_mercado_mer_mon
FOREIGN KEY (id_mercado) 
REFERENCES mercado(id_mercado) 
ON DELETE CASCADE;



-- Secuencias para id's autoincrementables
CREATE SEQUENCE seq_usuario
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE seq_dni
 START WITH     1000000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE seq_cartera
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE seq_orden
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE SEQUENCE seq_transaccion
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE seq_moneda
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE SEQUENCE seq_mercado
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

--DELETE FROM usuario
--WHERE 1=1;






