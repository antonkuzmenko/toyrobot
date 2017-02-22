module Toyrobot
  module Commands
    class PlaceCommand
      attr_accessor :x, :y, :direction

      def initialize(x, y, direction)
        self.x = x.to_i
        self.y = y.to_i
        self.direction = direction
      end
    end
  end
end
