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

first_player_symbol == "X" ? second_player_symbol = "O" : second_player_symbol = "X"

second_player_name = ''
while second_player_name.empty? || second_player_name == first_player_name
  puts 'Write the second player\'s name: (It must be different than the first player\'s name)'
  second_player_name = gets.chomp
end

puts "#{first_player_name} is going to play with #{first_player_symbol} symbol"
puts "#{second_player_name} is going to play with #{second_player_symbol} symbol"

board = %(
         1 | 2 | 3
        ---+---+---
         4 | 5 | 6
        ---+---+---
         7 | 8 | 9 )

puts board

puts "It\'s time for #{first_player_name} to make a move. Please choose the number of the cell you want to play"
move = gets.chomp.to_i

until move.between?(1, 9)
  puts "please enter a valid number"
  move = gets.chomp.to_i
end

puts move
p move
