module.exports =
  id: 'digging_stick'
  name: 'digging stick'
  plural: 'digging sticks'

  weight: 1
  break_odds: .12

  craft: (character, tile) ->
    takes:
      ap: 5
      building: 'campfire'
      tools: ['handaxe']
      items:
        stick: 1
    gives:
      items:
        digging_stick: 1
      xp:
        crafter: 3