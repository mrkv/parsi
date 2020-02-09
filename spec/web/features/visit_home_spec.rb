require 'features_helper'

RSpec.describe 'Visit home' do
  it 'displays each page' do
    visit '/?urls[]=https://www.google.com/&urls[]=https://yandex.ru/'

    within '#pages' do
      expect(page).to have_selector('.page', count: 2), 'Expected to find 2 pages'
    end
  end
end
