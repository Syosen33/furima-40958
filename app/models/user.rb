class User < ApplicationRecord
  # 必須項目のバリデーション
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "must include both letters and numbers" }
  validates :password_confirmation, presence: true
  validate :password_match

  # パスワードとパスワード確認の値が一致していることを確認するカスタムバリデーション
  def password_match
    if password != password_confirmation
      errors.add(:password_confirmation, "doesn't match Password")
    end
  end

  # devise のモジュールを含む
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角（漢字・ひらがな・カタカナ）で入力してください" }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角（漢字・ひらがな・カタカナ）で入力してください" }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "全角カタカナで入力してください" }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "全角カタカナで入力してください" }
         validates :birthday, presence: true


  def custom_validation
  if some_condition
    errors[:base] << "Custom error message 1"
  end

  if another_condition
    errors[:base] << "Custom error message 2"
  end
end
end