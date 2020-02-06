class PageRepository < Hanami::Repository
  def create_many(data)
    command(create: :pages, result: :many).call(data)
  end
end
