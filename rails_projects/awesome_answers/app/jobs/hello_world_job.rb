class HelloWorldJob < ApplicationJob
  #Docs for ActiveJob that already exists in Rails: https://guides.rubyonrails.org/active_job_basics.html

  #To generate the migration for delayed_job's queue table, run:
  # rails g delayed_job:active_record

  #To generate a job file:
  # rails g job <job-name>
  #in this case: rails g job hello_world


  queue_as :default



  #When a job is executed, the "perform" method will be called
  def perform(*args)
    # Do something later
    puts "------------------"
    puts "Running job......."
    puts "------------------"
  end
end

#To run a job, use any of the following methods:

#<JobClass>.perform_now(<args>)
#This will run the job synchronously (or in the foreground) meaning
#thayt it will not be in the queue. If it is called from Rails, Rails
#would execute the job instead of a worker

#<JobClass>.perform_later(<args>)
#This will insert the job into a queue to be executed by a worker

#To perform jobs at a given time, use this method:
#<JobClass>.set(<some-kind-of-time>)

#HelloWorldJob.set(wait: 10.minutes).perform_later
#The above will insert a job in the queue that
#will only run after 10 minutes have elapsed

#HelloWorldJob.set(run_at: 1.week.from_now).perform_later

#More options at: https://guides.rubyonrails.org/active_job_basics.html

=begin
#Run rails c to initiate job: (or jobs can be added and/or triggered to other events as well lie controller actions)
# HelloWorldJob.perform_now
This will run the job synchronously (or in the foreground) meaning that it will not go in the que
HelloWorldJob.perform_later
This will insert the job in your que to be executed by a worker
(Run rails s separately)
http://localhost:3000/delayed_job/overview # 👈🏻 we can use this url to view status of all the tasks, but you will need to set up routes for this
If you did perform_later, there should be a job in the queue
rails jobs:work # to perform the tasks in the que we will use this comand to start the worker
(Hint: you will need to get out of rails c to do this)
=end
