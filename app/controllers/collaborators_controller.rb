class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    # from the form
    @user = User.find_by(email: params[:email])

    @collaborator = @wiki.collaborators.new(user: @user)

    if @collaborator.save
      flash[:notice] = "Successfully invited #{@user.email}."
    else
      flash[:alert] = "Failed to invite user."
    end

    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Kicked out #{@collaborator.user.email}."
    else
      flash[:alert] = "Failed to kick out collab."
    end

    redirect_to edit_wiki_path(@collaborator.wiki)
  end
end
