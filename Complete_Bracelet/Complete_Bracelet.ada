--GNAT 8.3.0
--Aufgabe Beschreibung und Tests : https://edabit.com/challenge/kzBdYfSiWCQJRrwEp
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type Int_Arr is array(Positive range <>) of Positive;
	
	function Get_Num (len : Positive; k : in out Positive) return Positive is
		begin
			while k < len loop
				if len mod k = 0 then
					k := k + 1;
					return len / (k - 1);
				end if;
				k := k + 1;
			end loop;
			return len;
	end Get_Num;
	
	function Complete_Bracelet (arr : Int_Arr) return Boolean is
		k   : Positive := 2;
		l   : Positive := 1;
		idx : Positive := 1;
		begin
			if arr'Length mod 2 = 1 then
				return False;
			end if;
		
		while k < arr'Length loop
			l := Get_Num (arr'Length, k);
			if l /= arr'Length then
				if arr (idx .. idx + l - 1) = arr (idx + l .. idx + 2 * l - 1) then
					return True;
				end if;
			end if;
		end loop;
		
		return False;
	end Complete_Bracelet;
	
	arr : Int_Arr := (1, 2, 3, 3, 1, 2, 3, 3);
	ans : Boolean := Complete_Bracelet (arr);
begin
    Put_Line (ans'Image);
end Hello;





