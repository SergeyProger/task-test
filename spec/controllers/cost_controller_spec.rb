require "rails_helper"

RSpec.describe CostController, :type => :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end


    it "loads of the cost into @ansver" do
      cost = 122
      get :index, params: { cost: cost }
      expect(response).to be_success
      expect(response.content_type).to eq "text/plain"
      expect(response.body).to eq 'сто двадцать два рубля'
      expect(response).to have_http_status(200)
    end
  end

end