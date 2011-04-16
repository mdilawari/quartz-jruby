require 'java'
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'singleton'
require 'active_support'

# require jars                                                                                                                 
require 'quartz/jars/commons-collections-3.2.1'                                                                                
require 'quartz/jars/commons-logging'                                                                                          
require 'quartz/jars/log4j'                                                                                                    
require 'quartz/jars/quartz-1.6.4'

require 'quartz/version'
require 'quartz/job_factory'
require 'quartz/job_detail'
require 'quartz/cron_job'
require 'quartz/cronify'
require 'quartz/scheduler'

