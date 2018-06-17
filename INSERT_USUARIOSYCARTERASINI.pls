create or replace FUNCTION INSERT_USUARIOSYCARTERASINI(moneda_id number) RETURN NUMBER AS 
-- Variables

aleatorio number;

nombre_d varchar(50);
apellido_d varchar(50);
email_d varchar(50);
contraseña_d varchar(10);
banco_d varchar(50);

usuario_id number;

TYPE tarjetas IS VARRAY(3) OF tarjeta;
mis_tarjetas tarjetas;

TYPE telefonos IS VARRAY(3) OF number;
mis_telefonos telefonos;


BEGIN


for i in 1..1000 loop
  
  --Esto trae un numero aleatorio entre 1 y 200
  SELECT ROUND(dbms_random.value(1,199))
  INTO aleatorio
  FROM dual;
  
  --Trae un nombre ramdom
  SELECT nombre
  INTO nombre_d
  FROM nombres
  WHERE id = aleatorio;
  
  --Esto trae un numero aleatorio entre 1 y 200
  SELECT ROUND(dbms_random.value(1,199))
  INTO aleatorio
  FROM dual;
  
  --Trae un apellido ramdom
  SELECT apellido
  INTO apellido_d
  FROM apellidos
  WHERE id = aleatorio;
  
  --Esto trae un numero aleatorio entre 1 y 200
  SELECT ROUND(dbms_random.value(1,199))
  INTO aleatorio
  FROM dual;
  
  --Trae un email ramdom
  SELECT email
  INTO email_d
  FROM emails
  WHERE id = aleatorio;
  
  --Esto trae un string de 20 caracteres con letras mayusculas y minusculas y lo inserta en "contraseña"
  SELECT dbms_random.string('L', 10)
  INTO contraseña_d
  FROM dual;
  
       --Guarda los telefonos y los tda
       mis_telefonos := telefonos(111,222,333);
       mis_tarjetas := tarjetas(tarjeta('banco',123),tarjeta('banco',123),tarjeta('banco',123));
      ---
      --Esto trae un numero aleatorio entre 1 y 19
      SELECT ROUND(dbms_random.value(1,19))
      INTO aleatorio
      FROM dual;
      
      --Trae un banco ramdom
      SELECT banco
      INTO banco_d
      FROM bancos
      WHERE id = aleatorio;
      
       --Esto trae un numero aleatorio entre 1000000 y 10000000
      SELECT ROUND(dbms_random.value(1000000,10000000))
      INTO aleatorio
      FROM dual;
          
      mis_tarjetas(1).banco:= banco_d;
      mis_tarjetas(1).numero:= aleatorio;
      
       ---
      --Esto trae un numero aleatorio entre 1 y 19
      SELECT ROUND(dbms_random.value(1,19))
      INTO aleatorio
      FROM dual;
      
      --Trae un banco ramdom
      SELECT banco
      INTO banco_d
      FROM bancos
      WHERE id = aleatorio;
      
       --Esto trae un numero aleatorio entre 1000000 y 10000000
      SELECT ROUND(dbms_random.value(1000000,10000000))
      INTO aleatorio
      FROM dual;
          
      mis_tarjetas(2).banco:= banco_d;
      mis_tarjetas(2).numero:= aleatorio;
      
       ---
      --Esto trae un numero aleatorio entre 1 y 19
      SELECT ROUND(dbms_random.value(1,19))
      INTO aleatorio
      FROM dual;
      
      --Trae un banco ramdom
      SELECT banco
      INTO banco_d
      FROM bancos
      WHERE id = aleatorio;
      
       --Esto trae un numero aleatorio entre 1000000 y 10000000
      SELECT ROUND(dbms_random.value(1000000,10000000))
      INTO aleatorio
      FROM dual;
          
      mis_tarjetas(3).banco:= banco_d;
      mis_tarjetas(3).numero:= aleatorio;
      
      
    --Inserta un usuario  
    INSERT INTO USUARIO
    (nombre,apellido,correo,contraseña,tarjetas,telefonos)
    VALUES
    (nombre_d,apellido_d,email_d,contraseña_d,tarjetas(mis_tarjetas(1),mis_tarjetas(2),mis_tarjetas(3)),telefonos(mis_telefonos(1),mis_telefonos(2),mis_telefonos(3)));
      
     usuario_id := seq_usuario.CurrVal; --
      
    --Inserta una cartera con la moneda del sistema
    INSERT INTO CARTERA
    (id_usuario,id_moneda,cantidad)
    VALUES
    (usuario_id,moneda_id,20);
      
    --Aqui insertar direccion--  
      
    end loop;


  RETURN 1;
END INSERT_USUARIOSYCARTERASINI;