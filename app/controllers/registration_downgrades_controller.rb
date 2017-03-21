class RegistrationDowngradesController < ApplicationController

  def create
    current_user.update_attributes(role: "standard")
    flash[:notice] = "You have downgraded to standard"
    redirect_to wikis_path
  end
end
