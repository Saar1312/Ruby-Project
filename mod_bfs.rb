require 'thread'

module DFS
	def dfs
		q = Queue.new
		q.push(self)
		yield(self.get)
		while !q.empty? #Quitar el ? hace falta?
			elem = q.pop
			elem.each do |x|
				yield(x.get)
				q.push(x)
			end
		end
	end
	#def recoger(&block)
	#	dfs {} #En el bloque ver si se puede usar una lista para irle metiendo valores que cumplan
	#end
end

class BinTree
	include DFS
	attr_accessor :valor
	attr_reader :izquierdo, :derecho
#Se crea el nodo raiz.
	def initialize v,i = nil,d = nil
		begin
			raise if (i != nil && i.class != BinTree) || (d != nil && d.class != BinTree) ||
			 (v.class != String && v.class != Fixnum && v.class != Array)
		rescue RuntimeError
			raise "Argumentos invalidos."
		end
		@valor = v
		@izquierdo = i
		@derecho = d
	end
	def get
		return valor
	end
#Metodo each
	def each
		yield izquierdo unless @izquierdo== nil
		yield derecho unless @derecho == nil
	end

end

=begin

para probarlo
h1 = BinTree.new("h1")
h2 = BinTree.new("h2")
arbol = BinTree.new("arbol",h1,h2)


h4 = BinTree.new("h4")
h3 = BinTree.new("H3",arbol,h4)
arbol2 = BinTree.new("arbol2",h3)

arbol2.dfs {|x| puts "#{x}"}
=end