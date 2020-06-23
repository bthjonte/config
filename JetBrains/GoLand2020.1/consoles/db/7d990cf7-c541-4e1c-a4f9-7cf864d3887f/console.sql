SELECT s.stop_id                                as id,
       arrival_time,
       departure_time,
       stop_name,
       stop_lat,
       stop_lon,
       trip_headsign,
       date,
       (date::varchar || ' ' || departure_time) as joined_date
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



