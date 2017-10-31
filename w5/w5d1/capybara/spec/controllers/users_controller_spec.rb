require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) do
    FactoryBot.build(:user, email: 'email', password: 'password')
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'validates the presence of the user\'s email and password'
    it 'should validate that the length of the password is at least 6 }
  end
end
