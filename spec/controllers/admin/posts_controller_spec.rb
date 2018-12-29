require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
	include SpecTestHelper

	context "when not logged in" do
    it "the request is unauthorized" do
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
  	let! (:post) { FactoryBot.create(:post) }

    before do
      sign_in
    end

    it 'remove user' do
      delete :destroy, params: { id: post.id }
      expect(response).to have_http_status(:ok)
    end
  end

    describe 'GET #new' do
      it 'new user' do
        sign_in
        get :new
        expect(response).to have_http_status(:ok)
      end
  end
end