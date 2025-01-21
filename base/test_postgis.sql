SELECT PostGIS_Version();

CREATE TABLE test_geom (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(Point, 4326)
);

INSERT INTO test_geom (geom) VALUES (ST_GeomFromText('POINT(-71.060316 48.432044)', 4326));

SELECT id, ST_AsText(geom) FROM test_geom;

SELECT ST_Distance(
    ST_GeomFromText('POINT(-71.060316 48.432044)', 4326),
    ST_GeomFromText('POINT(-70.060316 47.432044)', 4326)
);

SELECT ST_Contains(
    ST_GeomFromText('POLYGON((-71.060316 48.432044, -70.060316 48.432044, -70.060316 47.432044, -71.060316 47.432044, -71.060316 48.432044))', 4326),
    ST_GeomFromText('POINT(-70.560316 47.932044)', 4326)
);