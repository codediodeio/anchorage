class InstallTrigram < ActiveRecord::Migration
  def self.up
    enable_extension 'uuid-ossp'
    ActiveRecord::Base.connection.execute("CREATE EXTENSION IF NOT EXISTS pg_trgm;")
  end

  def self.down
    disable_extension 'uuid-ossp'
    ActiveRecord::Base.connection.execute("DROP EXTENSION pg_trgm;")
  end
end
