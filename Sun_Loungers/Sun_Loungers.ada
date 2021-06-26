--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/AEQjA4fbNALaCaKip
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	procedure Sun_Loungers (s : String) is
		ans 	 : Natural := 0;
		occupied : Boolean := False;
		begin	
			for I in s'First .. s'Last - 1 loop
				if occupied then
					occupied := False;
				elsif not occupied then
					if s (I + 1) /= '1' and s (I) = '0' then
						ans      := ans + 1;
						occupied := True;
					elsif s (I) = '1' then
						occupied := True;
					end if;
				end if;
			end loop;
			
			if not occupied and s (s'Last) = '0' then
				ans := ans + 1;
			end if;
			
			Put (ans'Image);
	end Sun_Loungers;
	
	s : String := "10001";
	
begin
    Sun_Loungers (s);
end Hello;





