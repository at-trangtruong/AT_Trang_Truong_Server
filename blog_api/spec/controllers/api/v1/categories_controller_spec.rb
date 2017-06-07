require 'rails_helper'

RSpec.describe Api::V1::CategoriesController do
  describe "GET /api/v1/categories" do
    let!(:category) do
      FactoryGirl.create_list(:category, 3)
    end
    it "status success" do
      get :index
      expect(response).to be_success
    end
  end
end
