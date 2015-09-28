# == Schema Information
#
# Table name: outfit_tags
#
#  id         :integer          not null, primary key
#  outfit_id  :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_outfit_tags_on_outfit_id  (outfit_id)
#  index_outfit_tags_on_tag_id     (tag_id)
#

class OutfitTag < ActiveRecord::Base
  belongs_to :outfit
  belongs_to :tag
end
