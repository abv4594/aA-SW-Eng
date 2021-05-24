class Board

    def initialize
        @grid = Array.new (3){Array.new(3){'_'}}
    end

    def valid?(pos)

        a,b = pos[0], pos[1]
        return false if a<0 || a>2 || b<0 || b >2
        true

    end

    def empty?(pos)

        a,b = pos[0], pos[1]

        @grid[a][b] == '_'

    end

    def place_mark(pos, mark)
        a,b = pos[0], pos[1]
        if valid?(pos) && empty?(pos) 
            @grid[a][b]=mark
        else
            raise "Jogada inválida" 
        end
    end

    def print
        @grid.each {|row| p row}
    end

    def win_row?(mark)

        @grid.any? { |row| row.all?{|ele| ele == mark}}

    end

    def win_col?(mark)

        @grid.transpose.any? { |row| row.all?{|ele| ele == mark}}

    end

    def win_diagonal?(mark)

        diag1 = []
        diag2 = []
        len = @grid.length

        @grid.each_with_index do |row,idx| 
            diag1 << @grid[idx][idx]
            diag2 << @grid[idx][len-1-idx]
        end

        diag1.all?{|ele| ele == mark} || diag2.all?{|ele| ele == mark}

    end

    def win?(mark)

        self.win_diagonal?(mark) || self.win_col?(mark) || self.win_row?(mark)

    end

    def empty_positions?

        @grid.any? {|row| row.any? {|ele| ele == '_'}}

    end


end