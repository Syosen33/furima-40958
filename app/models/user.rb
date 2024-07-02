class User < ApplicationRecord
  # 必須項目のバリデーション
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナで入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナで入力してください' }
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'must include both letters and numbers' }
   # パスワードとパスワード確認の値が一致していることを確認するカスタムバリデーション


  # devise のモジュールを含む
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end