create table if not exists Compiliations_of_tracks (
	id SERIAL primary key,
	Title VARCHAR(20) not null,
	Year_of_release DATE not null
);
create table if not exists Albums_of_executor (
	id SERIAL primary key,
	Title VARCHAR(20) not null,
	Year_of_release DATE not null
);
create table if not exists Tracks (
	id SERIAL primary key,
	Title VARCHAR(20) not null,
	Duration TIME(0) not null,
	Album_id INTEGER not null references Albums_of_executor(id)
);
create table if not exists TraksCompilations (
	Trak_id INTEGER references Tracks(id),
	Compilation_id INTEGER references Compiliations_of_tracks(id),
	constraint pk1 primary key(Trak_id, Compilation_id)
);
create table if not exists Genre_of_music (
	id SERIAL primary key,
	Title VARCHAR(20) not null
);
create table if not exists Executors (
	id SERIAL primary key,
	Nickname VARCHAR(20) not null
);
create table if not exists ExecutorsGenre (
	Executors_id INTEGER references Executors(id),
	Gernre_id INTEGER references Genre_of_music(id),
	constraint pk2 primary key(Executors_id, Gernre_id)
);
create table if not exists ExecutorsAlbums (
	Executor_id INTEGER references Executors(id),
	Albums_id INTEGER references Albums_of_executor(id),
	constraint pk3 primary key(Executor_id, Albums_id)
);