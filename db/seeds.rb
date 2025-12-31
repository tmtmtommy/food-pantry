names = %w[
  キャベツ レタス ほうれん草 小松菜 ねぎ にんじん じゃがいも 玉ねぎ
  きゅうり トマト なす ピーマン もやし しめじ えのき
]

names.each do |name|
  Vegetable.find_or_create_by!(name:)
end
