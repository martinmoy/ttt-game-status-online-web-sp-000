# Helper Method
def position_taken?(board, index)
  #!(board[index].nil? || board[index] == " " || board[index] == "")
  (board[index] == "X" || board[index]== "O")
end

WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
]


def won?(board)
  WIN_COMBINATIONS.detect do |combinations|
    position_1 = combinations[0]
    position_2 = combinations[1]
    position_3 = combinations[2]
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3]  == "X"
      return combinations
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return combinations
    end
  end
end

def full?(board)
  board.all? {|positions|
    positions == "X" || positions == "O"
  }
end

def draw?(board)
 !won?(board) && full?(board) #? true:false
end

def over?(board)
  won?(board) || draw?(board) #? true:false
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  else
    return nil
  end


end
