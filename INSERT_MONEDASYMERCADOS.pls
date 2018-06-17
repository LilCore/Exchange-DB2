create or replace PROCEDURE INSERT_MONEDASYMERCADOS AS 
id_bitcoin number;
id_ethereum number;
id_katanacoin number;

id_bitcoin_mercado number;
id_ethereum_mercado number;

var number;

BEGIN

INSERT INTO mercado (nombre_mercado) VALUES ('KTN');
INSERT INTO moneda (nombre,abreviatura) VALUES ('SEMERUM','SEM');
INSERT INTO moneda (nombre,abreviatura) VALUES ('PHARETRA','PHA');
INSERT INTO moneda (nombre,abreviatura) VALUES ('NEQUETIM','NEQ');
INSERT INTO moneda (nombre,abreviatura) VALUES ('MALESUADI','MAL');
INSERT INTO moneda (nombre,abreviatura) VALUES ('MINORI','MIN');
INSERT INTO moneda (nombre,abreviatura) VALUES ('NONETU','NON');
INSERT INTO moneda (nombre,abreviatura) VALUES ('QUISQUER','QUI');
INSERT INTO moneda (nombre,abreviatura) VALUES ('FACILISIS','FAC');
INSERT INTO moneda (nombre,abreviatura) VALUES ('TELLUS','TEL');
INSERT INTO moneda (nombre,abreviatura) VALUES ('NECUARTO','NECU');
INSERT INTO moneda (nombre,abreviatura) VALUES ('BITCOIN','BTC');
id_bitcoin := seq_moneda.CurrVal;
INSERT INTO moneda (nombre,abreviatura) VALUES ('ETHERIUM','ETH');
id_ethereum := seq_moneda.CurrVal;


INSERT INTO mercado (nombre_mercado) VALUES ('BTC'); 
id_bitcoin_mercado := seq_mercado.CurrVal;
INSERT INTO moneda (nombre,abreviatura) VALUES ('NECNIUS','NEC');
INSERT INTO moneda (nombre,abreviatura) VALUES ('DIGNISSIM','DIG');
INSERT INTO moneda (nombre,abreviatura) VALUES ('IDOLOGI','IDO');
INSERT INTO moneda (nombre,abreviatura) VALUES ('ATHERO','ATH');
INSERT INTO moneda (nombre,abreviatura) VALUES ('TEMPUS','TEM');
INSERT INTO moneda (nombre,abreviatura) VALUES ('SAGITTIS','SAG');
INSERT INTO moneda (nombre,abreviatura) VALUES ('SCELERIE','SCE');
INSERT INTO moneda (nombre,abreviatura) VALUES ('LOREMA','LOR');
INSERT INTO moneda (nombre,abreviatura) VALUES ('DIGNISSIM.','DIGNI');
INSERT INTO moneda (nombre,abreviatura) VALUES ('KATANACOIN','KTN');
id_katanacoin := seq_moneda.CurrVal;
--INSERT INTO moneda (nombre,abreviatura) VALUES ('ETHERIUM','ETH');
INSERT INTO mer_mon (id_moneda,id_mercado) VALUES (id_ethereum,id_bitcoin_mercado);


INSERT INTO mercado (nombre_mercado) VALUES ('ETH');
id_ethereum_mercado := seq_mercado.CurrVal;
INSERT INTO moneda (nombre,abreviatura) VALUES ('ERATOS','ERAT');
INSERT INTO moneda (nombre,abreviatura) VALUES ('TECNUS','TEC');
INSERT INTO moneda (nombre,abreviatura) VALUES ('SERVERO','SERV');
INSERT INTO moneda (nombre,abreviatura) VALUES ('SAPIEN','SAP');
INSERT INTO moneda (nombre,abreviatura) VALUES ('DOLORES','DOL');
INSERT INTO moneda (nombre,abreviatura) VALUES ('MARISUM','MARI');
INSERT INTO moneda (nombre,abreviatura) VALUES ('NIGGAZ','NIGG');
INSERT INTO moneda (nombre,abreviatura) VALUES ('SUPAM','SUP');
INSERT INTO moneda (nombre,abreviatura) VALUES ('ASAP','ASA');
--INSERT INTO moneda (nombre,abreviatura) VALUES ('BITCOIN','BTC');
INSERT INTO mer_mon (id_moneda,id_mercado) VALUES (id_bitcoin,id_ethereum_mercado);
--INSERT INTO moneda (nombre,abreviatura) VALUES ('KATANACOIN','KTN');
INSERT INTO mer_mon (id_moneda,id_mercado) VALUES (id_katanacoin,id_ethereum_mercado);


--Le envía a la insercion de usuarios el id de katanacoin para abrirles una cartera con 20 de dicha moneda--
 var := INSERT_USUARIOSYCARTERASINI(id_katanacoin);

  NULL;
END INSERT_MONEDASYMERCADOS;