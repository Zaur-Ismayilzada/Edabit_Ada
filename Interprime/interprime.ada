--GNAT 8.3.0
--Aufgaben Beschreibung und Tests : https://edabit.com/challenge/4Nnvh8QYYD4aSqJfc
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
    type Int_Arr is array(Positive range <>) of Positive;
    
    procedure Print (arr: Int_Arr) is
        begin
            for Val of arr loop
                Put (Positive'Image (Val));
            end loop;
    end Print;
    
    function Is_Prime (num: Positive) return Boolean is
        k : Positive := 2;
        begin
            while k < num loop
                if num mod k = 0 then
                    return False;
                end if;
                k := k + 1;
            end loop;
            
            return True;
            
    end Is_Prime;
    
    
    procedure Interprime (num: Positive) is
        k : Positive := 1;
        begin
            while num - k /= 1 loop
                if Is_Prime (num - k) and Is_Prime (num + k) then
                    declare 
                        arr: Int_Arr := (num - k, num + k);                    
                        begin
                            Print (arr);
                            return;
                        end;
                end if;
                k := k + 1;
            end loop;
            
            Put ("NONE");
    end Interprime;
    
    
begin
    Interprime (413);
end Hello;

