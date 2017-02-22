module Toyrobot
  module Engine
    class Vector2D
      attr_reader :x, :y

      def initialize(x, y)
        @x = x.to_i
        @y = y.to_i
      end

      def up(step)
        Vector2D.new(x, y + step)
      end

      def down(step)
        Vector2D.new(x, y - step)
      end

      def left(step)
        Vector2D.new(x - step, y)
      end

      def right(step)
        Vector2D.new(x + step, y)
      end

      def to_s
        "#{x},#{y}"
      end
    end
  end
end
