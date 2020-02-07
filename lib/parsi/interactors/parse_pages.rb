require 'hanami/interactor'
# NOTE: We're using standard Ruby library for page fetches instead of third-party ones
require 'open-uri'

class ParsePages
  include Hanami::Interactor

  def initialize(repository: PageRepository.new)
    @repository = repository
  end

  def call(pages_attributes)
    return unless pages_attributes
    # NOTE: Filter out duplicate URLs
    pages_attributes.uniq!

    threads = []
    fetched_pages = []

    for page_to_fetch in pages_attributes
      # NOTE: We're using Ruby Threads instead of third-party libraries for demo purposes
      #   For each URL we create new thread. Using too many threads can destroy system resources
      #   To keep things simple, we won't implement our own Thread Pool
      #   For Production consider using libraries like Celluloid, Concurrent Ruby, Parallel, etc. with built-in Thread Pool
      threads << Thread.new(page_to_fetch) do |url|
        puts "Fetching: #{url}"

        title = open(url).read.scan(/<title>(.*?)<\/title>/)[0][0]
        puts "Got #{url}: #{title}"

        fetched_page = { url: url, title: title, status: 'processed' }
        fetched_pages.push(fetched_page)
      end
    end

    # NOTE: Wait for threads to finish
    threads.each {|thr| thr.join }

    puts fetched_pages

    # NOTE: To keep things simple, we overwrite pages history on each request
    #   In a real-life service, we should deal with duplicates
    #   For example, we may use upsert (INSERT ON CONFLICT for PostgreSQL)
    #   https://www.postgresqltutorial.com/postgresql-upsert/
    @repository.clear
    @pages = @repository.create_many(fetched_pages)
  end
end
