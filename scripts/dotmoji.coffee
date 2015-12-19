# Description:
#   Display the message using emoji
#
# Commands:
#   hubot moji TEST
#   hubot mojif TEST :sunny:
#   hubot mojifb TEST :sunny: :cloud:
#   hubot mj TEST # using alias (:dmjf: :dmjb:)
#
module.exports = (robot) ->
  robot.respond /moji\s+(.*)/i, (msg) ->
    text = encodeURIComponent msg.match[1]
    dotmojiMessage msg, text, ":black_large_square:", ":white_large_square:"

  robot.respond /mojif\s+(.*)\s+(:[\S]+:)/i, (msg) ->
    text = encodeURIComponent msg.match[1]
    fill = msg.match[2]
    dotmojiMessage msg, text, fill, ":white_large_square:"

  robot.respond /mojifb\s+(.*)\s+(:[\S]+:)\s+(:[\S]+:)/i, (msg) ->
    text = encodeURIComponent msg.match[1]
    fill = msg.match[2]
    bg = msg.match[3]
    dotmojiMessage msg, text, fill, bg

  robot.respond /mj\s+(.*)/i, (msg) ->
    text = encodeURIComponent msg.match[1]
    dotmojiMessage msg, text, ":dmjf:", ":dmjb:"

dotmojiMessage = (msg, text, fill, bg) ->
  url = "https://dotmoji.herokuapp.com/api/mapping/#{text}";
  msg.http(url).get() (err, res, body) ->
    json = JSON.parse body
    output = ""
    for y in json
      for x in y
        output += if x == 1 then fill else bg
      output += "\n"
    msg.send output
