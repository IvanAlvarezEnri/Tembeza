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
    @name
  end

  def show
    puts "#{@name},#{@beginNum},#{@numLength}"
  end
end


def LuhnValidation(cardNum)
  cardNum.reverse!
  i = 0
  newCardNum = []
  while i < cardNum.length
    newCardNum.push(cardNum[i])
    i += 1
    newCardNum.push((cardNum[i].to_i * 2).to_s)
    i += 1
  end
  sum = 0
  newCardNum.join.split(//).each { |n| sum += n.to_i }
  if sum % 10 == 0
    return 'valid'
  else
    return 'invalid'
  end

  'error'
end

CARDTYPES = []
CARDTYPES.push(CardType.new('AMEX', ['34','37'], [15]))
CARDTYPES.push(CardType.new('Discover', ['6011'], [16]))
CARDTYPES.push(CardType.new('MasterCard', ['51','55'], [16]))
CARDTYPES.push(CardType.new('VISA', ['4'], [13, 16]))

card_num = 0
while card_num >= 0
  puts 'INTRODUZCA UNA TARJETA DE CREDITO O UN NUMERO NEGATIVO PARA SALIR'
  card_num = gets.chomp.to_i # Si lo transformamos primero en integer no pueden colar letras
  if card_num < 0
    puts "adios"
    next
  end
  card_type = 'unknown'
  validation = 'invalid'
  CARDTYPES.each do |item|
    card_type = item.returnType if item.validate(card_num.to_s)
  end
  validation = LuhnValidation(card_num.to_s) if card_type != 'unknown'
  puts '------------------------------------------------'
  puts "#{card_type}: #{card_num}    (#{validation})"
end
