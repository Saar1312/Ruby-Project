class BinTree
  attr_accessor :valor
#Se crea el nodo raiz.
    def initialize v,i,d
        begin
            raise if (i != nil && i.class != BinTree) || (d != nil && d.class != BinTree)
        rescue RuntimeError
            raise "Argumentos invalidos."
        end
        @valor = v
        @izquierdo = i
        @derecho = d
    end

    def izquierdo
    	return @izquierdo
    end

    def derecho
    	return @derecho
    end
end

h1 = BinTree.new(4,nil,nil)
h2 = BinTree.new(5,nil,nil)
arbol = BinTree.new(3,h1,h2)
puts "valor: #{arbol.valor}"
puts "valor hijo i: #{arbol.izquierdo.valor}"