#!/usr/bin/env ruby

puts 'Tic Tac Toe.'
puts 'Numbers are available cells, symbols are busy cells. Every player have a different symbol.
Type the number of the cell where you want to write your symbol.
The first player to make a straight three line symbol wins'
first_player_name = ''
while first_player_name.empty?
  puts 'Write the first player\' name:'
  first_player_name = gets.chomp
end

first_player_symbol = ''
while first_player_symbol.empty?
  puts 'Write the first player\' symbol. Choose between X or O:'
  first_player_symbol = gets.chomp.upcase
  # X or O
  first_player_symbol = '' if first_player_symbol != 'O' && first_player_symbol != 'X'
end

second_player_symbol = first_player_symbol == 'X' ? 'O' : 'X'

second_player_name = ''
while second_player_name.empty? || second_player_name == first_player_name
  puts 'Write the second player\'s name: (It must be different than the first player\'s name)'
  second_player_name = gets.chomp
end

puts "#{first_player_name} is going to play with #{first_player_symbol} symbol"
puts "#{second_player_name} is going to play with #{second_player_symbol} symbol"

# Returns random boolean for the sake of mocking
def cell_busy?
  false
end

$finished = false

def mark_cell
  $finished = [true, false].sample
end

def game_finished?
  $finished
end

def a_tie?
  [true, false].sample
end

current_player = first_player_name
play_again = 'Y'

def get_next_player(first_player, second_player, current_player)
  current_player == first_player ? second_player : first_player
end

# Loop 1 - Reset the game
while play_again == 'Y'

  # Loop 2 - Check if the game is finished
  until game_finished?

    board = %(
         1 | 2 | 3
        ---+---+---
         4 | 5 | 6
        ---+---+---
         7 | 8 | 9 )

    puts board

    puts "It's time for #{current_player} to make a move. Please choose the number of the cell you want to play"
    move = gets.chomp.to_i

    until move.between?(1, 9) && !cell_busy?
      puts 'please enter a valid number'
      move = gets.chomp.to_i
    end

    # Mark it and change game_finished returns state if needed
    mark_cell # move

    if game_finished? && a_tie?
      puts 'Is a tie!'
      puts 'Game is finished. Total Score: 1 - 1'
    elsif game_finished? && !a_tie?
      puts 'The winners is player 1'
      puts 'Game is finished. Total Score: 1 - 1'
    elsif game_finished?
      current_player = get_next_player first_player_name, second_player_name, current_player
    end

  end

  play_again = ''
  while play_again.empty?
    puts 'Do you want to play again? (Y/N)'
    play_again = gets.chomp.upcase
    play_again = '' if play_again != 'Y' && play_again != 'N'
  end

  $finished = false

end
