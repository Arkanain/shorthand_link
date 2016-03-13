class Link < ActiveRecord::Base
  attr_accessible :original_link

  before_save :generate_link

  private

  def generate_link
    self.short_link = [*'a'..'z', *'A'..'Z', *0..9].sample(8).join
  end
end