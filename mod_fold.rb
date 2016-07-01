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
		yield(self)
		while !s.empty? #Quitar el ? hace falta?
			elem = s.pop
			elem.each do |x|
				yield(x)
				s.push(x)
			end
		end
	end

	#Realiza fold sobre los nodos del arbol en el orden dado por el DFS
	def fold(val)
		acum = Array.new
		self.dfs do |x|
			acum.push(x)
			yield(x,acum)
		end
	end
end
