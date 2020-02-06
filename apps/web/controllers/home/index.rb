module Web
  module Controllers
    module Home
      class Index
        include Web::Action

        def call(params)
          if params.valid?
            @pages = ParsePages.new.call(params[:urls])
          else
            self.status = 422
          end
        end
      end
    end
  end
end
