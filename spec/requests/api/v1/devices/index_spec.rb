require 'rails_helper'

describe 'GET /api/devices' do

  before do
    Device.create(
      device_id: 123,
      latitude: 123.09,
      longitude: 123.09,
    );
  end

  it 'returns 200 status' do
    get '/api/devices'
    expect(response.status).to eq 200
  end

  it 'returns an array' do
    get '/api/devices'
    expect(response_json['data']).to be_an Array
  end

end
