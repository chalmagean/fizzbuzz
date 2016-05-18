module ApplicationHelper
  def fizzbuzz(all_values, user_favorties = [])
    list = all_values.collect do |val|
      content_tag(:tr) do
        content_tag(:td, val) +
        content_tag(:td, fav_count(val, user_favorties))
      end
    end

    content_tag(:table, list.join.html_safe, class: 'table')
  end

  private

    def fav_count(count, user_favorties)
      if user_favorties.include?(count.to_s)
        content_tag(:span, 'Favorited', class: 'favorited', id: "fav_#{count}")
      else
        link_to('Favorite', favorite_path(number: count), id: "fav_#{count}")
      end
    end
end
