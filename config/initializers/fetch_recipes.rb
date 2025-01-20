require "rake"

Rails.application.config.after_initialize do
  Rails.application.load_tasks
  Rake::Task["fetch_recipes:store"].invoke
end
