require 'rails_helper'

RSpec.feature "StandardFizzbuzz", type: :feature do
  before :each do
    user = create(:user)
    login_as(user, scope: :user)
  end

  it 'defaults to 100 numbers' do
    visit '/?page_size=100'
    expect(page).to have_content('Fizz', count: 33)
    expect(page).to have_content('Buzz', count: 14)
  end

  it 'can receive a custom max value' do
    visit '/?max=10&page_size=100'
    expect(page).to have_content('Fizz', count: 3)
    expect(page).to have_content('Buzz', count: 2)
  end

  it 'returns back to 100 if max is 0' do
    visit '/?max=0&page_size=100'
    expect(page).to have_content('Fizz', count: 33)
    expect(page).to have_content('Buzz', count: 14)
  end

  it 'cannot go beyond 100,000,000,000' do
    visit '/?max=100000000001&page_size=100'
    expect(page).to have_content('Fizz', count: 33)
    expect(page).to have_content('Buzz', count: 14)
  end
end
