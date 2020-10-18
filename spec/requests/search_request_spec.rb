require 'rails_helper'

RSpec.describe "Searches", type: :request do
  let!(:address) { create_list(:address, 10) }

  describe 'GET /search/addresses' do
    before do
      Address.limit(5).update(state: 'CA')
      get '/search/addresses', params: { q: 'CA' }
    end

    it 'returns the expected results for the query search' do
      expect(json.length).to eq(5)
    end
  end
end
