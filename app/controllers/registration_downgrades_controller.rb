class RegistrationDowngradesController < ApplicationController
before_action :authorize_downgrade
  def create
    current_user.update_attributes(role: "standard")
    current_user.wikis.update_all(private: false)
    flash[:notice] = "You have downgraded to standard."
    redirect_to wikis_path
  end


  private

  def authorize_downgrade
      unless (current_user.premium? || current_user.admin?)
        flash[:alert] = "Must be premium to downgrade! Would you like to upgrade?"
        redirect_to edit_user_registration_path
      end
  end
end
