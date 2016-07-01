#!/usr/bin/ruby
#encoding: utf-8

# Isaac Gonzalez : 11-10396
# Samuel Arleo : 

require_relative "mod_bfs.rb"
require_relative "mod_fold.rb"
require_relative "nodos.rb"

#Arbol Binario
##################################################################################################
class ArbolBinario
  include BFS #--------> NUEVO <--------
  include DFS #--------> NUEVO <--------
  attr_accessor :valor
  attr_reader :izquierdo, :derecho
	
	#Se crea el nodo raiz.
    def initialize v, i = nil, d = nil
        @valor = v
        @izquierdo = i
        @derecho = d
    end

    #Metodo get --------> NUEVO <--------
    def get
        return valor
    end
	
    #Metodo each
    def each
        yield izquierdo unless @izquierdo == nil
        yield derecho unless @derecho == nil
    end

	#Metodo Mutar Valor
    def mutar(mutador)
    	@valor = @valor.mutar(mutador)
    end

end

#Arbol Rosa
####################################################################################################
class ArbolRosa
  include BFS #--------> NUEVO <--------
  include DFS #--------> NUEVO <--------
  attr_accessor :valor
  attr_reader :hijos

	#Se crea el nodo raiz.
    def initialize v, *h
        @valor = v
        @hijos = h
    end

    #Metodo get --------> NUEVO <--------
    def get
        return valor
    end

    #Metodo each
    def each
    	@hijos.each do |h|
    		(yield h) unless h == nil
    	end
    end 

    #Metodo mutar
    def mutar(mutador)
    	@valor = @valor.mutar(mutador)
    end
end

##############################################################################################

h1 = ArbolRosa.new("Perra")
h2 = ArbolRosa.new("Loca")
h3 = ArbolRosa.new("Fea")
h4 = ArbolRosa.new("Gafa")
h5 = ArbolRosa.new("Tonta")
arbol = ArbolRosa.new("Sucia",h1,h2,h3,h4,h5)
arbol.valor = "Puerca"
puts "valor Padre: #{arbol.valor}"
arbol.each do |x|
	puts "valor Hijo: #{x.valor}"
end
arbol.mutar(Singular.new())