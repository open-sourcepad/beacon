require 'rails_helper'

describe 'POST /api/aids' do

  let(:attributes) do
    {
      criminal_id: '123',
      recipient_id: '123',
    }
  end


  context 'happy path' do

    before do
      post '/api/aids', {aid: attributes}
    end

    it 'returns 200 status' do
      expect(response.status).to eq 200
    end

    it 'saves the right data' do
      obj = Aid.first

      attributes.each do |key, val|
        expect(obj.attributes[key.to_s]).to eq val
      end
    end

  end # eof context


  context 'not so happy path' do

    before do
      post '/api/aids', {aid: {invalid: :yes}}
    end

    it 'returns 422 status' do
      expect(response.status).to eq 422
    end

    it 'returns error messages' do
      expect(response_json['errors']).to be_present
    end

  end # eof context
end
