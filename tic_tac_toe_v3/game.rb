require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'

class Game

    def initialize(size,ahash)

        @board = Board.new(size)
        @players = []
        
        ahash.each do |k,v|

            if ahash[k]
                @players << ComputerPlayer.new(k)
            else
                @players << HumanPlayer.new(k)
            end

        end


        @current_player = @players[0]

    end

    def switch_turn

        @players.rotate!
        @current_player = @players[0]
        
    end

    def play

        while @board.empty_positions?
            @board.print
            legals = @board.legal_positions
            pos = @current_player.get_position(legals)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory!"
                puts "#{@current_player.mark} won!"
                return
            else
                self.switch_turn
            end     
        end

        puts "Draw!!!"


    end


end
