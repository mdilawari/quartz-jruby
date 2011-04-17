require File.dirname(__FILE__) + '/test_helper.rb'

org.apache.log4j.BasicConfigurator.configure
class TestScheduler
  include Quartz::Scheduler
  # schedule(:say_hello_5, :cron=>"0/5 * * * * ?") { info "every 5 seconds" }
  schedule(:say_hello_statefull, :every => 5.seconds, :stateful => true) { info "every 5 sec. statefull"; sleep(17) ; info "after sleep"}
  # schedule(:say_hello_30, :every=>30.seconds) { error "every 30 seconds" }
  # schedule(:say_hello_at, :every=>1.day, :at=>'15:06:00') { info "fire at 3:05 pm" }
end
TestScheduler.instance.run
