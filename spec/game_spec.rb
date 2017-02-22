require 'spec_helper'

RSpec.describe Toyrobot::Game do
  let(:game) { described_class.new }

  describe '#handle_command' do
    it 'places the robot' do
      game.handle_command('PLACE 0,0,NORTH')
      expect(game.report).to eq '0,0,NORTH'
    end

    it 'moves the robot forward' do
      game.handle_command('PLACE 0,0,NORTH')
      game.handle_command('MOVE')
      expect(game.report).to eq '0,1,NORTH'
      game.handle_command('MOVE')
      expect(game.report).to eq '0,2,NORTH'
    end

    it 'rotates the robot to the right' do
      game.handle_command('PLACE 0,0,NORTH')
      game.handle_command('RIGHT')
      expect(game.report).to eq '0,0,EAST'
      game.handle_command('RIGHT')
      expect(game.report).to eq '0,0,SOUTH'
      game.handle_command('RIGHT')
      expect(game.report).to eq '0,0,WEST'
      game.handle_command('RIGHT')
      expect(game.report).to eq '0,0,NORTH'
    end

    it 'rotates the robot to the left' do
      game.handle_command('PLACE 0,0,NORTH')
      game.handle_command('LEFT')
      expect(game.report).to eq '0,0,WEST'
      game.handle_command('LEFT')
      expect(game.report).to eq '0,0,SOUTH'
      game.handle_command('LEFT')
      expect(game.report).to eq '0,0,EAST'
      game.handle_command('LEFT')
      expect(game.report).to eq '0,0,NORTH'
    end

    it 'moves the robot forward' do
      game.handle_command('PLACE 0,0,NORTH')
      game.handle_command('MOVE')
      game.handle_command('RIGHT')
      game.handle_command('MOVE')
      expect(game.report).to eq '1,1,EAST'
    end

    it 'does not fall out of bounds' do
      game.handle_command('PLACE 0,0,NORTH')
      10.times { game.handle_command('MOVE') }
      expect(game.report).to eq '0,4,NORTH'
      game.handle_command('RIGHT')
      10.times { game.handle_command('MOVE') }
      expect(game.report).to eq '4,4,EAST'
    end

    it 'does not accept PLACE with invalid coordinates' do
      game.handle_command('PLACE -1,0,NORTH')
      expect(game.report).to eq 'Unplaced'
      game.handle_command('PLACE 0,-1,NORTH')
      expect(game.report).to eq 'Unplaced'
      game.handle_command('PLACE 5,0,NORTH')
      expect(game.report).to eq 'Unplaced'
      game.handle_command('PLACE 0,5,NORTH')
      expect(game.report).to eq 'Unplaced'
    end

    it 'does not accept PLACE with invalid facing' do
      game.handle_command('PLACE 0,0,INVALID')
      expect(game.report).to eq 'Unplaced'
    end
  end
end
