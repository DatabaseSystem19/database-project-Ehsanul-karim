
select * from club_details;
select * from player_details;
select * from schedule_details;
select * from score;
select * from match_history;

INSERT INTO club_details (club_id, club_name, stadium_name, shorthand) VALUES (1, 'Barcelona', 'Camp Nou', 'BARC');
INSERT INTO club_details VALUES (2, 'Manchester United', 'Old Trafford', 'MNU');
INSERT INTO club_details VALUES (3, 'Bayern Munich', 'Allianz Arena', 'BAY');
INSERT INTO club_details VALUES (4, 'Liverpool', 'Anfield', 'LIV');
INSERT INTO club_details VALUES (5, 'Paris Saint-Germain', 'Le Parc des Princes', 'PSG');
INSERT INTO club_details  VALUES (6, 'Real Madrid', 'Santiago Bernabeu', 'RMA');
INSERT INTO club_details  VALUES (7, 'Chelsea', 'Stamford Bridge', 'CHE');
INSERT INTO club_details  VALUES (8, 'Juventus', 'Allianz Stadium', 'JUV');
INSERT INTO club_details  VALUES (9, 'Manchester City', 'Etihad Stadium', 'MCI');
INSERT INTO club_details  VALUES (10, 'Arsenal', 'Emirates Stadium', 'ARS');
select * from club_details;

INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (1, 'Lionel', 'Messi', 'Attacker', 1);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (2, 'Sergio', 'Busquets', 'Mid-Fielder', 1);
INSERT INTO player_details  (player_id, first_name, last_name, position, club_id) VALUES (3, 'Bruno', 'Fernandes', 'Mid-Fielder', 2);
INSERT INTO player_details  (player_id, first_name, last_name, position, club_id) VALUES (4, 'Harry', 'Maguire', 'Defender', 2);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (5, 'Robert', 'Lewandowski', 'Attacker', 3);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (6, 'Manuel', 'Neuer', 'Goalkeeper', 3);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (9, 'Mohamed', 'Salah', 'Attacker', 4);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (10, 'Virgil', 'van Dijk', 'Defender', 4);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (11, 'Neymar', 'Jr', 'Attacker', 5);
INSERT INTO player_details  (player_id, first_name, last_name, position, club_id) VALUES (12, 'Marquinhos', 'Osaka', 'Defender', 5);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (7, 'Pierre-Emerick', 'Aubameyang', 'Attacker', 10);
INSERT INTO player_details  (player_id, first_name, last_name, position, club_id) VALUES (8, 'Bukayo', 'Saka', 'Mid-Fielder', 10);
INSERT INTO player_details  (player_id, first_name, last_name, position, club_id) VALUES (13, 'Karim', 'Benzema', 'Attacker', 6);
INSERT INTO player_details  (player_id, first_name, last_name, position, club_id)  VALUES (14, 'Thibaut', 'Courtois', 'Goalkeeper', 6);
INSERT INTO player_details  (player_id, first_name, last_name, position, club_id) VALUES (15,'Antonio', 'Rudiger', 'Defender', 7);
INSERT INTO player_details  (player_id, first_name, last_name, position, club_id) VALUES (16, 'Cristiano', 'Ronaldo', 'Attacker', 8);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (17, 'Kevin', 'De Bruyne', 'Mid-Fielder', 9);
INSERT INTO player_details (player_id, first_name, last_name, position, club_id) VALUES (18, 'Raheem', 'Sterling', 'Attacker', 9);
select * from player_details;

INSERT INTO schedule_details (match_no, s_date, id_home, id_opponent) VALUES (1, to_date('2023-06-01', 'YYYY-MM-DD'), 1, 2);
INSERT INTO schedule_details VALUES (2, to_date('2023-06-02', 'YYYY-MM-DD'), 3, 4);
INSERT INTO schedule_details VALUES (3, to_date('2023-06-03', 'YYYY-MM-DD'), 5, 6);
INSERT INTO schedule_details VALUES (4, to_date('2023-04-01', 'YYYY-MM-DD'), 1, 6);
INSERT INTO schedule_details VALUES (5, to_date('2023-04-02', 'YYYY-MM-DD'), 3, 5);
INSERT INTO schedule_details VALUES (6, to_date('2023-04-05', 'YYYY-MM-DD'), 5, 4);
INSERT INTO schedule_details VALUES (7, to_date('2023-06-07', 'YYYY-MM-DD'), 5, 6);
INSERT INTO schedule_details VALUES (8, to_date('2023-04-13', 'YYYY-MM-DD'), 3, 7);
INSERT INTO schedule_details VALUES (9, to_date('2023-04-19', 'YYYY-MM-DD'), 7, 1);
INSERT INTO schedule_details VALUES (10, to_date('2023-05-24', 'YYYY-MM-DD'), 10, 8);
INSERT INTO schedule_details VALUES (11, to_date('2023-05-28', 'YYYY-MM-DD'), 6, 2);
select * from schedule_details;

INSERT INTO match_history (match_no, home_team_goal, opponent_team_goal) VALUES (1, 3, 1);
INSERT INTO match_history  VALUES (2, 2, 2);
INSERT INTO match_history  VALUES (3, 2, 0);
INSERT INTO match_history  VALUES (4, 1, 2);
INSERT INTO match_history  VALUES (5, 1, 3);
INSERT INTO match_history  VALUES (6, 0, 3);
INSERT INTO match_history  VALUES (7, 2, 1);
INSERT INTO match_history  VALUES (8, 3, 2);
INSERT INTO match_history  VALUES (9, 3, 3);
INSERT INTO match_history  VALUES (10, 4, 3);
INSERT INTO match_history  VALUES (11, 0, 0);
select * from match_history;


INSERT INTO score (player_id, match_no, goals_scored, goals_assisted) VALUES (1, 1, 2, 1);
INSERT INTO score VALUES (2, 1, 1, 0);
INSERT INTO score VALUES (3, 1, 1, 0);
INSERT INTO score VALUES (5, 2, 2, 0);
INSERT INTO score VALUES (9, 2, 1, 1);
INSERT INTO score VALUES (10, 2, 1, 1);
INSERT INTO score VALUES (11, 3, 2, 0);
INSERT INTO score VALUES (2, 4, 1, 0);
INSERT INTO score VALUES (13, 4, 1, 0);
INSERT INTO score VALUES (14, 4, 1, 1);
select * from score;

--update records of a table
update player_details set position='Mid-Fielder' where player_id=11;
select * from player_details;
--update data by 'in'
update player_details set injured_status='yes' where club_id in (select club_id from club_details where club_name like 'B%');
select * from player_details;

--delete data from table
delete from match_history where match_no=11;
select * from match_history;