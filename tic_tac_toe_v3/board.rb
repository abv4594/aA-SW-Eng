class Board

    def initialize(size)
        @grid = Array.new (size){Array.new(size){'_'}}

    end

    #important to define methods [] and []= to allow referring to the grid by
    #self[row,pos] instead of having to write @grid[row][pos].

    def [](pos)
        row, col = pos 
        @grid[row][col]
    end

    def []=(pos, entry)
        row, col = pos
        @grid[row][col] = entry
    end

    def valid?(pos)

        pos.all?{|i| (i>=0)&&(i<@grid.length)}

    end

    def empty?(pos)
        
        self[pos] == '_'

    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos) 
            self[pos]=mark
        else
            raise "Jogada inválida" 
        end
    end

    def print
        @grid.each {|row| puts row.join(' ')}
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

        (0...len).each do |i|
            diag1 << self[[i,i]]
            diag2 << self[[i,len-1-i]]
        end

        diag1.all?(mark) || diag2.all?(mark)

    end

    def win?(mark)

        self.win_diagonal?(mark) || self.win_col?(mark) || self.win_row?(mark)

    end

    def empty_positions?

        #let's use the existing method empty?

        idxs = (0...@grid.length).to_a
        positions = idxs.product(idxs)

        positions.any? {|pos| empty?(pos)}

        # previous: @grid.any? {|row| row.any? {|ele| ele == '_'}}

    end

    def legal_positions

        idxs = (0...@grid.length).to_a
        positions = idxs.product(idxs)

        positions.select {|pos| empty?(pos)}
        
        # legals = []

        # @grid.each_with_index do |arr,row|

        #     arr.each_with_index do |el,col|

        #         legals << [row,col] if el == '_'
        #     end
        # end

        # legals

    end


end