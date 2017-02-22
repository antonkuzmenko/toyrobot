module Toyrobot
  module CommandHandlers
    class MoveHandler < BaseHandler
      def call
        game.robot.move_forward(Game::STEP_SIZE)
        # prevent_falling_out_of_bounds
      end

      private

      def prevent_falling_out_of_bounds
        game.x = 0 if game.x == -1
        game.y = 0 if game.y == -1
        game.x = game.table_length if game.x > game.table_length
        game.y = game.table_width if game.y > game.table_width
      end
    end
  end
end
