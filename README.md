T I M E - R E M A I N I N G
===========================

Given a process that will take some amount of time, and we know how much we have done, 
and how much is still to do, what is the time remaining for the process to reach completion?

U S A G E
-----------
 
  require 'time_remaining'_

	time_remaining = McDowall::TimeRemaining.new
	tasks_done = 0.0
	total_tasks = 20.0
	tasks_remaining = total_tasks

	def do_task
	  sleep (1 + rand(2))
	end

	while( tasks_done < total_tasks ) do
	  do_task( )						# Do whatever it is, transfer a byte, check a file etc.
	  tasks_done+=1
	  tasks_remaining-=1

	  time_remaining.add ( (tasks_done/total_tasks).to_f )

	  p Time.now.to_s + " | " + time_remaining.completed_at.to_s       	# Prints "2011-06-22 22:45:38 -0400"
	  p time_remaining                                                  # Prints "03:01:00"
	end
	
	
R U N N I N G  T H E  T E S T  S U I T E
----------------------------------------

	rspec spec

C O N T R I B U T I N G  to  T I M E - R E M A I N I N G
--------------------------------------------------------

* Check out the latest master to make sure the feature hasn’t been implemented or the bug hasn’t been fixed yet
* Check out the issue tracker to make sure someone already hasn’t requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don’t break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

C O P Y R I G H T
-----------------

Copyright © 2011 John McDowall. See LICENSE for further details.