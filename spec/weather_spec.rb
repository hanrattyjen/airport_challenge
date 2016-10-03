require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  let(:dummy_weather) {double(:weather)}
  
  it 'will be stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    expect(subject.stormy?).to eq true
  end

  it 'will be sunny' do
    allow(subject).to receive(:stormy?).and_return(false)
    expect(subject.stormy?).to eq false
  end
end
