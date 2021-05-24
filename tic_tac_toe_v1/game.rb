require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize(p1_mark, p2_mark)

        @board = Board.new
        @player_1 = HumanPlayer.new(p1_mark)
        @player_2 = HumanPlayer.new(p2_mark)
        @current_player = @player_1

    end

    def switch_turn

        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play

        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
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
