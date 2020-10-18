require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  let!(:address) { create_list(:address, 10) }
  let(:address_id) { address.first.id }

  describe 'GET /addresses' do
    # make HTTP get request before each example
    before { get '/addresses' }

    it 'returns addresses' do
      expect(json).not_to be_empty
      expect(json['addresses'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /addresses/:id
  describe 'GET /addresses/:id' do
    before { get "/addresses/#{address_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['address']['id']).to eq(address_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:address_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Address/)
      end
    end
  end

#   # Test suite for POST /addresses
  describe 'POST /addresses' do
    # valid payload
    let(:valid_attributes) do 
      {
        line1: "Massachusetts Hall",
        city: "Cambridge",
        state: "MA",
        zip: "02138"
      }
    end

    context 'when the request is valid' do
      before { post '/addresses', params: valid_attributes }

      it 'creates a todo' do
        expect(json['address']['line1']).to eq('Massachusetts Hall')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/addresses', params: { zip: '90201' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: .+ can't be blank/)
      end
    end
  end

  # Test suite for PUT /addresses/:id
  describe 'PUT /addresses/:id' do
    let(:valid_attributes) { { state: 'CA' } }

    context 'when the record exists' do
      before { put "/addresses/#{address_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /addresses/:id
  describe 'DELETE /addresses/:id' do
    before { delete "/addresses/#{address_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
