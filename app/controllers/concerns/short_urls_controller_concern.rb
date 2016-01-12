module ShortUrlsControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_short_url, only: [:show, :update, :destroy]

  # GET /v1/short_urls
  # GET /v1/short_urls.json
  def index
    @short_urls = V1::ShortUrl.all

    render json: @short_urls
  end

  # GET /v1/short_urls/1
  # GET /v1/short_urls/1.json
  def show
    render json: @short_url
  end

  # POST /v1/short_urls
  # POST /v1/short_urls.json
  def create
    @short_url = V1::ShortUrl.new(short_url_params)

    if @short_url.save
      render json: @short_url, status: :created, location: @short_url
    else
      render json: @short_url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/short_urls/1
  # PATCH/PUT /v1/short_urls/1.json
  def update
    @short_url = V1::ShortUrl.find(params[:id])

    if @short_url.update(short_url_params)
      head :no_content
    else
      render json: @short_url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/short_urls/1
  # DELETE /v1/short_urls/1.json
  def destroy
    @short_url.destroy

    head :no_content
  end

  private

    def set_v1_short_url
      @short_url = V1::ShortUrl.find(params[:id])
    end

    def short_url_params
      params.require(:short_url).permit(:url, :short_url)
    end

  end
end