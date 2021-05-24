class Board

    attr_reader :size

    def initialize(n)

        @grid = Array.new(n) {Array.new(n,:N)}
        @size = n*n

    end

    def self.print_grid(a_grid)
        a_grid.each do |row|
            puts row.join(" ")
        end
    end

    def [](pos)

        row, col = pos

        @grid[row][col]

        #@grid[pos[0]][pos[1]]

    end

    def []=(pos,value)

        row, col = pos

        @grid[row][col] = value

        #@grid[pos[0]][pos[1]]=value

    end

    def num_ships

        @grid.flatten.count(:S)

    end

    def attack(pos)

        if self[pos]==:S
            self[pos]=:H
            puts "you sunk my battleship!"
            return true
        else
            self[pos]=:X 
            return false
        end
    end


    def place_random_ships

        total_ships = @size*0.25

        n = @grid.length

        while self.num_ships < total_ships
            
            rnd = rand(@size)
            row = rnd/n 
            col = rnd%n 
            self[[row,col]] = :S
                    
        end

    end

    def hidden_ships_grid

        new_arr = []

        @grid.each do |row| 

            new_arr << row.map do |ele| 
                if ele == :S 
                    :N 
                else
                    ele 
                end
            end
        end

        return new_arr


    end

    def cheat

        Board.print_grid(@grid)

    end

    def print

        Board.print_grid(self.hidden_ships_grid)

    end

end
