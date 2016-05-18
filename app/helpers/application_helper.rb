module ApplicationHelper
  def fizzbuzz(all_values, user_favorties = [])
    list = all_values.collect do |count|
      content_tag(:tr) do
        content_tag(:td, fizz_or_buzz(count)) +
        content_tag(:td, fav_count(count, user_favorties))
      end
    end

    content_tag(:table, list.join.html_safe, class: 'table')
  end

  private

    def fizz_or_buzz(count)
      if count % 3 == 0
        'Fizz'
      elsif count % 5 == 0
        'Buzz'
      else
        count
      end
    end

    def fav_count(count, user_favorties)
      if user_favorties.include?(count.to_s)
        content_tag(:span, 'Favorited', class: 'favorited', id: "fav_#{count}")
      else
        link_to('Favorite', favorite_path(number: count), id: "fav_#{count}")
      end
    end
end
