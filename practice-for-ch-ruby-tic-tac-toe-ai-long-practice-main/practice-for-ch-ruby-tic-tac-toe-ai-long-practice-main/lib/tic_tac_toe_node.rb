require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos =prev_move_pos

  end

  def losing_node?(evaluator)#current mark, player mark?
    if @board.over? 
      if @board.winner == evaluator ||  @board.winner == nil
        return false
      else  
        return true
      end
    end   #we are forever looping
    if evaluator == self.next_mover_mark 
      child_nodes = self.children #if mark is not a winner?
      return child_nodes.all? {|child| losing_node?(child.next_mover_mark) }
    else
      child_nodes = self.children
      return child_nodes.any? {|child| losing_node?(child.next_mover_mark)}
    end
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