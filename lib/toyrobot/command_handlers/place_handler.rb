module Toyrobot
  module CommandHandlers
    class PlaceHandler < BaseHandler
      def call(x, y, facing)
        x = x.to_i
        y = y.to_i
        return unless valid_coordinates?(x, y)
        return unless valid_facing?(facing)

        game.x = x
        game.y = y
        game.facing_index = Game::FACINGS.index(facing)
      end

      private

      def valid_coordinates?(x, y)
        x >= 0 && x <= Game::TABLE_LENGTH && y >= 0 && y <= Game::TABLE_WIDTH
      end

      def valid_facing?(facing)
        Game::FACINGS.include?(facing)
      end
    end
  end
end
