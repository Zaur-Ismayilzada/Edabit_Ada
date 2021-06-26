--GNAT 8.3.0
-- Aufgabestellung und Tests : https://edabit.com/challenge/z7ps9d2jmqY5ERCaT
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;
procedure Hello is
	package My_Vector is new Ada.Containers.Vectors
			(Index_Type => Positive,
			 Element_Type => Integer);
	use My_Vector;
	
	function Asteroid_Collision (V: in out Vector) return Vector is
		changed : Boolean := True;
		begin
			while changed loop
				changed := False;
				
				for I in V.First_Index .. V.Last_Index - 1 loop
					declare
						a : Integer := V (I);
						b : Integer := V (I + 1);
						begin
							if a > 0 and b < 0 then
								changed := True;
								if a + b = 0 then
									Delete (V, I + 1);
									Delete (V, I);
									exit;
								elsif a > abs (b) then
									Delete (V, I + 1);
									exit;
								elsif abs (b) > a then
									Delete (V, I);
									exit;
								end if;
							end if;
						end;
				end loop;		
			end loop;
			
			return V;
	end Asteroid_Collision;
	
	V : Vector := (-2) & (-1) & 1 & 2;
	
begin

	V := Asteroid_Collision (V);

    for C in V.Iterate loop
		Put (Integer'Image (V (C)) & " ");
	end loop;
end Hello;




