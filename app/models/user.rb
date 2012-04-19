class User
  include Mongoid::Document
  # Include default devise modules. Others available are:

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  field :email,              :type => String, :null => false
  field :encrypted_password, :type => String, :null => false

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time
  #
  ## Rememberable
  field :remember_created_at, :type => Time

  validate :max_user_accounts, on: :create


  def max_user_accounts
    if User.count > 0
      errors.add(:name, "Max amount of users taken")
    end
  end

end
