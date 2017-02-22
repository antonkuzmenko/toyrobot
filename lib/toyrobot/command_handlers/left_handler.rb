module Toyrobot
  module CommandHandlers
    class LeftHandler < BaseHandler
      def call
        game.robot.turn_left
      end
    end
  end
end