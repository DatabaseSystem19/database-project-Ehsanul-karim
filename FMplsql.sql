--1
set serveroutput on
declare 
club_id club_details.club_id%type;
club_name club_details.club_name%type;
begin
select club_id,club_name into club_id,club_name from club_details where club_id=7;
dbms_output.put_line('CLUB_id: '||club_id|| ' CLUB_name: '||club_name);
end;
/
--2
set serveroutput on
declare 
club_id club_details.club_id%type := 9;
club_name club_details.club_name%type := 'Santos';
stadium_name club_details.stadium_name%type := 'Rio de genero';
shorthand club_details.shorthand%type :='SAN';
begin
insert into club_details values(club_id,club_name,stadium_name,shorthand);
end;
/
--3
set serveroutput on
declare 
club_row club_details%rowtype;
begin
select club_id,club_name into club_row.club_id,club_row.club_name from club_details where club_id=7;
end;
/
--4
set serveroutput on
declare 
cursor club_cursor is select * from club_details;
club_row club_details%rowtype;
begin
open club_cursor;
fetch club_cursor into club_row.club_id,club_row.club_name,club_row.stadium_name,club_row.shorthand;
while club_cursor%found loop
dbms_output.put_line('clubID: '||club_row.club_id|| ' club_name: '||club_row.club_name || ' stadium_name: ' ||club_row.stadium_name|| ' shorthand: '||club_row.shorthand);
dbms_output.put_line('Row count: '|| club_cursor%rowcount);
fetch club_cursor into club_row.club_id,club_row.club_name,club_row.stadium_name,club_row.shorthand;
end loop;
close club_cursor;
end;
/
--6
set serveroutput on
declare 
  counter number;
  first_name2 player_details.first_name%type;
  TYPE NAMEARRAY IS VARRAY(5) OF player_details.first_name%type;
  A_NAME NAMEARRAY:=NAMEARRAY();
begin
  counter:=1;
  for x in 12..16  
  loop
    select first_name into first_name2 from player_details where player_id=x;
    A_NAME.EXTEND();
    A_NAME(counter):=first_name2;
    counter:=counter+1;
  end loop;
  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/
--7
DECLARE 
   counter NUMBER := 1;
   first_name2 player_details.first_name%type;
   TYPE NAMEARRAY IS VARRAY(5) OF player_details.first_name%type;
   A_NAME NAMEARRAY:=NAMEARRAY('Player 1', 'Player 2', 'Player 3', 'Player 4', 'Player 5'); 
   -- VARRAY with a fixed size of 5 elements and initialized with book names
BEGIN
   counter := 1;
   FOR x IN 12..16  
   LOOP
    select first_name into first_name2 from player_details where player_id=x;
      A_NAME(counter) := first_name2;
      counter := counter + 1;
   END LOOP;
   counter := 1;
   WHILE counter <= A_NAME.COUNT 
   LOOP 
      DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
      counter := counter + 1;
   END LOOP;
END;
/
--8
DECLARE 
   counter NUMBER := 1;
   first_name2 player_details.first_name%type;
   TYPE NAMEARRAY IS VARRAY(5) OF player_details.first_name%type;
   A_NAME NAMEARRAY:=NAMEARRAY('Player 1', 'Player 2', 'Player 3', 'Player 4', 'Player 5'); 
BEGIN
   counter := 1;
   FOR x IN 1..16  
   LOOP
    select first_name into first_name2 from player_details where player_id=x;
      if first_name2='Lionel' 
        then
        dbms_output.put_line(first_name2||' is from '||'Barcelona');
      elsif first_name2='Neymar'  
        then
        dbms_output.put_line(first_name2||' is from '||'PSG');
      else 
        dbms_output.put_line(first_name2||' is from '||'other clubs');
        end if;
   END LOOP;
END;
/
--9
CREATE OR REPLACE PROCEDURE get_player_details(p_player_id IN player_details.player_id%TYPE) AS
  v_first_name player_details.first_name%TYPE;
  v_last_name player_details.last_name%TYPE;
  v_position player_details.position%TYPE;
BEGIN
  SELECT first_name, last_name, position
  INTO v_first_name, v_last_name, v_position
  FROM player_details
  WHERE player_id = p_player_id;

  DBMS_OUTPUT.PUT_LINE('Player Details:');
  DBMS_OUTPUT.PUT_LINE('First Name: ' || v_first_name);
  DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_last_name);
  DBMS_OUTPUT.PUT_LINE('Position: ' || v_position);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Player not found.');
END;
/
--10
CREATE OR REPLACE FUNCTION get_total_goals(p_player_id IN player_details.player_id%TYPE) RETURN NUMBER AS
  v_total_goals NUMBER;
BEGIN
  SELECT SUM(goals_scored)
  INTO v_total_goals
  FROM score
  WHERE player_id = p_player_id;

  RETURN v_total_goals;
END;
/
--11
drop get_player_details
drop get_total_goals





