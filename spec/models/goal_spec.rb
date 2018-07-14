# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  details    :text
#  private?   :boolean          default(FALSE), not null
#  completed? :boolean          default(FALSE), not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  
end
