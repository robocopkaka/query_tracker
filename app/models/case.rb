class Case < ApplicationRecord
  belongs_to :user
  enum status:{
  	open: 'open',
  	fixed: 'fixed',
  	closed: 'closed'
  }
end
