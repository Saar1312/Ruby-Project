#!/usr/bin/ruby
#encoding: utf-8

# Isaac Gonzalez : 11-10396
# Samuel Arleo : 10-10969

require_relative "mod_bfs.rb"
require_relative "mod_fold.rb"
require_relative "nodos.rb"

#Arbol Binario
##################################################################################################
class ArbolBinario
  include BFS #--------> NUEVO <--------
  attr_accessor :valor
  attr_reader :izquierdo, :derecho
	
	#Se crea el nodo raiz.
    def initialize v, i = nil, d = nil
        @valor = v
        @izquierdo = i
        @derecho = d
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
  attr_accessor :valor
  attr_reader :hijos

	#Se crea el nodo raiz.
    def initialize v, *h
        @valor = v
        @hijos = h
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
