--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/5tNkD75pLSkAqBFnD
with Ada.Text_IO;           use  Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
	 
procedure Hello is
	
	function Get_Next (s : in out Unbounded_String) return Unbounded_String is
		Result : Unbounded_String := Null_Unbounded_String;
		Temp   : Character        := ' ';
		I      : Positive         := 1;
		begin
			Temp   := Element (s, I);
            		Result := Result & Temp;
			I      := I + 1;
			
			while I <= Length (s) loop
				if Element (s, I) /= Temp then
					s := Unbounded_Slice (s, I, Length (s));
					return Result;
				else
					Result := Result & Temp;
					I      := I + 1;
				end if;
			end loop;
			
			s := Null_Unbounded_String;
			
			return Result;
	end Get_Next;
	
	
	function Is_Long_Pressed (a, b : in String) return Boolean is
		A_S : Unbounded_String := To_Unbounded_String (a);
		B_S : Unbounded_String := To_Unbounded_String (b);
		
		A_Temp : Unbounded_String := Null_Unbounded_String;
		B_Temp : Unbounded_String := Null_Unbounded_String;
		begin
			while A_S /= Null_Unbounded_String and B_S /= Null_Unbounded_String loop
				A_Temp := Get_Next (A_S);
				B_Temp := Get_Next (B_S);
				
				if Length (A_Temp) > Length (B_Temp) then
					return False;
				elsif (A_S  = Null_Unbounded_String and B_S /= Null_Unbounded_String) or
                      		      (A_S /= Null_Unbounded_String and B_S  = Null_Unbounded_String) then
					return False;					
				end if;
			end loop;
			
			return True;
	end Is_Long_Pressed;
	
	a : String := "deep";
	b : String := "dddeeeppp";
	
	Result : Boolean := Is_Long_Pressed (a, b);
begin
    Put_Line (Result'Image);
end Hello;
