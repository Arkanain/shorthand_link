class CreateLinkJob < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    User.find(user_id).links << Link.create(original_link: 'bla')
  end
end