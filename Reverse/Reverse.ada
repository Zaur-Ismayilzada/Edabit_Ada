--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/AQr6ZPvSWzJ2cPTGt
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;
with Ada.Characters.Handling; use Ada.Characters.Handling;
procedure Hello is
	procedure Reverse_String (str : in out String) is
		Letters : Unbounded_String := Null_Unbounded_String;
		K       : Positive         := 1;
		begin
			for I in reverse str'Range loop
				if Is_Letter (str (I)) then
					Letters := Letters & str (I);
				end if;
			end loop;
			
			for I in str'Range loop
				if Is_Letter (str (I)) then
					str (I) := Element (Letters, K);
					K       := K + 1;
				end if;
			end loop;
			
			Put (str);
	end Reverse_String;
	
	str : String := "ab89c";
begin
    Reverse_String (str);
end Hello;