module Database

  def self.database_file
    @database_file || File.expand_path('../test.db', __FILE__)
  end

  def self.setup
    destroy
    create

    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: database_file)

    # Hide migration logs
    ActiveRecord::Migration.verbose = false
  end

  def self.run_default_migration
    load File.expand_path('../../../lib/generators/historyable/templates/migration.rb', __FILE__)
    CreateChanges.new.up
  end


  protected

  def self.create
    SQLite3::Database.new FileUtils.touch(File.expand_path('../test.db', __FILE__)).first
  end

  def self.destroy
    FileUtils.rm(database_file) if File.exists?(database_file)
  end
end
