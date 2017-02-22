module Toyrobot
  module CommandHandlers
    class BaseHandler
      attr_reader :game

      def initialize(game)
        @game = game
      end

      def call
        raise NotImplementedError
      end
    end
  end
end