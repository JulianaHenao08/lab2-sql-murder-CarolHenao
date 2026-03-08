-- Paso 1: buscar el reporte del crimen en la tabla de reportes
SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND type = 'murder'
AND city = 'SQL City';

--Paso 2: Encontrar al primer testigo
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

--Paso 3: Encontrar al segundo testigo
SELECT *
FROM person
WHERE name LIKE 'Annabel%'
AND address_street_name = 'Franklin Ave';

--Paso 4: Buscar lo que los testigos dijeron en su entrevista.
SELECT *
FROM interview
WHERE person_id = 14887;

SELECT *
FROM interview
WHERE person_id = 16371;

--Paso 5: Buscar miembros del gimnasio
SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%'
AND membership_status = 'gold';

--Paso 6: Ver quién fue al gimnasio el 9 de enero
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109;

--Paso 7: Buscar sus carros
SELECT *
FROM person
WHERE id = 28819 OR id = 67318;

--Paso 8: Buscar la matrícula del carro
SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%';

--Paso 9: asesino
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;

--Buscamos a la que contrato el asesino que sera el verdadero culpable
--Paso 1 — Buscar licencias que coincidan
SELECT *
FROM drivers_license
WHERE hair_color = 'red'
AND gender = 'female'
AND car_make = 'Tesla'
AND car_model = 'Model S'
AND height BETWEEN 65 AND 67;

--miramos quienes son esas personas que nos salio en el paso anterior
SELECT *
FROM person
WHERE license_id IN (202298, 291182, 918773);

--paso 2 — Confirmar que fue 3 veces al concierto
SELECT person_id, COUNT(*)
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND date LIKE '201712%'
GROUP BY person_id
HAVING COUNT(*) = 3;

--Consulta final para terminar el juego
INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;
