require 'quick_queue/client'
require "readline"
module QuickQueue
  class Console < Client
    include Readline
    def loop
      while (command = readline('> ', true)).chomp != 'exit'
        next if command == ''
        method, *args = command.split(' ')
        if ['status', 'server_status', 'fetch', 'push', 'pop'].include?(method)
            eval "puts(#{method} #{args.join(' ')})" rescue $stdout.puts($!.message)
        else 
          puts "No such command - #{method}"
        end
      end
      puts 'Bye'
    end
    
  end
end