shared_examples 'a robot' do
  it { is_expected.to respond_to :turn_right }
  it { is_expected.to respond_to :turn_left }
  it { is_expected.to respond_to :move_forward }
  it { is_expected.to respond_to :to_s }
end

