# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob

module.exports = (robot) ->

  # 特定のチャンネルへ送信するメソッド(定期実行時に呼ばれる)　
  send = (channel, msg) ->
    robot.send {room: channel}, msg

  # Crontabの設定方法と基本一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  # 開始　月曜日
  new cronJob('0 0 9 * * 1', () ->
    send 7655, "一週間がんばりましょう！"
  ).start()

  # 開始　平日
  new cronJob('0 0 9 * * 2-5', () ->
    send 7655, "今日も一日がんばりましょう！"
  ).start()

  # お昼　平日
  new cronJob('0 0 12 * * 1-5', () ->
    send 7655, "お昼！"
  ).start()

  # 終了　平日
  new cronJob('0 0 18 * * 2-5', () ->
    send 7655, "今日も一日お疲れ様でした！"
  ).start()

  # 終了金曜　
  new cronJob('0 0 18 * * 5', () ->
    send 7655, "一週間お疲れ様でした！"
  ).start()
