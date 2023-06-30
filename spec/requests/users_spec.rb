require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:success)
    end
    it 'check if the user\'s title is present' do
      users = create_list(:user, 3) #create_list é do factory_bot
      get users_path
      users.each do |user|
        expect(response.body).to include(user.title)
      end
    end
  end

  describe "POST /users" do
    context 'when it has valid parameters' do
      it 'creates the user with correct attributes' do
        user_attributes = FactoryBot.attributes_for(:user)
        post users_path, params: { user: user_attributes }
        expect(User.last).to have_attributes(user_attributes)
      end
    end
    context 'when it has no valid parameters' do
      it 'does not create user' do
        expect{
          post users_path, params: { user: {kind: '', name: '', level: ''}}
        }.to_not change(User, :count)
      end
    end
  end

end