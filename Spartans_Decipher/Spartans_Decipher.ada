--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/CDs32gcYBoqQpk44j
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings;           use Ada.Strings;
procedure Hello is
	type Array_2D is array(Positive range <>, Positive range <>) of Character;
	
	procedure Spartans_Decipher (Text : String; Number_Slide : Positive) is
		Result : Unbounded_String := Null_Unbounded_String;
		Col    : Positive := Positive (Float'Ceiling (Float (Text'Length) / Float (Number_Slide)));
		arr    : Array_2D(1..Number_Slide, 1..Col) := (Others => (Others => ' '));
		K      : Positive := Text'First;
		begin
			for J in arr'Range(2) loop
				for I in arr'Range(1) loop
					if K in Text'Range then
						arr (I, J) := Text (K);
						K := K + 1;
					else
						exit;
					end if;
				end loop;
			end loop;
			
			for I in arr'Range(1) loop
				for J in arr'Range(2) loop
					Result := Result & arr (I, J);
				end loop;
			end loop;
			
			Trim (Result, Right);
			Put (To_String (Result));
	end Spartans_Decipher;
	
	Text : String   := "IOHOIEAMIVTSMUNEHHSCLWTA";
	Num  : Positive := 6;
begin
    Spartans_Decipher (Text, Num);
end Hello;