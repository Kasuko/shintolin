module.exports =
  name: 'hunk of cooked meat'
  plural: 'hunks of cooked meat'
  tags: ['usable', 'food']
  weight: 1

  craft: (character, tile) ->
    takes:
      ap: 1
      building: 'campfire'
      items:
        meat_raw: 1
    gives:
      items:
        meat_cooked: 1
      xp:
        wanderer: 1
