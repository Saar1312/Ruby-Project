#!/usr/bin/ruby
#encoding: utf-8

require_relative "mod_bfs.rb"
require_relative "mod_fold.rb"
require_relative "nodos.rb"


class BinTree
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

end

h1 = BinTree.new("Perra")
h2 = BinTree.new("Loca")
arbol = BinTree.new("Sucia",h1,h2)
puts "valor: #{arbol.valor}"
puts "valor hijo i: #{arbol.izquierdo.valor}"