module Web
  module Views
    module Home
      class Index
        include Web::View

        def page_title(page)
          if page.status == PageRepository::Status::PROCESSED
            raw %(
              #{page.title}
            )
          else
            raw %(
              <span class="uk-text-danger">
                oops! something went wrong
              </span>
            )
          end
        end

        def status_label(page)
          raw %(
            <span class="uk-label uk-label-#{page.status == PageRepository::Status::PROCESSED ? 'success' : 'danger'}">
              #{page.status}
            </span>
          )
        end

        def default_link_params
          raw %(
            ?urls[]=https://www.postgresqltutorial.com/postgresql-upsert/&urls[]=https://getuikit.com/docs/alert&urls[]=https://guides.hanamirb.org/helpers/links/#usage
          )
        end
      end
    end
  end
end
