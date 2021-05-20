--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/xxig52timWewkiJxY
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
procedure Hello is
	
	type Str_Array is array(Positive range <>) of Unbounded_String;
	
	one_nine 		: Str_Array := (To_Unbounded_String ("one"),
									To_Unbounded_String ("two"),
									To_Unbounded_String ("three"),
									To_Unbounded_String ("four"),
									To_Unbounded_String ("five"),
									To_Unbounded_String ("six"),
									To_Unbounded_String ("seven"),
									To_Unbounded_String ("eight"),
									To_Unbounded_String ("nine"));
							 
	ten_ninety      : Str_Array := (To_Unbounded_String ("ten"),
									To_Unbounded_String ("twenty"),
									To_Unbounded_String ("thirty"),
									To_Unbounded_String ("forty"),
									To_Unbounded_String ("fifty"),
									To_Unbounded_String ("sixty"),
									To_Unbounded_String ("seventy"),
									To_Unbounded_String ("eighty"),
									To_Unbounded_String ("ninety"));
	
	eleven_nineteen : Str_Array := (To_Unbounded_String ("eleven"),
									To_Unbounded_String ("twelve"),
									To_Unbounded_String ("thirteen"),
									To_Unbounded_String ("fourteen"),
									To_Unbounded_String ("fifteen"),
									To_Unbounded_String ("sixteen"),
									To_Unbounded_String ("seventeen"),
									To_Unbounded_String ("eighteen"),
									To_Unbounded_String ("nineteen"));
	
	
	function Num_To_Eng (num : in out Natural) return String is
		dig : Natural 		   := 0;
		ans : Unbounded_String := Null_Unbounded_String;
		begin
			if num = 0 then
				return "zero";
			end if; 
			
			loop
				if num in 11..19 then
					dig := num mod 10;
					ans := ans & eleven_nineteen (dig);
					exit;
				elsif num in 1..9 then
					ans := ans & one_nine (num);
					exit;
				elsif num in 10..99 then
					if num = 10 then
						ans := ans & ten_ninety (1);
						exit;
					else
						dig := num / 10;
						ans := ans & ten_ninety (dig) & " ";
						num := num mod 10;
					end if;
				elsif num >= 100 then
					dig := num / 100;
					ans := ans & one_nine (dig) & " hundred ";
					num := num mod 100;
				else
					exit;
				end if;
			end loop;
			
			return To_String (ans);
	end Num_To_Eng;
	
	num : Natural := 909;
	s   : String  := Num_To_Eng (num);
begin
    Put_Line (s);
end Hello;
