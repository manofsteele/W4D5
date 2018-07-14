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

FactoryBot.define do
  factory :goal do
    title "MyString"
    details "MyText"
    private? false
    completed? false
    user_id 1
  end
end
