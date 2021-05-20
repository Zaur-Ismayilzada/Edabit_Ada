--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/DSoxf5rgtyzRP7svM
with Ada.Text_IO;			 use Ada.Text_IO;
with Ada.Containers.Vectors;
procedure Hello is
	
	package My_Vector is new Ada.Containers.Vectors
					 (Index_Type => Positive, Element_Type => Integer);
	use My_Vector;
	
	procedure Print (V : Vector) is
		begin
			for E of V loop
				Put (E'Image & " ");
			end loop;
	end Print;
	
	procedure Number_Split (num : in out Integer) is
		V : Vector;
		divider  : Positive := 10;
		reminder : Integer  := 0;
		begin
		
			while num /= 0 loop
                if num >= 0 then
                    reminder := num mod divider;
                elsif num < 0 then
                    reminder := num rem divider;
                end if;
				
				Prepend (V, reminder);
				num 	:= num - reminder;
				divider := divider * 10;
			end loop;
					
			Print (V);
	end Number_Split;
	
	num : Integer := -434;
begin
    Number_Split (num);
end Hello;








