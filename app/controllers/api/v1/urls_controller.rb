class Api::V1::UrlsController < Api::V1::BaseController
  before_action :set_url, only: %i[show]

  def create
    @url = Url.new(url_params)
    if @url.long_url.empty?
      render json: {errors: @url.errors}, status: :unprocessable_entity
    else
      @url.token = Url.random_token()
      @url.expired_at = 7.days.from_now
      if @url.save
        render json: @url, serializer: ShortUrlShowSerializer, status: :created
      else
        render json: {errors: @url.errors}, status: :unprocessable_entity
      end 
    end
  end

  def show
    @url.counter += 1   
    if @url.save
      render json: @url, serializer: LongUrlShowSerializer
    else
      render json: {errors: @url.errors}, status: :unprocessable_entity
    end 
  end

  def stats
    render json: @url, serializer: CounterShowSerializer
  end

  private

  def url_params
    params.require(:url).permit( :long_url )
  end

  def set_url
    @url = Url.find(params[:token])
  end

end
