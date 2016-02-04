require 'rails_helper'

RSpec.describe MainController, type: :controller do

  describe "should GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "should GET #about" do
  	it "returns http success" do
  	  get :about
  	  expect(response).to have_http_status(:success)
  	end
  end
end
