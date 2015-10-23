Rails.application.routes.draw do
  api vendor_string: 'beacon', default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :devices
      end
    end
  end
end
