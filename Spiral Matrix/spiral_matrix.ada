--GNAT 8.3.0
-- Aufgabebeschreibung und Tests : https://edabit.com/challenge/wmJWogKLQPGWyYYdZ

with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
    type Matrix is array(Positive range <>, Positive range <>) of Character;
    
    procedure Print (m: Matrix) is
        begin
            for I in m'Range(1) loop
                for J in m'Range(2) loop
                    Put (Character'Image (m (I, J)) & " ");
                end loop;
                New_Line;
            end loop;
    end Print;
    
    function Get_Str (num: Positive; s: String) return String is
        begin
            if s'Length >= num * num then
                return s (1 .. num * num);
            else
                return s;
            end if;
    end Get_Str;
    
    function Get (num: Positive) return Positive is
        begin
            if num mod 2 = 0 then
                return num / 2;
            else
                return num / 2 + 1;
            end if;
    end Get;
    
    procedure Spiral_Matrix (num: Positive; s: String) is
        m : Matrix(1..num, 1..num) := (Others => (Others => '+'));
        
        s_n : String   := Get_Str (num, s);
        row : Natural  := Get (num);
        col : Natural  := Get (num);
        dis : Positive := 1;
        idx : Natural  := 0;
        len : Positive := num;
        
        begin
            m (row, col) := s_n (s_n'First + idx);
            idx := idx + 1;
            while idx < s_n'Last and row in m'Range(1) and col in m'Range(2) loop
               -- Print (m);
                --New_line;
                --column right
                for I in 1 .. dis loop
                    col := col + 1;
                    if row in m'Range(1) and col in m'Range(2) and idx < s_n'Last then
                        m(row, col) := s_n (s_n'First + idx);
                        idx := idx + 1;
                    else
                        exit;
                    end if;
                end loop;
                
                --row down
                for I in 1 .. dis loop
                    row := row + 1;
                   if row in m'Range(1) and col in m'Range(2) and idx < s_n'Last then
                        m(row, col) := s_n (s_n'First + idx);
                        idx := idx + 1;
                    else
                        exit;
                    end if;
                end loop;
                
                dis := dis + 1;
                
                --column left
                for I in 1 .. dis loop
                    col := col - 1;
                    if row in m'Range(1) and col in m'Range(2) and idx < s_n'Last then
                        m(row, col) := s_n (s_n'First + idx);
                        idx := idx + 1;
                    else
                        exit;
                    end if;
                end loop;
                
                -- row up
                for I in 1 .. dis loop
                    row := row - 1;
                    if row in m'Range(1) and col in m'Range(2) and idx < s_n'Last then
                        m(row, col) := s_n (s_n'First + idx);
                        idx := idx + 1;
                    else
                        exit;
                    end if;
                end loop;
                
                dis := dis + 1;
                
            end loop;
            
            Print (m);
            
    end Spiral_Matrix;
    num : Positive := 2;
    s   : String   := "DOG";
begin
    Spiral_Matrix (num, s);
end Hello;
