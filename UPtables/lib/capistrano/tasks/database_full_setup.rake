namespace :custom do
  role :web, "tt.cs.uni-potsdam.de"

  desc "run db:drop db:create db:migrate db:seed RAILS_ENV=production"
  task :full_database_setup do
    on roles(:web) do
      execute "cd #{current_path}; rake db:drop db:create db:migrate db:seed RAILS_ENV=production"
    end
  end
end
