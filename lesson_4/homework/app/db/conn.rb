require 'bundler'
require 'pg'

module Conn
    class ConnManager
        def self.conn
            if !@conn
                raise "Blyat suka connectiona netu"
            end
            @conn
        end

        def self.connect
            @conn = PG.connect :dbname => 'dev', :user => 'dev', :password => 'dev', :host => 'localhost', :port => '5432'
        rescue PG::ConnectionBad
            puts "conn err"
        end
    end
end