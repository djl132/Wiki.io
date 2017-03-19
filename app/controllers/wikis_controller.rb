class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

# will present errors if faile
    if @wiki.save
      flash[:notice] = "Successfully created a wiki."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error: could not create wiki."
      render :new
    end

  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])

    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Successfully updated wiki."
      redirect_to @wiki
    else
      flash[:alert] = "Error: could not update wiki."
      render :edit
    end

  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
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

end
