#encoding: utf-8
require "fileutils"
namespace :my_db do
  desc "Backup project database. Options: DIR=backups RAILS_ENV=production MAX=7"
  desc "usage - bundle exec rake my_db:backup  RAILS_ENV=production MAX=15 DIR=db/db.bak"
  task :backup => [:environment] do
    # config base dir
    datestamp = Time.now.strftime("%Y%m%d%H%M")
    base_path = Rails.root
    backup_folder = File.join(base_path, ENV["DIR"] || "backups")
    FileUtils.mkdir_p(backup_folder) unless File.exist?(backup_folder)

    #[2022-11-25 18:09:03] "C:/Program Files/PostgreSQL/13/bin/pg_dump.exe" --dbname=petrobooks3_development --file=\\wsl$\Ubuntu-20.04\home\nathan\data\PostgreSQL___postgres_localhost-2022_11_25_18_09_03-dump.sql --create --username=postgres --host=localhost --port=5432
    # backup database
    db_config = Rails.configuration.database_configuration[Rails.env]
    backup_file = File.join(backup_folder, "#{db_config['database']}_#{ENV['RAILS_ENV']}_#{datestamp}.sql")
    `test -f #{backup_file}* && rm #{backup_file}*`
    ` pg_dump --dbname=#{db_config['database']} -f #{backup_file} --create -U #{db_config['username']} -h #{db_config['host']} -p#{db_config['port']} `

    raise "Unable to make DB backup!" if ($?.to_i > 0)
    `gzip -9 #{backup_file}`

    # delete dulipute backups
    all_backups = Dir.new(backup_folder).entries.sort[2..-1].reverse
    puts "Created backup: #{backup_file}.gz successfully!"
    max_backups = (ENV["MAX"].to_i if ENV["MAX"].to_i > 0) || 30
    unwanted_backups = all_backups[max_backups..-1] || []
    for unwanted_backup in unwanted_backups
      FileUtils.rm_rf(File.join(backup_folder, unwanted_backup))
    end
    puts "Deleted #{unwanted_backups.length} backups, #{all_backups.length - unwanted_backups.length} backups available"
    # print the absolute dir path for remote operate db
    puts "#{backup_file}.gz"
  end

  desc "usage - bundle exec rake my_db:restore RAILS_ENV=production BACKUP_FILE=db/db.bak/backup_file.sql.gz"
  task :restore => [:environment] do
    # config base dir
    backup_file = ENV["BACKUP_FILE"]
    raise "No Exist File - #{backup_file}" unless File.exist?(backup_file)

    # restore database
    db_config = ActiveRecord::Base.configurations[ENV['RAILS_ENV']]
    `gunzip < #{backup_file} | mysql -u #{db_config['username']} -p#{db_config['password']} -i -c -q #{db_config['database']}`
    raise "Unable to restore DB from #{backup_file}!" if ($?.to_i > 0)
    puts "Restore DB from #{backup_file} successfully!"
  end
end
