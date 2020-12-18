#!/usr/bin/env ruby

require_relative './tictactoe.rb'

puts "Welcome to Copia Tic Tac Toe!"

game = TicTacToe.new
game.display_board

game.play