class Case < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum status:{
  	open: 'open',
  	fixed: 'fixed',
  	closed: 'closed'
  }
  @categories = ["General", "Miscellaneous"]
end
