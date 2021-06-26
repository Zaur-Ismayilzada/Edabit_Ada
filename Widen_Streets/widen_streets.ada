--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/5FM2kNSoy7fJxZaEK
with Ada.Text_IO; 			use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
procedure Hello is
	
	type Str_Arr is array(Positive range <>) of Unbounded_String;
	
	procedure Print (arr: Str_Arr) is
		begin	
			for Val of arr loop
				Put(To_String (Val));
				New_Line;
			end loop;
	end Print;
	
	
	procedure Widen_Streets (arr: in out Str_Arr; gap : Positive) is
		str  : Unbounded_String := To_Unbounded_String ("");
		temp : Unbounded_String := To_Unbounded_String ("");
		num  : Natural          := 0;
		flag : Boolean          := False;
		begin
			for I in arr'Range loop
				str := arr (I);
				for J in 2 .. Length (str) loop
					if not Flag then
						if Element (str, J) = ' ' then
							flag := True;
							num  := num + 1;
						else
							temp := temp & Element (str, J);
						end if;
					elsif Flag then	
						if Element (str, J) /= ' ' then
							flag := False;
							temp := temp & (num * gap * ' ');
							temp := temp & Element (str, J);
							num  := 0;
						else
							num := num + 1;
						end if;
					end if;
				end loop;
				arr (I) := temp;
				temp    := To_Unbounded_String ("");
                num     := 0;
			end loop;
	end Widen_Streets;
	
	arr: Str_Arr := (To_Unbounded_String ("## ### ###"),
					 To_Unbounded_String ("## ### ###"),
					 To_Unbounded_String ("## ### ###"),
					 To_Unbounded_String ("## ### ###"),
					 To_Unbounded_String ("## ### ###"));
	num : Positive := 3;
					 
	
begin
    Widen_Streets (arr, num);
	Print (arr);
end Hello;




