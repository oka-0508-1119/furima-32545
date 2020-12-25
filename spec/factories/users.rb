FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"111aaa"}
    password_confirmation {password}
    first_name             {"名"}
    last_name              {"前"}
    first_name_kana        {"ナ"}
    last_name_kana         {"マエ"}
    birth_date             {"2001-01-01"}
    
  end
end