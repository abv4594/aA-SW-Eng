
class HumanPlayer

    attr_reader :mark

    # def self.check_pos(pos)

    #     allowed = ('0'..'9').to_a + [' ']

    #     test1 = pos.split("").all?{|char| allowed.include?(char)}
    #     test2 = pos.split("").count{|char| char == ' '} == 1

    #     return true if test1 && test2 
    
    #     false

    # end

    def initialize(mark)

        @mark = mark

    end

    def get_position(positions)


        

        while true

            puts   
            puts "Jogador >>>> #{@mark} <<<<: entre com lin e col separadas por espaço, como 0 1 ou 1 2:"
            puts
            input = gets.chomp.split(" ")
            a = input[0].to_i
            b = input[1].to_i
           
            if positions.include?([a,b])

                return [a,b]
                
            else
                puts 
                puts "Escolha inálida, por favor tente novamente."
                puts
            end

        end

        # if HumanPlayer.check_pos(pos) 
        #     pos_arr = pos.split(' ')
        #     return [pos_arr[0].to_i,pos_arr[1].to_i]

        # else
        #     raise "Posição deve ser no formato número, espaço, número"
        # end    

    end

end



