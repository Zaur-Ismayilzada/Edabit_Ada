--GNAT 8.3.0
--Aufgabe Beschreibung und Tests : https://edabit.com/challenge/8HvxzPPudwZfGnJux
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	subtype Sudoku_Range is Positive range 1..9;
	type Sudoku_Array is array(Sudoku_Range, Sudoku_Range) of Sudoku_Range;
	type Int_Array    is array(Sudoku_Range) of Natural;
	
	function Check_For_Row (arr : Sudoku_Array; I : Positive) return Boolean is
		arr_int : Int_Array := (Others => 0);
		temp    : Positive  := 1;
		begin
			for J in arr'Range(2) loop
				temp           := arr (I, J);
				arr_int (temp) := arr_int (temp) + 1;
			end loop;
			
			for J in arr_int'Range loop
				if arr_int (J) /= 1 then
					return False;
				end if;
			end loop;
			
			return True;
	end Check_For_Row;
	
	function Check_For_Col (arr : Sudoku_Array; J : Positive) return Boolean is
		arr_int : Int_Array := (Others => 0);
		temp    : Positive  := 1;
		begin
			for I in arr'Range(1) loop
				temp 		   := arr (I, J);
				arr_int (temp) := arr_int (temp) + 1;
			end loop;
			
			for I in arr_int'Range loop
				if arr_int (I) /= 1 then
					return False;
				end if;
			end loop;
			
			return True;
	end Check_For_Col;
	
	function Sudoku_Validator (arr : Sudoku_Array) return Boolean is
		begin
			for I in arr'Range(1) loop
				if Check_For_Row (arr, I) = False then
					return False;
				end if;
			end loop;
			
			for J in arr'Range(2) loop
				if Check_For_Col (arr, J) = False then
					return False;
				end if;
			end loop;
			
			return True;
	end Sudoku_Validator;
	
	arr : Sudoku_Array := ((1, 5, 2, 4, 6, 9, 3, 7, 8),
						   (7, 8, 9, 2, 1, 3, 4, 5, 6),
						   (4, 3, 6, 5, 8, 7, 2, 9, 1),
						   (6, 1, 3, 8, 7, 2, 5, 4, 9),
						   (9, 7, 4, 1, 5, 6, 8, 2, 3),
						   (8, 2, 5, 9, 3, 4, 1, 6, 7),
						   (5, 6, 7, 3, 4, 8, 9, 1, 2),
						   (2, 4, 8, 6, 9, 1, 7, 3, 5),
						   (3, 9, 1, 7, 2, 5, 6, 8, 4));
	ans : Boolean      := Sudoku_Validator (arr);
	
begin
    Put_Line (ans'Image);
end Hello;








