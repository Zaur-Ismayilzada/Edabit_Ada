--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/FRMkLfEBFM7bykHEt
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is

	subtype Char_Range is Character range 'a' .. 'z';
	
	type Alphabet is array(Char_Range) of Positive;
	type Boo_Arr  is array(Positive range <>) of Boolean;
	
	alpha : Alphabet := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
					     14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26);
	
	procedure Print (arr : Boo_Arr) is
		begin
			for Val of arr loop
				Put (Val'Image & " ");
			end loop;
	end Print;
	
	function To_Bit_String (Word : String) return String is
		Bit_String : String(Word'Range);
		temp       : Positive := 1;
		begin
			for I in Bit_String'Range loop
				temp := alpha (Word (I));
				
				if temp mod 2 = 0 then
					Bit_String (I) := '0';
				elsif temp mod 2 = 1 then
					Bit_String (I) := '1';
				end if;
			end loop;
			
			return Bit_String;
	end To_Bit_String;
	
	function To_Boolean_Array (Bit_String : String) return Boo_Arr is
		arr : Boo_Arr (Bit_String'Range);
		begin
			for I in Bit_String'Range loop
				if Bit_String (I) = '0' then
					arr (I) := False;
				elsif Bit_String (I) = '1' then
					arr (I) := True;
				end if;
			end loop;
			
			return arr;
	end To_Boolean_Array;
	
	Word       : String  := "deep";
	Bit_String : String  := To_Bit_String (Word);
	arr        : Boo_Arr := To_Boolean_Array (Bit_String);  
	
begin
    Print (arr);
end Hello;