class CartContent < ActiveRecord::Base
	belongs_to :cart

	belongs_to :shelver_starter, class_name: "Shelver", foreign_key: "shelver_starter_id"
	belongs_to :shelver_finisher, class_name: "Shelver", foreign_key: "shelver_finisher_id"

	belongs_to :clerk_starter, class_name: "Clerk", foreign_key: "clerk_starter_id"
	belongs_to :clerk_finisher, class_name: "Clerk", foreign_key: "clerk_finisher_id"
end
