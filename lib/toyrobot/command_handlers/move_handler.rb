module Toyrobot
  module CommandHandlers
    class MoveHandler < BaseHandler
      def call
        game.robot.move_forward(Game::STEP_SIZE)
      end
    end
  end
end
