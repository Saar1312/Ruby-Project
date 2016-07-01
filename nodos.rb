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
        ult = Math.log10(valor).floor.downto(0).map { |x| (valor / 10**x) % 10 }

        suma = 0
        for i in (0..((ult.length)-2))
            suma += ult[i]
        end

        suma = suma * ult[ult.length-1]

        return suma
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

        suma = 0
        z = Math.log10(valor).floor.downto(0).map { |x| (valor / 10**x) % 10 }
        z.each do |x|
            suma += x
        end

        promedio = suma / z.length

        return promedio
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
        num = 0
        aux = Math.log10(valor).floor.downto(0).map { |x| (valor / 10**x) % 10 }

        aux= aux.partition { |x| x.odd? }
        aux[0].each do |x|
            num += x
        end

        return num       
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

        z = valor.flatten
        z1 = []
        zr = []
        tam = valor.length*0.5

        for x in 0 ..(tam -1)
            zr << Random.rand(0..(z.length -1))
        end

        for x in 0..(zr.length -1)
            count = zr[x]
            z1 << z[count].tipo_instancia(Oscuro.new())
        end

        d = z.reject{ |x| z1.include? x }


        return (z1 << d).flatten!
    end

end