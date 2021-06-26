--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/46K2Abh8C6Fdwyrpy
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
    	function Is_Prime (num : Integer) return Boolean is
		k : Integer := 2;
		begin
			while k < num loop
				if num mod k = 0 then
					return False;
				end if;
				k := k + 1;
			end loop;
			
			return True;
	end Is_Prime;
	
	function Get_Reversed (num : Integer) return Integer is
		s : String   := num'Image;
		a : String   := s (2 .. s'Last);
		b : String   := a;
		k : Positive := 2;
		begin
			for I in reverse a'Range loop
				b (k) := a (I);
				k     := k + 1;
			end loop;
			
			return Integer'Value (b);
	end Get_Reversed;
	
	function Get_Flipped (num : Integer) return Integer is
		s : String   := num'Image;
		a : String   := s (2 .. s'Last);
		begin
			for I in a'Range loop
				if a (I) = '9' then
					a (I) := '6';
				elsif a (I) = '6' then
					a (I) := '9';
				end if;
			end loop;
			
			return Integer'Value (a);
	end Get_Flipped;
	
	procedure Bemirp (num : Integer) is
		a : Integer := 0;
		begin
			if Is_Prime (num) then
				a := Get_Reversed (num);
				if a /= num and Is_Prime (a) then
					a := Get_Flipped (a);
					if Is_Prime (a) then
						Put ("B");
					else
						Put ("E");
					end if;
				else
					Put ("P");
				end if;
			else
				Put ("C");
			end if;
	end Bemirp;
	num : Integer := 101;
begin
	Bemirp (num);
end Hello;















