#!/usr/bin/ruby
#encoding: utf-8

# Isaac Gonzalez : 11-10396
# Samuel Arleo : 10-10969
# Archivo: Mixin con la implementacion de BFS y recoger


#Mixin
module BFS

	#Realiza BFS sobre el arbol
	def bfs
		q = Array.new
		q.insert(0,self)
		puts "#{self.valor}"
		yield(self)
		puts "#Sigue"
		while !q.empty? 
			elem = q.pop
			elem.each do |x|
				yield(x)
				q.insert(0,x)
			end
		end
	end

	#Recoger evalua un predicado sobre cada nodo del recorrido BFS
	#y acumula los nodos que lo cumplen en lista
	def recoger(predicado = Proc.new)
		lista = Array.new
		self.bfs do |x|
			if predicado.call(x)
				lista.push(x)
			end
		end
	end
end
