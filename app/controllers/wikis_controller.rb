class WikisController < ApplicationController
  #  an after_find and after_initialize callback is triggered
  #  for each object that is found and instantiated by a finder,
  # with after_initialize being triggered after new objects are instantiated as well.

  def index

    if (current_user.admin? || current_user.premium?)
      @wikis = Wiki.all
    else
      @wikis = Wiki.where(private: false)
    end
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    authorize_private_wiki if @wiki.private

# will present errors if faile
    if @wiki.save
      flash[:notice] = "Successfully created a wiki."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error: could not create wiki."
      render :new
    #  test if you can redirect
    end

  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize_private_wiki if @wiki.private

  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize_private_wiki if @wiki.private

  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.assign_attributes(wiki_params)

    authorize_private_wiki if @wiki.private

    if @wiki.save
      flash[:notice] = "Successfully updated wiki."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error: could not update wiki."
      redirect_to edit_wiki_path
    end

  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "Successfully deleted wiki."
      redirect_to wikis_path
    else
      flash[:alert] = "Error: could not delete wiki."
      redirect_to wikis_path
    end
  end


  private

  # used to mass assign params(from forms) and create/update wiki
  def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
  end

  def authorize_private_wiki
    unless (current_user.admin? || current_user.premium?)
      flash[:alert] = "You must be a premium user to create a private wiki."
      redirect_to :back
    end
  end


end
