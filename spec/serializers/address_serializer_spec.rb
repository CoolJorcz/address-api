require 'rails_helper'

describe AddressSerializer, type: :serializer do
  let(:address) { create(:address) }
  let(:expected_response) do
    {
      id: address.id,
      line1: address.line1,
      line2: address.line2,
      city: address.city,
      state: address.state,
      zip: address.zip
    }
  end

  subject { described_class.new(address) }

  it 'returns a serialized version of the address instance' do
    expect(subject.as_json).to eq(expected_response)
  end
end
