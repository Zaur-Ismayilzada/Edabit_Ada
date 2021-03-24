--GNAT 8.3.0
-- Aufgabe Beschreibung und Tests : https://edabit.com/challenge/qHAdirFSK5Euw4faG
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	function Diamond_Sum (n: Positive) return Natural is
		ans : Natural  := 0;
		l   : Positive := (n / 2) + 1; 
		x   : Positive := 1;
		begin
		        if n = 1 then
				return 1;
		        end if;
			ans := ans + l;
			
			while x <= n - 2 loop
				ans := ans + 2 * (l + x * n);
				x   := x + 1;
			end loop;
			
			ans := ans + l + n * (n - 1);
			return ans;
	end Diamond_Sum;
    n   : Positive := 1;
    ans : Natural  := Diamond_Sum (n);
begin
    Put_Line (ans'Image);
end Hello;
