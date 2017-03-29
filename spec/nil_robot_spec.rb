require 'spec_helper'

describe Toyrobot::NilRobot do
  let(:robot) { described_class.new }

  subject { robot }

  it_behaves_like 'a robot'
end

