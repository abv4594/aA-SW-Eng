class ComputerPlayer

    attr_reader :mark

    def initialize(mark)

        @mark = mark

    end

    def get_position(positions)

        idx_rand = rand(0..(positions.length - 1))

        pos = positions[idx_rand]

        puts
        puts "#{self.mark} (Computer) chosen position is #{pos}"
        puts

        pos

    end


end
