class V1::ShortUrlsController < ApplicationController
  before_action :set_v1_short_url, only: [:show, :update, :destroy]

  # GET /v1/short_urls
  # GET /v1/short_urls.json
  def index
    @v1_short_urls = V1::ShortUrl.all

    render json: @v1_short_urls
  end

  # GET /v1/short_urls/1
  # GET /v1/short_urls/1.json
  def show
    render json: @v1_short_url
  end

  # POST /v1/short_urls
  # POST /v1/short_urls.json
  def create
    @v1_short_url = V1::ShortUrl.new(v1_short_url_params)

    if @v1_short_url.save
      render json: @v1_short_url, status: :created, location: @v1_short_url
    else
      render json: @v1_short_url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/short_urls/1
  # PATCH/PUT /v1/short_urls/1.json
  def update
    @v1_short_url = V1::ShortUrl.find(params[:id])

    if @v1_short_url.update(v1_short_url_params)
      head :no_content
    else
      render json: @v1_short_url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/short_urls/1
  # DELETE /v1/short_urls/1.json
  def destroy
    @v1_short_url.destroy

    head :no_content
  end

  private

    def set_v1_short_url
      @v1_short_url = V1::ShortUrl.find(params[:id])
    end

    def v1_short_url_params
      params.require(:v1_short_url).permit(:url, :short_url, :visitor_count)
    end
end
