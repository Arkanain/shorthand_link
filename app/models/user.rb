# == Schema Information
#
# Table name: users
#
#  id    :integer          not null, primary key
#  email :string
#

class User < ActiveRecord::Base
  has_many :links, dependent: :destroy

  after_create :send_mail

  accepts_nested_attributes_for :links

  def send_mail
    CreateLinkJob.perform_later(self.id)
  end
end
