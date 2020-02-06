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
          if params.valid?
            ParsePages.new.call(params[:urls])
          else
            self.status = 422
          end

          repository = PageRepository.new
          @pages = repository.all
        end
      end
    end
  end
end
