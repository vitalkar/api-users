class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true, length: 6..20
    validates :email, presence: true, format: /@/
    validates :birthday, presence: true
end
