--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/hZoJjNreFFyrbmJrQ
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type Int_Arr is array(Positive range <>) of Natural;
	
	procedure Print (arr : Int_Arr) is
		begin
			for Val of arr loop
				Put (Val'Image & " ");
			end loop;
	end Print;
	
	function Sum (num : Integer) return Natural is
		begin
			if num < 10 then
				return num;
			end if;
			return num mod 10 + Sum (num / 10);
	end Sum;
	
	procedure Decode (s : String) is
		arr : Int_Arr (1 .. s'Length) := (Others => 0);
		begin
			for I in s'Range loop
				arr (I) := Sum (Character'Pos (s (I)));
			end loop;
			
			Print (arr);
	end Decode;
	
	s : String := "something challenging";
	
begin
    Decode (s);
end Hello;







