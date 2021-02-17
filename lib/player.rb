class Player
  attr_reader :name, :symbol, :score
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
  end

  def increase_score
    @score += 1
  end
end
