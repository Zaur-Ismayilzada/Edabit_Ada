--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/ecR654j7ivFqs2WPi
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
procedure Main is
	subtype Row_Array_String_Range   is Positive range 1..17;
	subtype Digit_Array_String_Range is Positive range 1..15;
	
	type Row_Array   is array(Positive range 1..5) of String(Row_Array_String_Range);
	type Digit_Array is array(Positive range 1..4) of String(Digit_Array_String_Range);
	
	zero  : String := "111101101101111";
	one   : String := "010110010010111";
	two   : String := "111001111100111";
	three : String := "111001111001111";
	four  : String := "101101111001001";
	five  : String := "111100111001111";
	six   : String := "100100111101111";
	seven : String := "111001001001001";
	eight : String := "111101111101111";
	nine  : String := "111101111001001";
	
	function Get_Rows (Bit_Map : String) return Row_Array is
		rows : Row_Array;
		idx  : Positive := 1;
		begin
			for I in rows'Range loop
				rows (I) := Bit_Map (idx .. idx + 16);
				idx := idx + 17;
			end loop;
			
			return rows;
	end Get_Rows;
	
	function Get_Digits (rows : Row_Array) return Digit_Array is
		digit : Digit_Array;
		temp  : Unbounded_String := Null_Unbounded_String;
		str   : String(Row_Array_String_Range);
		idx   : Positive := 1;
		begin
			for I in digit'Range loop
				for J in rows'Range loop
					str  := rows (J);
					temp := temp & str (idx .. idx + 2);
				end loop;
				
				if idx = 5 then
					idx := idx + 6;
				else
					idx := idx + 4;
				end if;
				
				digit (I) := To_String (temp);
				temp      := Null_Unbounded_String;
			end loop;
			
			return digit;
	end Get_Digits;
	
	function Get_Number (digit : Digit_Array; I : Positive) return Natural is
		temp : String := digit (I);
		begin
			if    temp = zero then
				return 0;
			elsif temp = one then
				return 1;
			elsif temp = two then
				return 2;
			elsif temp = three then
				return 3;
			elsif temp = four then
				return 4;
			elsif temp = five then
				return 5;
			elsif temp = six then
				return 6;
			elsif temp = seven then
				return 7;
			elsif temp = eight then
				return 8;
			elsif temp = nine then
				return 9;
			else
				Put_Line("Could not match raising error");
				return -1;
			end if;
	end Get_Number;
	
	
	function Bit_Map_To_Time (Bit_Map : String) return String is
		rows  : Row_Array   := Get_Rows (Bit_Map);
		digit : Digit_Array := Get_Digits (rows);
		num   : Natural     := 0;
		ans   : String(Digit_Array_String_Range);
		begin
			
			for I in digit'Range loop
				num     := Get_Number (digit, I);
				ans (I) := Natural'Image (num) (2);
			end loop;
			return ans (1..2) & ":" & ans (3..4);
	end Bit_Map_To_Time;
	
	Bit_Map : String := "1110010000111011110101100100010100101001000011101111010010010001000111101110001110111";
	Time    : String := Bit_Map_To_Time (Bit_Map);
	
begin
    Put_Line (Time);
end Main;




