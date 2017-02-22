module Toyrobot
  class Robot
    def initialize(vector, direction, table)
      @vector = vector
      @direction = direction
      @table = table
    end

    def turn_left
      @direction = direction.rotate_left
    end

    def turn_right
      @direction = direction.rotate_right
    end

    def move_forward(number_of_steps)
      new_vector = case direction.to_s
                   when 'NORTH'
                     vector.up(number_of_steps)
                   when 'SOUTH'
                     vector.down(number_of_steps)
                   when 'EAST'
                     vector.right(number_of_steps)
                   when 'WEST'
                     vector.left(number_of_steps)
                   else
                     vector
                   end

      @vector = new_vector if table.include?(new_vector)
    end

    def to_s
      "#{vector},#{direction}"
    end

    private

    attr_reader :vector, :direction, :table
  end
end
