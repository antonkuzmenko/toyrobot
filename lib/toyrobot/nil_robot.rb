module Toyrobot
  class NilRobot
    REPORT_MESSAGE = 'Unplaced'.freeze

    def turn_left
      # no op
    end

    def turn_right
      # no op
    end

    def move_forward(_number_of_steps)
      # no op
    end

    def to_s
      REPORT_MESSAGE
    end
  end
end
