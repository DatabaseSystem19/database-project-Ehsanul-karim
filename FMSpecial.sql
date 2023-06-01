
--search by substring
select club_name,stadium_name from club_details where club_name like 'M%';
--search by 'in' 
select first_name,last_name from player_details where club_id in (select club_id from club_details where club_name like 'Liverpool');

-- range search
select first_name,last_name from player_details where club_id between 5 and 6;
select * from schedule_details WHERE s_date not between to_date('2023-04-01', 'yyyy-mm-dd') AND to_date('2023-04-30', 'yyyy-mm-dd');
--range search by 'in'
select first_name,last_name from player_details where player_id in (select player_id from score where goals_scored between 2 and 3);


--Aggregate functions
-- count total goals in the tournament
SELECT SUM (home_team_goal + opponent_team_goal) AS total_goals FROM match_history;
--count total players in a specific club
SELECT COUNT(player_id) AS total_players FROM player_details WHERE club_id = (SELECT club_id FROM club_details WHERE club_name = 'Real Madrid');
--count total players for all clubs using group by
SELECT club_id, COUNT(player_id) AS total_players FROM player_details p GROUP BY club_id ORDER BY club_id DESC;
--average goals in this tournament 
SELECT AVG(home_team_goal) AS home_goals, AVG(opponent_team_goal) AS opponent_goals FROM match_history;
-- group by match_no method + having total_goals >3
select match_no, sum(goals_scored) as total_goals from score GROUP BY match_no having sum(goals_scored) > 3 ;



--Union : 

select first_name , last_name from player_details
WHERE
club_id=1 
union 
select first_name , last_name from player_details
WHERE
club_id=4;

--Intersection : 

select * from player_details
WHERE
position = 'Attacker'
INTERSECT
select * from player_details
WHERE
first_name like 'M%';


-- nested

SELECT first_name FROM player_details WHERE club_id IN
  (
    SELECT id_home FROM schedule_details WHERE match_no IN
      (
        SELECT match_no FROM match_history mh
        WHERE 
        mh.home_team_goal + mh.opponent_team_goal = 
        (
          SELECT MAX(mh.home_team_goal + mh.opponent_team_goal) FROM match_history mh
        )
      )
  );

-- nested 
select match_no, (home_team_goal + opponent_team_goal) as total_goal from match_history where (home_team_goal + opponent_team_goal) = (
    SELECT MAX(home_team_goal + opponent_team_goal) FROM match_history where (home_team_goal + opponent_team_goal) < (SELECT MAX(home_team_goal + opponent_team_goal) FROM match_history)
);

--in: 
select first_name || ' ' || last_name AS player_name
FROM player_details
WHERE club_id IN (
  SELECT id_home
  FROM schedule_details
  WHERE s_date = to_date('2023-04-01', 'yyyy-mm-dd')
);


-- some ::
select club_name from club_details where club_id in (
select id_home from schedule_details 
where s_date > some (select s_date from schedule_details where match_no > = 8));


-- all:: 

select club_name from club_details where club_id in (
select id_home from schedule_details 
where s_date > all (select s_date from schedule_details where match_no > = 8));

--exist
SELECT club_name
FROM club_details
WHERE club_id = 6 AND EXISTS (
  SELECT *
  FROM player_details
  WHERE player_details.club_id = 6 AND position = 'Attacker'
);

--and
select * from player_details where position = 'Defender' and club_id in (select id_home from schedule_details where s_date > to_date('2023-06-01', 'yyyy-mm-dd'));

-- string operation 

SELECT * FROM club_details WHERE shorthand LIKE 'M%';
SELECT * FROM club_details WHERE shorthand LIKE '%V';
SELECT * FROM club_details WHERE club_name LIKE '%e%e%';
SELECT * FROM club_details WHERE shorthand LIKE '____';
SELECT * FROM player_details WHERE last_name LIKE 'M%' or last_name like'N%' or  last_name like 'V%';

--join

select * from schedule_details natural join match_history where s_date=to_date('2023-06-01', 'yyyy-mm-dd');
select * from schedule_details natural join match_history;

select (home_team_goal + opponent_team_goal) as total_goal , match_no , s_date as match_date from schedule_details join match_history using(match_no);

select (home_team_goal + opponent_team_goal) as total_goal , match_no , s_date from schedule_details left outer join match_history using(match_no);
select (home_team_goal + opponent_team_goal) as total_goal , match_no , player_id from score right outer join match_history using(match_no);
select (home_team_goal + opponent_team_goal) as total_goal , match_no , s_date from schedule_details full outer join match_history using(match_no);

select (home_team_goal + opponent_team_goal) as total_goal , schedule_details.match_no , schedule_details.s_date 
from schedule_details left outer join match_history on schedule_details.match_no = match_history.match_no;


-- Constraints on a Single Relation

CREATE TABLE player_details2 (
    id INTEGER PRIMARY KEY,
    player_name VARCHAR(50) NOT NULL,
    age INTEGER CHECK (age >= 18 AND age <= 120),
    fitness VARCHAR(10) CHECK (fitness IN ('injured', 'fit', 'healthy')),
    CONSTRAINT check_age_status CHECK (
        (fitness = 'fit' AND age >= 18 AND age <= 22) OR
        (fitness = 'injured' AND age >= 18 AND age <= 50) OR
        (fitness = 'healthy' AND age >= 18 AND age <= 30)
    )
);



INSERT INTO score (player_id, match_no, goals_scored, goals_assisted)
SELECT 13, 5, 3, 2
FROM dual
WHERE EXISTS (
    SELECT 1
    FROM schedule_details
    WHERE match_no = 5
    AND (id_home = (
            SELECT club_id
            FROM player_details
            WHERE player_id = 13)
        OR 
		id_opponent = (
            SELECT club_id
            FROM player_details
            WHERE player_id = 13)
    )
);

SELECT AVG(home_team_goal + opponent_team_goal) AS average_goals
FROM match_history mh
JOIN schedule_details sd ON mh.match_no = sd.match_no
JOIN club_details cd ON sd.id_home = cd.club_id
WHERE cd.stadium_name = 'Camp Nou';           
