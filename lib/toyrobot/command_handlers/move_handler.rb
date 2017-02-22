module Toyrobot
  module CommandHandlers
    class MoveHandler < BaseHandler
      def call
        case game.facing
        when 'NORTH'
          game.y += Game::STEP_SIZE
        when 'SOUTH'
          game.y -= Game::STEP_SIZE
        when 'EAST'
          game.x += Game::STEP_SIZE
        when 'WEST'
          game.x -= Game::STEP_SIZE
        end

        prevent_falling_out_of_bounds
      end

      private

      def prevent_falling_out_of_bounds
        game.x = 0 if game.x == -1
        game.y = 0 if game.y == -1
        game.x = Game::TABLE_LENGTH if game.x > Game::TABLE_LENGTH
        game.y = Game::TABLE_WIDTH if game.y > Game::TABLE_WIDTH
      end
    end
  end
end
