--GNAT 8.3.0
-- Aufgabestellung und Tests : https://edabit.com/challenge/GBmwGCwP3GfDKfqY2
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
    function Lunar_Sum (a, b : String) return String is
        begin
            if a'Length = 0 or b'Length = 0 then
                return a & b;
            end if;
            
            declare
                a_n : Natural := Natural'Value (a (a'Last) & "");
                b_n : Natural := Natural'Value (b (b'Last) & "");
                begin
                    if a_n > b_n then
                        return Lunar_Sum (a (a'First .. a'Last - 1), 
                                          b (b'First .. b'Last - 1)) & a_n'Image;
                    else
                        return Lunar_Sum (a (a'First .. a'Last - 1), 
                                          b (b'First .. b'Last - 1)) & b_n'Image;
                    end if;
                end;           
    end Lunar_Sum;
    
    function Trim (s: String) return String is
        begin
            if s'Length = 0 then
                return "";
            elsif s (s'First) /= ' ' then
                return s (s'First) & "" & Trim (s (s'First + 1 .. s'Last));
            end if;
            return Trim (s (s'First + 1 .. s'Last));
    end Trim;
    
    procedure Main (num_1, num_2 : Natural) is
        ans : Natural := 0;
        s   : String  := Trim (Lunar_Sum (Trim (num_1'Image), Trim (num_2'Image)));
        begin
            ans := Integer'Value (s);
            Put (ans'Image);                    
    end Main;
    
    a : Natural := 9;
    b : Natural := 11;
    
begin
    Main (a, b);
end Hello;
