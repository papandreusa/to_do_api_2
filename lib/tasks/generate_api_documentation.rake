namespace :api do
  namespace :v1 do
    desc 'Generate API v1 documentation'

    task md: :environment do
      puts 'md task'
      RSpec::Core::RakeTask.new(:api_spec) do |t|
        t.rspec_opts = "-f Dox::Formatter --order defined --tag dox --out #{Api::V1::Constants::ApiDoc::API_DOCS_MD}"
      end
      puts 'api_spec'
      Rake::Task['api_spec'].invoke
    end

    task html: :environment do
      puts 'html task'
      system("bundle exec aglio -i #{Api::V1::Constants::ApiDoc::API_DOCS_MD}\
         -o #{Api::V1::Constants::ApiDoc::API_DOCS_HTML}")
    end

    task docs: ['api:v1:md', 'api:v1:html']
  end
end
