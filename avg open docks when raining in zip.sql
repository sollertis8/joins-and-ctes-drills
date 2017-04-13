WITH
	open_docks
AS
(
SELECT
	status.station_id station_id,
	AVG(status.docks_available) docks_available
FROM
	status
GROUP BY station_id
)

SELECT 
	s.name,
	o.docks_available,
	w.Events,
	t.zip_code
FROM
	open_docks o
JOIN
	stations s
ON
	o.station_id = s.station_id 
JOIN
	trips t
ON
	t.start_station = s.name
JOIN 
	weather w
ON
	w.ZIP = t.zip_code
WHERE
	w.Events like 'rain'
GROUP BY s.name
ORDER BY s.name