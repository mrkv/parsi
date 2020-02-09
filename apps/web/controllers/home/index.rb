module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        expose :pages

        params do
         optional(:urls).filled
       end

        def call(params)
          ParsePages.new.call(params[:urls])

          repository = PageRepository.new
          @pages = repository.all
        end
      end
    end
  end
end
