class NumbersController < ApplicationController
  def index
    @page_size = page_size
    @max = find_max
    @values = Kaminari.paginate_array((1..@max).to_a).
      page(params[:page]).
      per(@page_size)
  end

  def favorite
    number = params[:number]
    current_user.favorites << number unless current_user.favorites.include?(number)
    current_user.save
    redirect_to root_path
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
end
