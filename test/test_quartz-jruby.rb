require File.dirname(__FILE__) + '/test_helper.rb'

# org.apache.log4j.BasicConfigurator.configure
class TestScheduler
  include Quartz::Scheduler
  schedule(:say_hello_2_dis, :cron => "0/2 * * * * ?", :disallow_concurrent => true) { puts "every 2 seconds"; sleep(8) ; puts 'after sleep' }
  schedule(:say_hello_2, :every => 2) { puts "every 2 seconds (no dis)"; sleep(5) }
end

TestScheduler.instance.run
