require './player'

class TicTacToe
  attr_reader :player1, :player2, :current_player
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]].freeze
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_finished = false
    @winner = nil
  end

  def cell_busy?(cell)
    cell_value = @board[cell - 1]
    %w[X O].include? cell_value
  end

  def game_finished?
    @game_finished
  end

  def board
    %(
           #{@board[0]} | #{@board[1]} | #{@board[2]}
          ---+---+---
           #{@board[3]} | #{@board[4]} | #{@board[5]}
          ---+---+---
           #{@board[6]} | #{@board[7]} | #{@board[8]} )
  end

  def mark_cell(cell)
    @board[cell - 1] = current_player.symbol
    won?
    # Check if the game is finished
  end

  def rotate_current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def won?
    WIN_COMBINATIONS.each do |win_comb|
      if @board[win_comb[0]] == @board[win_comb[1]] && @board[win_comb[1]] == @board[win_comb[2]]
        @game_finished = true
        @winner = @current_player
        current_player.increase_score
      elsif @board.all? { |cell| !cell.is_a?(Numeric) }
        @game_finished = true
      end
    end
  end

  def a_tie?
    if @game_finished && @board.all? { |cell| !cell.is_a?(Numeric) }
      true
    else
      false
    end
  end

  def reset_game
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner = nil
    @game_finished = false
  end
end
