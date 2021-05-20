--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/v6QmCNrboDPYavd43
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is

	function Get_Num (num : Natural; temp : in out Natural) return Natural is 
		begin
			if num = (temp ** 2 + temp) then
				return (temp ** 2 + temp);
			elsif temp = num + 1 then
				return num + 1;
			else
				temp := temp + 1;
				return Get_Num (num, temp);
			end if;
	end Get_Num;
	
    function Is_Heteromecic (num : Natural) return Boolean is
		temp : Natural := 0;
		begin
			if num = Get_Num (num, temp) then
				return True;
			else
				return False;
			end if;
	end Is_Heteromecic;
	
	num : Natural := 0;
	ans : Boolean := Is_Heteromecic (num);
	
begin
    Put_Line (ans'Image);
end Hello;