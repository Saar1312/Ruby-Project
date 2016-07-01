module BFS
	def bfs
		q = Array.new
		q.insert(0,self)
		yield(self.get)
		while !q.empty? #Quitar el ? hace falta?
			elem = q.pop
			elem.each do |x|
				yield(x.get)
				q.insert(0,x)
			end
		end
	end
	def recoger(&predicado)
		lista = Array.new
		self.bfs do |x|
			if predicado.call(x)
				lista.push(x)
			end
		end
	end
end

class BinTree
	include BFS
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


h1 = BinTree.new("h1")
h2 = BinTree.new("h2")
arbol = BinTree.new("arbol",h1,h2)


h4 = BinTree.new("h4")
h3 = BinTree.new("H3",arbol,h4)
arbol2 = BinTree.new("arbol2",h3)

#arbol2.bfs {|x| puts "#{x}"}
predicado = lambda{|x| x == "arbol" || x=="h1"}
puts "Res #{arbol2.recoger(&predicado)}"


=begin

FOLDR?

module Inject
  def inject(n)
	 each do |value|
	   n = yield(n, value)
	 end
	 n
  end
  def sum(initial = 0)
	inject(initial) { |n, value| n + value }
  end
  def product(initial = 1)
	inject(initial) { |n, value| n * value }
  end
end

class Array
  include Inject
end
[ 1, 2, 3, 4, 5 ].sum → 15
[ 1, 2, 3, 4, 5 ].product 
=end