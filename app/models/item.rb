class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :item_type, :inclusion => { :in => %w(number scale boolean),
    :message => "pick a thing!!!!" }
end
