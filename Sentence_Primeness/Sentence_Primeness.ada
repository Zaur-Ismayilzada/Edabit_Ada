--GNAT 8.3.0
-- Aufgabe Beschreibung und Tests : https://edabit.com/challenge/22zFrigLPpuGEPprt
with Ada.Text_IO; 			  use Ada.Text_IO;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;
with Ada.Containers;          use Ada.Containers;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Containers.Vectors;
procedure Hello is
	
	package My_Vector is new Ada.Containers.Vectors
			(Index_Type => Positive, Element_Type => Unbounded_String);
	use My_Vector;
	
	subtype Ch_Range  is Character range 'a' .. 'z';
	subtype Num_Range is Character range '0' .. '9';
	type    Ch_Arr    is array (Ch_Range) of Positive;
	
	arr: Ch_Arr := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                    14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26);
	
    procedure Print (V: Vector) is
        begin
            for Val of V loop
                Put (To_String (Val) & " ");
            end loop;
    end Print;
    
    
	function Get_Vector (s: String) return Vector is
		V    : Vector;
		temp : Unbounded_String := To_Unbounded_String ("");
		begin
			for I in s'Range loop
				if Is_Letter (s (I)) then
					temp := temp & To_Lower (s (I));
				elsif Is_Digit (s (I)) then	
					temp := temp & s (I);
				else
					if Length (temp) /= 0 then
						V.Append (temp);
						temp := To_Unbounded_String ("");
					end if;
				end if;
			end loop;
			return V;
	end Get_Vector;
	
	function Is_Prime (num : Natural) return Boolean is
		k: Positive := 2;
		begin	
			while k < num loop
				if num mod k = 0 then
					return False;
				end if;
				k := k + 1;
			end loop;
			return True;
	end Is_Prime;
	
	function Get_Value (V: Vector; idx : Natural) return Natural is
		sum  : Natural := 0;
		temp : Unbounded_String := To_Unbounded_String ("");
		begin
			for I in V.First_Index .. V.Last_Index loop
				if I /= idx then
					temp := V (I);
					for J in 1 .. Length (temp) loop
						if Element (temp, J) in Ch_Range then
							sum := sum + arr (Element (temp, J));
						elsif Element (temp, J) in Num_Range then
							sum := sum + Integer'Value (Element (temp, J) & ""); 
						end if;
					end loop;
				end if;
			end loop;
            return sum;
	end Get_Value;
	
	function Sentence_Primeness (s: String) return String is
		V   : Vector  := Get_Vector (s);
		sum : Natural := 0;
        begin
            sum := Get_Value (V, 0);
            
			if Is_Prime (sum) then
				return "Prime Sentence";
			end if;
			
			for I in V.First_Index .. V.Last_Index loop
				sum := Get_Value (V, I);
				if Is_Prime (sum) then
					return "Almost Prime Sentence (" & To_String (V (I)) & ")";
				end if;
			end loop;
			
			return "Composite Sentence";
			
	end Sentence_Primeness;
	
	s: String := "42 is THE aNsWeR...";
	
begin
    Put_Line (Sentence_Primeness (s));
end Hello;














