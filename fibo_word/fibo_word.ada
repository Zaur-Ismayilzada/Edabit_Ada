--GNAT 8.3.0
-- Aufgabe Beschreibung und Tests : https://edabit.com/challenge/j9uHeqkpTAXosdPpr
with Ada.Text_IO; 			use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
procedure Hello is
	
	function Fibo_Word (n : in out Positive) return String is
		ans : Unbounded_String := To_Unbounded_String ("");
		a   : Unbounded_String := To_Unbounded_String ("b");
		b   : Unbounded_String := To_Unbounded_String ("a");
		tem : Unbounded_String := To_Unbounded_String ("");
		begin
			if n < 2  then
				return "invalid";
			end if;
			
			ans := ans & Character'Val (34) & a & ", " & b;
			
			while n /= 2 loop
				ans := ans & ", " & b & a;
				tem := a;
				a   := b;
				b   := b & tem;
				n   := n - 1;
			end loop;
			
			
			return To_String (ans & Character'Val (34));
	end Fibo_Word;
	
	n : Natural := 7;
	s : String  := Fibo_Word (n);
	
begin
    Put_Line (s);
end Hello;