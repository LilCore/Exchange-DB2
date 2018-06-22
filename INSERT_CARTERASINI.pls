create or replace FUNCTION INSERT_CARTERASINI(katana_id number) RETURN NUMBER AS 

contador number := seq_usuario.CurrVal;
contenedor number;

BEGIN


    WHILE contenedor != 0
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
        
           DBMS_OUTPUT.PUT_LINE(contenedor);
            /*INSERT INTO CARTERA
            (id_usuario,id_moneda,cantidad)
            VALUES
            (i,katana_id,20); */ 
            contador := contador - 1; 
            
      END IF;
            
    END LOOP;


  RETURN 1;
END INSERT_CARTERASINI;