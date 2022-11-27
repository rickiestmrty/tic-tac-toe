require_relative 'lib/player.rb'
require_relative 'lib/board.rb'

class Game

    def initialize
        @board = Board.new
        @players = []
    end

    def main
        puts "Welcome to a new game of TIC TAC TOE"

        askPlayerNames()
        @board.showBoard
        winner = nil

        curr_player = 0
        while true
            putMark(curr_player)
            @board.showBoard

            if checkCombo?(@players[curr_player])
                puts "#{@players[curr_player].name} is the Winner!"  
                break      
            elsif noSpots?()
                puts "Both of you are losers"
                break
            end
            curr_player = 1 - curr_player
        end

        print "Do you want to play again? Type 'Y' if you want to play: "
        answer = gets.chomp

        if answer.upcase == "Y"
            print "\e[2J\e[f"
            return true
        else
            return false
        end
        

    end

    def askPlayerNames
        marks = ["X","O"]
        for mark in marks do
            print "Enter Player #{mark} name: "
            name = gets.chomp
            player = Player.new(name, mark)
            @players.push(player)
        end
        puts
    end

    def checkCombo?(player)
        # Returns true if there is a winning combo in player's taken spots

        winning_combos = [
            [1,2,3],[1,4,7],[1,5,9],[2,5,8],
            [3,6,9],[3,5,7],[4,6,6],[7,8,9]
        ]
        for combo in winning_combos do
            if (combo - player.spots).empty?
                return true
            end
        end
        return false
    end

    def noSpots?
        # Returns true if there is no available space

        @board.board.uniq.size == 1
    end

    def putMark(player_idx)
        loop do
            puts "You turn, #{@players[player_idx].name}"
            print "Please type number of the spot you want to take: "
            spot = gets.chomp
            spot = spot.to_i
            if validMark?(spot)
                @players[player_idx].addSpot(spot)
                @board.updateBoard(spot,@players[player_idx].mark)
                puts ""
                break
            else
                puts "Sorry, please try again."
                puts "\n"
            end
            
        end
        

    end

    def validMark?(spot)
        @board.board.include?(spot.to_i)
    end
end

x = true
while x
    game = Game.new
    x = game.main
end

