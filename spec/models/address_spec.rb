require 'rails_helper'

describe Address, type: :model do
  describe 'validations' do
    describe '#state' do
      it { is_expected.to validate_length_of(:state).is_equal_to(2) }
    end
    
    describe '#zip' do
      it { is_expected.to allow_value('90201').for(:zip) }
      it { is_expected.to allow_value('01047').for(:zip) }
      it { is_expected.to allow_value('90201-4566').for(:zip) }
      it { is_expected.not_to allow_value('notazip!').for(:zip) }
    end
  end
end
