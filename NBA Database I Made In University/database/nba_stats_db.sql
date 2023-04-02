CREATE SCHEMA nba_stats;
USE nba_stats;

CREATE TABLE teams(
	team_id INT NOT NULL AUTO_INCREMENT,
	abbreviation VARCHAR(3) NULL,
	city VARCHAR(20) NOT NULL,
	team_name VARCHAR(20) NOT NULL,
	records VARCHAR(20) NOT NULL,
	PRIMARY KEY (team_id));

CREATE TABLE games(
	game_id INT NOT NULL AUTO_INCREMENT,
	home_team_id INT NOT NULL, 
	away_team_id INT NOT NULL,
	home_score INT NOT NULL,
	away_score INT NOT NULL,
	date_played VARCHAR(5),
 	season VARCHAR(4),
	matches VARCHAR(15) NOT NULL,
	PRIMARY KEY (game_id),
	FOREIGN KEY (home_team_id) REFERENCES TEAMS(team_id),
	FOREIGN KEY (away_team_id) REFERENCES TEAMS(team_id));
	
CREATE TABLE players(
	player_id INT NOT NULL AUTO_INCREMENT,
	t_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE NULL,
	season_experience INT NOT NULL,
	role VARCHAR(10) NOT NULL,
	height VARCHAR(20) NOT NULL,
	weight VARCHAR(20) NOT NULL,
	jersey_number INT NOT NULL,
	roster_status VARCHAR(15) NOT NULL,
	school VARCHAR(50) NULL,
	country VARCHAR(50) NULL,
	PRIMARY KEY (player_id),
	FOREIGN KEY (t_id) REFERENCES TEAMS(team_id));
    
CREATE TABLE stats(
	stats_id INT NOT NULL AUTO_INCREMENT,
	g_id INT NOT NULL,
	p_id INT NOT NULL,
	fg_made INT NOT NULL,
	fg_attempt INT NOT NULL,
	threes_made INT NOT NULL,
	threes_attempt INT NOT NULL,
	ft_made INT NOT NULL,
	ft_attempt INT NOT NULL,
	off_rebound INT NOT NULL,
	def_rebound INT NOT NULL,
	assists INT NOT NULL,
	steals INT NOT NULL,
	fouls INT NOT NULL,
	blocks INT NOT NULL,
	turnovers INT NOT NULL,
	points INT NOT NULL,
	PRIMARY KEY (stats_id, g_id, p_id),
 	FOREIGN KEY (g_id) REFERENCES GAMES(game_id),
	FOREIGN KEY (p_id) REFERENCES PLAYERS(player_id));

INSERT INTO teams VALUES (1, 'ATL', 'Atlanta', 'Hawks', '2-0');

INSERT INTO teams (abbreviation, city, team_name, records)
	VALUES ('BOS', 'Boston', 'Celtics', '0-2'),
	('BKN', 'Brooklyn', 'Nets', '2-0'),
	('CHA', 'Charlotte', 'Hornets', '0-2'),
	('CHI', 'Chicago', 'Bulls', '2-0'),
	('CLE', 'Cleveland', 'Cavaliers', '0-2'),
	('DAL', 'Dallas', 'Mavericks', '2-0'),
	('DEN', 'Denver', 'Nuggets', '0-2'),
	('DET', 'Detroit', 'Pistons', '2-0'),
	('GSW', 'Golden State', 'Warriors', '0-2'),
	('HOU', 'Houston', 'Rockets', '2-0'),
	('IND', 'Indiana', 'Pacers', '0-2'),
	('LAC', 'Los Angeles', 'Clippers', '2-0'),
	('LAL', 'Los Angeles', 'Lakers', '0-2'),
	('MEM', 'Memphis', 'Grizzlies', '2-0'),
	('MIA', 'Miami', 'Heat', '0-2'),
	('MIL', 'Milwaukee', 'Bucks', '2-0'),
	('MIN', 'Minnesota', 'Timberwolves', '0-2'),
	('NOP', 'New Orleans', 'Pelicans', '2-0'),
	('NYK', 'New York', 'Knicks', '0-2'),
	('OKC', 'Oklahoma City', 'Thunder', '2-0'),
	('ORL', 'Orlando', 'Magic', '0-2'),
	('PHI', 'Philadelphia', '76ers', '2-0'),
	('PHX', 'Phoenix', 'Suns', '0-2'),
	('POR', 'Portland', 'Trailblazers', '2-0'),
	('SAC', 'Sacramento', 'Kings', '0-2'),
	('SAS', 'San Antonio', 'Spurs', '2-0'),
	('TOR', 'Toronto', 'Raptors', '0-2'),
	('UTA', 'Utah', 'Jazz', '2-0'),
	('WAS', 'Washington', 'Wizards', '0-2');

INSERT INTO games VALUES (1, 1, 2, 98, 99, '4/1', '2018', 'ATL/BOS');

INSERT INTO games (home_team_id, away_team_id, home_score, away_score, date_played, season, matches)
	VALUES (3, 4, 87, 80, '4/1', '2018', 'BKN/CHA'),
	(5, 6, 95, 90, '4/2', '2018', 'CHI/CLE'),
	(7, 8, 101, 99, '4/2', '2018', 'DAL/DEN'),
	(9, 10, 89, 102, '4/3', '2018', 'DET/GSW'),
	(11, 12, 91, 92, '4/3', '2018', 'HOU/IND'),
	(13, 14, 93, 95, '4/4', '2018', 'LAC/LAL'),
	(15, 16, 98, 99, '4/4', '2018', 'MEM/MIA'),
	(17, 18, 102, 99, '4/5', '2018', 'MIL/MIN'),
	(19, 20, 98, 103, '4/5', '2018', 'NOP/NYK'),
	(21, 22, 98, 87, '4/6', '2018', 'OKC/ORL'),
	(23, 24, 88, 90, '4/6', '2018', 'PHI/PHX'),
	(25, 26, 115, 110, '4/7', '2018', 'POR/SAC'),
	(27, 28, 98, 97, '4/7', '2018', 'SAS/TOR'),
	(29, 30, 98, 70, '4/8', '2018', 'UTA/WAS'),
    	(1, 2, 98, 99, '4/8', '2018', 'ATL/BOS'),
    	(3, 4, 87, 80, '4/9', '2018', 'BKN/CHA'),
	(5, 6, 95, 90, '4/9', '2018', 'CHI/CLE'),
	(7, 8, 101, 99, '4/10', '2018', 'DAL/DEN'),
	(9, 10, 89, 102, '4/10', '2018', 'DET/GSW'),
	(11, 12, 91, 92, '4/11', '2018', 'HOU/IND'),
	(13, 14, 93, 95, '4/11', '2018', 'LAC/LAL'),
	(15, 16, 98, 99, '4/12', '2018', 'MEM/MIA'),
	(17, 18, 102, 99, '4/12', '2018', 'MIL/MIN'),
	(19, 20, 98, 103, '4/13', '2018', 'NOP/NYK'),
	(21, 22, 98, 87, '4/13', '2018', 'OKC/ORL'),
	(23, 24, 88, 90, '4/14', '2018', 'PHI/PHX'),
	(25, 26, 115, 110, '4/14', '2018', 'POR/SAC'),
	(27, 28, 98, 97, '4/15', '2018', 'SAS/TOR'),
	(29, 30, 98, 70, '4/15', '2018', 'UTA/WAS');

INSERT INTO players VALUES (1, 1, 'Kent', 'Bazemore', '1989-07-01', 5, 'guard', '6 ft 5 in', '201 lbs', 24, 'active', 'Old Dominion', NULL);

INSERT INTO players (t_id, first_name, last_name, birthdate, season_experience, role, height, weight, jersey_number, roster_status, school, country) 
VALUES (1, 'Tyler', 'Dorsey', '1996-02-18', 0, 'guard', '6 ft 5 in', '183 lbs', 2, 'active', 'Oregon', NULL),
(1, 'Miles', 'Plumley', '1988-09-01', 5, 'center', '6 ft 11 in', '249 lbs', 18, 'active', 'Duke', NULL),
(1, 'Dennis', 'Schroder', '1993-09-15', 4, 'forward', '6 ft 1 in', '172 lbs', 21, 'active', 'Texas', NULL),
(1, 'John', 'Collins', '1989-02-28', 1, 'forward', '6 ft 2 in', '221 lbs', 22, 'active', 'California', NULL),
(2, 'Jaylen', 'Brown', '1986-03-11', 2, 'guard', '6 ft 3 in', '222 lbs', 23, 'active', 'North Carolina', NULL),
(2, 'Gordon', 'Hayward', '1983-04-24', 3, 'guard', '6 ft 4 in', '223 lbs', 24, 'active', 'Oklahoma', NULL),
(2, 'Kyrie', 'Irving', '1982-05-20', 4, 'center', '6 ft 5 in', '224 lbs', 25, 'active', 'Kansas', NULL),
(2, 'Greg', 'Monroe', '1981-06-15', 5, 'forward', '6 ft 6 in', '215 lbs', 26, 'active', 'Kentucky', NULL),
(2, 'Daniel', 'Theis', '1985-07-12', 6, 'forward', '6 ft 7 in', '225 lbs', 27, 'active', 'Duke', NULL),
(3, 'Jarrett', 'Allen', '1984-08-11', 7, 'guard', '6 ft 8 in', '226 lbs', 28, 'active', 'Kansas', NULL),
(3, 'Milton', 'Doyle', '1987-09-04', 1, 'guard', '6 ft 9 in', '227 lbs', 29, 'active', 'Florida', NULL),
(3, 'Joe', 'Harris', '1988-10-03', 2, 'center', '6 ft 10 in', '228 lbs', 20, 'active', 'Oklahoma', NULL),
(3, 'Caris', 'LeVert', '1989-11-06', 3, 'forward', '6 ft 11 in', '229 lbs', 11, 'active', 'Duke', NULL),
(3, 'Dante', 'Cunningham', '1990-12-07', 4, 'forward', '6 ft 1 in', '230 lbs', 12, 'active', 'North Carolina', NULL),
(4, 'Jeremy', 'Lamb', '1991-01-08', 5, 'center', '6 ft 2 in', '221 lbs', 13, 'active', 'California', NULL),
(4, 'Marcus', 'Paige', '1992-02-09', 6, 'forward', '6 ft 3 in', '231 lbs', 14, 'active', 'Oregon', NULL),
(4, 'Cody', 'Zeller', '1993-03-10', 7, 'forward', '6 ft 4 in', '232 lbs', 15, 'active', 'Duke', NULL),
(4, 'Marvin', 'Williams', '1988-04-11', 1, 'center', '6 ft 5 in', '232 lbs', 16, 'active', 'California', NULL),
(4, 'Frank', 'Kaminsky', '1989-05-01', 2, 'guard', '6 ft 6 in', '233 lbs', 17, 'active', 'Wisconson', NULL),
(5, 'Kris', 'Dunn', '1990-06-15', 3, 'guard', '6 ft 7 in', '244 lbs', 18, 'active', 'Kansas', NULL),
(5, 'Jarell', 'Eddie', '1991-07-14', 4, 'center', '6 ft 8 in', '255 lbs', 19, 'active', 'Wisconsin', NULL),
(5, 'Zach', 'LaVine', '1992-08-11', 5, 'forward', '6 ft 9 in', '254 lbs', 31, 'active', 'North Carolina', NULL),
(5, 'Paul', 'Zipser', '1993-09-08', 6, 'forward', '6 ft 10 in', '252 lbs', 32, 'active', 'Duke', NULL),
(5, 'Cameron', 'Payne', '1988-10-04', 7, 'center', '6 ft 11 in', '251 lbs', 33, 'active', 'Kansas', NULL),
(6, 'Jordan', 'Clarkson', '1989-11-03', 1, 'guard', '6 ft 1 in', '249 lbs', 34, 'active', 'Florida', NULL),
(6, 'Jeff', 'Green', '1990-12-21', 2, 'guard', '6 ft 2 in', '248 lbs', 35, 'active', 'Texas', NULL),
(6, 'George', 'Hill', '1991-01-20', 3, 'center', '6 ft 3 in', '247 lbs', 36, 'active', 'Kansas', NULL),
(6, 'John', 'Holland', '1992-02-25', 4, 'forward', '6 ft 4 in', '246 lbs', 37, 'active', 'Stanford', NULL),
(6, 'Kevin', 'Love', '1992-03-26', 5, 'forward', '6 ft 5 in', '245 lbs', 38, 'active', 'UCLA', NULL),
(7, 'Kyle', 'Collinsworth', '1988-04-05', 6, 'center', '6 ft 6 in', '244 lbs', 39, 'active', 'Old Dominion', NULL),
(7, 'Jalen', 'Jones', '1989-05-09', 7, 'guard', '6 ft 7 in', '243 lbs', 40, 'active', 'UCLA', NULL),
(7, 'Dwight', 'Powell', '1990-06-10', 1, 'guard', '6 ft 8 in', '242 lbs', 41, 'active', 'North Carolina', NULL),
(7, 'Johnathan', 'Motley', '1991-07-11', 2, 'center', '6 ft 9 in', '241 lbs', 42, 'active', 'Duke', NULL),
(7, 'Wesley', 'Matthews', '1992-08-12', 3, 'forward', '6 ft 10 in', '240 lbs', 43, 'active', 'Kansas', NULL),
(8, 'Darrell', 'Arthur', '1993-09-13', 4, 'forward', '6 ft 11 in', '239 lbs', 44, 'active', 'Florida', NULL),
(8, 'Will', 'Barton', '1988-10-14', 5, 'center', '6 ft 1 in', '238 lbs', 45, 'active', 'Texas', NULL),
(8, 'Tyler', 'Lydon', '1989-11-15', 6, 'guard', '6 ft 2 in', '237 lbs', 46, 'active', 'Kansas', NULL),
(8, 'Trey', 'Lyles', '1990-12-16', 7, 'guard', '6 ft 3 in', '236 lbs', 47, 'active', 'Wisconsin', NULL),
(8, 'Monte', 'Morris', '1991-01-17', 1, 'center', '6 ft 4 in', '235 lbs', 48, 'active', 'Stanford', NULL),
(9, 'Henry', 'Ellenson', '1992-02-18', 2, 'forward', '6 ft 5 in', '234 lbs', 49, 'active', 'UCLA', NULL),
(9, 'Kay', 'Felder', '1993-03-19', 3, 'forward', '6 ft 6 in', '233 lbs', 50, 'active', 'Old Dominion', NULL),
(9, 'Blake', 'Griffin', '1988-04-20', 4, 'center', '6 ft 7 in', '232 lbs', 51, 'active', 'North Carolina', NULL),
(9, 'Eric', 'Moreland', '1989-05-21', 5, 'guard', '6 ft 8 in', '231 lbs', 52, 'active', 'Duke', NULL),
(9, 'Jon', 'Leuer', '1990-06-22', 6, 'guard', '6 ft 9 in', '230 lbs', 53, 'active', 'Kansas', NULL),
(10, 'Quinn', 'Cook', '1991-07-23', 7, 'center', '6 ft 10 in', '222 lbs', 54, 'active', 'Florida', NULL),
(10, 'Kevin', 'Durant', '1992-08-24', 1, 'guard', '6 ft 11 in', '223 lbs', 55, 'active', 'Texas', NULL),
(10, 'Draymond', 'Green', '1993-09-25', 2, 'guard', '6 ft 1 in', '224 lbs', 56, 'active', 'Kansas', NULL),
(10, 'Damian', 'Jones', '1988-10-26', 3, 'center', '6 ft 2 in', '225 lbs', 57, 'active', 'Wisconsin', NULL),
(10, 'Nick', 'Young', '1989-11-27', 4, 'forward', '6 ft 3 in', '226 lbs', 58, 'active', 'UCLA', NULL),
(11, 'Ryan', 'Anderson', '1990-12-28', 5, 'forward', '6 ft 4 in', '227 lbs', 59, 'active', 'Old Dominion', NULL),
(11, 'Markel', 'Brown', '1991-01-29', 6, 'center', '6 ft 5 in', '228 lbs', 60, 'active', 'UCLA', NULL),
(11, 'James', 'Harden', '1992-02-21', 7, 'guard', '6 ft 6 in', '238 lbs', 61, 'active', 'North Carolina', NULL),
(11, 'Chris', 'Paul', '1993-03-01', 1, 'guard', '6 ft 7 in', '229 lbs', 62, 'active', 'Duke', NULL),
(11, 'Brandan', 'Wright', '1988-04-02', 2, 'center', '6 ft 8 in', '230 lbs', 63, 'active', 'Kansas', NULL),
(12, 'Darren', 'Collison', '1989-05-03', 3, 'forward', '6 ft 9 in', '231 lbs', 64, 'active', 'Florida', NULL),
(12, 'Al', 'Jefferson', '1990-06-04', 4, 'forward', '6 ft 10 in', '232 lbs', 65, 'active', 'Texas', NULL),
(12, 'TJ', 'Leaf', '1991-07-05', 5, 'center', '6 ft 11 in', '233 lbs', 66, 'active', 'Kansas', NULL),
(12, 'Ben', 'Moore', '1992-08-06', 6, 'guard', '6 ft 1 in', '234 lbs', 67, 'active', 'Wisconsin', NULL),
(12, 'Myles', 'Turner', '1993-09-07', 7, 'guard', '6 ft 2 in', '235 lbs', 68, 'active', 'Stanford', NULL),
(13, 'Thomas', 'Bryant', '1988-10-08', 1, 'center', '6 ft 3 in', '236 lbs', 69, 'active', 'Old Dominion', NULL),
(13, 'Alex', 'Caruso', '1989-11-09', 2, 'forward', '6 ft 4 in', '247 lbs', 70, 'active', 'UCLA', NULL),
(13, 'Tyler', 'Ennis', '1990-12-10', 3, 'forward', '6 ft 5 in', '237 lbs', 71, 'active', 'North Carolina', NULL),
(13, 'Josh', 'Hart', '1991-01-11', 4, 'center', '6 ft 6 in', '238 lbs',72, 'active', 'Duke', NULL),
(13, 'Brandon', 'Ingram', '1992-02-12', 5, 'guard', '6 ft 7 in', '239 lbs', 73, 'active', 'Kansas', NULL),
(14, 'Sam', 'Dekker', '1993-03-13', 6, 'guard', '6 ft 8 in', '240 lbs', 74, 'active', 'Florida', NULL),
(14, 'Austin', 'Rivers', '1988-04-14', 7, 'center', '6 ft 9 in', '241 lbs', 75, 'active', 'Texas', NULL),
(14, 'Wesley', 'Johnson', '1989-05-15', 1, 'forward', '6 ft 10 in', '242 lbs', 76, 'active', 'Kansas', NULL),
(14, 'Lou', 'Williams', '1990-06-16', 2, 'guard', '6 ft 11 in', '243 lbs', 77, 'active', 'Wisconsin', NULL),
(14, 'Tyrone', 'Wallace', '1991-07-17', 3, 'center', '6 ft 1 in', '244 lbs', 78, 'active', 'Stanford', NULL),
(15, 'Dillon', 'Brooks', '1992-08-18', 4, 'forward', '6 ft 2 in', '245 lbs', 79, 'active', 'Old Dominion', NULL),
(15, 'Mike', 'Conley', '1993-09-19', 5, 'forward', '6 ft 3 in', '246 lbs', 80, 'active', 'UCLA', NULL),
(15, 'Tyreke', 'Evans', '1988-10-20', 6, 'center', '6 ft 4 in', '247 lbs', 81, 'active', 'North Carolina', NULL),
(15, 'Myke', 'Henry', '1989-11-21', 7, 'guard', '6 ft 5 in', '248 lbs', 82, 'active', 'Duke', NULL),
(15, 'Brice', 'Johnson', '1990-12-22', 1, 'forward', '6 ft 6 in', '249 lbs', 83, 'active', 'Kansas', NULL),
(16, 'Luke', 'Babbitt', '1991-01-23', 2, 'center', '6 ft 7 in', '250 lbs', 84, 'active', 'Florida', NULL),
(16, 'Wayne', 'Ellington', '1992-02-24', 3, 'forward', '6 ft 8 in', '251 lbs', 85, 'active', 'Texas', NULL),
(16, 'Jordan', 'Mickey', '1993-03-25', 4, 'guard', '6 ft 9 in', '252 lbs', 86, 'active', 'Kansas', NULL),
(16, 'Josh', 'Richardson', '1988-04-26', 5, 'center', '6 ft 10 in', '215 lbs', 87, 'active', 'Wisconsin', NULL),
(16, 'Dion', 'Waiters', '1989-05-27', 6, 'guard', '6 ft 11 in', '251 lbs', 88, 'active', 'Stanford', NULL),
(17, 'Eric', 'Bledsoe', '1990-06-28', 7, 'forward', '6 ft 1 in', '250 lbs', 89, 'active', 'Old Dominion', NULL),
(17, 'Sterling', 'Brown', '1991-07-29', 1, 'center', '6 ft 2 in', '249 lbs', 90, 'active', 'UCLA', NULL),
(17, 'John', 'Henson', '1992-08-30', 2, 'forward', '6 ft 3 in', '248 lbs', 91, 'active', 'North Carolina', NULL),
(17, 'Tony', 'Snell', '1993-09-01', 3, 'guard', '6 ft 4 in', '247 lbs', 92, 'active', 'Duke', NULL),
(17, 'Jason', 'Terry', '1988-10-02', 4, 'center', '6 ft 5 in', '246 lbs', 93, 'active', 'Kansas', NULL),
(18, 'Cole', 'Aldrich', '1989-11-03', 5, 'guard', '6 ft 6 in', '245 lbs', 94, 'active', 'Florida', NULL),
(18, 'Aaron', 'Brooks', '1990-12-04', 6, 'forward', '6 ft 7 in', '244 lbs', 95, 'active', 'Texas', NULL),
(18, 'Jimmy', 'Butler', '1991-01-05', 7, 'center', '6 ft 8 in', '243 lbs', 96, 'active', 'Kansas', NULL),
(18, 'Justin', 'Patton', '1992-02-06', 1, 'forward', '6 ft 9 in', '242 lbs', 97, 'active', 'Wisconsin', NULL),
(18, 'Andrew', 'Wiggins', '1993-03-07', 2, 'guard', '6 ft 10 in', '241 lbs', 98, 'active', 'Stanford', NULL),
(19, 'Ian', 'Clark', '1988-04-08', 3, 'center', '6 ft 11 in', '240 lbs', 99, 'active', 'Old Dominion', NULL),
(19, 'Anthony', 'Davis', '1989-05-09', 4, 'guard', '6 ft 1 in', '239 lbs', 1, 'active', 'UCLA', NULL),
(19, 'Charles', 'Cooke', '1990-06-10', 5, 'forward', '6 ft 2 in', '238 lbs', 2, 'active', 'North Carolina', NULL),
(19, 'Darius', 'Miller', '1991-07-11', 6, 'center', '6 ft 3 in', '237 lbs', 3, 'active', 'Duke', NULL),
(19, 'Frank', 'Jackson', '1992-08-12', 7, 'forward', '6 ft 4 in', '236 lbs', 4, 'active', 'Kansas', NULL),
(20, 'Ron', 'Baker', '1993-09-13', 1, 'guard', '6 ft 5 in', '235 lbs', 5, 'active', 'Florida', NULL),
(20, 'Michael', 'Beasley', '1988-10-14', 2, 'center', '6 ft 6 in', '224 lbs', 6, 'active', 'Texas', NULL),
(20, 'Trey', 'Burke', '1989-11-15', 3, 'guard', '6 ft 7 in', '234 lbs', 7, 'active', 'Kansas', NULL),
(20, 'Isaiah', 'Hicks', '1990-01-16', 4, 'forward', '6 ft 8 in', '233 lbs', 8, 'active', 'Wisconsin', NULL),
(20, 'Lance', 'Thomas', '1991-02-17', 5, 'center', '6 ft 9 in', '232 lbs', 9, 'active', 'Stanford', NULL),
(21, 'Alex', 'Abrines', '1992-03-18', 6, 'guard', '6 ft 10 in', '231 lbs', 10, 'active', 'Old Dominion', NULL),
(21, 'Carmelo', 'Anthony', '1993-04-19', 7, 'forward', '6 ft 11 in', '230 lbs', 11, 'active', 'UCLA', NULL),
(21, 'Raymond', 'Felton', '1988-05-20', 1, 'center', '6 ft 1 in', '229 lbs', 12, 'active', 'North Carolina', NULL),
(21, 'Paul', 'George', '1989-06-21', 2, 'guard', '6 ft 2 in', '228 lbs', 13, 'active', 'Duke', NULL),
(21, 'Daniel', 'Hamilton', '1990-07-22', 3, 'forward', '6 ft 3 in', '227 lbs', 14, 'active', 'Kansas', NULL),
(22, 'Evan', 'Fournier', '1991-08-23', 4, 'center', '6 ft 4 in', '226 lbs', 15, 'active', 'Florida', NULL),
(22, 'Aaron', 'Gordon', '1992-09-24', 5, 'forward', '6 ft 5 in', '225 lbs', 16, 'active', 'Texas', NULL),
(22, 'Jonathan', 'Isaac', '1993-10-25', 6, 'guard', '6 ft 6 in', '224 lbs', 17, 'active', 'Kansas', NULL),
(22, 'Shelvin', 'Mack', '1988-11-26', 7, 'center', '6 ft 7 in', '223 lbs', 18, 'active', 'Wisconsin', NULL),
(22, 'Terrence', 'Ross', '1989-12-27', 1, 'forward', '6 ft 8 in', '222 lbs', 19, 'active', 'Stanford', NULL),
(23, 'Justin', 'Anderson', '1990-01-28', 2, 'guard', '6 ft 9 in', '221 lbs', 20, 'active', 'Old Dominion', NULL),
(23, 'Amir', 'Johnson', '1991-02-25', 3, 'center', '6 ft 10 in', '220 lbs', 21, 'active', 'UCLA', NULL),
(23, 'Trevor', 'Booker', '1992-03-30', 4, 'forward', '6 ft 11 in', '221 lbs', 22, 'active', 'North Carolina', NULL),
(23, 'Robert', 'Covington', '1993-04-01', 5, 'forward', '6 ft 1 in', '222 lbs', 23, 'active', 'Duke', NULL),
(23, 'Ben', 'Simmons', '1988-05-02', 6, 'center', '6 ft 2 in', '223 lbs', 24, 'active', 'Kansas', NULL),
(24, 'Zach', 'Collins', '1989-06-03', 7, 'guard', '6 ft 3 in', '224 lbs', 25, 'active', 'Florida', NULL),
(24, 'Ed', 'Davis', '1990-07-04', 1, 'forward', '6 ft 4 in', '225 lbs', 26, 'active', 'Texas', NULL),
(24, 'Jake', 'Layman', '1991-08-05', 2, 'center', '6 ft 5 in', '226 lbs', 27, 'active', 'Kansas', NULL),
(24, 'Meyers', 'Leonard', '1992-09-06', 3, 'forward', '6 ft 6 in', '227 lbs', 28, 'active', 'Wisconsin', NULL),
(24, 'Brandon', 'Rush', '1993-10-07', 4, 'guard', '6 ft 7 in', '228 lbs', 29, 'active', 'Stanford', NULL),
(25, 'Vince', 'Carter', '1988-11-08', 5, 'center', '6 ft 8 in', '229 lbs', 30, 'active', 'Old Dominion', NULL),
(25, 'Jack', 'Cooley', '1989-12-09', 6, 'forward', '6 ft 9 in', '230 lbs', 31, 'active', 'UCLA', NULL),
(25, 'Frank', 'Mason', '1990-01-10', 7, 'guard', '6 ft 10 in', '231 lbs', 32, 'active', 'North Carolina', NULL),
(25, 'Harry', 'Giles', '1991-02-11', 1, 'center', '6 ft 11 in', '232 lbs', 33, 'active', 'Duke', NULL),
(25, 'Garrett', 'Temple', '1992-03-12', 2, 'guard', '6 ft 1 in', '233 lbs', 34, 'active', 'Kansas', NULL),
(26, 'Tyson', 'Chandler', '1993-04-13', 3, 'forward', '6 ft 2 in', '234 lbs', 35, 'active', 'Florida', NULL),
(26, 'Troy', 'Daniels', '1988-05-14', 4, 'center', '6 ft 3 in', '235 lbs', 36, 'active', 'Texas', NULL),
(26, 'Jared', 'Dudley', '1989-06-15', 5, 'forward', '6 ft 4 in', '236 lbs', 37, 'active', 'Kansas', NULL),
(26, 'Alex', 'Len', '1990-07-16', 6, 'guard', '6 ft 5 in', '237 lbs', 38, 'active', 'Wisconsin', NULL),
(26, 'Alan', 'Williams', '1991-08-17', 7, 'center', '6 ft 6 in', '238 lbs', 39, 'active', 'Stanford', NULL),
(27, 'Kyle', 'Anderson', '1992-09-18', 1, 'guard', '6 ft 7 in', '239 lbs', 40, 'active', 'Old Dominion', NULL),
(27, 'Matt', 'Costello', '1993-10-19', 2, 'forward', '6 ft 8 in', '240 lbs', 41, 'active', 'UCLA', NULL),
(27, 'Bryn', 'Forbes', '1988-11-20', 3, 'center', '6 ft 9 in', '241 lbs', 42, 'active', 'North Carolina', NULL),
(27, 'Danny', 'Green', '1989-12-21', 4, 'guard', '6 ft 10 in', '241 lbs', 43, 'active', 'Duke', NULL),
(27, 'Tony', 'Parker', '1990-01-22', 5, 'forward', '6 ft 11 in', '242 lbs', 44, 'active', 'Kansas', NULL),
(28, 'Lorenzo', 'Brown', '1991-02-23', 6, 'center', '6 ft 1 in', '243 lbs', 45, 'active', 'Florida', NULL),
(28, 'Kyle', 'Lowry', '1992-03-24', 7, 'forward', '6 ft 2 in', '244 lbs', 46, 'active', 'Texas', NULL),
(28, 'CJ', 'Miles', '1993-04-25', 1, 'guard', '6 ft 3 in', '245 lbs', 47, 'active', 'Kansas', NULL),
(28, 'Norman', 'Powell', '1988-05-26', 2, 'center', '6 ft 4 in', '246 lbs', 48, 'active', 'Wisconsin', NULL),
(28, 'Delon', 'Wright', '1989-06-27', 3, 'forward', '6 ft 5 in', '247 lbs', 49, 'active', 'Stanford', NULL),
(29, 'Tim', 'Frazier', '1990-07-28', 4, 'guard', '6 ft 6 in', '248 lbs', 50, 'active', 'Old Dominion', NULL),
(29, 'Jodie', 'Meeks', '1991-08-29', 5, 'center', '6 ft 7 in', '249 lbs', 51, 'active', 'UCLA', NULL),
(29, 'Devin', 'Robinson', '1992-09-30', 6, 'guard', '6 ft 8 in', '250 lbs', 52, 'active', 'North Carolina', NULL),
(29, 'Mike', 'Scott', '1993-10-01', 7, 'forward', '6 ft 9 in', '220 lbs', 53, 'active', 'Duke', NULL),
(29, 'John', 'Wall', '1988-11-02', 1, 'center', '6 ft 10 in', '221 lbs', 54, 'active', 'Kansas', NULL),
(30, 'Alec', 'Burks', '1989-12-03', 2, 'forward', '6 ft 11 in', '223 lbs', 55, 'active', 'Florida', NULL),
(30, 'Tony', 'Bradley', '1990-01-04', 3, 'guard', '6 ft 1 in', '224 lbs', 56, 'active', 'Texas', NULL),
(30, 'Derrick', 'Favors', '1991-02-05', 4, 'center', '6 ft 2 in', '225 lbs', 57, 'active', 'Kansas', NULL),
(30, 'Joe', 'Ingles', '1992-03-06', 5, 'forward', '6 ft 3 in', '226 lbs', 58, 'active', 'Wisconsin', NULL),
(30, 'Donovan', 'Mitchell', '1993-04-07', 6, 'guard', '6 ft 4 in', '227 lbs', 59, 'active', 'Stanford', NULL);

INSERT INTO stats(stats_id, g_id, p_id, points, fg_made, fg_attempt, threes_made, threes_attempt, ft_made, ft_attempt, off_rebound, def_rebound, assists, steals, fouls, blocks,turnovers) VALUES (1, 1, 1, 25, 9, 15, 3, 6, 4, 4, 1, 2, 4, 3, 3, 1, 3);
    
INSERT INTO stats(g_id, p_id, points, fg_made, fg_attempt, threes_made, threes_attempt, ft_made, ft_attempt, off_rebound, def_rebound, assists, steals, fouls, blocks,turnovers) VALUES (1, 2, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (1, 3, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (1, 4, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (1, 5, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (1, 6, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (1, 7, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (1, 8, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (1, 9, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (1, 10, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (2, 11, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (2, 12, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (2, 13, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (2, 14, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (2, 15, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (2, 16, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (2, 17, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (2, 18, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (2, 19, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (2, 20, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (3, 21, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (3, 22, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (3, 23, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (3, 24, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (3, 25, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (3, 26, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (3, 27, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (3, 28, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (3, 29, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (3, 30, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
    (4, 31, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (4, 32, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (4, 33, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (4, 34, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (4, 35, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (4, 36, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (4, 37, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (4, 38, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (4, 39, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (4, 40, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (5, 41, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (5, 42, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (5, 43, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (5, 44, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (5, 45, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (5, 46, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (5, 47, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (5, 48, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (5, 49, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (5, 50, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (6, 51, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (6, 52, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (6, 53, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (6, 54, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (6, 55, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (6, 56, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (6, 57, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (6, 58, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (6, 59, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (6, 60, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
    (7, 61, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (7, 62, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (7, 63, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (7, 64, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (7, 65, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (7, 66, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (7, 67, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (7, 68, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (7, 69, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (7, 70, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (8, 71, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (8, 72, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (8, 73, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (8, 74, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (8, 75, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (8, 76, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (8, 77, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (8, 78, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (8, 79, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (8, 80, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (9, 81, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (9, 82, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (9, 83, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (9, 84, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (9, 85, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (9, 86, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (9, 87, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (9, 88, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (9, 89, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (9, 90, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
    (10, 91, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (10, 92, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (10, 93, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (10, 94, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (10, 95, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (10, 96, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (10, 97, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (10, 98, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (10, 99, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (10, 100, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (11, 101, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (11, 102, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (11, 103, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (11, 104, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (11, 105, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (11, 106, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (11, 107, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (11, 108, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (11, 109, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (11, 110, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (12, 111, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (12, 112, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (12, 113, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (12, 114, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (12, 115, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (12, 116, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (12, 117, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (12, 118, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (12, 119, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (12, 120, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
    (13, 121, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (13, 122, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (13, 123, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (13, 124, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (13, 125, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (13, 126, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (13, 127, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (13, 128, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (13, 129, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (13, 130, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (14, 131, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (14, 132, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (14, 133, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (14, 134, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (14, 135, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (14, 136, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (14, 137, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (14, 138, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (14, 139, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (14, 140, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (15, 141, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (15, 142, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (15, 143, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (15, 144, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (15, 145, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (15, 146, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (15, 147, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (15, 148, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (15, 149, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (15, 150, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
	(16, 1, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (16, 2, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (16, 3, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (16, 4, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (16, 5, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (16, 6, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (16, 7, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (16, 8, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (16, 9, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (16, 10, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
	(17, 11, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (17, 12, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (17, 13, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (17, 14, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (17, 15, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (17, 16, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (17, 17, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (17, 18, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (17, 19, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (17, 20, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (18, 21, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (18, 22, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (18, 23, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (18, 24, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (18, 25, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (18, 26, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (18, 27, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (18, 28, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (18, 29, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (18, 30, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (19, 31, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (19, 32, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (19, 33, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (19, 34, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (19, 35, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (19, 36, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (19, 37, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (19, 38, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (19, 39, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (19, 40, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
	(20, 41, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (20, 42, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (20, 43, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (20, 44, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (20, 45, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (20, 46, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (20, 47, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (20, 48, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (20, 49, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (20, 50, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (21, 51, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (21, 52, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (21, 53, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (21, 54, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (21, 55, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (21, 56, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (21, 57, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (21, 58, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (21, 59, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (21, 60, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (22, 61, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (22, 62, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (22, 63, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (22, 64, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (22, 65, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (22, 66, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (22, 67, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (22, 68, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (22, 69, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (22, 70, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
	(23, 71, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (23, 72, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (23, 73, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (23, 74, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (23, 75, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (23, 76, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (23, 77, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (23, 78, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (23, 79, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (23, 80, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (24, 81, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (24, 82, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (24, 83, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (24, 84, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (24, 85, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (24, 86, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (24, 87, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (24, 88, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (24, 89, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (24, 90, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (25, 91, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (25, 92, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (25, 93, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (25, 94, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (25, 95, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (25, 96, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (25, 97, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (25, 98, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (25, 99, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (25, 100, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
	(26, 101, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (26, 102, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (26, 103, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (26, 104, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (26, 105, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (26, 106, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (26, 107, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (26, 108, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (26, 109, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (26, 110, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (27, 111, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (27, 112, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (27, 113, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (27, 114, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (27, 115, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (27, 116, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (27, 117, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (27, 118, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (27, 119, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (27, 120, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5),
    (28, 121, 14, 7, 12, 3, 6, 7, 8, 5, 10, 5, 3, 4, 1, 2),
    (28, 122, 19, 8, 15, 5, 6, 5, 6, 3, 7, 3, 2, 2, 2, 0),
    (28, 123, 13, 5, 14, 3, 6, 4, 4, 2, 9, 2, 5, 3, 4, 0),
    (28, 124, 19, 6, 9, 4, 6, 6, 6, 4, 4, 6, 2, 5, 3, 3),
    (28, 125, 20, 8, 11, 5, 7, 8, 8, 7, 6, 7, 4, 2, 0, 1),
    (28, 126, 21, 9, 12, 6, 8, 7, 8, 10, 8, 5, 1, 1, 1, 4),
    (28, 127, 28, 10, 10, 6, 7, 8, 8, 8, 5, 8, 3, 3, 3, 0),
    (28, 128, 25, 8, 13, 7, 9, 7, 8, 5, 6, 9, 4, 4, 0, 0),
    (28, 129, 30, 10, 15, 8, 10, 8, 8, 7, 6, 8, 2, 2, 4, 0),
    (28, 130, 21, 7, 14, 5, 7, 7, 8, 9, 10, 5, 5, 5, 1, 1),
	(29, 131, 25, 9, 15, 3, 6, 4, 4, 1, 2, 10, 3, 4, 1, 3),
    (29, 132, 10, 9, 16, 3, 5, 5, 6, 4, 7, 3, 5, 3, 3, 2),
    (29, 133, 22, 7, 10, 5, 7, 7, 8, 2, 8, 7, 1, 5, 2, 4),
    (29, 134, 16, 8, 14, 2, 5, 6, 4, 3, 6, 4, 3, 2, 1, 0),
    (29, 135, 13, 6, 11, 3, 8, 5, 6, 6, 10, 5, 2, 4, 4, 1),
    (29, 136, 28, 5, 13, 5, 7, 7, 8, 3, 8, 8, 4, 3, 1, 2),
    (29, 137, 14, 6, 16, 3, 6, 6, 6, 5, 7, 4, 1, 2, 2, 0),
    (29, 138, 7, 4, 14, 1, 4, 4, 4, 2, 8, 3, 3, 3, 4, 5),
    (29, 139, 12, 8, 10, 3, 6, 5, 6, 1, 8, 5, 2, 5, 3, 2),
    (29, 140, 19, 6, 13, 5, 7, 6, 6, 3, 10, 3, 5, 2, 1, 0),
    (30, 141, 17, 7, 12, 2, 4, 4, 4, 2, 5, 4, 4, 3, 5, 1),
    (30, 142, 14, 9, 14, 4, 6, 7, 8, 5, 7, 3, 3, 1, 3, 4),
    (30, 143, 10, 8, 15, 2, 5, 4, 4, 3, 3, 3, 4, 4, 1, 0),
    (30, 144, 9, 3, 16, 2, 6, 6, 6, 4, 8, 2, 1, 5, 2, 2),
    (30, 145, 18, 6, 15, 4, 6, 4, 4, 6, 5, 4, 3, 3, 0, 5),
    (30, 146, 18, 7, 14, 5, 7, 6, 6, 2, 6, 6, 2, 2, 2, 0),
    (30, 147, 22, 8, 13, 6, 7, 7, 8, 4, 7, 7, 5, 4, 1, 3),
    (30, 148, 28, 9, 15, 7, 8, 8, 8, 5, 4, 9, 4, 1, 3, 1),
    (30, 149, 31, 10, 10, 7, 9, 8, 8, 2, 8, 10, 2, 5, 0, 0),
    (30, 150, 17, 8, 13, 4, 5, 6, 6, 1, 9, 4, 1, 1, 5, 5);
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `away_team_wins` AS
    SELECT 
        `games`.`matches` AS `matches`,
        `games`.`date_played` AS `date_played`,
        `games`.`home_score` AS `home_score`,
        `games`.`away_score` AS `away_score`,
        `games`.`season` AS `season`
    FROM
        `games`
    WHERE
        (`games`.`home_score` <= `games`.`away_score`)
    ORDER BY `games`.`matches`;
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `defensive_stats` AS
    SELECT DISTINCT
        `players`.`first_name` AS `first_name`,
        `players`.`last_name` AS `last_name`,
        `players`.`birthdate` AS `birthdate`,
        `players`.`season_experience` AS `season_experience`,
        `players`.`role` AS `role`,
        `players`.`height` AS `height`,
        `players`.`weight` AS `weight`,
        `players`.`jersey_number` AS `jersey_number`,
        `players`.`roster_status` AS `roster_status`,
        `players`.`school` AS `school`,
        `stats`.`def_rebound` AS `def_rebound`,
        `stats`.`steals` AS `steals`,
        `stats`.`turnovers` AS `turnovers`,
        `stats`.`blocks` AS `blocks`
    FROM
        (`stats`
        JOIN `players` ON ((`stats`.`p_id` = `players`.`player_id`)))
    	ORDER BY `players`.`last_name`;
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
    VIEW `home_team_wins` AS
    SELECT 
        `games`.`matches` AS `matches`,
        `games`.`date_played` AS `date_played`,
        `games`.`home_score` AS `home_score`,
        `games`.`away_score` AS `away_score`,
        `games`.`season` AS `season`
    FROM
        `games`
    WHERE
        (`games`.`away_score` <= `games`.`home_score`)
    ORDER BY `games`.`matches`;
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
    VIEW `offensive_stats` AS
    SELECT DISTINCT
        `players`.`first_name` AS `first_name`,
        `players`.`last_name` AS `last_name`,
        `players`.`birthdate` AS `birthdate`,
        `players`.`season_experience` AS `season_experience`,
        `players`.`role` AS `role`,
        `players`.`height` AS `height`,
        `players`.`weight` AS `weight`,
        `players`.`jersey_number` AS `jersey_number`,
        `players`.`roster_status` AS `roster_status`,
        `players`.`school` AS `school`,
        `stats`.`fg_made` AS `fg_made`,
        `stats`.`fg_attempt` AS `fg_attempt`,
        `stats`.`threes_made` AS `threes_made`,
        `stats`.`threes_attempt` AS `threes_attempt`,
        `stats`.`ft_made` AS `ft_made`,
        `stats`.`ft_attempt` AS `ft_attempt`,
        `stats`.`off_rebound` AS `off_rebound`,
        `stats`.`assists` AS `assists`,
        `stats`.`points` AS `points`
    FROM
        (`stats`
        JOIN `players` ON ((`stats`.`p_id` = `players`.`player_id`)))
    ORDER BY `players`.`last_name`;
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
    VIEW `view_forwards_sorted_by_points_per_game` AS
    SELECT DISTINCT
        `players`.`role` AS `role`,
        `players`.`first_name` AS `first_name`,
        `players`.`last_name` AS `last_name`,
        `teams`.`team_name` AS `team_name`,
        `players`.`jersey_number` AS `jersey_number`,
        `players`.`height` AS `height`,
        `players`.`weight` AS `weight`,
        `players`.`school` AS `school`,
        `stats`.`points` AS `points`
    FROM
        ((`players`
        JOIN `teams` ON ((`players`.`t_id` = `teams`.`team_id`)))
        JOIN `stats` ON ((`stats`.`p_id` = `players`.`player_id`)))
    WHERE
        (`players`.`role` = 'forward')
    ORDER BY `stats`.`points` DESC;
    
    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
    VIEW `view_players` AS
    SELECT 
        `players`.`first_name` AS `first_name`,
        `players`.`last_name` AS `last_name`,
        `players`.`jersey_number` AS `jersey_number`
    FROM
        `players`;
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
    VIEW `view_rosters` AS
    SELECT 
        `teams`.`team_name` AS `team_name`,
        `teams`.`records` AS `records`,
        `players`.`first_name` AS `first_name`,
        `players`.`last_name` AS `last_name`,
        `players`.`jersey_number` AS `jersey_number`,
        `players`.`role` AS `role`,
        `players`.`height` AS `height`,
        `players`.`weight` AS `weight`
    FROM
        (`players`
        JOIN `teams` ON ((`players`.`t_id` = `teams`.`team_id`)))
    ORDER BY `teams`.`team_name`;

DROP procedure IF EXISTS 'player_stat'
 DELIMITER $$
CREATE PROCEDURE `player_stat` (IN first_name VARCHAR(20), IN last_name VARCHAR(20))
BEGIN
SELECT 	CONCAT_WS(' ', t.city, t.team_name) AS 'Team',
		CONCAT_WS(' ', p.first_name, p.last_name) AS 'Player',
        g.matches AS 'Game', g.date_played, s.points, s.fg_made, s.fg_attempt,
        s.threes_made, s.threes_attempt, s.ft_made, s.ft_attempt, s.off_rebound, 
        s.def_rebound, s.assists, s.steals, s.fouls, s.blocks, s.turnovers
FROM players AS p
JOIN teams AS t
	ON p.t_id= t.team_id
JOIN stats AS s
	ON s.p_id = p.player_id
JOIN games AS g
	ON t.team_id = g.home_team_id 
    OR t.team_id = g.away_team_id
	AND s.g_id = g.game_id
WHERE	p.first_name = first_name
AND		p.last_name = last_name
GROUP BY 'Team', g.date_played;
END$$

DELIMITER ;

DROP procedure IF EXISTS `team_record`;

DELIMITER $$
CREATE PROCEDURE `team_record` (IN city VARCHAR(20), IN team VARCHAR(20))
BEGIN
 SELECT CONCAT_WS(' ', t.city, t.team_name) AS 'Team', t.records AS 'Record',
		CONCAT_WS(' ', p.first_name, p.last_name) AS 'Players'
     FROM teams AS t
     JOIN players AS p
		ON p.t_id = t.team_id
     WHERE 	t.city = city
     AND	t.team_name = team;
END$$

DELIMITER ;

