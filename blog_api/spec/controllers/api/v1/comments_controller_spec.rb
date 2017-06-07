require 'rails_helper'

RSpec.describe Api::V1::CommentsController do
   describe "GET /api/v1/comments" do
    let!(:comment) do
      FactoryGirl.create_list(:comment, 3)
    end
    it "status success" do
      get :index
      expect(response).to be_success
    end
  end
end
