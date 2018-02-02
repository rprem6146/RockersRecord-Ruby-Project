class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @artists = Artist.all
    respond_with(@artists)
  end

  def show
  respond_to do |format|
    format.js do 
      if @artist.image_url
        render js: "window.location = '#{artist_path(@artist)}'"
      else
        url = URI.parse('https://randomuser.me/api/')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port, use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE) {|http|
                 http.request(req)
              }.body
        json = JSON.parse(res)
        image_url = json["results"].first["picture"]["large"]
        @artist.update(image_url: image_url)
        render js: "window.location = '#{artist_path(@artist)}'"
      end
    end
    format.html
   end
  end

  def new
    @artist = Artist.new
    respond_with(@artist)
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    respond_with(@artist)
  end

  def update
    @artist.update(artist_params)
    respond_with(@artist)
  end

  def destroy
    @artist.destroy
    respond_with(@artist)
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end
end
