-- Tabla películas vistas

SELECT profiles.name AS Perfiles,
CONCAT(customers.name, " ", customers.last_name) AS Clientes,
country AS Pais,
categories.categorie AS Categorias,
movies.title AS Peliculas,
lenguages.language AS Idiomas
FROM customers
INNER JOIN accounts ON customers.id = accounts.customer_id
INNER JOIN subscriptions ON accounts.id = subscriptions.account_id
INNER JOIN profiles ON subscriptions.id = profiles.subscription_id
INNER JOIN profiles_movies ON profiles.id = profiles_movies.profile_id
INNER JOIN movies ON profiles_movies.movie_id = movies.id
INNER JOIN lenguages_movies ON movies.id = lenguages_movies.movie_id
INNER JOIN lenguages ON lenguages_movies.language_id = lenguages.id
INNER JOIN movies_categories ON movies.id = movies_categories.movie_id
INNER JOIN categories ON movies_categories.category_id = categories.id;

-- Tabla series vistas

SELECT profiles.name AS Perfiles,
CONCAT(customers.name, " ", customers.last_name) AS Clientes,
country AS Pais,
categories.categorie AS Categorias,
series.title AS Series,
lenguages.language AS Idiomas
FROM customers
INNER JOIN accounts ON customers.id = accounts.customer_id
INNER JOIN subscriptions ON accounts.id = subscriptions.account_id
INNER JOIN profiles ON subscriptions.id = profiles.subscription_id
INNER JOIN profiles_series ON profiles.id = profiles_series.profile_id
INNER JOIN series ON profiles_series.serie_id = series.id
INNER JOIN lenguages_series ON series.id = lenguages_series.serie_id
INNER JOIN lenguages ON lenguages_series.language_id = lenguages.id
INNER JOIN series_categories ON series.id = series_categories.serie_id
INNER JOIN categories ON series_categories.category_id = categories.id;

-- Tabla clientes

SELECT CONCAT(customers.name, " ",customers.last_name) AS Clientes,
country AS Pais
FROM customers;

-- Tabla suscripciones

SELECT accounts.first_name AS Cuenta,
date_subscription AS Fecha_de_suscripcion,
payment_method AS Metodo_de_pago,
date_billing AS Fecha_de_facturacion,
current_plan AS Plan_actual,
price AS Precio
FROM subscriptions
INNER JOIN accounts ON subscriptions.account_id = accounts.id;

-- Tabla perfiles

SELECT profiles.name AS Perfiles,
profiles.color,
profiles.category AS Categoria
FROM profiles;

-- Tabla películas

SELECT title AS Pelicula,
release_year AS Año_de_lanzamiento,
director,
duration AS Duracion,
clasification AS Clasificacion
FROM movies;

-- Tabla series

SELECT title AS Serie,
release_year AS Año_de_lanzamiento,
seasons AS Temporadas,
creator AS Director
FROM series;

-- Tabla cuentas

SELECT first_name AS nombre_de_cuenta,
email,
registration_date AS fecha_de_registro,
password AS contraseña
FROM accounts;