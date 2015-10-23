require 'rails_helper'

describe 'POST /api/devices' do

  let(:attributes) do
    {
      device_id: '123',
      state: 'not_okay',
      latitude: 123.09,
      longitude: 123.09,
    }
  end


  context 'happy path' do

    before do
      post '/api/devices', {device: attributes}
    end

    it 'returns 200 status' do
      expect(response.status).to eq 200
    end

    it 'saves the right data' do
      obj = Device.first

      attributes.each do |key, val|
        expect(obj.attributes[key.to_s]).to eq val
      end
    end

  end # eof context


  context 'not so happy path' do

    before do
      post '/api/devices', {device: {state: 'not valid'}}
    end

    it 'returns 422 status' do
      expect(response.status).to eq 422
    end

    it 'returns error messages' do
      expect(response_json['errors']).to be_present
    end

  end # eof context
end
