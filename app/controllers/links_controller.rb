class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def create
    @link = Link.create(link_params)

    respond_to do |format|
      format.js do
        unless @link.valid?
          render nothing: true
        end
      end
    end
  end

  def edit
    @link = Link.find_by(id: params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @link = Link.find_by(id: params[:id])
    @link.update(link_params)

    respond_to do |format|
      format.js
    end
  end

  def link_params
    params.require(:link).permit(:original_link)
  end
end