--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/73wHtPbiYpWRQjoJb
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type Int_Arr is array(Positive range <>) of Natural;
	type Boo_Arr is array(Positive range <>) of Boolean;
	
	procedure Print (arr: Int_Arr) is
		begin
			for I in arr'Range loop
				Put (Integer'Image (arr (I)) & " ");
			end loop;
	end Print;
	
	procedure Left_Slide (arr_int : in out Int_Arr) is
		arr_boo : Boo_Arr(1 .. arr_int'Length) := (Others => False);
		changed : Boolean                      := True;
		begin
			while changed loop
				changed := False;
				
				for I in arr_int'First + 1 .. arr_int'Last loop
					if arr_int (I) /= 0 and arr_int (I - 1) = 0 then
						arr_int (I - 1) := arr_int (I);
						arr_int (I)     := 0;
						changed         := True;
					elsif arr_int (I) = arr_int (I - 1) and
						  arr_boo (I - 1) = False and arr_boo (I) = False then
						arr_int (I - 1) := arr_int (I - 1) * 2;
						arr_int (I)     := 0;
						arr_boo (I - 1) := True;
						changed         := True;
					end if;
				end loop;
				
			end loop;
			Print (arr_int);
	end Left_Slide;
	arr: Int_Arr := (0, 2, 2, 8, 8, 8);
begin
    Left_Slide (arr);
end Hello;







