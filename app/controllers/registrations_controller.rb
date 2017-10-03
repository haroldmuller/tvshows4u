class RegistrationsController < Devise::RegistrationsController

  skip_before_filter :require_no_authentication, only: [:new, :create]

  def new
    super
  end

  def create
    super
  end

end
