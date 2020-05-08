# frozen_string_literal: true

# Luhn algorithm  (segunda comprobacion)
# 1 Empezando por el penultimo, doblar cada numero par, ejemplo 12345 = 5 8 3 4 1 , 123456 = 6 10 4 6 2 2
# 2 Sumar todos los valores de forma unitaria, si hay un numero de dos cifras separarlas y sumar ej 123456= 2 2 6 4 10 6 = 2+2+6+4+1+0+6
# 3 si el total es un multiple de 10 es valido ( 70%10 == 0 valid)

# Logica a seguir
# 1. revisar si es visa mastercard etc, si no lo es, directamente invalid y fuera
# 2. revisar el luhn algorthm
# 3. mostrar los resultados tal que TIPO: NUMERO (valid/invalid) ejemplo VISA: 4111111111111111       (valid)

# mejor usar una clase porque asi se pueden añadir nuevos tipos de tarjetas de forma rapida

class CardType
  def initialize(name, beginNum, numLength)
    @name = name
    @beginNum = beginNum
    @numLength = numLength
  end

  def validate(cardNum)
    if @numLength.include? cardNum.length
      @beginNum.each do |num|
        return true if cardNum.start_with?(num)
      end
    end
    false
  end

  def returnType
    return @name
  end 

  def show
    puts "#{@name},#{@beginNum},#{@numLength}"
  end
end


CARDTYPES = []
CARDTYPES.push(CardType.new('AMEX', %w[34 37], [15]))
CARDTYPES.push(CardType.new('Discover', ['6011'], [16]))
CARDTYPES.push(CardType.new('MasterCard', %w[51 55], [16]))
CARDTYPES.push(CardType.new('VISA', ['4'], [13, 16]))

puts "INTRODUZCA UNA TARJETA DE CREDITO"
card_num = gets.chomp.to_i # Si lo transformamos primero en integer no pueden colar letras
card_type = "unknown"
validation = "invalid"
CARDTYPES.each do |item|
  if item.validate(card_num.to_s)
    card_type= item.returnType
  end
end


puts "#{card_type}: #{card_num}    (#{validation})"
