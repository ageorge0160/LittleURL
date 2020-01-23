class ShortenUrlsController < ApplicationController
  before_action :set_shorten_url, only: [:show, :edit, :update, :destroy]

  # GET /shorten_urls
  # GET /shorten_urls.json
  def index
    @shorten_urls = ShortenUrl.all
  end

  # GET /shorten_urls/1
  # GET /shorten_urls/1.json
  def show
    @shorten_url = ShortenUrl.find_by(little_url: params[:little_url])
  end

  # GET /shorten_urls/new
  def new
    @shorten_url = ShortenUrl.new
  end

  # GET /shorten_urls/1/edit
  def edit
  end

  # POST /shorten_urls
  # POST /shorten_urls.json
  def create
    @shorten_url = ShortenUrl.new(shorten_url_params)
    if @shorten_url.little_url != nil
      @shorten_url.little_url
    else
      @shorten_url.little_url = @shorten_url.generate_short_url()
    end

    respond_to do |format|
      if @shorten_url.save
        format.html { redirect_to @shorten_url, notice: 'Shorten url was successfully created.' }
        format.json { render :show, status: :created, location: @shorten_url }
      else
        format.html { render :new }
        format.json { render json: @shorten_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shorten_urls/1
  # PATCH/PUT /shorten_urls/1.json
  def update
    respond_to do |format|
      if @shorten_url.update(shorten_url_params)
        format.html { redirect_to @shorten_url, notice: 'Shorten url was successfully updated.' }
        format.json { render :show, status: :ok, location: @shorten_url }
      else
        format.html { render :edit }
        format.json { render json: @shorten_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorten_urls/1
  # DELETE /shorten_urls/1.json
  def destroy
    @shorten_url.destroy
    respond_to do |format|
      format.html { redirect_to shorten_urls_url, notice: 'Shorten url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shorten_url
      @shorten_url = ShortenUrl.find_by(params[:little_url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shorten_url_params
      params.require(:shorten_url).permit(:original_url, :little_url)
    end
end
