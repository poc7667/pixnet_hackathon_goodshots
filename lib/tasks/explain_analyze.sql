EXPLAIN ANALYZE SELECT "cafes".* FROM "cafes" WHERE (
    ST_DWithin(
     ST_GeographyFromText(
     'SRID=4326;POINT(' || cafes.longitude || ' ' || cafes.latitude || ')'
     ),
    ST_GeographyFromText('SRID=4326;POINT(-76.000000 39.000000)'),
    2000
    )
 );