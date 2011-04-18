require 'jruby/core_ext'
java_import 'org.quartz.Job'
java_import 'org.quartz.JobExecutionContext'
java_import 'org.quartz.DisallowConcurrentExecution'

module Quartz
  class CronJob
    include org.quartz.Job

    add_method_signature('execute', [java.lang.Void::TYPE, JobExecutionContext])
    def execute(context)
      job_block = JobBlocksContainer.instance.jobs[context.job_detail.name]      
      job_block.call
    end      
  end
  
  class CronJobSingle < CronJob
    add_class_annotation({ DisallowConcurrentExecution => {} }) 
  end
  
  CronJob.become_java!
  CronJobSingle.become_java!  
end
