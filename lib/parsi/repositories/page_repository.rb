class PageRepository < Hanami::Repository
  # NOTE: Create records in bulk
  #   see more: https://guides.hanamirb.org/repositories/overview/
  def create_many(data)
    command(create: :pages, result: :many).call(data)
  end
end
