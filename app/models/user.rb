class User < ApplicationRecord
    has_many :bugs

    def last_first
        return lname + ", " + fname
    end

    def first_last
        return fname + " " + lname
    end

    validates(:lname, :fname, :email, :presence => true)
    validates :email, :uniqueness => true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :thumbnail, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
end
