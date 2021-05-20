--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/XgaeYwf9NRx4f4iY7
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	function Is_Prime (num : in Positive) return Boolean is
		k : Positive := 2;
		begin
			while k < num loop
				if num rem k = 0 then
					return False;
				end if;
				
				k := k + 1;
			end loop;
			
			return True;
	end Is_Prime;
	
    procedure Goldbach_Conjecture (num : Positive) is
		arr : array(1..2) of Positive;
		a   : Positive := 2;
		begin
			if num <= 2 or num rem 2 = 1 then
				Put ("[]");
				return;
			end if;
			
			loop
				if Is_Prime (a) and Is_Prime (num - a) then
					arr (1) := a;
					arr (2) := num - a;
					exit;
				end if;
				a := a + 1;
			end loop;
			
			Put ("[" & Positive'Image (arr (1)) & ", " & Positive'Image (arr (2)) & "]");
	end Goldbach_Conjecture;
	
	num : Positive := 544;
	
begin
	Goldbach_Conjecture (num);
end Hello;






