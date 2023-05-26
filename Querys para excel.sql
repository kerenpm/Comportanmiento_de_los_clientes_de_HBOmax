-- Tabla series_vistas

SELECT hbo.profiles.name AS perfil,
first_name AS nombre_de_Cuenta,
email,
CONCAT (hbo.customers.name, ' ', hbo.customers.last_name) AS nombre_completo_de_Cliente,
title AS Serie,
hbo.series.category AS Categoria,
original_language AS Idioma_original,
current_plan AS Plan_contratado
FROM hbo.profiles
INNER JOIN hbo.profiles_series ON hbo.profiles.id = hbo.profiles_series.profile_id
INNER JOIN hbo.series ON hbo.profiles_series.serie_id = hbo.series.id
INNER JOIN hbo.subscriptions ON hbo.profiles.subscription_id = hbo.subscriptions.id
INNER JOIN hbo.accounts ON hbo.subscriptions.account_id = hbo.accounts.id
INNER JOIN hbo.customers ON hbo.accounts.customer_id = hbo.customers.id;

-- Tabla peliculas_vistas

SELECT hbo.profiles.name AS perfil,
first_name AS nombre_de_Cuenta,
email,
CONCAT (hbo.customers.name, ' ', hbo.customers.last_name) AS nombre_completo_de_Cliente,
title AS Pelicula,
hbo.movies.category AS Categoria,
original_language AS Idioma_original,
current_plan AS Plan_contratado
FROM hbo.profiles
INNER JOIN hbo.profiles_movies ON hbo.profiles.id = hbo.profiles_movies.profile_id
INNER JOIN hbo.movies ON hbo.profiles_movies.movie_id = hbo.movies.id
INNER JOIN hbo.subscriptions ON hbo.profiles.subscription_id = hbo.subscriptions.id
INNER JOIN hbo.accounts ON hbo.subscriptions.account_id = hbo.accounts.id
INNER JOIN hbo.customers ON hbo.accounts.customer_id = hbo.customers.id;

-- Tabla clientes

SELECT CONCAT(hbo.customers.name, ' ',customers.last_name) AS Clientes,
country AS Pais
FROM hbo.customers;

-- Tabla suscripciones

SELECT accounts.first_name AS nombre_de_Cuenta,
date_subscription AS Fecha_de_suscripcion,
payment_method AS Metodo_de_pago,
date_billing AS Fecha_de_facturacion,
current_plan AS Plan_actual,
price AS Precio
FROM hbo.subscriptions
INNER JOIN hbo.accounts ON hbo.subscriptions.account_id = hbo.accounts.id;

-- Tabla perfiles

SELECT profiles.name AS Perfil,
profiles.color,
profiles.category AS Categoria
FROM hbo.profiles;

-- Tablas películas

SELECT title AS Pelicula,
release_year AS Año_de_lanzamiento,
director,
duration AS Duracion,
category AS categoria,
original_language AS Idioma_original,
clasification AS Clasificacion
FROM hbo.movies;

-- Tabla series

SELECT title AS Serie,
release_year AS Año_de_lanzamiento,
seasons AS Temporadas,
creator AS Director,
category AS categoria,
original_language AS Idioma_original
FROM hbo.series;

-- Tabla cuentas

SELECT first_name AS nombre_de_cuenta,
email,
registration_date AS fecha_de_registro,
password AS contraseña
FROM hbo.accounts;