'''
1. Create a new game
2. Create a board
3. Ask players their names
4. Player 1 starts game
'''
class Player
    attr_reader :name

    def initialize(name, mark)
        @name = name
        @player_mark = mark
    end
end

class Board
    attr_accessor :board

    def initialize
        @board = [
            ["1", "|", "2", "|", "3"],
            ["-", "-", "-", "-", "-"],
            ["4", "|", "5", "|", "6"],
            ["-", "-", "-", "-", "-"],
            ["7", "|", "8", "|", "9"]
        ]
    end
end

class Game

    def initialize
        @board = Board.new
        @players = []
    end

    def startGame
        marks = ["X","O"]
        marks.each do |mark|
            print "Enter player #{mark} name: "
            name = gets(chomp: true)
            @players.push(Player.new(name, mark))
        end
        printBoard()
        playGame()
    end
    
    def playGame
        winningCondition()
    end

    def winningCondition
        empty_space = false
        for row in @board.board
            row.any? do |val|
                begin
                    val.parseInt()
                    empty_space = true
                    break
                rescue => exception
                    endGame
                end
            end
            if empty_space
                break
            end
        end
    end

    def endGame
        
    end

    def printBoard
        for row in @board.board
            for val in row
                print val
            end
            puts
        end
    end
end

game = Game.new
game.startGame