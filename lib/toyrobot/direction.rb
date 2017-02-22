module Toyrobot
  class Direction
    DIRECTIONS = %w(NORTH EAST SOUTH WEST).freeze

    def initialize(value)
      set_value(value.freeze)
    end

    def rotate_right
      new_value = DIRECTIONS[DIRECTIONS.index(@value) + 1]
      Direction.new(new_value || DIRECTIONS.first)
    end

    def rotate_left
      new_value = DIRECTIONS[DIRECTIONS.index(@value) - 1]
      Direction.new(new_value || DIRECTIONS.last)
    end

    def to_s
      @value
    end

    private

    def set_value(value)
      unless DIRECTIONS.include?(value)
        fail ArgumentError, "direction should be one of the following #{DIRECTIONS.join(', ')}"
      end

      @value = value
    end
  end
end
