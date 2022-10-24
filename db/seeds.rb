# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@test.com',
    password: 'c1b2a3',

)

Genre.create!(
  [
    {name:'犬'},
    {name:'猫'},
    {name:'小動物'},
    {name:'その他'}
  ]
    )

Customer.create!(
  [
    {email: 'test2@test.com', name: '田中', name_kana: 'たなか', pen_name: 'なか', pet_name: 'プー', introduce: '1歳のトイプードルです。元気なやんちゃボウズです！', password: 'toyp11', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cus1.jpg"), filename:"sample-cus1.jpg")},
    {email: 'test3@test.com', name: '佐藤', name_kana: 'さとう', pen_name: 'さと', pet_name: 'チャロモ', introduce: 'いつもプイプイ元気に鳴いてます！きゅうり大好き', password: 'molcar', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cus2.jpg"), filename:"sample-cus2.jpg")},
  ]
)
