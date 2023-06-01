drop table match_history;
drop table score;
drop table schedule_details;
drop table player_details;
drop table club_details;

Create table club_details(
club_id number(10),
club_name varchar(20) not null,
stadium_name varchar(20) DEFAULT 'UCL Stadium',
shorthand varchar(5) not null,
primary key(club_id)
);
create table player_details(
player_id number(10),
first_name varchar(20) not null,
last_name varchar(20) not null,
position varchar(20) check(position in ('Attacker','Mid-Fielder','Defender','Goalkeeper')),
club_id number(10),
primary key(player_id),
foreign key(club_id) references club_details(club_id)
);
create table schedule_details(
match_no number(10) primary key,
s_date DATE not null,
id_home number(10),
id_opponent number(10),
foreign key(id_home) references club_details(club_id) on delete cascade,
foreign key(id_opponent) references club_details(club_id) on delete cascade
);
create table score(
player_id number(10),
match_no number(10),
goals_scored number(10),
goals_assisted number(10),
foreign key(player_id) references player_details(player_id),
foreign key(match_no) references schedule_details(match_no)
);
create table match_history(
match_no number(10),
home_team_goal number(10) not null, 
opponent_team_goal number(10) not null,
primary key(match_no),
foreign key(match_no) references schedule_details(match_no)
);

desc club_details;
desc player_details;
desc schedule_details;
desc score;
desc match_history;

alter table club_details add manager_name varchar(20);
desc club_details;
alter table club_details rename column manager_name to manager_salary;
desc club_details;
alter table club_details modify manager_salary integer;
desc club_details;
alter table club_details drop column manager_salary;
desc club_details;

ALTER TABLE player_details
ADD injured_status VARCHAR(20) DEFAULT 'no' CHECK(injured_status IN ('yes', 'no'));
desc player_details;