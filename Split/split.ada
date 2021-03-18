--GNAT 8.3.0
-- Aufgabe Beschreibung und Tests : https://edabit.com/challenge/f5RmXpK54SGQ8w8tz
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
procedure Hello is
	package Str_Vector is new Ada.Containers.Vectors
			(Index_Type   => Positive,
			 Element_Type => Unbounded_String);
	use Str_Vector;
	
	function Split (s: String) return Vector is
		V   : Vector;
		idx : Positive 		   := s'First;
		con : Natural  		   := 0;
		str : Unbounded_String := To_Unbounded_String ("");
		begin
			for I in s'Range loop
				if s (I) = '(' then
					con := con + 1;
				elsif s (I) = ')' then
					con := con - 1;
				end if;
				
				if con = 0 then
					str := To_Unbounded_String (s (idx .. I));
					V.Append (str);
					idx := I + 1;
					str := To_Unbounded_String ("");				
				end if;
			end loop;
			return V;
	end Split;
	
	s : String := "()()()";
    V : Vector := Split (s);
begin
	for E of V loop
        Put (To_String (E) & " ");
    end loop;
end Hello;