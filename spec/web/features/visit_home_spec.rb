require 'features_helper'

RSpec.describe 'Visit home' do
  let(:repository) { PageRepository.new }

  before do
    repository.clear

    repository.create(url: 'guides.hanamirb.org', title: 'Hanami guides', status: 'unprocessed')
    repository.create(url: 'sitepoint.com/threads-ruby', title: 'Threads in Ruby', status: 'processed')
  end

  it 'displays each page' do
    visit '/'

    within '#pages' do
      expect(page).to have_selector('.page', count: 2), 'Expected to find 2 pages'
    end
  end
end
