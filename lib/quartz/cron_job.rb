require 'java'
java_import 'org.quartz.Job'

module Quartz
  class AbstractCronJob
    attr_accessor :name
    def initialize(name)
      @name=name
    end
    def execute(context)
      job_block = JobFactory.instance.jobs[@name]
      job_block.call
    end    
  end
  
  class CronJob < AbstractCronJob
    include org.quartz.Job
  end
  
  class CronStatefulJob < AbstractCronJob
    include org.quartz.StatefulJob
  end  
end
