#!/usr/bin/ruby
#encoding: utf-8

# Isaac Gonzalez : 11-10396
# Samuel Arleo : 
# Archivo: Mixin con la implementacion de BFS y recoger


#Mixin
module BFS
	
	#Realiza BFS sobre el arbol
	def bfs
		q = Array.new
		q.insert(0,self)
		yield(self)
		while !q.empty? #Quitar el ? hace falta?
			elem = q.pop
			elem.each do |x|
				yield(x)
				q.insert(0,x)
			end
		end
	end

	#Recoger evalua un predicado sobre cada nodo del recorrido BFS
	#y acumula los nodos que lo cumplen en lista
	def recoger(&predicado)
		lista = Array.new
		self.bfs do |x|
			if predicado.call(x)
				lista.push(x)
			end
		end
	end
end

=begin
h1 = BinTree.new("h1")
h2 = BinTree.new("h2")
arbol = BinTree.new("arbol",h1,h2)


h4 = BinTree.new("h4")
h3 = BinTree.new("H3",arbol,h4)
arbol2 = BinTree.new("arbol2",h3)

arbol2.bfs {|x| puts "#{x}"}
predicado = lambda{|x| x == "arbol" || x=="h1"}
puts "Res #{arbol2.recoger(&predicado)}"
=end
