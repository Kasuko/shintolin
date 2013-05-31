_ = require 'underscore'

module.exports =
  plural: 'deer'
  hp: 30

  attacked: (attacker, target, tile) ->
    roll = Math.random()
    if roll < .60
      'flee'
    else
      null

  loot: (attacker, target, tile) ->
    if _.contains attacker.skills, 'butchering'
      pelt: 1
      meat_raw: 10
    else
      pelt: 1
      meat_raw: 8
