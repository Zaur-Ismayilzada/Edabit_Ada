--GNAT 8.3.0
--Aufgabe Beschreibung und Tests : https://edabit.com/challenge/mb99CwB4PBZnKKC4J
with Ada.Text_IO;             use Ada.Text_IO;
procedure Hello is
	
	
	function Get_Count (me, other : String) return Natural is
		ans : Natural := 0;
		a   : Integer := 0;
		b   : Integer := 0;
		begin
			
			for I in other'First .. other'Last - 1 loop
				if I = other'First then
					a := Character'Pos (other (I));
					b := Character'Pos (me (me'First));
					if (a - b) > 0 then
						return ans;
					else
						ans := ans + 1;						
					end if;
				elsif other (I) = ' ' then
					a := Character'Pos (other (I + 1));
					b := Character'Pos (me (me'First));
					if (a - b) > 0 then
						return ans;
					else
						ans := ans + 1;						
					end if;
				end if;
			end loop;
			
			return ans;
	end Get_Count;
	
	procedure License (me : String; agent : Positive; other : String) is
		ans   : Positive := 20;
		count : Natural  := Get_Count (me, other);
		begin
			while count >= agent loop
				count := count - agent;
				ans   := ans + 20;
			end loop;
			Put (ans'Image);
	end License;
	
    me    : String := "Eric";
    other : String := "Adam Caroline Rebecca Frank";
    
begin
    License (me, 2, other);
end Hello;







