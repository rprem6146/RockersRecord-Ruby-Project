class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @publishers = Publisher.all
    respond_to do |format|
       format.json
       format.html
    end 
  end

  def show
    respond_with(@publisher)
  end

  def new
    @publisher = Publisher.new
    respond_with(@publisher)
  end

  def edit
  end

  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.save
    respond_with(@publisher)
  end

  def update
    @publisher.update(publisher_params)
    redirect_to(@publisher)
  end

  def destroy
    @publisher.destroy
    respond_with(@publisher)
  end

  private
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    def publisher_params
      params.require(:publisher).permit(:name, :address, :city, :state, :zip, :phone, :url)
    end
end
