--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/ZERHA9w8iSLYNzRiT
with Ada.Text_IO; 		use Ada.Text_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Containers; 		use Ada.Containers;
with Ada.Containers.Vectors;
procedure Hello is

	package My_Vector is new Ada.Containers.Vectors
			(Index_Type => Positive, Element_Type => Unbounded_String);
	use My_Vector;
	
	
	function Get_Vector (s: String) return Vector is
		V   : Vector;
		idx : Positive := 1;
		str : Unbounded_String := To_Unbounded_String ("");
		begin
			for I in s'First + 1 .. s'Last loop
				if s (I) = ' ' then
					str := To_Unbounded_String (s (idx .. I - 1));
					Append (V, str);
					idx := I + 1;
				end if;
			end loop;
			
			str := To_Unbounded_String (s (idx .. s'last));
			Append (V, str);
			
			return V;
	end Get_Vector;
	
	function Prefix (s: String) return Integer is
		V   : Vector := Get_Vector (s);
		a   : Unbounded_String := To_Unbounded_String ("");
		b   : Unbounded_String := To_Unbounded_String ("");
		ans : Integer := 0;
		begin
			for I in reverse V.First_Index .. V.Last_Index loop
				if V (I) = "+" then
					a := Element (V, I + 1);
					b := Element (V, I + 2);
					ans   := Integer'Value (To_String (a)) + Integer'Value (To_String (b));
					Replace_Element (V, I, To_Unbounded_String (Integer'Image (ans)));
					Delete (V, I + 1, 2);
				elsif V (I) = "-" then
					a := Element (V, I + 1);
					b := Element (V, I + 2);
					ans   := Integer'Value (To_String (a)) - Integer'Value (To_String (b));
					Replace_Element (V, I, To_Unbounded_String (Integer'Image (ans)));
					Delete (V, I + 1, 2);
				elsif V (I) = "*" then
					a := Element (V, I + 1);
					b := Element (V, I + 2);
					ans   := Integer'Value (To_String (a)) * Integer'Value (To_String (b));
					Replace_Element (V, I, To_Unbounded_String (Integer'Image (ans)));
					Delete (V, I + 1, 2);				
				elsif V (I) = "/" then
					a := Element (V, I + 1);
					b := Element (V, I + 2);
					ans   := Integer'Value (To_String (a)) / Integer'Value (To_String (b));
					Replace_Element (V, I, To_Unbounded_String (Integer'Image (ans)));
					Delete (V, I + 1, 2);
				end if;
			end loop;
			
			return Integer'Value (To_String (Element (V, 1)));
	end Prefix;
	
	s : String  := "* + 20 2 5";
	a : Integer := Prefix (s);

begin
	Put (a'Image);
end Hello;






