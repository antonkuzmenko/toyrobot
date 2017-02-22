module Toyrobot
  module CommandHandlers
    class ReportHandler < BaseHandler
      def call
        puts game
      end
    end
  end
end