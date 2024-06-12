--- sql create---

--create extension postgis

create table oras(
	fid serial primary key not null,
	nume varchar(250) not null,
	geom geometry('Polygon', 4326),
	populatie int not null
);

create table zona_verde(
	fid serial primary key not null,
	geom geometry('Polygon', 4326),
	oras_fid int not null,
	foreign key(oras_fid) references oras(fid)
);

create table tip_zona_verde(
	fid serial primary key not null,
	tip varchar(255) not null,
	area int not null, 
	geom geometry('Polygon', 4326),
	zona_verde_fid int not null, 
	foreign key(zona_verde_fid) references zona_verde(fid)
	);
	
create table mobilier_urban(
	fid serial primary key not null,
	tip_mobilier varchar(255) not null,
	geom geometry('Point', 4326),
	tip_zona_verde_fid int not null,
	foreign key(tip_zona_verde_fid) references tip_zona_verde(fid)
);

create table sistem_irigatii(
	fid serial primary key not null,
	lungime int not null,
	geom geometry('LineString', 4326),
	zona_verde_fid int not null,
	foreign key(zona_verde_fid) references zona_verde(fid)
);

create table vegetatie(
	fid serial primary key not null,
	specie varchar(255) not null,
	stare varchar(255) not null,
	geom geometry('Point', 4326),
	tip_zona_verde_fid int not null,
	foreign key(tip_zona_verde_fid) references tip_zona_verde(fid)
);

create table tip_zona_verde_vegetatie(
	id serial primary key not null,
	tip_zona_verde_fid int not null,
	vegetatie_fid int not null,
	foreign key(tip_zona_verde_fid) references tip_zona_verde(fid),
	foreign key(vegetatie_fid) references vegetatie(fid)
);