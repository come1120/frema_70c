class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]
         with_options presence: true do
    validates :nickname
    validates :birth_year
    validates :birth_month
    validates :birth_day
    validates :email,          uniqueness: {case_sensitive: false},
                               format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password,       length: { minimum: 7 }
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :firstname
      validates :lastname
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :firstname_kana
      validates :lastname_kana
    end
  end
  has_one :address

end
