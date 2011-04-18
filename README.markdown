= Quartz JRuby

* http://github.com/ocher/quartz-jruby

== DESCRIPTION:

From {Quartz Scheduler's website}[http://www.quartz-scheduler.org/]

Quartz is a full-featured, open source job scheduling service that can be integrated with, or used along side virtually any Java EE or Java SE application - from the smallest stand-alone application to the largest e-commerce system. Quartz can be used to create simple or complex schedules for executing tens, hundreds, or even tens-of-thousands of jobs; jobs whose tasks are defined as standard Java components that may executed virtually anything you may program them to do. The Quartz Scheduler includes many enterprise-class features, such as JTA transactions and clustering.

This gem makes these available in a ruby friendly syntax

== ocher's notes:

* Quartz 2.0 support
* All required JARs included
* This version doesn't support :at and :every options. Only :cron option is supported
* Support for Jobs with DisallowConcurrentExecution annotation set (pass :disallow_concurrent => true to schedule method)

== SYNOPSIS:

  <tt>
    class TestScheduler
      include Quartz::Scheduler
      schedule(:say_hello_5, :cron => "0/5 * * * * ? ") { puts "every 5 seconds" }
      schedule(:say_hello_5_dc, :cron => "0/5 * * * * ? ", :disallow_concurrent => true) { puts "every 5 seconds"; sleep(8) }
    end
    TestScheduler.instance.run
  </tt>

== REQUIREMENTS:

* Requires JRuby (tested on 1.6.0)

== INSTALL:

* gem install quartz-jruby

== LICENSE:

(The MIT License)

Copyright (c) 2010, Vagmi Mudumbai

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
