--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/jvyJ6xmPyrWab2MeX
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type Matrix    is array(Positive range <>, Positive range <>) of Natural;
	type Str_Array is array(Positive range <>) of String(1..2); 
	
	procedure Print (mat : Matrix) is
		begin
			for I in mat'Range(1) loop
				for J in mat'Range(2) loop
					Put (mat (I, J)'Image & " ");
				end loop;
				New_Line;
			end loop;
	end Print;
	
	procedure Final (row, col : Positive; arr : Str_Array) is
		mat : Matrix(1..row, 1..col) := (Others => (Others => 0));
		tem : Natural := 0;
		begin
			for s of arr loop
				tem := Natural'Value (s (1..1));
				
				if tem /= 0 then
					if s (2) = 'r' then
						for J in mat'Range(2) loop
							mat (tem, J) := mat (tem, J) + 1;
						end loop;
					elsif s (2) = 'c' then
						for I in mat'Range(1) loop
							mat (I, tem) := mat (I, tem) + 1;
						end loop;
					end if;
				end if;
			end loop;
			
			Print (mat);
	end Final;
	
	row : Positive  := 3;
	col : Positive  := 3;
	arr : Str_Array := ("3r", "3c", "2r", "1c"); 
	
begin
    Final (row, col, arr);
end Hello;

