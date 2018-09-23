namespace :db do
  desc 'Add default account'
  task :add_default_account => :environment do
    script_file = File.join(Rails.root, 'db', 'add_default_account.rb')
    load(script_file) if File.exist?(script_file)
  end
end