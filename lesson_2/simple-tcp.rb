require 'socket'
require 'json'
require 'time'

class HttpServer
  def initialize(reply_data)
    host = 'localhost'
    port = 4446
    @tcp_server = TCPServer.new host, port
    @reply_data = reply_data
  end
 
  private def receive
    loop do
      Thread.start(@tcp_server.accept) do |sock|
        req = sock.gets
    
        (method, path, protocol) = req.split " "

        puts "[#{method}] - #{path} - #{Time.new}"

        reply = @reply_data.call sock

        res = reply.to_json
      
        sock.print "HTTP/1.1 200 OK\r\n" +
        "Content-Type: application/json\r\n" +
        "Content-Length: #{res.bytesize}\r\n" +
        "Connection: close\r\n"
    
        sock.print "\r\n"
      
        sock.print res
      
        def get_result
          data = { time: Time.new }
          data.to_json
        end

        (1..9).each do |_|
          sleep 2
          sock.print get_result
        end

        sock.close
      end
    end
  end

  def listen
    t = Thread.new {
      receive
    }
    t.join
  end

end

# todo: make a request instance with headers, body

server = HttpServer.new lambda { |sock|  { :ok => true} }

server.listen