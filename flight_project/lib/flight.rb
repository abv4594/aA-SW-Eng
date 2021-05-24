class Flight

    attr_reader :passengers

    def initialize(flight, capacity)

        @flight_number = flight
        @capacity = capacity
        @passengers = []

    end

    def full?

        self.passengers.length == @capacity

    end

    def board_passenger(passenger)

        if passenger.has_flight?(@flight_number)
            self.passengers << passenger if !self.full?
        end

    end

    def list_passengers

        listpass = [] 
        self.passengers.each { |passenger| listpass << passenger.name}
        listpass

    end

    def [](num)

        @passengers[num]

    end

    def <<(passenger)

        self.board_passenger(passenger)

    end

end
