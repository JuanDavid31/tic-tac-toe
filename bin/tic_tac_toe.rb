require './player'

class TicTacToe
  attr_reader :player1, :player2, :current_player
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_finished = false
  end

  def cell_busy?(cell)
    cell_value = board[cell - 1]
    return cell_value == 'X' || cell_value == 'O'
  end

  def a_tie?
    # TODO
  end

  def game_finished?
    @game_finished
  end

  def get_board
    %(
       #{board[0]} | #{board[1]} | #{board[2]}
      ---+---+---
       #{board[3]} | #{board[4]} | #{board[5]}
      ---+---+---
       #{board[6]} | #{board[7]} | #{board[8]} )
  end

  def mark_cell cell
    board[cell + 1] = current_player.symbol
    # Check if the game is finished
  end

  def rotate_current_player(first_player, second_player, current_player)
    current_player == first_player ? second_player : first_player
  end

end
