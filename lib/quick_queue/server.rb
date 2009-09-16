require 'drb'
module QuickQueue
  class Server

    def initialize(options = {})
      start(options)
    end

    def pop
     @size = 0 if @queue.size <= 1
     return nil if @queue.empty?
     @queue.pop
    end

    def push(item)
      # currently it only supports strings
      @queue.push item.to_s
      @size += 1
    end

    def size 
      @size
    end

    def status
      status = "Current queue status: "
      if @size > 0
        percentage = (((@queue.length.to_f / @size.to_f) * 10000.0).floor / 100.0)
        status << "#{@queue.length} left of #{@size} (#{percentage}%)" 
      else
        status << "queue is empty"
      end
    end

    private
     
      def start(options)
        @queue = Queue.new
        if options[:file] and File.exists?(options[:file])
          lines = File.read(options[:file]).split("\n")
          lines.each do |line| 
            @queue.push line
          end
        end
        @size = @queue.length
        trap('INT') { exit }
        port = (options[:port] || 7654)
        puts "quick_queue: server working at #{port}"
        DRb.start_service("druby://localhost:#{port}", self)
        DRb.thread.join
      end

  end
end

