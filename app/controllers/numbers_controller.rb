class NumbersController < ApplicationController
  def index
    @page_size = page_size
    @max = find_max
    data = (1..@max).to_a.map { |n| fizz_or_buzz(n) }
    @values = Kaminari.paginate_array(data).page(params[:page]).per(@page_size)

    respond_to do |format|
      format.html
      format.json { render json: @values }
    end
  end

  def favorite
    number = params[:number]
    current_user.favorites << number unless current_user.favorites.include?(number)
    current_user.save

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: current_user, status: :created }
    end
  end

  private

    def find_max
      if params.has_key?(:max) &&
          params[:max].to_i > 0 &&
          params[:max].to_i <= 100_000_000_000
        params[:max].to_i
      else
        100
      end
    end

    def page_size
      if params.has_key?(:page_size) &&
          params[:page_size].to_i > 0
        params[:page_size].to_i
      else
        10
      end
    end

    def fizz_or_buzz(count)
      if count % 3 == 0
        'Fizz'
      elsif count % 5 == 0
        'Buzz'
      else
        count
      end
    end
end
