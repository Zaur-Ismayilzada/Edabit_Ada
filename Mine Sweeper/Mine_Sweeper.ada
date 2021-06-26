--GNAT 8.3.0
--Aufgabestellung und Tests : https://edabit.com/challenge/XtgQF7ZDMakKHQiSp
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
    
    procedure Mine_Sweeper (m: in out Matrix) is
        temp : Positive := 48;
        begin
            for I in m'Range(1) loop
                for J in m'Range(2) loop
                    if m (I, J) = '?' then
                        m (I, J) := Character'Val (temp);
                        if J /= m'First(2) and then m (I, J - 1) = '#' then
                            temp     := temp + 1;
                            m (I, J) := Character'Val (temp);
                        end if;
                        if J /= m'Last(2) and then m (I, J + 1) = '#' then
                            temp     := temp + 1;
                            m (I, J) := Character'Val (temp);
                        end if;
                        if I /= m'First(1) and then m (I - 1, J) = '#' then
                            temp     := temp + 1;
                            m (I, J) := Character'Val (temp);                    
                        end if;
                        if I /= m'Last(1) and then m (I + 1, J) = '#' then
                            temp     := temp + 1;
                            m (I, J) := Character'Val (temp);                  
                        end if;
                        if I /= m'First(1) then
                            if J /= m'First(2) and then m (I - 1, J - 1) = '#' then
                                temp     := temp + 1;
                                m (I, J) := Character'Val (temp);                           
                            end if;
                            if J /= m'Last(2) and then m (I - 1, J + 1) = '#' then
                                temp     := temp + 1;
                                m (I, J) := Character'Val (temp);                             
                            end if;
                        end if;
                        if I /= m'Last(1) then
                            if J /= m'First(2) and then m (I + 1, J - 1) = '#' then
                                temp     := temp + 1;
                                m (I, J) := Character'Val (temp);                            
                            end if;
                            if J /= m'Last(2) and then m (I + 1, J + 1) = '#' then
                                temp     := temp + 1;
                                m (I, J) := Character'Val (temp);                              
                            end if;
                        end if;         
                    end if;
                    temp := 48;
                end loop;
            end loop;
            
            Print (m);
            
    end Mine_Sweeper;
    
    m : Matrix := (('-', '#', '#'), 
                   ('?', '#', '-'), 
                   ('#', '?', '-'));
    
begin
    Mine_Sweeper (m);
end Hello;
