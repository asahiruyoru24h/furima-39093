FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abc123'}
    password_confirmation {password}
    kanji_first_name      {'山田'}
    kanji_last_name       {'太郎'}
    kana_first_name       {'ヤマダ'}
    kana_last_name        {'タロウ'}
    birthday              {'1930-01-01'}

  end
end