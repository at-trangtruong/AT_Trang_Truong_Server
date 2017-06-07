require 'rails_helper'

describe Api::V1::SessionsController do
  describe "POST /api/v1/sessions" do
    describe "Login successfully" do
      let!(:user) do
        FactoryGirl.build :user
      end
      it "Login failed" do
        # request.headers["HTTP_ACCESS_TOKEN"] = get_access_token user[:email]
        # create_record user.slice("email", "password")
        post :create, params: user.slice("email", "password")
        expect(response).to have_http_status(401)
      end
    end
  end
end
