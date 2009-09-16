require 'drb'
module QuickQueue
  class Client

    def initialize(options = {})
      port = (options[:port] || 7654)
      DRb.start_service()
      @server = DRbObject.new(nil, "druby://localhost:#{port}")
      @current_item = nil
    end

    def fetch
      @server.pop
    end

    def push(item)
      @server.push(item)
    end

    def server_status
      @server.status
    end

    def loop
      begin
        while item = fetch
          @current_item = item
          handle(item)
          @current_item = nil
        end
      rescue
        # if something went wrong, put it back in the queue
        if @current_item
          @server.push(@current_item)
          @current_item = nil
        end
      end
    end

    def handle(item)
      puts item
    end

  end
end
