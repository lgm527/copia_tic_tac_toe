require_relative './tictactoe.rb'

describe './tictactoe.rb' do
    describe TicTacToe do

    #   game starts

      describe '#initialize' do
        it 'assigns an instance variable @board to an array with 9 blank spaces " "' do
          game = TicTacToe.new
          expect(game.instance_variable_get(:@board)).to eq([" "," "," "," "," "," "," "," "," "])
        end
      end

    #   play through game

      describe '#play' do
        it 'plays through an entire game' do
            game = TicTacToe.new
            allow($stdout).to receive(:puts)

            expect(game).to receive(:gets).and_return("1")
            expect(game).to receive(:gets).and_return("2")
            expect(game).to receive(:gets).and_return("3")
            expect(game).to receive(:gets).and_return("4")
            expect(game).to receive(:gets).and_return("5")
            expect(game).to receive(:gets).and_return("6")
            expect(game).to receive(:gets).and_return("7")

            expect($stdout).to receive(:puts).with("Congratulations X!")

            game.play
        end
      end

    end
end