require 'rails_helper'

describe 'GET /api/devices' do

  before do
    Device.create(
      device_id: 123,
      latitude: 123.09,
      longitude: 123.09,
    );

    Device.create(
      device_id: 321,
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

  it 'returns an array' do
    first_d = Device.first
    last_d = Device.last

    aid = Aid.create(criminal_id: first_d.device_id, recipient_id: last_d.device_id)

    get '/api/devices'

    helper = response_json['data'].find{ |d| d['device_id'] === aid.criminal_id}
    helpee = response_json['data'].find{ |d| d['device_id'] === aid.recipient_id}

    expect(helper['helping']).to include aid.recipient_id
    expect(helpee['helped_by']).to include aid.criminal_id
  end

end
