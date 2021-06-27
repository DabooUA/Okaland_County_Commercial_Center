class User < ActiveRecord::Base

    has_many :messages
    has_many :listings
    has_secure_password

    # has_attached_file :photos, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    # validates_attachment_content_type :photos, content_type: /\Aimage\/.*\z/
  
    def slug
      username.downcase.gsub(" ","-")
    end
  
    def self.find_by_slug(slug)
      User.all.find{|user| user.slug == slug}
    end
  end