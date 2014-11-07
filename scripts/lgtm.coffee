# Description:
#   LGTM is the most important thing in life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot lgtm - Receive a lgtm

module.exports = (robot) ->

  robot.respond /lgtm/i, (msg) ->
    msg.http("http://www.lgtm.in/g")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        url = JSON.parse(body).actualImageUrl

        # 画像サービス毎にがんばって！
        url = url.replace(/\.(jpe?g|gif|png)$/, "m.$1") if url.match(/^http:\/\/i.imgur.com/)

        msg.send url

