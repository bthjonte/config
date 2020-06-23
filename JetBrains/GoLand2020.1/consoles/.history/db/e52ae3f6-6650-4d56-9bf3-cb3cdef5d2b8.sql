show tables;
;-- -. . -..- - / . -. - .-. -.--
select * from information_schema.tables;
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS stops CASCADE;
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS stops;
;-- -. . -..- - / . -. - .-. -.--
TRUNCATE TABLE stops;
;-- -. . -..- - / . -. - .-. -.--
SELECT pg_terminate_backend(procpid)
FROM pg_stat_activity
WHERE datname = 'gtfs';
;-- -. . -..- - / . -. - .-. -.--
SELECT datname as database,
       procpid as pid,
       usename as username,
       application_name as application,
       client_addr as client_address,
       current_query
FROM pg_stat_activity;
;-- -. . -..- - / . -. - .-. -.--
SELECT pg_terminate_backend(pg_stat_get_activity.pid)
FROM pg_stat_get_activity(NULL::integer)
WHERE datid=(SELECT oid from pg_database where datname = 'gtfs');
;-- -. . -..- - / . -. - .-. -.--
DROP DATABASE gtfs;
;-- -. . -..- - / . -. - .-. -.--
Create database gtfs;