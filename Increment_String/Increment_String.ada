--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/iqEb9gZi2jgNR99At
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	
	function Get_Idx (str : String) return Positive is
		begin
			for I in reverse str'Range loop
				if str (I) = '0'  then
					return I + 1;
				end if;
			end loop;
			
			return str'First;
	end Get_Idx;
	
	function Increment_String (str : String) return String is
		begin
			if str (str'Last) in '0' .. '9' then
				declare
					Idx  : Positive := Get_Idx (str);
					Temp : String   := str (Idx .. str'Last);
					Num  : Positive := Positive'Value (Temp);
				begin
					Num := Num + 1;
					
					if Num'Image (2 .. Num'Image'Last)'Length > Temp'Length then
						return str (str'First .. Idx - 2) & Num'Image (2 .. Num'Image'Last);
					else
						return str (str'First .. Idx - 1) & Num'Image (2 .. Num'Image'Last);
					end if;
				end;
			else
				return str & "1";
			end if;
	end Increment_String;
	
	str : String := "foobar01002";
	s   : String := Increment_String (str);
begin
    Put (s);
end Hello;