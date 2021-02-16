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

second_player_name = ''
while second_player_name.empty?
  puts 'Write the second player\'s name:'
  second_player_name = gets.chomp
end

board = ' 1 | 2 | 3 \n'\
        '---+---+--- \n'\
        ' 4 | 5 | 6 \n'\
        '---+---+--- \n'\
        ' 7 | 8 | 9 \n'

puts board
