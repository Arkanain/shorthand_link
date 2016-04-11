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

require 'rails_helper'

describe Link do
end
