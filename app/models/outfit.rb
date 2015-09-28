# == Schema Information
#
# Table name: outfits
#
#  id          :integer          not null, primary key
#  image_url   :string
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Outfit < ActiveRecord::Base
  has_many :outfitTags
  has_many :tags, through: :outfitTags
end
