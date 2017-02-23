module Toyrobot
  module Commands
    class PlaceCommand
      attr_reader :x, :y, :direction

      def initialize(x, y, direction)
        @x = x.to_i
        @y = y.to_i
        @direction = direction
      end
    end
  end
end
