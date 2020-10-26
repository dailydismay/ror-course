require_relative '../db/db'

class BaseDao
  private_class_method :new

  def initialize(conn)
      @conn = conn
  end

  def self.get_instance
      unless @instance
          @instance = new Db::ConnManager.conn
      end
      @instance
  end
end