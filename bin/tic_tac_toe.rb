require './player'

class TicTacToe
  attr_reader :player1, :player2, :current_player
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
    return cell_value == 'X' || cell_value == 'O'
  end

  def game_finished?
    @game_finished
  end

  def get_board
    board = %(
       #{@board[0]} | #{@board[1]} | #{@board[2]}
      ---+---+---
       #{@board[3]} | #{@board[4]} | #{@board[5]}
      ---+---+---
       #{@board[6]} | #{@board[7]} | #{@board[8]} )
    puts board
  end

  def mark_cell cell
    @board[cell - 1] = current_player.symbol
    won?
    # Check if the game is finished
  end

  def rotate_current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def won?
    if @board[0] == @board[1] && @board[1] == @board[2]
      @game_finished = true
      @winner = @current_player
      current_player.increase_score
    elsif @board[3] == @board[4] && @board[4] == @board[5]
      @game_finished = true
      @winner = @current_player
      current_player.increase_score
    elsif @board[6] == @board[7] && @board[7] == @board[8]
      @game_finished = true
      @winner = @current_player
      current_player.increase_score
    elsif @board[0] == @board[3] && @board[3] == @board[6]
      @game_finished = true
      @winner = @current_player
      current_player.increase_score
    elsif @board[1] == @board[4] && @board[4] == @board[7]
      @game_finished = true
      @winner = @current_player
      current_player.increase_score
    elsif @board[2] == @board[5] && @board[5] == @board[8]
      @game_finished = true
      @winner = @current_player
      current_player.increase_score
    elsif @board[0] == @board[4] && @board[4] == @board[8]
      @game_finished = true
      @winner = @current_player
      current_player.increase_score
    elsif @board[6] == @board[4] && @board[4] == @board[2]
      @game_finished = true
      @winner = @current_player
      current_player.increase_score
    elsif @board.all? { |cell| !cell.is_a?(Numeric)  }
      @game_finished = true
    end
  end

  def a_tie?
    if @game_finished && @board.all? { |cell| !cell.is_a?(Numeric)  }
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
