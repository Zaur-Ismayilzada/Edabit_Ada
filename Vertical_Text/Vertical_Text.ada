--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/ZMdWqb8QwBz7QEMEs
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
procedure Hello is
	type Char_Array is array(Positive range <>, Positive range <>) of Character;
	type Str_Array  is array(Positive range <>) of Unbounded_String;
	
	procedure Print (arr : Char_Array) is	
		begin
			for I in arr'Range(1) loop
				for J in arr'Range(2) loop
					Put (arr (I, J)'Image & " ");
				end loop;
				New_Line;
			end loop;
	end Print;
	
	function Get_Longest (s : String) return Positive is
		max : Positive := 1;
		idx : Positive := 1;		
		begin
			for I in s'First + 1 .. s'Last loop
				if s (I) = ' ' then
					if s (idx .. I - 1)'Length > max then
						max := s (idx .. I - 1)'Length;
					end if;
					idx := I + 1;
				end if;
			end loop;
			
			if s (idx .. s'Last)'Length > max then
				max := s (idx .. s'Last)'Length;
 			end if;
			
			return max;
	end Get_Longest;
	
	function Get_Count (s : String) return Positive is
		count : Positive := 1;
		begin
			for I in s'Range loop
				if s (I) = ' ' then
					count := count + 1;
				end if;
			end loop;
			
			return count;
	end Get_Count;
	
	function Get_Str_Array (s : String) return Str_Array is
		arr : Str_Array(1 .. Get_Count (s)) := (Others => Null_Unbounded_String);
		idx : Positive := 1;
		J   : Positive := 1;
		begin
			for I in s'First + 1 .. s'Last loop
				if s (I) = ' ' then
					arr (J) := To_Unbounded_String (s (idx .. I - 1));
					J       := J + 1;
					idx     := I + 1;
				end if;
			end loop;
			
			arr (J) := To_Unbounded_String (s (idx .. s'Last));
			
			return arr;
	end Get_Str_Array;
	
	procedure Vertical_Text (s : String) is
		Len  : Positive := Get_Longest (s);
		Con  : Positive := Get_Count (s);
		
		arr_char : Char_Array(1..Len, 1..Con) := (Others => (Others => ' '));
		arr_str  : Str_Array 				  := Get_Str_Array (s);
		
		str      : Unbounded_String := Null_Unbounded_String;
		begin
			for J in arr_char'Range(2) loop
				str := arr_str (J);
				for I in arr_char'Range(1) loop
					if I in 1..Length (str) then
						arr_char (I, J) := Element (str, I);
					else
						exit;
					end if;
				end loop;
			end loop;
			
			Print (arr_char);
	end Vertical_Text;
	
	s : String := "Holy bananas";
begin
    Vertical_Text (s);
end Hello;