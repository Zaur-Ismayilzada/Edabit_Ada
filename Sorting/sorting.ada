--GNAT 8.3.0
-- Aufgabestellung und Tests : https://edabit.com/challenge/BjWyFnNMEwHC3DgoK
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type Char_Set is ('a', 'A',
					  'b', 'B',
					  'c', 'C',
					  'd', 'D',
					  'e', 'E',
					  'f', 'F',
					  'g', 'G',
					  'h', 'H',
					  'i', 'I',
					  'j', 'J',
					  'k', 'K',
					  'l', 'L', 
					  'm', 'M',
					  'n', 'N',
					  'o', 'O',
					  'p', 'P',
					  'q', 'Q', 
					  'r', 'R',
					  's', 'S',
					  't', 'T',
					  'u', 'U',
					  'v', 'V',
					  'w', 'W',
					  'x', 'X',
					  'y', 'Y',
					  'z', 'Z',
					  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
					  
					  
					  
					  
					  
	procedure Sorting (s: in out String) is
		temp    : Character := ' ';
		changed : Boolean   := True;
		a       : Char_Set  := Char_Set'Val (0);
		b       : Char_Set  := Char_Set'Val (0);
		
		begin
			while changed loop
				changed := False;
				
				for I in s'First .. s'Last - 1 loop
					a := Char_Set'Value (s (I)'Image);
					b := Char_Set'Value (s (I + 1)'Image);
					if Char_Set'Pos (a) > Char_Set'Pos (b) then
						temp      := s (I);
						s (I)     := s (I + 1);
						s (I + 1) := temp;
						changed := True;
					end if;
				end loop;
			end loop;
	end Sorting;
	
	s : String := "eA2a1E";
	
begin
	Sorting (s);
	Put (s);
end Hello;












