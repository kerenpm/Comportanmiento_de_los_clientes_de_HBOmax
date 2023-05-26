
-- ¿Cuántos perfiles ven peliculas románticas?

SELECT COUNT(hbo.profiles.id) AS Cantidad_de_perfiles,
hbo.movies.category AS Categoria
FROM hbo.profiles
INNER JOIN hbo.profiles_movies ON hbo.profiles.id = hbo.profiles_movies.profile_id
INNER JOIN hbo.movies ON hbo.profiles_movies.movie_id = hbo.movies.id
WHERE hbo.movies.category = 'Romance'
GROUP BY Categoria;

--¿Qué categorías de películas es la más vista en Perú?

SELECT COUNT(hbo.profiles.id) AS Cantidad_total_de_vistas,
country AS Pais,
hbo.movies.category AS Categoria
FROM hbo.customers
INNER JOIN hbo.accounts ON hbo.customers.id = hbo.accounts.customer_id
INNER JOIN hbo.subscriptions ON hbo.accounts.id = hbo.subscriptions.account_id
INNER JOIN hbo.profiles ON hbo.subscriptions.id = hbo.profiles.subscription_id
INNER JOIN hbo.profiles_movies ON hbo.profiles.id = hbo.profiles_movies.profile_id
INNER JOIN hbo.movies ON hbo.profiles_movies.movie_id = hbo.movies.id
WHERE country = 'Peru'
GROUP BY Pais, Categoria
ORDER BY cantidad_total_de_vistas DESC
LIMIT 1;

--¿Qué categoría de peliculas es la más pedida en latinoamérica?

SELECT COUNT(hbo.profiles.id) AS Cantidad_total_de_vistas,
hbo.movies.category AS Categoria,
CASE
 WHEN country = 'United States' THEN 'América'
ELSE
'Latinoamérica'
END AS Region
 FROM hbo.customers
INNER JOIN hbo.accounts ON hbo.customers.id = hbo.accounts.customer_id
INNER JOIN hbo.subscriptions ON hbo.accounts.id = hbo.subscriptions.account_id
INNER JOIN hbo.profiles ON hbo.subscriptions.id = hbo.profiles.subscription_id
INNER JOIN hbo.profiles_movies ON hbo.profiles.id = hbo.profiles_movies.profile_id
INNER JOIN hbo.movies ON hbo.profiles_movies.movie_id = hbo.movies.id
GROUP BY Categoria, Region
ORDER BY Cantidad_total_de_vistas DESC
LIMIT 1;

--¿Cuántos perfiles ven series en español?

SELECT COUNT(profiles.id) AS Cantidad_total_de_vistas,
hbo.series.original_language AS Idioma
FROM hbo.profiles
INNER JOIN hbo.profiles_series ON hbo.profiles.id = hbo.profiles_series.profile_id
INNER JOIN hbo.series ON hbo.profiles_series.serie_id = hbo.series.id
WHERE hbo.series.original_language = 'Spanish'
GROUP BY Idioma;

--¿Cuántas cuentas si tienen suscripción?

SELECT COUNT(first_name) AS Cuentas_con_suscripcion
FROM hbo.accounts
INNER JOIN hbo.subscriptions ON hbo.accounts.id = hbo.subscriptions.account_id;

--¿Cuántas cuentas aún no se han suscrito?

SELECT COUNT(first_name) AS Cuentas_con_suscripcion
FROM hbo.accounts
LEFT JOIN hbo.subscriptions ON hbo.accounts.id = hbo.subscriptions.account_id
WHERE hbo.subscriptions.account_id IS NULL;

--Las cuentas no suscritas son las siguientes

SELECT first_name AS Cuentas_sin_suscripcion
FROM hbo.accounts
LEFT JOIN hbo.subscriptions ON hbo.accounts.id = hbo.subscriptions.account_id
WHERE hbo.subscriptions.account_id IS NULL;

--¿Cuál es el país que más películas ve de comedia?

SELECT COUNT(hbo.profiles.id) AS Cantidad_total_de_vistas,
country AS Pais,
hbo.movies.category AS Categoria
FROM hbo.customers
INNER JOIN hbo.accounts ON hbo.customers.id = hbo.accounts.customer_id
INNER JOIN hbo.subscriptions ON hbo.accounts.id = hbo.subscriptions.account_id
INNER JOIN hbo.profiles ON hbo.subscriptions.id = hbo.profiles.subscription_id
INNER JOIN hbo.profiles_movies ON hbo.profiles.id = hbo.profiles_movies.profile_id
INNER JOIN hbo.movies ON hbo.profiles_movies.movie_id = hbo.movies.id
WHERE hbo.movies.category = 'Comedy'
GROUP BY Pais, Categoria
ORDER BY cantidad_total_de_vistas DESC
LIMIT 1;

--¿Quiénes se han suscrito con el plan de 29,90?

SELECT CONCAT(hbo.customers.name, ' ', hbo.customers.last_name) AS Clientes,
hbo.subscriptions.price AS Plan
FROM hbo.customers
INNER JOIN hbo.accounts ON hbo.customers.id = hbo.accounts.customer_id
INNER JOIN hbo.subscriptions ON hbo.accounts.id = hbo.subscriptions.account_id
WHERE hbo.subscriptions.price = 29.90
GROUP BY Plan, Clientes;

--¿Cuál es el método de pago más usado ?

SELECT COUNT(hbo.subscriptions.id) AS Cantidad_suscripciones,
payment_method AS Metodo_de_pago
FROM hbo.subscriptions
GROUP BY Metodo_de_pago
ORDER BY Cantidad_suscripciones DESC
LIMIT 1;

--¿Cuál es el mes que hizo más ventas?

SELECT SUM(price) AS Ventas,
EXTRACT (MONTH FROM date_subscription) AS Mes
FROM hbo.subscriptions
GROUP BY Mes
ORDER BY Ventas DESC
LIMIT 1;