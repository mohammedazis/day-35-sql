Microsoft Windows [Version 10.0.22621.1848]
(c) Microsoft Corporation. All rights reserved.

C:\Users\Mohammed Azis>mysql -u root -p
Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 8.0.33 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| imdb               |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.00 sec)

mysql> use imdb;
Database changed
mysql> desc imdb;
ERROR 1146 (42S02): Table 'imdb.imdb' doesn't exist
mysql> create table imdb_media(movie name char(100) not null,media1 varchar(100) not null,media2 varchar(100) not null,media3 varchar(100) not null,media4 varchar(100) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name char(100) not null,media1 varchar(100) not null,media2 varchar(100) not nul' at line 1
mysql> create table imdb_media(movie_name char(100) not null,media1 varchar(100) not null,media2 varchar(100) not null,media3 varchar(100) not null,media4 varchar(100) not null);
Query OK, 0 rows affected (0.03 sec)

mysql> desc imdb_media;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| movie_name | char(100)    | NO   |     | NULL    |       |
| media1     | varchar(100) | NO   |     | NULL    |       |
| media2     | varchar(100) | NO   |     | NULL    |       |
| media3     | varchar(100) | NO   |     | NULL    |       |
| media4     | varchar(100) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> create table imdb_media(movie_name char(100) not null,media1 varchar(100) not null,media2 varchar(100) not null,media3 varchar(100) not null,media4 varchar(100) not null foriegn key(movie_name) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'foriegn key(movie_name)' at line 1
mysql> create table imdb_media(movie_name char(100) not null,media1 varchar(100) not null,media2 varchar(100) not null,media3 varchar(100) not null,media4 varchar(100) not null foriegn key (movie_name) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'foriegn key (movie_name)' at line 1
mysql> create table imdb_media(movie_name char(100) not null,media1 varchar(100) not null,media2 varchar(100) not null,media3 varchar(100) not null,media4 varchar(100) not null , foriegn key (movie_name) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key (movie_name)' at line 1
mysql> create table imdb_media(movie_name char(100) not null,media1 varchar(100) not null,media2 varchar(100) not null,media3 varchar(100) not null,media4 varchar(100) not null , foriegn key(movie_name)) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key(movie_name))' at line 1
mysql> create table imdb_media(movie_name char(100) not null,media1 varchar(100) not null,media2 varchar(100) not null,media3 varchar(100) not null,media4 varchar(100) not null , foriegn key (movie_name)) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key (movie_name))' at line 1
mysql> desc imdb_media;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| movie_name | char(100)    | NO   |     | NULL    |       |
| media1     | varchar(100) | NO   |     | NULL    |       |
| media2     | varchar(100) | NO   |     | NULL    |       |
| media3     | varchar(100) | NO   |     | NULL    |       |
| media4     | varchar(100) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc imdb;
ERROR 1146 (42S02): Table 'imdb.imdb' doesn't exist
mysql> desc imdb_media;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| movie_name | char(100)    | NO   |     | NULL    |       |
| media1     | varchar(100) | NO   |     | NULL    |       |
| media2     | varchar(100) | NO   |     | NULL    |       |
| media3     | varchar(100) | NO   |     | NULL    |       |
| media4     | varchar(100) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> create table imdb_media(movie_name char(100) not null,genre1 varchar(100) not null,genre2 varchar(100) not null,genre3 varchar(100) not null,genre4 varchar(100) not null , foriegn key (movie_name) references imdb_media(movie_name)) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key (movie_name) references imdb_media(movie_name))' at line 1
mysql> create table imdb_media(movie_name char(100) not null,genre1 varchar(100) not null,genre2 varchar(100) not null,genre3 varchar(100) not null,genre4 varchar(100) not null , FOREIGN KEY (movie_name) REFERENCES imdb_media(movie_name)) ;
ERROR 1050 (42S01): Table 'imdb_media' already exists
mysql> create table imdb_genre(movie_name char(100) not null,genre1 varchar(100) not null,genre2 varchar(100) not null,genre3 varchar(100) not null,genre4 varchar(100) not null , FOREIGN KEY (movie_name) REFERENCES imdb_media(movie_name)) ;
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'imdb_genre_ibfk_1' in the referenced table 'imdb_media'
mysql> create table imdb_media(movie_name char(100) not null,genre1 varchar(100) not null,genre2 varchar(100) not null,genre3 varchar(100) not null,genre4 varchar(100) not null , foriegn key (movie_name) references imdb_media(movie_name)) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key (movie_name) references imdb_media(movie_name))' at line 1
mysql> create table imdb_media(movie_name char(100) not null,genre1 varchar(100) not null,genre2 varchar(100) not null,g for the right syntax to use near 'key (movie_name) references imdb_media(movie_name))' at line 1
ERROR 1050 (42S01): Table 'imdb_media' already exists
mysql> create table imdb_media(movie_name char(100) not null,genre1 varchar(100) not null,genre2 varchar(100) not null,genre3 varchar(100) not null,genre4 varchar(100) not null , primary key (movie_name)) ;                                                                      create table imdb_media(movie_name char(100) not null,genre1 varchar(100) not null,gcreate table imdb_media(movie_name char(100) not null,genre1 varchar(100) not null,genre2 varchar(100) not null,genre3 varchar(100) not null,genre4 varchar(100) not null )
    -> ;
ERROR 1050 (42S01): Table 'imdb_media' already exists
mysql> alter table imdb_media add primary key(movie name)'
    '> ;
    '> alter table imdb_media add primary key(movie name);
    '>
    '>
    '>
    '>
    '>
    '>
    '> alter table imdb_media add primary key(movie name).';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name)'
;
alter table imdb_media add primary key(movie name);






alter table i' at line 1
mysql> alter table imdb_media add primary key(movie name);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name)' at line 1
mysql> show databases;ALTER TABLE imdb_media
+--------------------+
| Database           |
+--------------------+
| imdb               |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.00 sec)

    -> DROP CONSTRAINT imdb_media_pkey;
ERROR 3940 (HY000): Constraint 'imdb_media_pkey' does not exist.
mysql>
mysql> ALTER TABLE imdb_media
    -> ADD PRIMARY KEY (movie_name);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> use imdb;
Database changed
mysql> desc imdb_media;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| movie_name | char(100)    | NO   | PRI | NULL    |       |
| media1     | varchar(100) | NO   |     | NULL    |       |
| media2     | varchar(100) | NO   |     | NULL    |       |
| media3     | varchar(100) | NO   |     | NULL    |       |
| media4     | varchar(100) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> create table imdb_genre(movie_name char(100) not null,genre1 varchar(100) not null,genre2 varchar(100) not null,genre3 varchar(100) not null,genre4 varchar(100) not null , FOREIGN KEY (movie_name) REFERENCES imdb_media(movie_name)) ;
Query OK, 0 rows affected (0.03 sec)

mysql> desc imdb_genre;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| movie_name | char(100)    | NO   | MUL | NULL    |       |
| genre1     | varchar(100) | NO   |     | NULL    |       |
| genre2     | varchar(100) | NO   |     | NULL    |       |
| genre3     | varchar(100) | NO   |     | NULL    |       |
| genre4     | varchar(100) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> select * from imdb_genre;
Empty set (0.00 sec)

mysql> create table imdb_review(movie_name varchar (100) not null,review1 int not null,review2 int not null,review3 int not null, FOREIGN KEY (movie_name) REFERENCES imdb_media(movie_name)) ;
Query OK, 0 rows affected (0.04 sec)

mysql> desc imdb_review;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| movie_name | varchar(100) | NO   | MUL | NULL    |       |
| review1    | int          | NO   |     | NULL    |       |
| review2    | int          | NO   |     | NULL    |       |
| review3    | int          | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table imdb_artist(movie_name varchar (100) not null,artist1 varchar(100) not null,primary key(artist), FOREIGN KEY (movie_name) REFERENCES imdb_media(movie_name)) ;
ERROR 1072 (42000): Key column 'artist' doesn't exist in table
mysql> create table imdb_artist(movie_name varchar (100) not null,artist varchar(100) not null,primary key(artist), FOREIGN KEY (movie_name) REFERENCES imdb_media(movie_name)) ;
Query OK, 0 rows affected (0.04 sec)

mysql> desc imdb_artist;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| movie_name | varchar(100) | NO   | MUL | NULL    |       |
| artist     | varchar(100) | NO   | PRI | NULL    |       |
+------------+--------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table imdb_artist_skill(movie_name varchar (100) not null,skill1 varchar(100) not null,skill3 varchar(100) not null,skill3 varchar(100) not null, FOREIGN KEY (artist) REFERENCES imdb_artist(artist)) ;
ERROR 1060 (42S21): Duplicate column name 'skill3'
mysql> create table imdb_artist_skill(movie_name varchar (100) not null,skill1 varchar(100) not null,skill2 varchar(100) not null,skill3 varchar(100) not null, FOREIGN KEY (artist) REFERENCES imdb_artist(artist)) ;
ERROR 1072 (42000): Key column 'artist' doesn't exist in table
mysql> create table imdb_artist_skill(artist varchar (100) not null,skill1 varchar(100) not null,skill2 varchar(100) not null,skill3 varchar(100) not null, FOREIGN KEY (artist) REFERENCES imdb_artist(artist)) ;
Query OK, 0 rows affected (0.03 sec)

mysql> desc imbd_artist_skill;
ERROR 1146 (42S02): Table 'imdb.imbd_artist_skill' doesn't exist
mysql> desc imbd_artist_skill;
ERROR 1146 (42S02): Table 'imdb.imbd_artist_skill' doesn't exist
mysql> create table imdb_role(movie_name varchar (100) not null,artist varchar (100) not null,role1 varchar(100) not null,role2 varchar(100) not null,role3 varchar(100) not null, FOREIGN KEY (artist) REFERENCES imdb_artist(artist), FOREIGN KEY (movie_name) REFERENCES imdb_movie(movie_name)) ;
ERROR 1824 (HY000): Failed to open the referenced table 'imdb_movie'
mysql> create table imdb_role(movie_name varchar (100) not null,artist varchar (100) not null,role1 varchar(100) not null,role2 varchar(100) not null,role3 varchar(100) not null, FOREIGN KEY (artist) REFERENCES imdb_artist(artist)) ;
Query OK, 0 rows affected (0.04 sec)

mysql> desc imdb_role;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| movie_name | varchar(100) | NO   |     | NULL    |       |
| artist     | varchar(100) | NO   | MUL | NULL    |       |
| role1      | varchar(100) | NO   |     | NULL    |       |
| role2      | varchar(100) | NO   |     | NULL    |       |
| role3      | varchar(100) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)
--------------------------------------------------------------------------------------------------------------------------------------------------------
