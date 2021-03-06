_ = require 'underscore'
async = require 'async'
commands = require '../../../commands'
data = require '../../../data'
mw = require '../middleware'
MAX_WEIGHT = 70

module.exports = (app) ->
  app.post '/take', mw.not_dazed, mw.available_actions('take'), (req, res, next) ->
    return next('Invalid Item') unless req.item?
    return next('That item may not be traded or dropped.') if req.item.nodrop or req.item.intrinsic

    building = data.buildings[req.tile.building]
    quantity = parseInt(req.param('quantity'))
    inventory_item = _.find req.tile.items, (i) ->
      i.item is req.item.id
    return next("The #{building.name} doesn\'t have #{quantity} #{req.item.name} to give away.") unless inventory_item.count >= quantity

    weight = quantity * (req.item.weight ? 0)
    return next("Taking that would overburden you.") if req.character.weight + weight > MAX_WEIGHT

    async.series [
      (cb) ->
        commands.remove_item req.tile, req.item, quantity, cb
      (cb) ->
        commands.add_item req.character, req.item, quantity, cb
      (cb) ->
        commands.charge_ap req.character, 1, cb
      (cb) ->
        msg =
          item: req.item.id
          quantity: quantity
          building: req.tile.building
        commands.send_message 'take', req.character, req.character, msg, cb
      (cb) ->
        msg =
          item: req.item.id
          quantity: quantity
          building: req.tile.building
        commands.send_message_nearby 'take_nearby', req.character, [req.character], msg, cb
    ], (err) ->
      return next(err) if err?
      res.redirect '/game'
