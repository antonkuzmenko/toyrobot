require 'spec_helper'

RSpec.describe Toyrobot::Game do
  let(:game) { described_class.new }

  describe '#handle_command' do
    let(:commands) { Toyrobot::Commands }
    let(:commands) { Toyrobot::Commands }
    let(:move_command) { commands::MoveCommand.new }
    let(:right_command) { commands::RightCommand.new }
    let(:left_command) { commands::LeftCommand.new }

    it 'places the robot' do
      game.handle_command(commands::PlaceCommand.new(0, 0, 'NORTH'))
      expect(game.to_s).to eq '0,0,NORTH'
    end

    it 'moves the robot forward' do
      game.handle_command(commands::PlaceCommand.new(0, 0, 'NORTH'))
      game.handle_command(move_command)
      expect(game.to_s).to eq '0,1,NORTH'
      game.handle_command(move_command)
      expect(game.to_s).to eq '0,2,NORTH'
    end

    it 'turns the robot to the right' do
      game.handle_command(commands::PlaceCommand.new(0, 0, 'NORTH'))
      game.handle_command(right_command)
      expect(game.to_s).to eq '0,0,EAST'
      game.handle_command(right_command)
      expect(game.to_s).to eq '0,0,SOUTH'
      game.handle_command(right_command)
      expect(game.to_s).to eq '0,0,WEST'
      game.handle_command(right_command)
      expect(game.to_s).to eq '0,0,NORTH'
    end

    it 'turns the robot to the left' do
      game.handle_command(commands::PlaceCommand.new(0, 0, 'NORTH'))
      game.handle_command(left_command)
      expect(game.to_s).to eq '0,0,WEST'
      game.handle_command(left_command)
      expect(game.to_s).to eq '0,0,SOUTH'
      game.handle_command(left_command)
      expect(game.to_s).to eq '0,0,EAST'
      game.handle_command(left_command)
      expect(game.to_s).to eq '0,0,NORTH'
    end

    it 'moves the robot forward' do
      game.handle_command(commands::PlaceCommand.new(0, 0, 'NORTH'))
      game.handle_command(move_command)
      game.handle_command(right_command)
      game.handle_command(move_command)
      expect(game.to_s).to eq '1,1,EAST'
    end

    it 'does not fall out of bounds' do
      game.handle_command(commands::PlaceCommand.new(0, 0, 'NORTH'))
      10.times { game.handle_command(move_command) }
      expect(game.to_s).to eq '0,4,NORTH'
      game.handle_command(right_command)
      10.times { game.handle_command(move_command) }
      expect(game.to_s).to eq '4,4,EAST'
    end

    it 'does not accept PLACE with invalid coordinates' do
      game.handle_command(commands::PlaceCommand.new(-1, 0, 'NORTH'))
      expect(game.to_s).to eq 'Unplaced'
      game.handle_command(commands::PlaceCommand.new(0, -1, 'NORTH'))
      expect(game.to_s).to eq 'Unplaced'
      game.handle_command(commands::PlaceCommand.new(5, 0, 'NORTH'))
      expect(game.to_s).to eq 'Unplaced'
      game.handle_command(commands::PlaceCommand.new(0, 5, 'NORTH'))
      expect(game.to_s).to eq 'Unplaced'
    end

    it 'does not accept PLACE with invalid direction' do
      game.handle_command(commands::PlaceCommand.new(0, 0, 'INVALID'))
      expect(game.to_s).to eq 'Unplaced'
    end

    it 'does nothing when robot is not places' do
      game.handle_command(move_command)
      expect(game.to_s).to eq 'Unplaced'
      game.handle_command(right_command)
      expect(game.to_s).to eq 'Unplaced'
      game.handle_command(left_command)
      expect(game.to_s).to eq 'Unplaced'
    end
  end
end
