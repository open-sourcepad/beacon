require 'rails_helper'

describe 'PATCH /api/devices' do

  let(:attributes) do
    {
      device_id: '123',
      latitude: 123.09,
      longitude: 123.09,
    }
  end

  let!(:device) { Device.create(attributes) }
  let(:device2) { Device.create(attributes.merge(device_id: 'dev2')) }
  let(:device3) { Device.create(attributes.merge(device_id: 'dev3')) }


  context 'happy path' do

    before do
      patch "/api/devices/#{device.device_id}", {device: {state: 'okay'}}
    end

    it 'returns 200 status' do
      expect(response.status).to eq 200
    end

    it 'saves the right data' do
      expect(device.reload.state).to eq 'okay'
    end

  end # eof context


  context 'not so happy path' do

    before do
      patch "/api/devices/#{device.device_id}", {device: {device_id: nil}}
    end

    it 'returns 422 status' do
      expect(response.status).to eq 422
    end

    it 'returns error messages' do
      expect(response_json['errors']).to be_present
    end

  end # eof context


  context 'callbacks' do

    it 'updates active aids when became safe' do
      Aid.create(recipient_id: device.device_id, criminal_id: device2.device_id)
      Aid.create(recipient_id: device.device_id, criminal_id: device3.device_id)

      expect(device.aids_received.pluck(:state).uniq).to eq ['active']

      patch "/api/devices/#{device.device_id}", {device: {state: 'safe!!'}}

      expect(device.reload.aids_received.pluck(:state).uniq).to eq ['inactive']
    end

  end # eof context
end
