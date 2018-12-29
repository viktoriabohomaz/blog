# frozen_string_literal: true

require 'rails_helper'

module SpecTestHelper
  def sign_in(user = FactoryBot.create(:user, role: 'admin'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, scope: :user)
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end
