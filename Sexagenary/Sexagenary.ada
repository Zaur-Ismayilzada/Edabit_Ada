--GNAT 8.3.0
--Aufgabebeschreibung und Tests : https://edabit.com/challenge/pnhcp4FraYQDeqRGt
with Ada.Text_IO; 			use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
procedure Main is

	type Element_Index is mod 5;
	type Animal_Index  is mod 12;
	
	type Animal_Array  is array(Animal_Index  range <>) of Unbounded_String;
	type Element_Array is array(Element_Index range <>) of Unbounded_String;

	
	Ani_Arr : 	Animal_Array 	:= 	(To_Unbounded_String ("Rat"),
									 To_Unbounded_String ("Ox"),
									 To_Unbounded_String ("Tiger"),
									 To_Unbounded_String ("Rabbit"),
									 To_Unbounded_String ("Dragon"),
									 To_Unbounded_String ("Snake"),
									 To_Unbounded_String ("Horse"),
									 To_Unbounded_String ("Sheep"),
									 To_Unbounded_String ("Monkey"),
									 To_Unbounded_String ("Rooster"),
									 To_Unbounded_String ("Dog"),
									 To_Unbounded_String ("Pig"));
	
	Ele_Arr : 	Element_Array 	:= 	(To_Unbounded_String ("Wood"),
									 To_Unbounded_String ("Fire"),
									 To_Unbounded_String ("Earth"),
									 To_Unbounded_String ("Metal"),
									 To_Unbounded_String ("Water"));
									  
	procedure Sexagenary (Year : Positive) is
		Base_Year : Positive := 1984;
		Temp      : Natural  := abs (Base_Year - Year);
		Temp_Float: Float    := 0.0;
		
		Ele_Idx   : Element_Index    := Element_Index'First;
		Ani_Idx   : Animal_Index     := Animal_Index'First;
		Answer    : Unbounded_String := Null_Unbounded_String;
		begin
			
			if Year >= Base_Year then
				Ani_Idx := Animal_Index (Temp mod 12);
				Answer  := Answer & Ani_Arr (Ani_Idx) & " ";
				
				Temp_Float := Float'Floor (Float (Temp) / Float (2));
				Ele_Idx    := Element_Index (Natural (Temp_Float) mod 5);
				Answer     := Answer & Ele_Arr (Ele_Idx);
			elsif Year < Base_Year then
				Ani_Idx := Ani_Idx - Animal_Index (Temp mod 12);
				Answer  := Answer & Ani_Arr (Ani_Idx) & " ";
				
				Temp_Float := Float'Ceiling (Float (Temp) / Float (2));
				Ele_Idx    := Ele_Idx - Element_Index (Natural (Temp_Float) mod 5);
				Answer     := Answer & Ele_Arr (Ele_Idx);
			end if;
			
			Put (To_String (Answer));
	end Sexagenary;
begin
    for I in 1900 .. 1983 loop
        Put (I'image & " ");
        Sexagenary (I);
        New_Line;
    end loop;
end Main;