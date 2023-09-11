class Entity < ApplicationRecord
    has_many :group_entities, dependent: :destroy
    has_many :groups, through: :group_entities
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  
    validates :name, presence: true
    validates :amount, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
    validates :group_ids, presence: true
  end