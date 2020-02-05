RSpec.describe Page, type: :entity do
  it 'can be initialized with attributes' do
    page = Page.new(
      url: 'guides.hanamirb.org',
      title: 'Hanami guides',
      status: 'processed'
    )

    expect(page.url).to eq('guides.hanamirb.org')
    expect(page.title).to eq('Hanami guides')
    expect(page.status).to eq('processed')
  end
end
