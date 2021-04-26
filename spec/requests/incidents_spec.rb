require 'rails_helper'

RSpec.describe Api::IncidentsController, :type => :request do
  describe "POST /api/incident" do
    before(:each) do
      post "/api/user/sign_in?api_user[email]=lpedromendoza333@gmail.com&api_user[password]=1g86c8i"
      token = response
      puts token.body
    end
    it "return a status 200" do
      headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJhZTk1N2U0My03YTI2LTRmNjctOTkxMi1lMDJhNmIzYzQ4ZDUiLCJpZCI6MTUsInN1YiI6IjE1Iiwic2NwIjoiYXBpX3VzZXIiLCJhdWQiOm51bGwsImlhdCI6MTYxOTE5Nzc4MywiZXhwIjoxNjE5MjAxMzgzfQ.CbKyIKc9FT-KnHGvY7OyDRy1Ta6JQN1X-ssoY3Zjj5Q",
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
      post "/api/incident", :params => {"symptomatic": true, "covid_positive": true, "places": [1]}
      expect(response).to have_http_status(200)
    end
  end
end
