class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def create
    @link = Link.create(params[:link])

    respond_to do |format|
      format.js
    end
  end

  def show
    @link = Link.find_by(short_link: params[:id])

    redirect_to @link.original_link
  end
end