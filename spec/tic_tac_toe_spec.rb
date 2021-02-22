require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'

p1 = Player.new 'winner', 'X'
p2 = Player.new 'no-winner', 'Y'
empty_tic_tac_toe = TicTacToe.new(p1, p2)
full_tie_tic_tac_toe = TicTacToe.new(p1, p2)
full_tie_tic_tac_toe.board = %w[O X O X O X X O X]
win_comb1 = TicTacToe.new(p1, p2)
win_comb1.board = ['O', 'O', 'O', 4, 5, 6, 7, 8, 9]
win_comb2 = TicTacToe.new(p1, p2)
win_comb2.board = [1, 2, 3, 'O', 'O', 'O', 7, 8, 9]
win_comb3 = TicTacToe.new(p1, p2)
win_comb3.board = [1, 2, 3, 4, 5, 6, 'O', 'O', 'O']
win_comb4 = TicTacToe.new(p1, p2)
win_comb4.board = ['O', 2, 3, 'O', 5, 6, 'O', 8, 9]
win_comb5 = TicTacToe.new(p1, p2)
win_comb5.board = [1, 'O', 3, 4, 'O', 6, 7, 'O', 9]
win_comb6 = TicTacToe.new(p1, p2)
win_comb6.board = [1, 2, 'O', 4, 5, 'O', 7, 8, 'O']
win_comb7 = TicTacToe.new(p1, p2)
win_comb7.board = ['O', 2, 3, 4, 'O', 6, 7, 8, 'O']
win_comb8 = TicTacToe.new(p1, p2)
win_comb8.board = [1, 2, 'O', 4, 'O', 6, 'O', 8, 9]

describe TicTacToe do
  describe '#cell_busy?' do
    it 'returns true if the cell is occupied by a X or Y' do
      expect(empty_tic_tac_toe.cell_busy?(6)).to be false
    end
    it 'returns true if the cell is occupied by a X or Y' do
      expect(full_tie_tic_tac_toe.cell_busy?(5)).to be true
    end
  end
  describe '#game_finished?' do
    empty_tic_tac_toe.won?
    win_comb3.won?
    full_tie_tic_tac_toe.won?
    it 'returns false if there is no winner or a tie' do
      expect(empty_tic_tac_toe.game_finished?).to be false
    end
    it 'returns true if there is a winner' do
      expect(win_comb3.game_finished?).to be true
    end
    it 'returns true if there is a tie' do
      expect(full_tie_tic_tac_toe.game_finished?).to be true
    end
  end
  describe '#disp_board' do
    it 'returns the board in the displayable form' do
      expect(full_tie_tic_tac_toe.disp_board).to eq(%(
           #{full_tie_tic_tac_toe.board[0]} | #{full_tie_tic_tac_toe.board[1]} | #{full_tie_tic_tac_toe.board[2]}
          ---+---+---
           #{full_tie_tic_tac_toe.board[3]} | #{full_tie_tic_tac_toe.board[4]} | #{full_tie_tic_tac_toe.board[5]}
          ---+---+---
           #{full_tie_tic_tac_toe.board[6]} | #{full_tie_tic_tac_toe.board[7]} | #{full_tie_tic_tac_toe.board[8]} ))
    end
  end
  describe '#rotate_current_player' do
    it 'changes the roles of the players' do
      expect(empty_tic_tac_toe.current_player).to eq(p1)
      empty_tic_tac_toe.rotate_current_player
      expect(empty_tic_tac_toe.current_player).to eq(p2)
    end
  end
  describe '#won?' do
    it 'if there is no winner or a tie the game finished must be false and the winner nil' do
      empty_tic_tac_toe.won?
      expect(empty_tic_tac_toe.game_finished).to be false
      expect(empty_tic_tac_toe.winner).to be nil
    end
    it 'if there is a winner combination (first row) return that the current player won and finish the game' do
      win_comb1.won?
      expect(win_comb1.game_finished).to be true
      expect(win_comb1.winner).to eq(p1)
    end
    it 'if there is a winner combination (second row) return that the current player won and finish the game' do
      win_comb2.won?
      expect(win_comb2.game_finished).to be true
      expect(win_comb2.winner).to eq(p1)
    end
    it 'if there is a winner combination (third row) return that the current player won and finish the game' do
      win_comb3.won?
      expect(win_comb3.game_finished).to be true
      expect(win_comb3.winner).to eq(p1)
    end
    it 'if there is a winner combination (first column) return that the current player won and finish the game' do
      win_comb4.won?
      expect(win_comb4.game_finished).to be true
      expect(win_comb4.winner).to eq(p1)
    end
    it 'if there is a winner combination (second column) return that the current player won and finish the game' do
      win_comb5.won?
      expect(win_comb5.game_finished).to be true
      expect(win_comb5.winner).to eq(p1)
    end
    it 'if there is a winner combination (third column) return that the current player won and finish the game' do
      win_comb6.won?
      expect(win_comb6.game_finished).to be true
      expect(win_comb6.winner).to eq(p1)
    end
    it 'if there is a winner combination (left diagonal) return that the current player won and finish the game' do
      win_comb7.won?
      expect(win_comb7.game_finished).to be true
      expect(win_comb7.winner).to eq(p1)
    end
    it 'if there is a winner combination (right diagonal) return that the current player won and finish the game' do
      win_comb8.won?
      expect(win_comb8.game_finished).to be true
      expect(win_comb8.winner).to eq(p1)
    end
    it 'if there is no winner but all cell are marked finish the game, let the winner empty' do
      full_tie_tic_tac_toe.won?
      expect(full_tie_tic_tac_toe.game_finished).to be true
      expect(full_tie_tic_tac_toe.winner).to be nil
    end
  end
  describe 'a_tie?' do
    it 'returns true if all cells are marked and there is no winner' do
      expect(full_tie_tic_tac_toe.a_tie?).to be true
    end
    it 'returns false if there is a winner' do
      expect(win_comb4.a_tie?).to be false
    end
    it 'returns false if there is no winner and are empty cells' do
      expect(empty_tic_tac_toe.a_tie?).to be false
    end
  end
  describe '#reset_game' do
    it 'set the values of the board to the default' do
      full_tie_tic_tac_toe.reset_game
      expect(full_tie_tic_tac_toe.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
  describe '#mark_cell' do
    it 'changes the value of the choosen cell in the array' do
      empty_tic_tac_toe.mark_cell(5)
      expect(empty_tic_tac_toe.board).to eq([1, 2, 3, 4, 'Y', 6, 7, 8, 9])
    end
  end
end

describe Player do
  describe '#increase_score' do
    it 'increse the score by one' do
      current_score = p1.score
      p1.increase_score
      expect(p1.score).to eql(current_score + 1)
    end
  end
end
