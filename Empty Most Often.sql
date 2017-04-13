SELECT
	s.name,
	MAX(status.docks_available) docks_available
FROM
	stations s
JOIN
	status
ON
	s.station_id = status.station_id

	
	