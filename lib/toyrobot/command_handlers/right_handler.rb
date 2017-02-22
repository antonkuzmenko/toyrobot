module Toyrobot
  module CommandHandlers
    class RightHandler < BaseHandler
      def call
        game.robot.turn_right
      end
    end
  end
end
