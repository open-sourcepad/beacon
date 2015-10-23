Rails.application.routes.draw do
  api vendor_string: 'beacon', default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :devices, only: %i(index create)
        resources :aids, only: %i(index create)
      end
    end
  end
end
