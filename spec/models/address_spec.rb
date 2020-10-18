require 'rails_helper'

describe Address, type: :model do
  describe 'validations' do
    it  { is_expected.to validate_length_of(:state).is_equal_to(2) }
    
    describe '#zip' do
      it { is_expected.to allow_value('90201').for(:zip) }
      it { is_expected.to allow_value('01047').for(:zip) }
      it { is_expected.not_to allow_value('notazip!').for(:zip) }
    end
  end
end
