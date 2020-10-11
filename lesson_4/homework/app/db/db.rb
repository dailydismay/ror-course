require 'bundler'
require 'pg'

module Db
  class ConnManager
    def self.conn
      unless @conn
        raise "Blyat suka connectiona netu"
      end
      @conn
    end

    def self.connect
      @conn = PG.connect :dbname => 'dev', :user => 'dev', :password => 'dev', :host => 'localhost', :port => '5432'
    rescue PG::BadAuthenticationError
      puts "conn err"
    end
  end
end