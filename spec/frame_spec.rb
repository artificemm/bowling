require 'frame'

describe Frame do
  context 'Test for strike' do
    let(:frame) { Frame.new }
    subject { frame.first_roll=(10) }
    it 'should return true' do
      expect(frame.is_strike?).to be(true)
    end
  end
end
