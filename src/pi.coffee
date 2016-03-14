# Description
#   Give digits of pi
#
# Configuration:
#
# Commands:
#   hubot pi digit(s) 5 (to 10) - give the 5th (or 5th to 10th) digits
#
# Notes:
#
# Author:
#   Joe Ennever <joe@dwnld.me>

pi = require("./data/pi.json").digits

module.exports = (robot) ->
  robot.respond /pi digit(?:s)? (\d+)(?: to (\d+))?/, (msg) ->
    [_, low, hi] = msg.match
    low = low - 1
    if hi == undefined
      msg.send pi[low]
      return
    hi = hi - 1
    if hi < low
      msg.send "Whoops! The second digit must be higher!"
      return
    msg.send pi[low..high]


