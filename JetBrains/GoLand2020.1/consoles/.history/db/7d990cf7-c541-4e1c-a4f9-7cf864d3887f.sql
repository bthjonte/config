SELECT * from stop_times;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times ORDER BY  arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time > LOCALTIME ORDER BY  arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time > CURRENT_TIME ORDER BY  arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE date(arrival_time) > CURRENT_TIME ORDER BY  arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time::date > CURRENT_TIME ORDER BY  arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time::time > CURRENT_TIME ORDER BY  arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time::text > CURRENT_TIME::text ORDER BY  arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time::text < CURRENT_TIME::text ORDER BY  arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT CURRENT_TIME;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time::text > CURRENT_TIME::text ORDER BY arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time::text > CURRENT_TIME::text;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time::text >= CURRENT_TIME::text ORDER BY arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times WHERE arrival_time::text >= CURRENT_TIME::text;
;-- -. . -..- - / . -. - .-. -.--
select current_time::text;
;-- -. . -..- - / . -. - .-. -.--
SELECT  from stop_times WHERE arrival_time::text >= CURRENT_TIME::text;
;-- -. . -..- - / . -. - .-. -.--
SELECT  from stop_times WHERE arrival_time::text > CURRENT_TIME::text;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time from stop_times WHERE arrival_time::text > CURRENT_TIME::text;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time from stop_times WHERE arrival_time::varchar > CURRENT_TIME::varchar;
;-- -. . -..- - / . -. - .-. -.--
select CURRENT_TIME('HH:MM:SS');
;-- -. . -..- - / . -. - .-. -.--
select timeofday();
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time from stop_times WHERE arrival_time::varchar > localtime::varchar;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time from stop_times WHERE arrival_time::varchar > localtime::varchar order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
select localtime;
;-- -. . -..- - / . -. - .-. -.--
select timezone();
;-- -. . -..- - / . -. - .-. -.--
select current_timestamp;
;-- -. . -..- - / . -. - .-. -.--
select current_time;
;-- -. . -..- - / . -. - .-. -.--
select transaction_timestamp();
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time from stop_times WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar) order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times JOIN stops where stops.stop_id == stop_times.stop_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times JOIN stops ON stops.stop_id == stop_times.stop_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
order by stop_times.arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
order by stop_times.arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT * from stop_times JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
order by stop_times.arrival_time limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(stops.stop_lon, stops.stop_lon)), geography(st_point(56.66157,16.36163)), 1)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(stops.stop_lon, stops.stop_lon)), geography(st_point(56.66157,16.36163)), 10)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(56.66157,16.36163)),geography(st_point(stops.stop_lon, stops.stop_lon)), 10)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(56.66157,16.36163)),geography(st_point(stops.stop_lon, stops.stop_lat)), 10)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(16.36163,56.66157)),geography(st_point(stops.stop_lon, stops.stop_lat)), 10)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(stops.stop_lon, stops.stop_lat)),geography(st_point(16.36163,56.66157)), 10)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(stops.stop_lon, stops.stop_lat)),geography(st_point(16.36163,56.66157)), 10000)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(stops.stop_lon, stops.stop_lat)),geography(st_point(16.350635,56.672136)), 10000)
order by stop_times.arrival_time
limit 100;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops ON stops.stop_id = stop_times.stop_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(stops.stop_lon, stops.stop_lat)),geography(st_point(16.350635,56.672136)), 10000)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
WHERE stop_times.arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 10000)
order by stop_times.arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 10000)
order by arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN stops s ON s.stop_id = stop_times.stop_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 10000)
order by arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 10000)
order by arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from calendar_dates;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 100000)
order by arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time,stop_name,stop_lat,stop_lon,trip_headsign
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 100000)
order by arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time,stop_name,stop_lat,stop_lon,trip_headsign,cd.date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 100000)
order by arrival_time
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time,stop_name,stop_lat,stop_lon,cd.date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 100000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time,stop_name,stop_lat,stop_lon,trip_headsign,cd.date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 100000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time,stop_name,stop_lat,stop_lon,trip_headsign,cd.date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 10000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time,stop_name,stop_lat,stop_lon,trip_headsign,cd.date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin( geography(st_point(s.stop_lon, s.stop_lat)),geography(st_point(16.350635,56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT arrival_time, departure_time, stop_name, stop_lat, stop_lon, trip_headsign, date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT stop_id as id ,arrival_time, departure_time, stop_name, stop_lat, stop_lon, trip_headsign, date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id as id ,arrival_time, departure_time, stop_name, stop_lat, stop_lon, trip_headsign, date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id as id ,arrival_time, departure_time, stop_name, ARRAY(stop_lat, stop_lon), trip_headsign, date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id as id, arrival_time, departure_time, stop_name, [stop_lat, stop_lon] as loc , trip_headsign, date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id      as id,
       arrival_time,
       departure_time,
       stop_name,
       ([stop_lat,
           stop_lon]) as loc,
       trip_headsign,
       date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                   as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date + ' ' + arrival_time) as date,

from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                   as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date + ' ' + arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date + ' ' + arrival_time::varchar) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar + ' ' + arrival_time::varchar) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar + ' ' + arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar + " " + arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar + ' '::varchar + arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar + arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE arrival_time::varchar > TRIM(LEADING '0' from localtime::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
select localtimestamp;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date::varchar > TRIM(LEADING '0' from localtimestamp::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by arrival_time;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date::varchar > TRIM(LEADING '0' from localtimestamp::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by date;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date::varchar || ' ' || arrival_time)::varchar > TRIM(LEADING '0' from localtimestamp::varchar)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                            as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date::varchar || ' ' || arrival_time)::varchar > (TRIM(LEADING '0' from localtime::varchar))
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE age((date::varchar || ' ' || arrival_time)::timestamp) > 24
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE age((date::varchar || ' ' || arrival_time)::timestamp) > '24 hours'::interval
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date::varchar || ' ' || arrival_time)::varchar > (TRIM(LEADING '0' from localtime::varchar))
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
CREATE FUNCTION normalizeDate(t time, d date)
    RETURNS integer
AS $$
  if a > b:
    return a
  return b
$$ LANGUAGE plpythonu;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       date,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours')
  AND time(current_timestamp) < departure_time::time
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
  AND time(current_timestamp) < departure_time::time
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || arrival_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
  AND current_time < departure_time::time
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
  AND time(current_timestamp) < departure_time::time
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
  AND current_timestamp::time < departure_time::time
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 10000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
--   AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 10000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time)::timestamp as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
   OR date(current_timestamp + interval '20 hours') = cd.date
--   AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 10000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
   OR date(current_timestamp + interval '20 hours') = cd.date
--   AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 10000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
select * from stop_times JOIN trips t on stop_times.trip_id = t.trip_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT count(* ) from trips;
;-- -. . -..- - / . -. - .-. -.--
SELECT distinct on (trip_id) count(*) from trips;
;-- -. . -..- - / . -. - .-. -.--
SELECT distinct on (trip_id) from trips;
;-- -. . -..- - / . -. - .-. -.--
SELECT distinct on (trip_id) * from trips;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
   OR date(current_timestamp + interval '20 hours') = cd.date
--   AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 10000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
   OR date(current_timestamp + interval '20 hours') = cd.date
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 10000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 100000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 10000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE date(current_timestamp + interval '- 4 hours') = cd.date
   OR date(current_timestamp + interval '20 hours') = cd.date
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
select * from stop_times JOIN trips t on stop_times.trip_id = t.trip_id order by departure_time;
;-- -. . -..- - / . -. - .-. -.--
select * from stop_times join trips t on stop_times.trip_id = t.trip_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
   OR date(current_timestamp + interval '20 hours') = cd.date)
   AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || departure_time);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                                         as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
   OR date(current_timestamp + interval '20 hours') = cd.date)
   AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000)
order by (date::varchar || ' ' || departure_time)::timestamp;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
ND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000) GROUP by stop.stop_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000) GROUP by stop.stop_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id from stops limit 5)
  AND (date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
  AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct s.stop_id from stops limit 5)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct s.stop_id from stops limit 1)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct s.stop_id from stops order by stop_id limit 1)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id from stops order by stop_id limit 1)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id from stops order by stop_id limit 2)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date)
    AND st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)), geography(st_point(16.350635, 56.672136)), 1000));
;-- -. . -..- - / . -. - .-. -.--
select distinct stop_id from stops order by stop_id limit 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)),
                                     geography(st_point(16.350635, 56.672136)), 1000)
order by stop_id
limit 2
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date);
;-- -. . -..- - / . -. - .-. -.--
select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(s.stop_lon, s.stop_lat)),
                                     geography(st_point(16.350635, 56.672136)), 1000)
                    order by stop_id
                    limit 2;
;-- -. . -..- - / . -. - .-. -.--
select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon, stop_lat)),
                                     geography(st_point(16.350635, 56.672136)), 1000)
                    order by stop_id
                    limit 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon, stop_lat)),
                                     geography(st_point(16.350635, 56.672136)), 1000)
                    order by stop_id
                    limit 2
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date);
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon, stop_lat)),
                                     geography(st_point(16.350635, 56.672136)), 1000)
                    order by stop_id
                    limit 2
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t
              on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon
                        , stop_lat))
                              , geography(st_point(16.350635
                                , 56.672136))
                              , 10000)
                    order by stop_id
                    limit 20
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t
              on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon
                        , stop_lat))
                              , geography(st_point(16.350635
                                , 56.672136))
                              , 10000)
                    order by stop_id
                    limit 5
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       (date::varchar || ' ' || arrival_time) as date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t
              on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon
                        , stop_lat))
                              , geography(st_point(16.350635
                                , 56.672136))
                              , 100000)
                    order by stop_id
                    limit 5
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       date
       (date::varchar || ' ' || arrival_time) as join_date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t
              on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon
                        , stop_lat))
                              , geography(st_point(16.350635
                                , 56.672136))
                              , 100000)
                    order by stop_id
                    limit 5
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       date,
       (date::varchar || ' ' || arrival_time) as join_date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t
              on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon
                        , stop_lat))
                              , geography(st_point(16.350635
                                , 56.672136))
                              , 100000)
                    order by stop_id
                    limit 5
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date));
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       date,
       (date::varchar || ' ' || arrival_time) as join_date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t
              on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon
                        , stop_lat))
                              , geography(st_point(16.350635
                                , 56.672136))
                              , 100000)
                    order by stop_id
                    limit 5
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date))
    ORDER BY join_date;
;-- -. . -..- - / . -. - .-. -.--
SELECT s.stop_id                              as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       date,
       (date::varchar || ' ' || arrival_time) as joined_date
from stop_times
         JOIN stops s ON s.stop_id = stop_times.stop_id
         JOIN trips t
              on stop_times.trip_id = t.trip_id
         JOIN calendar_dates cd on t.service_id = cd.service_id
WHERE s.stop_id in (select distinct stop_id
                    from stops
                    where st_dwithin(geography(st_point(stop_lon
                        , stop_lat))
                              , geography(st_point(16.350635
                                , 56.672136))
                              , 100000)
                    order by stop_id
                    limit 5
)
  AND ((date(current_timestamp + interval '- 4 hours') = cd.date
    OR date(current_timestamp + interval '20 hours') = cd.date))
    ORDER BY joined_date;