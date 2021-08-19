namespace :api do
  namespace :v1 do
    desc 'Generate API v1 documentation'

    json_file, html_file = 'spec/docs/v1/docs.json', 'public/docs/v1.html'

    task :md do
      puts 'md task'
      RSpec::Core::RakeTask.new(:api_spec) do |t|
        t.rspec_opts = "-f Dox::Formatter --order defined --tag dox --out #{json_file}"
      end
      puts 'api_spec'
      Rake::Task['api_spec'].invoke
    end

    task :html do
      puts 'html task'
      system("yarn run redoc-cli bundle   -o #{html_file} #{json_file}")
    end

    task docs: ['api:v1:md', 'api:v1:html']
  end
end
