# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  private
 
  def user_not_authorized
    redirect_to(request.referrer || root_path)
  end
end
