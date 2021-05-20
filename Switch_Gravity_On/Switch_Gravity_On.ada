--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/xHFhHKnNP8uc7AoNm
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type Matrix is array(Positive range <>, Positive range <>) of Character;
	
	procedure Print (mat : Matrix) is
		begin
			for I in mat'Range(1) loop
				for J in mat'Range(2) loop
					Put (mat (I, J)'Image & " ");
				end loop;
				New_Line;
			end loop;
	end Print;
	
	procedure Switch_Gravity_On (mat : in out Matrix) is
		changed : Boolean;
		temp    : Character := ' ';
		begin
		
			for J in mat'Range(2) loop
				changed := True;
				while changed loop
					changed := False;
					for I in reverse mat'First .. mat'Last - 1 loop
						if mat (I, J) = '#' and mat (I + 1, J) = '-' then
							temp 	   	   := mat (I, J);
							mat (I, J) 	   := mat (I + 1, J);
							mat (I + 1, J) := temp;
							changed        := True;
						end if;
					end loop;
				end loop;
			end loop;
			
			Print (mat);
	end Switch_Gravity_On;
	
	mat : Matrix := (('-', '#', '#', '-'),
					 ('-', '-', '-', '-'),
					 ('-', '-', '-', '-'),
					 ('-', '-', '-', '-'));
	
begin
	Switch_Gravity_On (mat);
end Hello;