module Web
  module Views
    module Home
      class Index
        include Web::View

        def status_label(page)
          raw %(
            <span class="uk-label uk-label-#{page.status == 'processed' ? 'success' : 'danger'}">
              #{page.status}
            </span>
          )
        end
      end
    end
  end
end
