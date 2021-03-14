--GNAT 8.3.0
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
    function Get_Disarium (num: Positive) return Positive is
        temp : String    := Positive'Image (num);
        begin
            if num < 10 --Aufgabe Beschreibung und Tests : https://edabit.com/challenge/mP5BLYHWyeiFpECud
then
                return num;     
            end if;
            return   (num mod 10) ** (temp'Length - 1) + 
                    Get_Disarium (num / 10);       
    end Get_Disarium;
    
    num : Positive := 175;
    
begin
    if num = Get_Disarium (num) then
        Put ("True");
    else
        Put ("False");
    end if;
end Hello;