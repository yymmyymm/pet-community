class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :customer
end
