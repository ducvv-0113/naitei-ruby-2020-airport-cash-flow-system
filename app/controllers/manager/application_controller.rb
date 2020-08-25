class Manager::ApplicationController < ApplicationController
  include SessionsHelper

  before_action :require_manager

  def home; end

  private

  def require_manager
    return if current_user.is_manager?

    redirect_to root_path, flash: {error: t(".required_manager")}
  end
end
