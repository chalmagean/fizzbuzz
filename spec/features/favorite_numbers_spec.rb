require 'rails_helper'

RSpec.feature "Favorite Numbers", type: :feature do
  describe '#favorite' do
    it 'marks a number as favorite' do
      user = create(:user)
      login_as(user, scope: :user)

      visit '/'

      click_on 'fav_4'
      expect(page).to have_css('#fav_4', text: 'Favorited')
    end
  end
end
