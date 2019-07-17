# 定期起動のための宣言
#cronJob = require('cron').CronJob

module.exports = (robot) ->

  # あいさつ系
  hello = ['こんにちは', 'はい、よろしく', 'どうも']
  robot.hear /こんにちは/i, (res) ->
    res.send res.random hello

  goodby = ['さようなら', 'またな', 'バイバイ']
  robot.hear /さようなら/i, (res) ->
    res.send res.random goodby

  otukare = ['お疲れ様でした', 'はい、お疲れさん', 'はい、おつかれ']
  robot.hear /おつかれさま/i, (res) ->
    res.send res.random otukare


  # サポート系
  robot.hear /help/i, (res) ->
    res.send "javadoc, eclipse, 正規表現, 技術トレンド, ランチ, bot testとか打ってみて"
    res.send "URL で一覧も表示するよ"

  robot.hear /javadoc/i, (res) ->
    res.send "JAVA 5 API仕様：https://docs.oracle.com/javase/jp/1.5.0/api/ \n
              JAVA 8 API仕様：https://docs.oracle.com/javase/jp/8/docs/api/"

  robot.hear /eclipse/i, (res) ->
    res.send "Eclipseショートカット一覧：https://qiita.com/ynxx/items/7734dfb755bc83373d7c"

  robot.hear /正規表現/i, (res) ->
    res.send "正規表現チェッカー：https://weblabo.oscasierra.net/tools/regex/"

  robot.hear /技術トレンド/i, (res) ->
    res.send "技術トレンド情報収集：https://qiita.com/ryuichi1208/items/604a68abb91949e79ece"

  lunch = ['ヒンナヒンナだな', '脳みそに塩かけて食べるとうまいぞ', 'オソマおかわり！']
  robot.hear /ランチ/i, (res) ->
    res.send "本社周辺ランチ情報：https://r.gnavi.co.jp/area/aream2178/lunch/"
    setTimeout () ->
      res.send res.random lunch
    , 5 * 1000

  robot.hear /bot/i, (res) ->
    res.send "idobata botの作り方：https://yamayoshiblog.com/post-410/ \n
              スクリプトリファレンス：https://github.com/hubotio/hubot/blob/master/docs/scripting.md \n
              お試しチャットボット：https://landbot.io/u/H-195931-G67XKP8XDCUGQ73Y/index.html (user:sky, pass:leaf2019)"

  robot.hear /URL/i, (res) ->
    res.send "JAVA 5 API仕様：https://docs.oracle.com/javase/jp/1.5.0/api/ \n
              JAVA 8 API仕様：https://docs.oracle.com/javase/jp/8/docs/api/ \n
              Eclipseショートカット一覧：https://qiita.com/ynxx/items/7734dfb755bc83373d7c \n
              正規表現チェッカー：https://weblabo.oscasierra.net/tools/regex/ \n
              技術トレンド情報収集：https://qiita.com/ryuichi1208/items/604a68abb91949e79ece \n
              本社周辺ランチ情報：https://r.gnavi.co.jp/area/aream2178/lunch/ \n
              idobata botの作り方：https://yamayoshiblog.com/post-410/ \n
              hubotスクリプトリファレンス：https://github.com/hubotio/hubot/blob/master/docs/scripting.md \n
              お試しチャットボット：https://landbot.io/u/H-195931-G67XKP8XDCUGQ73Y/index.html (user:sky, pass:leaf2019)"

  # 定期起動系
  # Crontabの設定方法と基本一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  #send = (channel, msg) ->
  #  robot.send {room: channel}, msg
  #send = (msg) ->
  #  robot.send msg

  #new cronJob('0 00 09 * * 1-5', () ->
  #new cronJob('30 * * * * *', () ->
  #  send '#lounge', "@all さあ、今日も一日頑張ろう！！"
  #).start()

  #new cronJob('0 00 12 * * 1-5', () ->
  #new cronJob('10 * * * * *', () ->
  #  send 'lounge', "ランチの時間だよ！！"
  #).start()

  #new cronJob('0 0 12 * * 1-5', () ->
  #new cronJob('5 * * * * *', () ->
  #   send '#apitest', "@all そろそろ帰る準備をしよう"
  #).start()

  # その他
  #cronjob = new cronJob(
  #  cronTime: "5 * * * * *"    # 実行時間
  #  start:    true                # すぐにcronのjobを実行するか
  #  timeZone: "Asia/Tokyo"        # タイムゾーン指定
  #  onTick: ->                    # 時間が来た時に実行する処理
  #    robot.send "今日はハグの日ですよ！"
  #)
 
  #send = (room, msg) ->
  #  response = new robot.Response(robot, {user : {id : -1, name : room}, text : "none", done : false}, [])
  #  response.send msg
 
  #new cronJob('5 * * * * *', () ->
  #  send 'apitest', "current time is 00."
  #  console.log('You will see this message every second');
  #).start()

  robot.hear /.*アシリパ.*/i, (res) ->
    setTimeout () ->
      res.send "アシリパ？はぁ？誰？"
    , 5 * 1000
