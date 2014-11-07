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
        msg.send JSON.parse(body).imageUrl

