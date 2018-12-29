# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  include SpecTestHelper

  context 'when not logged in' do
    it 'the request is unauthorized' do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #index' do
    before do
      sign_in
    end

    it 'show index login user' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE #destroy' do
    let! (:user_1) { FactoryBot.create(:user) }

    before do
      sign_in
    end

    it 'remove user' do
      delete :destroy, params: { id: user_1.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
