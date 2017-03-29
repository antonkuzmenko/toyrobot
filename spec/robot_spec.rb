require 'spec_helper'

describe Toyrobot::Robot do
  let(:vector) { Toyrobot::Engine::Vector2D.new(1, 2) }
  let(:robot) do
    described_class.new(vector, Toyrobot::Engine::Direction.new('NORTH'), Toyrobot::Table.new(5, 5))
  end

  subject { robot }

  it_behaves_like 'a robot'
end

