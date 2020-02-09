RSpec.describe ParsePages do
  let(:interactor) { ParsePages.new }
  let(:google_url) { 'https://www.google.com/' }
  let(:yandex_url) { 'https://yandex.ru/' }
  let(:wrong_url) { 'http://google312312.com/' }
  let(:attributes) { %W(#{google_url} #{google_url} #{yandex_url}) }
  let(:mixed_attributes) { %W(#{wrong_url} #{google_url}) }

  context "passing right urls" do
    let(:result) { interactor.call(attributes) }

    it "filters duplicates and persists new pages" do
      expect(result.successful?).to be(true)

      repository = PageRepository.new
      pages = repository.all

      expect(pages.count).to eq(2)

      google_page = repository.find_by_url(google_url)
      yandex_page = repository.find_by_url(yandex_url)

      expect(google_page.title).to eq('Google')
      expect(google_page.status).to eq('processed')
      expect(yandex_page.title).to eq('Яндекс')
      expect(yandex_page.status).to eq('processed')
    end
  end

  context "passing mixed urls" do
    let(:result) { interactor.call(mixed_attributes) }

    it "persists pages with right statuses" do
      expect(result.successful?).to be(true)

      repository = PageRepository.new
      pages = repository.all

      expect(pages.count).to eq(2)

      google_page = repository.find_by_url(google_url)
      wrong_page = repository.find_by_url(wrong_url)

      expect(google_page.title).to eq('Google')
      expect(google_page.status).to eq('processed')
      expect(wrong_page.title).to eq(nil)
      expect(wrong_page.status).to eq('failed')
    end
  end
end
