class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :item_type, :inclusion => { :in => %w(number scale boolean),
    :message => "pick a thing!!!!" }
  has_many :traces, dependent: :destroy
  accepts_nested_attributes_for :traces

end
