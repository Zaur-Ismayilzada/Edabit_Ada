--GNAT 8.3.0
--Aufgabe Beschreibung und Tests : https://edabit.com/challenge/KnpqDdkibon22Eexa
with Ada.Strings.Unbounded;                 use Ada.Strings.Unbounded;
with Ada.Text_IO;                           use Ada.Text_IO;
procedure Hello is
    type Ch_Arr is array(Positive range <>) of Character;
	
	arr : Ch_Arr := ('I', 'V', 'X', 'L', 'C', 'D', 'M');
	
	function To_Roman (num : in out Positive) return String is
		idx : Positive         := 1;
		dig : Natural  		   := 0;
		ans : Unbounded_String := To_Unbounded_String ("");
		begin
			loop
				dig := num mod 10;
				
				if dig in 1 .. 3 then
					ans := (dig * arr (idx)) & ans;
				elsif dig in 6 .. 8 then
					ans := arr (idx + 1) & ((dig - 5) * arr (idx)) & ans;
				elsif dig = 4 then
					ans := arr (idx) & arr (idx + 1) & ans;
				elsif dig = 5 then
					ans := arr (idx + 1) & ans;
				elsif dig = 9 then
					ans := arr (idx) & arr (idx + 2) & ans;
				end if;
				
				if num < 10 then
					exit;
				else
					num := num / 10;
					idx := idx + 2;
				end if;		
			end loop;
			
			return To_String (ans);
	end To_Roman;
    num: Natural := 16;
begin
    Put (To_Roman (num));
end Hello;