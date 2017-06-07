require 'rails_helper'

RSpec.describe Api::V1::TagsController do
   describe "GET /api/v1/tags" do
    let!(:tag) do
      FactoryGirl.create_list(:tag, 3)
    end
    it "status success" do
      get :index
      expect(response).to be_success
    end
  end
end
