namespace :custom do
  role :web, "tt.cs.uni-potsdam.de"

  desc "run db:drop db:create db:migrate db:seed"
  task :full_database_setup do
    on roles(:web) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec rake db:drop db:create db:migrate db:seed"
        end
      end
    end
  end
end


after "deploy", "custom:full_database_setup"
