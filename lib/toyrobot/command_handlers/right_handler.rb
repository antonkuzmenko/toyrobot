module Toyrobot
  module CommandHandlers
    class RightHandler < BaseHandler
      def call
        new_index = game.facing_index + 1
        game.facing_index = (new_index == Game::FACINGS.size) ? 0 : new_index
      end
    end
  end
end
