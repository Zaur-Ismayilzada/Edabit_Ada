--GNAT 8.3.0
-- Aufgabe Beschreibung und Tests : https://edabit.com/challenge/Tp5bqp6AyoQFMwWMr
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type Int_Array is array(Positive range <>) of Natural;
	
	procedure Print (arr : Int_Array) is
		begin
			for Val of arr loop
				Put (Val'Image & " ");
			end loop;
	end Print;
	
	function Is_Vowel (ch : Character) return Boolean is
		begin
			case ch is
				when 'a' => 
					return True;
				when 'e' =>
					return True;
				when 'i' =>
					return True;
				when 'o' =>
					return True;
				when 'u' =>
					return True;
				when others =>
					return False;
			end case;
	end Is_Vowel;
	function Find_Left (s : String; I : Positive) return Integer is
		ans : Integer  := 0;
		idx : Positive := I;
		begin
			for k in reverse s'First .. idx loop
				if Is_Vowel (s (k)) then
					return ans;
				else
					ans := ans + 1;
				end if;
			end loop;
			
			return Integer'Last;
	end Find_Left;
	
	function Find_Right (s : String; I : Positive) return Integer is
		ans : Integer  := 0;
		idx : Positive := I;
		begin
			for k in idx .. s'Last loop
				if Is_Vowel (s (k)) then
					return ans;
				else
					ans := ans + 1;
				end if;
			end loop;
			return Integer'Last;
	end Find_Right;
	
	function Distance_To_Nearest_Vowel (s : String) return Int_Array is
		arr : Int_Array(1 .. s'Length) := (Others => 0);
		con : Natural                  := 0;
		begin
			for I in s'Range loop
				if Is_Vowel (s (I)) then 
					arr (I) := 0;	
				else
					con := Integer'Min (Find_Left (s, I), Find_Right (s, I));
					arr (I) := con;
				end if;
			end loop;
			
			return arr;
	end Distance_To_Nearest_Vowel;
	
	s   : String    := "abcdabcd";
	arr : Int_Array := Distance_To_Nearest_Vowel (s);
begin
    Print (arr);
end Hello;






