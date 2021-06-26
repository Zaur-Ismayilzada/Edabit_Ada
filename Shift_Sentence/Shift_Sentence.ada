--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/FmkCYeghMCxHRB9jn
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;
procedure Hello is
	procedure Shift_Sentence (s : in out String) is
		ch   : Character := s (s'First);
		temp : Character := ' ';
		begin
			for I in s'First + 1 .. s'Last loop
				if s (I - 1) = ' ' then 
					temp  := s (I);
					s (I) := ch;
					ch    := temp;
				end if;
			end loop;
			
			s (s'First) := ch;		
	end Shift_Sentence;
	
	s: String := "elephants dance about bravely in thailand";
	
begin
	Shift_Sentence (s);
    Put_Line (s);
end Hello;
