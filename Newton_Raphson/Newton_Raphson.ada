--GNAT 8.3.0
--Aufagabe Beschreibung und Tests : https://edabit.com/challenge/nQz4cQ5cbLyRCwgCP
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
	type My_Float is digits 4;
	
	
	
	function F_S (a, b, c, d, x : My_Float) return My_Float is
		begin
			return a * (x ** 3) + b * (x ** 2) + c * x + d;
	end F_S;
	
	function F_A (a, b, c, d, x : My_Float) return My_Float is
		begin	
			return  My_Float (3) * a * (x ** 2) + My_Float (2) * b * x + c;
	end F_A;
	
	function Newton_Raphson (a, b, c, d : My_Float) return My_Float is
		x   : My_Float := 0.000;
		begin
			for I in 1..20 loop
				x := x - (F_S (a, b, c, d, x) / F_A (a, b, c, d, x));
			end loop;
			
			return x;
	end Newton_Raphson;
	
	
	a : My_Float := 0.000;
	b : My_Float := -0.100;
	c : My_Float := -0.200;
	d : My_Float := 0.300;
	
	ans : My_Float := 0.000;
	
	
	
begin

	ans := Newton_Raphson (a, b, c, d);
	
    Put_Line (ans'Image);
end Hello;




