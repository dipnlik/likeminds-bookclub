require "spec_helper"

describe SessionsController do
  it { get('/login').should route_to('sessions#new') }
  it { post('/login').should route_to('sessions#create') }
  it { get('/logout').should route_to('sessions#destroy') }
end
