require_relative "room"

class Hotel

    def initialize(name, capacities)
        @name = name
        @capacities = capacities
        @rooms = {}

        capacities.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        words = @name.split(" ")
        new_words = words.map {|word| word.capitalize}
        return new_words.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.each do |k, v|
            if @rooms.has_key?(name)
                return true
            else
                return false
            end
        end
    end

    def check_in(person, room_name)

        if self.room_exists?(room_name)
            room = @rooms[room_name]
            added = room.add_occupant(name)
            if added
                print "check in successful"
            else
                print "sorry, room is full"
            end
        else
            print "sorry, room does not exist"
        end     
        
    end
    
    def has_vacancy?
        @rooms.values.any? { |room| !room.full?}
    end
    

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} - #{v.available_space}"
        end
    end

end
