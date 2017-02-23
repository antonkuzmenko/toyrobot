module Toyrobot
  module CommandHandlers
    class BaseHandler
      def initialize(game)
        @game = game
      end

      def call
        raise NotImplementedError
      end

      private

      attr_reader :game
    end
  end
end