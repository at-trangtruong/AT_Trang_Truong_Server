require 'rails_helper'

describe Api::V1::UsersController do


  describe "GET /api/v1/users/:id" do
    let!(:user) { FactoryGirl.create :user }
    it "Status 200" do
      get :show, params: user.slice("id")
      expect(response).to be_success
    end

    it "information user" do
      user.id = 10
      get :show, params: user.slice("id")
      response_json= JSON.parse(response.body)
      expect(response_json["messages"]).to eql "Not found"
    end
  end

  describe "POST /api/v1/users" do
    describe "when create new user is successfully" do
      let!(:user) { FactoryGirl.attributes_for :user }
      it "Status 200" do
        post :create, params: user
        expect(response).to be_success
      end
    end
  end

  describe "PUT /api/v1/users/:id" do
    describe "check login failer" do
      let!(:user_params) { FactoryGirl.attributes_for :user }
      let!(:user) { FactoryGirl.create :user }
      it "Status 403" do
        binding.pry
        put :update, params: user.slice("id")
        expect(response).to have_http_status(403)
      end
    end
  end
end
