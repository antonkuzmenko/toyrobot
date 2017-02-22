module Toyrobot
  require 'toyrobot/version'

  require 'toyrobot/instructions_parser'

  require 'toyrobot/game'
  require 'toyrobot/table'
  require 'toyrobot/robot'
  require 'toyrobot/nil_robot'

  require 'toyrobot/engine/vector2d'
  require 'toyrobot/engine/direction'

  require 'toyrobot/commands/report_command'
  require 'toyrobot/commands/move_command'
  require 'toyrobot/commands/right_command'
  require 'toyrobot/commands/left_command'
  require 'toyrobot/commands/place_command'

  require 'toyrobot/command_handlers/base_handler'
  require 'toyrobot/command_handlers/report_handler'
  require 'toyrobot/command_handlers/place_handler'
  require 'toyrobot/command_handlers/move_handler'
  require 'toyrobot/command_handlers/right_handler'
  require 'toyrobot/command_handlers/left_handler'
end
