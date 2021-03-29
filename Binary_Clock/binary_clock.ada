--GNAT 8.3.0
--Aufgabe Beschreibung und Tests : https://edabit.com/challenge/NEKp7kukbwmCPDc5n
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	
	type Ch_Arr is array(Positive range 1..4, Positive range 1..6) of Character;
	
	
	function Get_Arr  return Ch_Arr is
		arr : Ch_Arr := (Others => (Others => '0'));
		begin
			arr (1, 1) := ' ';
			arr (1, 3) := ' ';
			arr (1, 5) := ' ';
			arr (2, 1) := ' ';
			return arr;
	end Get_Arr;
	
	procedure Print (arr: Ch_Arr) is
		begin
			for I  in arr'Range(1) loop
				for J in arr'Range(2) loop
					Put (arr (I, J) & " ");
				end loop;
				New_Line;
			end loop;
	end Print;
	
	function Trim (s: String) return String is
		begin
			if s'Length = 0 then
				return "";
			elsif s (s'First) /= ':' then
				return s (s'First) & Trim (s (s'First + 1 .. s'Last));
			end if;
			
			return Trim (s (s'First + 1 .. s'Last));
	end Trim;
	
	
	procedure Binary_Clock (s: String) is
		str : String  := Trim (s);
		arr : Ch_Arr  := Get_Arr; 
		tem : Natural := 0;
		begin
			for I in reverse str'Range loop
				tem := Integer'Value (str (I) & "");
				
				if tem >= 8 then
					arr (1, I) := '1';
					tem := tem - 8;
				end if;
				if tem >= 4 then
					arr (2, I) := '1';
					tem := tem - 4;
				end if;
				if tem >= 2 then
					arr (3, I) := '1';	
					tem := tem - 2;
				end if;
				if tem >= 1 then
					arr (4, I) := '1';	
					tem := tem - 1;
				end if;							
			end loop;
            
            Print (arr);
	end Binary_Clock;
    
    s: String := "10:37:49";
begin
    Binary_Clock (s);
end Hello;







