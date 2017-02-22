module Toyrobot
  module CommandHandlers
    class LeftHandler < BaseHandler
      def call
        new_index = game.facing_index - 1
        game.facing_index = (new_index == -1) ? Game::FACINGS.size - 1 : new_index
      end
    end
  end
end