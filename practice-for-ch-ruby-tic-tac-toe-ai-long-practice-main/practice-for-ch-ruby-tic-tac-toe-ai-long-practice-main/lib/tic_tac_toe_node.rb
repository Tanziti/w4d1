require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos =prev_move_pos

  end

  def losing_node?(evaluator)
    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    copy = @board.dup
    list = copy.open_positions
    child_nodes = []
    
    list.each do |move|
      new_board = @board.dup
      new_board[move] = next_mover_mark
      next_mark = new_board.next_mark
      child = TicTacToeNode.new(new_board,next_mark,move)
      child_nodes << child
    end
    child_nodes
    
  end
end