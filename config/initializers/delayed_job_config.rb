Delayed::Worker.delay_jobs = !Rails.env.test?   # Don't use DJ for tests
Delayed::Worker.destroy_failed_jobs = false     # Retain failed job records for auditing
Delayed::Worker.max_attempts = 10               # Reduced from 25
Delayed::Worker.max_run_time = 2.hours          # Reduced from 4 hours
Delayed::Worker.raise_signal_exceptions = :term # Exit jobs immediately on heroku restart
#Delayed::Worker.default_queue_name = 'default'