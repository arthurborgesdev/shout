require 'rails_helper'
require_relative '../support.rb'

RSpec.describe HomepageController do
  before(:all) { @user = User.create(username: "arthurborges", full_name: "Arthur Borges") }

  describe "GET index" do
    it "renders the index template" do
      log_in(@user)

      get :index
      expect(response).to redirect_to('/welcome')
    end
  end
end