module ShortUrlsControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_short_url, only: [:show, :update, :destroy]

  # GET /v1/short_urls
  # GET /v1/short_urls.json
  def index
    @short_urls = _version::ShortUrl.all
  end

  # GET /v1/short_urls/1
  # GET /v1/short_urls/1.json
  def show
  end

  # POST /v1/short_urls
  # POST /v1/short_urls.json
  def create
    @short_url = _version::ShortUrl.new(short_url_params)
    unless @short_url.save
      render json: @short_url.errors, status: :unprocessable_entity
    end
  end

  private

    def set_short_url
      @short_url = _version::ShortUrl.find(params[:id])
    end

    def short_url_params
      params.require(:short_url).permit(:url)
    end

  end
end