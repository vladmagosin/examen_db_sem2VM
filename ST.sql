select ST_perimeter(geom) from oras;

select ST_area(geom) from oras;

select ST_centroid(geom) from zona_verde;

select ST_area(geom) from zona_verde where fid =5;

select ST_centroid(geom) from tip_zona_verde where fid=10;

select ST_geometrytype(geom) from tip_zona_verde;

select ST_geometrytype(geom) "Tip geometrie", ST_Perimeter(geom) from tip_zona_verde;

select ST_buffer(geom, 0.5) from mobilier_urban;

select ST_Transform(geom, 4326) from mobilier_urban;

select ST_X(geom) X, ST_Y(geom) Y from mobilier_urban;

select ST_length(geom) from sistem_irigatii;

select ST_StartPoint(geom) from sistem_irigatii;

select ST_EndPoint(geom) from sistem_irigatii;

select ST_ASGeoJSON(geom) from vegetatie;

select ST_Distance(geom, ST_GeomFromText('POINT(1 1)', 4326)) from vegetatie;



