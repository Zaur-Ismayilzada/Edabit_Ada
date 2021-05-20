--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/pmEMT7uYeNbHisFKK
with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
	type Identity_Matrix is array(Positive range <>, Positive range <>) of Natural;
	
	procedure Print (arr : Identity_Matrix) is
		begin
			for I in arr'Range(1) loop
				for J in arr'Range(2) loop
					Put (arr (I, J)'Image & " ");
				end loop;
				New_Line;
			end loop;
	end Print;
	
	procedure Output (num : Integer) is
		temp : Natural := abs (num);    
		begin
			if num = 0 then
				Put ("");
				return;
			end if;	
			
			declare
				arr  : Identity_Matrix(1..temp, 1..temp) := (Others => (Others => 0));
				flag : Positive := temp + 1;
				begin
					if num > 0 then
						for I in arr'Range(1) loop
							for J in arr'Range(2) loop
								if I = J then
									arr (I, J) := 1;
									exit;
								end if;
							end loop;
						end loop;
					elsif num < 0 then
						for I in arr'Range(1) loop
							flag := flag - 1;                        
							for J in reverse arr'Range(2) loop							
								if J = flag then
									arr (I, J) := 1;
									exit;
								end if;
							end loop;
						end loop;
					end if;
					
					Print (arr);
				end;
	end Output;
	
	num : Integer := -3;
begin
    Output (num);
end Main;