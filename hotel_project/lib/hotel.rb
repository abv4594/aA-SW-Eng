require_relative "room"

class Hotel

    def initialize (hotel_name, list_rooms)

        @name = hotel_name

        @rooms = {} 
        
        list_rooms.each {|k,v| @rooms[k] = Room.new(v) }
            
    end

    def name

        @name.split.map(&:capitalize).join(" ")

    end

    def rooms

        @rooms

    end

    def room_exists?(room_name)

        @rooms.has_key?(room_name)

    end

    def check_in (guest, room_name)

        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        
        elsif self.rooms[room_name].add_occupant(guest)
            puts "check in successful"
        else
            puts "sorry, room is full"
        end

    end

    def has_vacancy?

        return false if self.rooms.values.all?(&:full?)
        
            
        true
        
    end
  
    def list_rooms

        self.rooms.each do |room_name, room|

            puts "#{room_name}: #{room.available_space}"
        end
    end




end
