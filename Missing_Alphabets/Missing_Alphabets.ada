--GNAT 8.3.0
--Aufgabe Beschreibung und Tests : https://edabit.com/challenge/ASEf3jedZfD3L5Afg
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
procedure Hello is
	function Is_Empty (s : String) return Boolean is
		begin
			for I in s'Range loop
				if s (I) /= ' ' then
					return False;
				end if;
			end loop;
			
			return True;
	end Is_Empty;
	
	function Get_Index (s : String; ch : Character) return Integer is
		begin
			for I in s'Range loop
				if s (I) = ch then
					return I;
				end if;
			end loop;
			
			return -1;
	end Get_Index;
	
	procedure Sort (s : in out String) is
		temp    : Character := ' ';
		changed : Boolean   := True;
		begin
			while changed loop
				changed := False;
				
				for I in s'First .. s'Last - 1 loop
					if s (I) > s (I + 1) then
						temp      := s (I);
						s (I)     := s (I + 1);
						s (I + 1) := temp;
						changed   := True;
					end if;
				end loop;
			end loop;
	end Sort;
	
	function Missing_Alphabets (s : in out String) return String is
		ans : Unbounded_String := To_Unbounded_String ("");
		str : String           := "abcdefghijklmnopqrstuvwxyz";	
		tem : Integer          := 0;
		begin
			
			while not Is_Empty (s) loop
				for I in str'Range loop
					tem := Get_Index (s, str (I));
					
					if tem /= -1 then
						s (tem) := ' ';
					else
						ans := ans & str (I);
					end if;
				end loop;
			end loop;
			
			declare
				unb : String := To_String (ans);
				begin
					Sort (unb);
					return unb;
				end;
	end Missing_Alphabets;
	
	s   : String := "abcdefghijklmnopqrstuvwxy";
	ans : String := Missing_Alphabets (s);
begin
    Put_Line (ans);
end Hello;









