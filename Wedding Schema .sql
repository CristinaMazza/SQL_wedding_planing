/* Creation of wedding schema, with three tables: Venues, Venue Styles, and Venue Locations */

CREATE SCHEMA if not exists wedding;

set search_path to wedding

drop table if exists venues;

CREATE TABLE venues (
id integer,
venue_name text,
style_id integer,
capacity integer,
location_id integer,
couple_score integer
primary key(id)
);

insert_into venues values (1, 'berkley fieldhouse', 6, 130, 9, 2)
insert_into venues values (2, 'berkley church', 7, 150, 9, 3)
insert_into venues values (3, 'la maquette', 1, 120, 13, 3)
insert_into venues values (4, 'the loft', 3, 100, 1, 2)
insert_into venues values (5, 'fermenting cellar', 3, 450, 1, 2)
insert_into venues values (6, 'evergreen brickworks', 6, 750, 2, 3)
insert_into venues values (7, 'globe and mail centre', 5, 300, 13, 2)
insert_into venues values (8, 'broadview hotel', 7, 110, 11, 3)
insert_into venues values (9, 'drake hotel', 'eclectic', 150, 10, 3)
insert_into venues values (10, 'gladstone hotel', 7, 250, 14, 3)
insert_into venues values (11, 'carlu', 1, 500, 15, 3)
insert_into venues values (12, 'eglinton grand', 1, 320, 4, 2)
insert_into venues values (13, 'toronto reference library', 5, 750, 15, 1)
insert_into venues values (14, 'hart house', 7, 400, 15, 1)
insert_into venues values (15, 'steamwhistle', 3, 400, 5, 3)
insert_into venues values (16, 'balzacs powerhouse', 1, 70, 7, 2)
insert_into venues values (17, 'liberty grand', 4, 750, 8, 1)
insert_into venues values (18, 'storys building', 3, 250, 3, 3)
insert_into venues values (19, 'king edward hotel', 4, 500, 3, 2)
insert_into venues values (20, 'campbell house', 7, 85, 3, 1)
insert_into venues values (21, 'sunnyside pavillion', 2, 200, 12, 2)
insert_into venues values (22, 'the burroughes', 3, 250, 7, 3)
insert_into venues values (23, 'palais royale', 1, 400, 12, 1)
insert_into venues values (24, 'amsterdam brewery', 3, 500, 5, 2)
insert_into venues values (25, 'archeo', 3, 120, 1, 3)
insert_into venues values (26, 'brunswick bierworks', 3, 150, 2, 2)
insert_into venues values (27, 'malaparte', 5, 200, 3, 2)
insert_into venues values (28, 'loft on king', 3, 200, 3, 2)
insert_into venues values (29, 'one king west', 4, 250, 3, 2)
insert_into venues values (30, 'the ago', 5, 200, 7, 2)

drop table if exists locations;
create table locations (
location text,
walk_score integer,
transit_score integer,
downtown text
primary key (location)
);

insert_into venues values (1, 'distillery district', 96, 91, 'YES');
insert_into venues values (2, 'don valley', 35, 88, 'NO');
insert_into venues values (3, 'entertainment district', 100, 100, 'YES');
insert_into venues values (4, 'forest hill', 70, 80, 'NO');
insert_into venues values (5, 'harbourfront', 99, 100, 'YES');
insert_into venues values (6, 'junction', 81, 80, 'NO');
insert_into venues values (7, 'kensington', 97, 98, 'YES');
insert_into venues values (8, 'liberty village', 70, 92, 'NO');
insert_into venues values (9, 'moss park', 95, 100, 'YES');
insert_into venues values (10, 'queen west', 96, 92, 'YES');
insert_into venues values (11, 'riverside', 97, 92, 'NO');
insert_into venues values (12, 'south parkdale', 63, 62, 'NO');
insert_into venues values (13, 'st lawrence', 100, 100, 'YES');
insert_into venues values (14, 'west queen west', 90, 91, 'NO');
insert_into venues values (15, 'yonge and bloor', 98, 92, 'YES');

drop table if exists venue_styles;
create table venue_styles (
style_id integer,
venue_style text,
cristina_rank integer,
steve_rank integer,
primary key (style_id)
);

insert_into venue_styles values (1, 'art deco', 3, 2)
insert_into venue_styles values (2, 'classical', 5, 7)
insert_into venue_styles values (3, 'industrial chic', 1, 3)
insert_into venue_styles values (4, 'luxe', 6, 5)
insert_into venue_styles values (5, 'modern', 7, 4)
insert_into venue_styles values (6, 'nature', 2, 1)
insert_into venue_styles values (7, 'vintage', 4, 6)