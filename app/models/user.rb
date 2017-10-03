class User < ApplicationRecord

  enum role: [:child, :common, :admin]
  before_save :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => ":style/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :tv_show_comments
  has_many :episode_comments
  has_many :news
  has_many :tv_show_ratings
  has_many :episode_ratings
  has_many :tv_shows, through: :tv_show_ratings
  has_many :episodes, through: :episode_ratings
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "father_id",
                                  dependent:   :destroy
  has_many :children, through: :active_relationships, source: :child
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "child_id",
                                   dependent:   :destroy
  has_many :fathers, through: :passive_relationships, source: :father

  def set_default_role
    puts "----------------------------"
    puts self.role
    if self.role == :child
      self.role ||= :child
    else
      self.role ||= :common
    end
    puts "+++++++++++++++++++++++++++++"
    puts self.role
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email = auth.info.email
      user = User.find_by(email: email) if email

      # Create the user if it's a new registration
      if user.nil?
        password = "123456"
        if auth.provider == 'facebook'
          user = User.new(
            email: email ? email : "#{auth.uid}@facebook.com",
            first_name: auth.info.first_name,
            last_name: auth.info.last_name,
            password: password,
            password_confirmation: password
          )
        end
      end
      user.save!
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end

    user
  end

  def email_verified?
    return true
    if self.email
      if self.email.split('@')[1] == 'facebook.com'
        return false
      else
        return true
      end
    else
      return false
    end
  end


end
