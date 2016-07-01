#!/usr/bin/ruby
#encoding: utf-8

# Isaac Gonzalez : 11-10396
# Samuel Arleo : 

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
        puts "Hola"
    end

    def mutarArray(valor)
        puts "Hola"
    end

end

#Clase Uniforme
######################################################################################
class Uniforme < Mutador

    def mutarFixnum(valor)
        puts "Hola"
    end

    def mutarString(valor)
        puts "Hola"
    end

    def mutarArray(valor)
        puts "Hola"
    end

end

#Clase Oscuro
######################################################################################
class Oscuro < Mutador

    def mutarFixnum(valor)
        put "Hola"        
    end

    def mutarString(valor)
        puts "Hola"        
    end

    def mutarArray(valor)
        puts "Hola"
    end

end