class Player
    attr_reader :name, :spots, :mark

    def initialize(name, mark)
        @name = name
        @mark = mark
        @spots = []
    end

    def addSpot(pos)
        @spots.push(pos)
    end
end