create or replace FUNCTION INSERT_CARTERASINI(katana_id number) RETURN NUMBER AS 


contador number;
contenedor number;


BEGIN

contador := seq_usuario.CurrVal;

    WHILE contador != 0
    LOOP
   
        Begin 
            SELECT id_usuario
            INTO contenedor
            FROM usuario
            WHERE id_usuario=contador;
            exception 
            when no_data_found then
            contenedor := 0;
        End;
        
        
      IF contenedor != 0 THEN       
        
            INSERT INTO CARTERA
            (id_usuario,id_moneda,cantidad)
            VALUES
            (contenedor,katana_id,10);
            contador := contador - 1; 
            
      END IF;
            
    END LOOP;


  RETURN 1;
END INSERT_CARTERASINI;