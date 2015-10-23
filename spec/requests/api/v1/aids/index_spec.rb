require 'rails_helper'

describe 'GET /api/aids' do

  before do
    Aid.create(
      criminal_id: 123,
      recipient_id: 123,
    );
  end

  it 'returns 200 status' do
    get '/api/aids'
    expect(response.status).to eq 200
  end

  it 'returns an array' do
    get '/api/aids'
    expect(response_json['data']).to be_an Array
  end

end
