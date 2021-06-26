--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/Z3McmedxhWdQLb8M6
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type Str_Array is array(Positive range 1..3) of String(1..3);
	
	function Get_Count (arr : Str_Array; ch : Character) return Natural is
		ans : Natural := 0;
		str : String  := "   ";
		begin
			for I in arr'Range loop
				str := arr (I);
				for J in str'Range loop
					if str (J) = ch then
						ans := ans + 1;
					end if;
				end loop;
			end loop;
			
			return ans;
	end Get_Count;
	
	function Is_Finished (arr : Str_Array; ch : Character) return Boolean is
		flag : Boolean := False;
		str  : String  := "" & ch & ch & ch;
		begin
			for I in arr'Range loop
				if arr (I) = str then
					return True;
				end if;
			end loop;
			
			for I in arr'Range loop
				if flag then
					return True;
				end if;
				for J in arr'Range loop
					if arr (J) (I)  = ch then
						flag := True;
					else
						flag := False;
                        exit;
					end if;
				end loop;
			end loop;
			
			if arr (1) (1) = ch and arr (2) (2) = ch and arr (3) (3) = ch then
				return True;
			elsif arr (1) (3) = ch and arr (2) (2) = ch and arr (3) (1) = ch then
				return True;
			end if;
			
			return False;
	end Is_Finished;
	
	function Validate_TicTacToe (arr : Str_Array) return Boolean is
		X_Count : Natural := Get_Count (arr, 'X');
		O_Count : Natural := Get_Count (arr, 'O');
		begin
			if  O_Count > X_Count then
				return False;
			elsif X_Count - O_Count >= 2 then       
				return False;
			elsif Is_Finished (arr, 'X') and Is_Finished (arr, 'O') then          
				return False;
			end if;
			
			return True;
	end Validate_TicTacToe;
	
	arr : Str_Array := ("X  ", "   ", "   ");
	ans : Boolean   := Validate_TicTacToe (arr);
begin
    Put_Line (ans'Image);
end Hello;
