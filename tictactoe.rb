class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
        ]
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    # move/user input logic

    def input_to_index(user_input)
        user_input.to_i - 1
    end
    
    def move(index, char = "X")
        @board[index] = "#{char}"
        puts @board
    end
    
    def position_taken?(index)
        if @board[index] == " " || @board[index] == "" || @board[index] == nil
            return false
            elsif @board[index] == "X" || @board[index] == "O"
            return true
        end
    end
    
    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
    end

    def turn_count
        turns = 0
        @board.each do |space|
            if space != " "
                turns += 1
            end
        end
        return turns
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Player #{current_player}, please enter 1-9:"
        a_move = gets.strip
        index = input_to_index(a_move)
        if valid_move?(index)
            char = current_player
            move(index, char)
            display_board
            else
            turn
        end
    end

    # determine game status after every turn

    def won?
        WIN_COMBINATIONS.detect do | winning_combo |
            
            position_1 = winning_combo[0]
            position_2 = winning_combo[1]
            position_3 = winning_combo[2]
            
            @board[position_1] == @board[position_2] && @board[position_2] == @board[position_3] && @board[position_3] != " "
            
        end
    end
    
    def full?
        @board.none? { |i| i == " " }
    end
    
    def draw?
        full? && !won?
    end
    
    def over?
        won? || draw?
    end
    
    def winner
        win_combo = won?
        if win_combo != nil
            winning_location = win_combo[0]
            @board[winning_location]
        end
    end

end