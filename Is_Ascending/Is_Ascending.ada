--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/QNHnzhfWyYyZMXsvJ
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is

	function Get_Num (k: in out Positive; len : Positive) return Positive is
		begin
			while k <= len loop
				if len mod k = 0 then
					return len / k;
				end if;
				k := k + 1;
			end loop;
			
			return len + 1;
	end Get_Num;


	function Is_Ascending (s : String) return Boolean is
		k    : Positive := 2;
		l    : Positive := 1;
		idx  : Positive := s'First;
		a    : Positive := 1;
		b    : Positive := 1;
		flag : Boolean  := False;
		begin
			while k <= s'Length loop
				l := Get_Num (k, s'Length);
				
				if l = s'Length + 1 then
					return False;
				end if;
				
				while idx /= s'Length - l + 1 loop
					a := Integer'Value (s (idx .. idx + l - 1));
					b := Integer'Value (s (idx + l .. idx + 2 * l - 1));
					if a + 1 = b then
						flag := True;
					else
						flag := False;
                        			exit;
					end if;
					idx := idx + l;
				end loop;
				
				if flag then
					return True;
				else
					k   := k + 1;
					idx := s'First;
				end if;
				
			end loop;
			
			return False;
	end Is_Ascending;
    
    s   : String := "444445";
    ans : Boolean := Is_Ascending (s);
    
begin
    Put_Line (ans'Image);
end Hello;




