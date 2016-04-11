require 'resque/tasks'
task 'resque:setup' => :environment

require 'resque/failure/redis'
Resque::Failure.backend = Resque::Failure::Redis