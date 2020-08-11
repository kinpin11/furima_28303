class Category < ActiveHash::Base
  self.data = [
    # { id: 1, name: '---' },
    { id: ２, name: 'レディース' },
    { id: ３, name: 'メンズ' },
    { id: ４, name: 'ベビー・キッズ' },
    { id: ５, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: '家電・スマホ・レジャー' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' }

  ]
end
