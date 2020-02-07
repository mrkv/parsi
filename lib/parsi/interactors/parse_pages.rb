require 'hanami/interactor'
# NOTE: We're using standard Ruby library for page fetches instead third-party ones
require 'open-uri'

class ParsePages
  include Hanami::Interactor

  def initialize(repository: PageRepository.new)
    @repository = repository
  end

  def call(pages_attributes)
    return unless pages_attributes
    # NOTE: Filter out unique URLs
    pages_attributes.uniq!

    threads = []
    fetched_pages = []

    for page_to_fetch in pages_attributes
      threads << Thread.new(page_to_fetch) do |url|
        puts "Fetching: #{url}"

        title = open(url).read.scan(/<title>(.*?)<\/title>/)[0][0]
        puts "Got #{url}: #{title}"

        fetched_page = { url: url, title: title, status: 'processed' }
        fetched_pages.push(fetched_page)
      end
    end

    threads.each {|thr| thr.join }

    puts fetched_pages
    @repository.clear
    @pages = @repository.create_many(fetched_pages)
  end
end
