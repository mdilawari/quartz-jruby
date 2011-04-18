java_import 'org.quartz.JobBuilder'
java_import 'org.quartz.TriggerBuilder'
java_import 'org.quartz.impl.StdSchedulerFactory'
java_import 'org.quartz.CronScheduleBuilder'

module Quartz
  module Scheduler
    def self.included(base)
      base.class_eval do        
        include InstanceMethods
        extend ClassMethods
        include Singleton
      end
    end
    
    module ClassMethods
      def schedule(name, options, &block)
        instance.schedule(name, options, block)
      end
    end
       
    module InstanceMethods            
      def schedule(name, options, block)
        job_code_blocks.jobs[name.to_s] = block
        
        job_class = (options[:disallow_concurrent] ? Quartz::CronJobSingle : Quartz::CronJob)
        job = JobBuilder.new_job(job_class.java_class).with_identity("#{name}", "group").build                                                                                                                       
        trigger = TriggerBuilder.new_trigger.with_identity("#{name}_trigger", "group").
                          withSchedule(CronScheduleBuilder.cronSchedule(options[:cron])).build
                      
        scheduler.schedule_job(job, trigger)                                                                                           
      end
  
      def scheduler_factory
        @scheduler_factor ||= StdSchedulerFactory.new
      end
  
      def scheduler
        scheduler_factory.get_scheduler
      end
  
      def job_code_blocks
        JobBlocksContainer.instance
      end
  
      def run
        scheduler.start
      end  
    end
  end
end
