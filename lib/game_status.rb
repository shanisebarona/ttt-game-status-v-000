require "pry"


# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #middle column
  [2,5,8], #bottom column
  [0,4,8], #first diagonal
  [6,4,2]  #second diagonal
]

def won?(board)
  WIN_COMBINATIONS.find do |combo|
   if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
     combo
   end
 end
end

def full?(board)
  board.all? { |spot| spot == "X" || spot == "O" }
end

def draw?(board)
#check to see if the board is full, anyone won, or if there is a draw
  !won?(board) && full?(board)
end

def over?(board)
  #the game is over if: draw, full or someone won
  won?(board) && full?(board) || draw?(board)
end

def winner(board)
  #return the winner, X or O
   if win_index = won?(board)
   board[win_index.first]
 end
end
