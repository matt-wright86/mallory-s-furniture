class Post < ActiveRecord::Base

    validates :name, presence: true
    validates :description, presence: true

    has_many :votes, dependent: :destroy

end
