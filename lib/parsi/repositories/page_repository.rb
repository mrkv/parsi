class PageRepository < Hanami::Repository
  module Status
    ALL = [
      UNPROCESSED = 'unprocessed',
      PROCESSED = 'processed',
      FAILED = 'failed'
    ].freeze
  end

  # NOTE: Create records in bulk
  #   see more: https://guides.hanamirb.org/repositories/overview/
  def create_many(data)
    command(create: :pages, result: :many).call(data)
  end

  def find_by_url(url)
    pages
      .where(url: url)
      .first
  end
end
