#!/usr/bin/ruby
#encoding: utf-8

# Isaac Gonzalez : 11-10396
# Samuel Arleo : 
# Archivo: Mixin con la implementacion de DFS y fold


#Mixin
module FOLD
	
	#Realiza DFS sobre el arbol
	def dfs
		s = Array.new
		s.push(self)
		while !s.empty? #Quitar el ? hace falta?
			elem = s.pop
			yield(elem)
			elem.each do |x|
				s.push(x)
			end
		end
	end

	#Realiza fold sobre los nodos del arbol en el orden dado por el DFS
	def fold(val)
		temp = val
		self.dfs do |x|
			val = yield(x,temp)
			temp = val
		end
		puts "#{val}"
	end
end

#predicado = lambda{|x| x == "arbol" || x=="h1"}
#puts "Res #{arbol2.recoger(&predicado)}"

