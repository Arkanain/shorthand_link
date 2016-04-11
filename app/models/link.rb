# == Schema Information
#
# Table name: links
#
#  id            :integer          not null, primary key
#  original_link :string
#  short_link    :string
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#

class Link < ActiveRecord::Base
  belongs_to :user

  attr_accessible :original_link

  validates :original_link, presence: true

  before_create :generate_link
  after_create  :assign_user

  scope :move_me, lambda { |link| find_by(short_link: link).original_link }

  def update(hash)
    self.transaction do
      super(hash)

      self.user.update(email: "#{self.original_link.last(3)}@test.com")
    end
  end

  private

  def generate_link
    self.short_link = [*'a'..'z', *'A'..'Z', *0..9].sample(8).join
  end

  def assign_user
    self.transaction do
      update_attribute(:original_link, "#{self.original_link}/new")

      user = User.first
      update_attribute(:user, user) if user
    end
  end
end
