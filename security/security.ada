--GNAT 8.3.0
-- Aufgabe und Tests : https://edabit.com/challenge/tQ3s32czduj3vkm2u
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	procedure security (s: String) is
		money : Boolean := False;
		thief : Boolean := False;
		begin
			for I in s'Range loop
				if s (I) = '$' then
					if thief then
						Put ("ALARM");
						return;
					else
						money := True;
					end;
				elsif s (I) = 'T' then
					if money then
						Put ("ALARM");
						return;
					else
						thief := True;
					end;
				elsif s (I) = 'G' then
					if money then	
						money := False;
					elsif thief then
						thief := False;
					end if;
				end if;
			end loop;
			
			Put ("Safe");
			
	end security;
	
	s : String := "xxxxTTxGxx$xxTxxx";
	
begin
	security (s);
end Hello;


