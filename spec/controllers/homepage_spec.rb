require 'rails_helper'
require_relative '../support'

RSpec.describe HomepageController do
  before(:all) { @user = User.create(username: 'arthurborges', full_name: 'Arthur Borges') }

  describe 'GET welcome' do
    it 'redirect to the welcome template' do
      log_in(@user)

      get :index
      expect(response).to redirect_to('/welcome')
    end
  end
end
