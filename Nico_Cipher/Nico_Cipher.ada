--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/wiGuBNCHkcLkPPG3W
with Ada.Text_IO; 			  use Ada.Text_IO;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;
with Ada.Characters.Handling; use Ada.Characters.Handling;
procedure Hello is

	subtype Ch_Range is Character range 'a' .. 'z';
	type Matrix is array(Positive range <>, Positive range <>) of Character;
	
	procedure Print (mat: Matrix) is
		begin
			for I in mat'Range(1) loop
				for J in mat'Range(2) loop
					Put (Character'Image (mat (I, J)));
				end loop;
				New_Line;
			end loop;
			New_Line;
	end Print;
	
	
	function Set_Key (key : in out String) return String is
		count : Positive 		 := 1;
		temp  : String           := "  ";
		begin
			if Is_Digit (key (key'First)) then
				return key;
			end if;
			
			for I in Ch_Range loop
				for J in key'Range loop
					if key (J) = I then
						temp    := count'Image;
						key (J) := temp (temp'First + 1);
						count   := count + 1;
						exit;
					end if;
				end loop;
			end loop;
			
			return key;
	end Set_Key;
	
	function Get_Matrix (message, key : String) return Matrix is
		len : Positive := 1;
		idx : Positive := 1;
		begin
			if message'Length mod key'Length = 0 then
				len := message'Length / key'Length;
			else
				len := (message'Length / key'Length) + 1;
			end if;
			
			declare
				mat : Matrix(1 .. len, 1 .. key'Length) := (Others => (Others => ' '));
			begin
				for I in mat'Range (1) loop
					for J in mat'Range (2) loop
						if idx in message'Range then
							mat (I, J) := message (idx);
							idx        := idx + 1;
						else	
							return mat;
						end if;
					end loop;
				end loop;
				return mat;
			end;
	end Get_Matrix;
	
	procedure Sort_Arr (mat: in out Matrix; col_1, col_2 : Positive) is
		temp : Character := ' ';
		begin
			for I in mat'Range(1) loop
				temp 		   := mat (I, col_1);
				mat (I, col_1) := mat (I, col_2);
				mat (I, col_2) := temp;
			end loop;
	end Sort_Arr;
	
		
	procedure Sort (mat : in out Matrix; key : in out String) is
		changed : Boolean   := True;
		temp    : Character := ' '; 
		begin
			while changed loop
				changed := False;
				
				for I in key'First .. key'Last - 1 loop
					if key (I) > key (I + 1) then
						temp        := key (I);
						key (I)     := key (I + 1);
						key (I + 1) := temp;
						changed     := True;
						Sort_Arr (mat, I, I + 1);
					end if;
				end loop;
			end loop;
			
	end Sort;
	
	
	
	function Nico_Cipher (message, key : in out String) return String is
		begin
			key := Set_Key (key);
			declare
				ans : Unbounded_String := To_Unbounded_String ("");
				mat : Matrix           := Get_Matrix (message, key);
			begin
				Sort (mat, key);
				
				for I in mat'Range(1) loop
					for J in mat'Range(2) loop
						ans := ans & mat (I, J);
					end loop;
				end loop;
				return To_String (ans);					
			end;
	end Nico_Cipher;
	
    mess : String := "mubashirhassan";
    key  : String := "crazy";
    ans  : String := Nico_Cipher (mess, key);
    
begin
    Put_Line (ans);
end Hello;









