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

genres = Genre.create!(
  [
    {name:'犬'},
    {name:'猫'},
    {name:'小動物'},
    {name:'その他'}
  ]
    )

tags = Tag.create!(
  [
    {name:'犬'},
    {name:'トイプードル'},
    {name:'モルモット'},
    {name:'長毛種モル'}
  ]
    )

customers = Customer.create!(
  [
    {email: 'test2@test.com', name: '田中', name_kana: 'たなか', pen_name: 'なか', pet_name: 'プー', introduce: '1歳のトイプードルです。元気なやんちゃボウズです！', password: 'toyp11', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cus1.jpg"), filename:"sample-cus1.jpg")},
    {email: 'test3@test.com', name: '佐藤', name_kana: 'さとう', pen_name: 'さと', pet_name: 'チャロモ', introduce: 'いつもプイプイ元気に鳴いてます！きゅうり大好き', password: 'molcar', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cus2.jpg"), filename:"sample-cus2.jpg")},
    {email: 'test4@test.com', name: 'アンダーソン', name_kana: 'アンダーソン', pen_name: 'アンソン', password: '654321'},

  ]
)

post_images = PostImage.create!(
  [
    {title: 'おねんね中・・・起こさないでください', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: '大好きなお散歩に行って、大好きなゴハンを食べてぐっすり眠ってます。キュートすぎ！', customer_id: customers[0].id, genre_id: genres[0].id },
    {title: 'お友達いっぱい', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: 'まるで某アニメみたい(笑)', customer_id: customers[1].id, genre_id: genres[2].id },
  ]
)

PostTag.create!(
  [
    {post_image_id: post_images[0].id, tag_id: tags[0].id },
    {post_image_id: post_images[0].id, tag_id: tags[1].id },
    {post_image_id: post_images[1].id, tag_id: tags[2].id },
    {post_image_id: post_images[1].id, tag_id: tags[3].id },
  ]
    )

PostComment.create!(
  [
    {comment: 'すっごい美人さんですね！見てて癒されます♥',post_image_id: post_images[0].id, customer_id: customers[1].id },
    {comment: 'ありがとうございます！そう言っていただけて嬉しいです',post_image_id: post_images[0].id, customer_id: customers[0].id },
    {comment: 'ホント某アニメそっくりｗそのままプイプイ言いながら出勤しそう',post_image_id: post_images[1].id, customer_id: customers[2].id },
    {comment: 'コメントありがとうございます！',post_image_id: post_images[1].id, customer_id: customers[1].id },
  ]
    )


questions = Question.create!(
  [
    {title: '犬と猫を一緒に飼っても大丈夫？', q_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-q1.jpg"), filename:"sample-q1.jpg"), caption: '保護猫を飼いたい！けど先住犬がいます。飼っても大丈夫でしょうか？気を付けることとかありますか？', customer_id: customers[0].id},
    {title: 'モルの好物について', caption: 'うちの子はきゅうり大好き！みなさんちのモルちゃんは何が好物ですか？', customer_id: customers[1].id},
  ]
)

QuestionComment.create!(
  [
    {comment: '先住犬の性格によりますね。嫉妬深かったり、縄張り意識が強いとネコちゃんを攻撃しちゃうかもですね・・・。最悪部屋を分けたりできればいいですが・・・。',question_id: questions[0].id, customer_id: customers[2].id },
    {comment: 'コメントありがとうございます！うちの子の性格は結構穏やかなので大丈夫そうです。少しづつ慣らしていって、一緒に暮らせるようにしたいです！',question_id: questions[0].id, customer_id: customers[0].id },
    {comment: '友達が飼ってるモルはキャベツに夢中らしいです',question_id: questions[1].id, customer_id: customers[0].id },
  ]
    )