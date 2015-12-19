# Commands:
#   hubot photo|画像|がぞう <query>
#   おなかすいた|お腹すいた|お腹空いた


module.exports = (robot) ->
  robot.respond /(photo|画像|がぞう)\s+(.*)/i, (msg) ->
    text = msg.match[2]
    url = "https://api.photozou.jp/rest/search_public.json?keyword=#{text}&limit=10";
    msg.http(url).get() (err, res, body) ->
      photos = JSON.parse(body)['info']['photo']
      photo = msg.random(photos)
      msg.send "検索単語 #{text}"
      msg.send photo['image_url']
      # msg.send photo.image_url
