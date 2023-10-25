Notification.seed do |s|
  s.id = 1
  s.sender_id = 2
  s.receiver_id = 1
  s.varity = 1
  s.title = '今なら最大購入金額3倍分ポイント戻ってくる！'
  s.message = 'お買い物をするといまならポイントが戻ってくる。Q: 購入後に抽選結果が届きません。抽選結果はキャンペーン期間中1度目の購入後、1週間以内にお知らせいたします。2度目以降の購入後には届きません。'
  s.is_read = false
end

Notification.seed do |s|
  s.id = 2
  s.sender_id = 2
  s.receiver_id = 1
  s.varity = 1
  s.title = '《最大33,000円割引》最新のiPhone13もお買い得！先着5,000名！'
  s.message = '最新のiPhone13がお買い得！購入をご検討しているお客様にはさらに割引も適用できます。'
  s.is_read = false
end
