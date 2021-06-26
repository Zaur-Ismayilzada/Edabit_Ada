--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/YGJBDxuqBjh8rYqyT
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is

	function Is_Empty (str : String) return Boolean is
		begin
			for I in str'Range loop
				if str (I) /= ' ' then
					return False;
				end if;
			end loop;
			
			return True;
	end Is_Empty;
	
	procedure Shift_Left (str : in out String) is
		begin
			for I in str'First .. str'Last - 1 loop
				str (I)     := str (I + 1);
			end loop;
	end Shift_Left;
	
	function Get_Next (s : String; idx : in out Positive) return Character is
		ans : Character := s (idx);
		begin
			idx := idx + 1;
			return ans;
	end Get_Next;
	
    procedure News_At_Ten (s : in out String; Len : Positive) is
		str : String(1..Len) := (Others => ' ');
		idx : Positive       := 1;
		begin			
			loop
				Put_Line (str);
				Shift_Left (str);
				
				if idx in s'Range then
					str (str'Last) := Get_Next (s, idx);
				else
					str (str'Last) := ' ';
				end if;
				
				exit when Is_Empty (str);
			end loop;
            
            Put_Line (str);
	end News_At_Ten;
	
    s   : String   := "edabit";
	Len : Positive := 10;
	
begin
    News_At_Ten (s, Len);
end Hello;
