#!/usr/bin/ruby
#encoding: utf-8

# Isaac Gonzalez : 11-10396
# Samuel Arleo : 10-10969

#Fixnum
########################################################################
class Fixnum

    def mutar(mutador)
        mutador.mutarFixnum(self)      
    end
end

#String
########################################################################
class String

    def mutar(mutador)
        mutador.mutarString(self)
    end
end

#Array
########################################################################
class Array

    def mutar(mutador)
        mutador.mutarArray(self)
    end
end


#Clase Mutador
#####################################################################################
class Mutador
end

#Clase Singular
######################################################################################
class Singular < Mutador

    def mutarFixnum(valor)
        puts "Hola"
    end

    def mutarString(valor)
            valor.gsub!(/s/,"S")
            valor.gsub!(/i/,"I")
            valor.gsub!(/n/,"N")
            valor.gsub!(/g/,"G")
            valor.gsub!(/u/,"U")
            valor.gsub!(/l/,"L")
            valor.gsub!(/a/,"A")
            valor.gsub!(/r/,"R")
        return valor
    end

    def mutarArray(valor)
        return (valor * " ")
    end

end

#Clase Uniforme
######################################################################################
class Uniforme < Mutador

    def mutarFixnum(valor)
        puts "Hola"
    end

    def mutarString(valor)
        valor.swapcase!
        return valor
    end

    def mutarArray(valor)
        array = []
        valor.each do |x|
            array << x.mutar(Uniforme.new())
        end
        return array
    end

end

#Clase Oscuro
######################################################################################
class Oscuro < Mutador

    def mutarFixnum(valor)
        put "Hola"        
    end

    def mutarString(valor)
        d = []
        i = []
        for it in 0..((valor.length) -1)
            if it.odd?
                i << valor[it]
            else
                d << valor[it]
            end
        end
        (i += d)
        return (i * "") 
    end

    def mutarArray(valor)
        puts "Hola"
    end

end