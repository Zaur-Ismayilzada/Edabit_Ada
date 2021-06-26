--GNAT 8.3.0
-- Aufgabestellung und Tests : https://edabit.com/challenge/g7cbJYaRkq5P36Ewy
with Ada.Text_IO; 			  use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;
procedure Hello is
	
	type Boo_Arr is array(Character range 'a' .. 'z')  of Boolean;
	type Int_Arr is array(Character range 'a' .. 'z')  of  Natural;
	
	
	procedure To_Lowercase (s: in out String) is
		begin
			for I in s'Range loop
				if Is_Letter (s (I)) then
					s (I) := To_Lower (s (I));
				end if;
			end loop;
	end To_Lowercase;
	
	function Is_Pangram (s: String) return Boolean is
		arr: Boo_Arr := (Others => False);
		begin
			for ch of s loop
				if ch in arr'Range then
					arr (ch) := True;
				end if;
			end loop;
			
			for I in arr'Range loop
				if not arr (I) then
					return False;
				end if;
			end loop;
			
			return True;		
	end Is_Pangram;
	
	function Is_Heterogram (s: String) return Boolean is
		arr: Int_Arr := (Others => 0);
		begin
			for ch of s loop
				if ch in arr'Range then
					arr (ch) := arr (ch) + 1;
				end if;
			end loop;
			
			for I in arr'Range loop
				if arr (I) >= 2 then
					return False;
				end if;
			end loop;
			
			return True;		
	end Is_Heterogram;
	
	function Is_Tautogram (s: String) return Boolean is
		ch : Character := s (s'First);
		begin
			for I in s'First .. s'Last - 1 loop
				if s (I) = ' ' and 
				   s (I + 1) /= ch then
					return False;
				end if;
			end loop;
			
			return True;
	end Is_Tautogram;
	
	function Is_Transgram (s: String) return Boolean is
		arr: Int_Arr := (Others => 0);
		con: Natural := 0;
		begin
			for ch of s loop
				if ch = ' ' then
					con := con + 1;
				end if;
				if ch in arr'Range then 
					arr (ch) := arr (ch) + 1;
				end if;
			end loop;
			for I in arr'Range loop
				if arr (I) >= con + 1 then
					return True;
				end if;
			end loop;
			
			return False;
	end Is_Transgram;
	
	
	procedure Constraint (s: in out String) is
		begin
			To_Lowercase (s);
			if Is_Pangram (s) then
				Put ("Pangram");
			elsif Is_Heterogram (s) then
				Put ("Heterogram");
			elsif Is_Tautogram (s) then
				Put ("Tautogram");
			elsif Is_Transgram (s) then
				Put ("Transgram");
			else
				Put ("Sentence");
			end if;
	end Constraint;
    
    s: String := "The quick brown fox jumps over the lazy dog.";
begin
    Constraint (s);
end Hello;
