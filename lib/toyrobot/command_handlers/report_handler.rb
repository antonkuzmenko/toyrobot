module Toyrobot
  module CommandHandlers
    class ReportHandler < BaseHandler
      def call
        # TODO: inject dependency. E.g. reporter.report(game)
        puts game
      end
    end
  end
end