-- Definici�n de las cadenas de texto a comparar
DECLARE @Cadena1 VARCHAR(100) = 'alex$'
DECLARE @Cadena2 VARCHAR(100) = 'arwg$'

-- Obteniendo la longitud de cada cadena
DECLARE @Longitud1 INT = LEN(@Cadena1)
DECLARE @Longitud2 INT = LEN(@Cadena2)

-- Variable para almacenar la distancia entre las cadenas
DECLARE @Distancia INT = 0

-- Determinando la longitud m�xima entre ambas cadenas
DECLARE @MaxLongitud INT = CASE WHEN @Longitud1 > @Longitud2 THEN @Longitud1 ELSE @Longitud2 END

-- Variable para iterar sobre las cadenas y calcular la distancia
DECLARE @i INT = 1
WHILE @i <= @MaxLongitud
BEGIN
    -- Verificar si la posici�n actual existe en ambas cadenas
    IF @i <= @Longitud1 AND @i <= @Longitud2
    BEGIN
        -- Comparar los caracteres en la misma posici�n
        IF SUBSTRING(@Cadena1, @i, 1) != SUBSTRING(@Cadena2, @i, 1)
            -- Incrementar la distancia si los caracteres son diferentes
            SET @Distancia = @Distancia + 1
    END
    ELSE
    BEGIN
        -- Incrementar la distancia si una de las cadenas se ha agotado
        SET @Distancia = @Distancia + 1
    END

    -- Pasar a la siguiente posici�n
    SET @i = @i + 1
END

-- Calcular el valor num�rico cuantitativo como la distancia entre las cadenas
DECLARE @NumericoCuantitativo INT = @Distancia

-- Calcular el valor num�rico porcentual como el porcentaje de similitud entre las cadenas
DECLARE @NumericoPorcentual DECIMAL(5, 2) = (1 - CAST(@Distancia AS DECIMAL) / @MaxLongitud) * 100

-- Mostrar los resultados
SELECT @NumericoCuantitativo AS 'Num�rico cuantitativo',
       @NumericoPorcentual AS 'Num�rico porcentual'
