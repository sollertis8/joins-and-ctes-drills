SELECT
	trips.trip_id,
	(cast(trips.duration as int)) duration,
	weather.Events
FROM
	trips
JOIN
	weather
ON
	trips.zip_code = weather.ZIP
WHERE
	weather.Events like 'rain'
GROUP BY (cast(trips.duration as int))
ORDER BY (cast(trips.duration as int)) DESC
LIMIT 3
