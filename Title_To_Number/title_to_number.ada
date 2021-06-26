--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/GAAHikJEWXqdeB4cu

with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
    
    type Ch_Arr is array(Character range 'A' .. 'Z') of Positive;
    arr: Ch_Arr := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                    14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26);
                    
    function Title_To_Number (s: String) return Positive is
        temp : Positive := 1;
        begin
            if s'Length = 1 then
                return arr (s (s'First));
            end if;
            
            temp := temp * arr (s (s'First)) * (26 ** (s'Length - 1));
            
            return temp + Title_To_Number (s (s'First + 1 .. s'Last));
    end Title_To_Number;
    
    ans : Positive := Title_To_Number ("FRIENDS");
    
begin
    Put_Line (Positive'Image (ans));
end Hello;
