require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    before { @user = FactoryGirl.create(:user) }
    subject { @user }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
    it { should validate_presence_of(:birthday) }
    it { should validate_presence_of(:avatar) }
  end
  describe "associations" do
    it { should has_many(:articles) }
    it { should has_many(:favorites) }
    it { should has_many(:comments) }
  end
end
