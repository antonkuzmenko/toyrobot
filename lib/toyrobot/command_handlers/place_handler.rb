module Toyrobot
  module CommandHandlers
    class PlaceHandler < BaseHandler
      def call(command)
        vector = Engine::Vector2D.new(command.x, command.y)
        return unless game.table.includes?(vector)
        return unless valid_direction?(command.direction)

        game.robot = Robot.new(vector, Engine::Direction.new(command.direction), game.table)
      end

      private

      def valid_direction?(direction)
        Engine::Direction::DIRECTIONS.include?(direction)
      end
    end
  end
end
