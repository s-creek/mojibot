module.exports = (robot) ->
  robot.hear /((おなかすいた|お腹すいた|お腹空いた))/i, (msg) ->
    foods = ['ラーメン食おうぜ', 'おにぎりにぎってるよー', '肉だなやっぱり', '我慢汁', '寿司や！', '満漢全席いってみよか']
    msg.send msg.random foods


  robot.enter (res) ->
    enterReplies = ['よくきた', 'らっしゃい', 'はろー', ':wave: やふー', '粗茶ですが(´・ω・)⊃旦', ' ', 'ごゆるりと']
    res.send res.random enterReplies


  robot.hear /凶/i, (res) ->
    badReplies = ['( ´,_ゝ｀)ﾌﾟｯ', '( ﾟ∀ﾟ)ｱﾊﾊ八八ﾉヽﾉヽﾉヽﾉ ＼ / ＼/ ＼/ ＼', 'm9(^Д^)']
    if res.message.user.name is "slackbot"
      res.send res.random badReplies
 

  robot.hear /大吉/i, (res) ->
    goodReplies = ['(*ﾟ▽ﾟ)/ﾟ･:*【祝】*:･ﾟ＼(ﾟ▽ﾟ*)', '(ﾟρﾟ)ｵﾒﾃﾞﾀｰ', '才×〒"├_〆(･･　)♪', '(・∀・)ｲｲﾈ!']
    if res.message.user.name is "slackbot"
      res.send res.random goodReplies
    else
      res.send "自演ダメぜ，#{res.message.user.name}"


  robot.hear /(もじぼ|モジボ)/i, (res) ->
    username = res.message.user.name
    resReplies = [username+'よ呼んだ？', 'いるで'+username, '今手が離せない', '( ˘ω˘)ｽﾔｧ']
    res.send res.random resReplies


  robot.hear /(監視|かんし)/i, (msg) ->
    msg.send "┃電柱┃_･)ｼﾞｰ"


  robot.hear /(ながぼ|ながボ|ナガボ)/i, (msg) ->
    msg.send "サセさーん"