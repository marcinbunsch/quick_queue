require 'drb'
module QuickQueue
  class Client

    def initialize(options = {})
      port = (options[:port] || 7654)
      host = (options[:host] || 'localhost')
      @worker = File.read(options[:file]) if options[:file]
      DRb.start_service()
      @server = DRbObject.new(nil, "druby://#{host}:#{port}")
      @current_item = nil
    end
    
    def fetch
      @server.pop
    end
    alias :pop :fetch

    def push(item)
      @server.push(item)
    end

    def server_status
      @server.status
    end
    alias :status :server_status

    def loop
      while item = fetch
        begin
          @current_item = item
          handle(item)
          @current_item = nil
        rescue
          # if something went wrong, put it back in the queue
          if @current_item
            @logger.info("Failed to process #{@current_item}, putting it back in queue") if @logger
            @logger.info("Reason for failure: #{$!.class}: #{$!.message} at #{$!.backtrace.first}") if @logger
            @server.push(@current_item)
            @current_item = nil
          end
        end
      end
    end

    def handle(item)
      puts item
    end

  end
end
