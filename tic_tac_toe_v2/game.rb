require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize(size,*marks)

        @board = Board.new(size)
        @players = []
        marks.each {|mark| @players << HumanPlayer.new(mark)}
        @current_player = @players[0]

    end

    def switch_turn

        @players.rotate!
        @current_player = @players[0]
        
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
