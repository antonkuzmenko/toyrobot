require 'spec_helper'

describe Toyrobot::CommandsParser do
  describe '#parse' do
    let(:parser) { described_class.new }
    let(:commands) { '' }

    subject { parser.parse(commands) }

    context 'when parsing an empty string' do
      it { is_expected.to eq [] }
    end

    context 'when parsing an command without arguments' do
      let(:commands) { 'MOVE' }

      it { is_expected.to include an_instance_of Toyrobot::Commands::MoveCommand }

      it 'has 1 command' do
        expect(subject.size).to eq 1
      end
    end

    context 'when parsing multiple commands' do
      let(:commands) { "MOVE\nRIGHT\nLEFT" }

      it { is_expected.to include an_instance_of Toyrobot::Commands::MoveCommand }
      it { is_expected.to include an_instance_of Toyrobot::Commands::LeftCommand }
      it { is_expected.to include an_instance_of Toyrobot::Commands::RightCommand }

      it 'has 3 commands' do
        expect(subject.size).to eq 3
      end
    end

    context 'when parsing an command with arguments' do
      let(:commands) { "PLACE 1,2,EAST\nRIGHT\nMOVE" }

      it { is_expected.to include an_instance_of Toyrobot::Commands::PlaceCommand }
      it { is_expected.to include an_instance_of Toyrobot::Commands::RightCommand }
      it { is_expected.to include an_instance_of Toyrobot::Commands::MoveCommand }

      it 'has 3 arguments' do
        expect(subject.first.x).to eq 1
        expect(subject.first.y).to eq 2
        expect(subject.first.direction).to eq 'EAST'
      end
    end

    context 'when parsing invalid data' do
      let(:commands) { "Asd )()( ASD \n12102394098~,." }

      it { is_expected.to eq [] }
    end

    context 'when arguments are missing' do
      let(:commands) { 'PLACE' }

      it { is_expected.to eq [] }
    end

    context 'when some arguments are missing' do
      let(:commands) { 'PLACE 1,2' }

      it { is_expected.to eq [] }
    end
  end
end
