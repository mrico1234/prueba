class Orden < ApplicationRecord
	belongs_to :client
	include AASM

	aasm column: 'status' do
	  state :nuevo, initial: true
	  state :preparation
	  state :canceled
	  state :finished
	  

	  event :run do
	    transitions from: :nuevo, to: :preparation
	  end

	  event :walk do
	    transitions from: :preparation, to: :finished
	  end

	  event :hold do
	    transitions from: :nuevo, to: :canceled
	  end
	end
	


end#
