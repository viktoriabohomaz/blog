# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:post) { FactoryBot.create(:post)}

  describe 'GET #index' do

    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: post.slug }
      expect(response).to be_successful
    end
  end
end
