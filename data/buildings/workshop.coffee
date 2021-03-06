module.exports =
  name: 'Workshop'
  size: 'large'
  hp: 50
  interior: '_interior_workshop'
  upgrade: true
  actions: ['write']

  build: (character, tile) ->
    takes:
      ap: 25
      settlement: true
      building: 'longhouse'
      skill: 'artisanship'
      items:
        timber: 6
        stone_carpentry: 4
    gives:
      xp:
        crafter: 25

  repair: (character, tile) ->
    max = @hp_max ? @hp
    return null unless tile.hp < max
    takes:
      ap: 10
      items:
        timber: 2
    gives:
      tile_hp: 5
      xp:
        crafter: 5

  text:
    built: 'You assemble work benches and organise your tools, setting up a workshop in this building.'
