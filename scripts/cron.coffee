
random = require('hubot').Response::random

# room id
creatingRoomId  = 7655
localtestRoomId = 9630

#roomId = creatingRoomId
roomId = localtestRoomId

# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob

module.exports = (robot) ->

  # 特定のチャンネルへ送信するメソッド(定期実行時に呼ばれる)　
  send = (channel, msg) ->
    robot.send {room: channel}, msg

  # Crontabの設定方法と基本一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  #######################################################################################
  # 挨拶関連
  #######################################################################################
  # 開始　月曜日
  new cronJob('0 0 9 * * 1', () ->
    say = random [
      '一週間がんばりましょう！',
      'また一週間始まりましたね。頑張りましょう！'
    ]
    send roomId, say
  ).start()

  # 開始　平日
  new cronJob('0 0 9 * * 2-5', () ->
    say = random [
      '今日も一日がんばりましょう！',
      'おはようございます！'
    ]
    send roomId, say
  ).start()

  # お昼　平日
  new cronJob('0 0 12 * * 1-5', () ->
  #new cronJob('10 * * * * *', () ->
    say = 'お昼！' + random [
      'ヒンナヒンナ',
      ''
    ]
    send roomId, say
  ).start()

  # 終了　平日
  new cronJob('0 0 18 * * 1-4', () ->
    say = random [
      '今日も一日お疲れ様でした！',
      'お疲れ様でした！',
      'お疲れ様でした！たまには定時退社しましょう'
    ]
    send roomId, say
  ).start()

  # 終了金曜　
  new cronJob('0 0 18 * * 5', () ->
    say = random [
      '一週間お疲れ様でした！',
      '一週間疲れましたね・・・'
    ]
    send roomId, say
  ).start()

  #######################################################################################
  # 連絡関連
  #######################################################################################
  # 残業累積時間
  new cronJob('0 0 10 20 * *', () ->
    send roomId, "20日までの残業累積時間報告をしてください！"
  ).start()

  # 定期代申請は毎月25日まで
  new cronJob('0 0 10 23 * *', () ->
    send roomId, "定期代申請は毎月25日までにお願いします！"
  ).start()
