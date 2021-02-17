#!/usr/bin/env ruby

require './tic_tac_toe'

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

player1 = Player.new first_player_name, first_player_symbol
player2 = Player.new second_player_name, second_player_symbol

tic_tac_toe = TicTacToe.new player1, player2

puts "#{tic_tac_toe.player1.name} is going to play with #{tic_tac_toe.player1.symbol} symbol"
puts "#{tic_tac_toe.player2.name} is going to play with #{tic_tac_toe.player2.symbol} symbol"

play_again = 'Y'

# Loop 1 - Reset the game
while play_again == 'Y'

  # Loop 2 - Check if the game is finished
  until tic_tac_toe.game_finished?

    puts tic_tac_toe.board

    puts "It's time for #{tic_tac_toe.current_player.name} to make a move.
    Please choose the number of the cell you want to play"
    move = gets.chomp.to_i

    until move.between?(1, 9) && !tic_tac_toe.cell_busy?(move)
      puts 'please enter a valid number'
      move = gets.chomp.to_i
    end

    # Mark it and change game_finished returns state if needed
    tic_tac_toe.mark_cell move

    if tic_tac_toe.game_finished? && tic_tac_toe.a_tie?
      puts 'Is a tie!'
      puts "Game is finished. Total Score  #{player1.name}: #{player1.score}, #{player2.name}: #{player2.score}"
    elsif tic_tac_toe.game_finished? && !tic_tac_toe.a_tie?
      puts tic_tac_toe.board
      puts "The winners is #{tic_tac_toe.current_player.name}"
      puts "Game is finished. Total Score  #{player1.name}: #{player1.score}, #{player2.name}: #{player2.score}"
    elsif !tic_tac_toe.game_finished?
      tic_tac_toe.rotate_current_player
    end

  end

  play_again = ''
  while play_again.empty?
    puts 'Do you want to play again? (Y/N)'
    play_again = gets.chomp.upcase
    play_again = '' if play_again != 'Y' && play_again != 'N'
  end

  tic_tac_toe.reset_game

end
