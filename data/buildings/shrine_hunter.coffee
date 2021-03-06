module.exports =
  name: 'Hunter\'s Shrine'
  size: 'small'
  hp: 50
  interior: '_interior_shrine_hunter'
  upgrade: true
  actions: ['write']

  recovery: (character, tile) ->
    if tile.z is 1
      1
    else
      0

  build: (character, tile) ->
    takes:
      ap: 50
      building: 'hut'
      skill: 'divine_inspiration'
      items:
        pelt: 1
        pelt_small: 1
        pelt_wolf: 1
        pelt_lion: 1
        pelt_bear: 1
        pelt_croc: 1
        sabre_tooth: 2
        horn: 2
        antler: 2
        spear_stone: 3
    gives:
      xp:
        crafter: 50

  repair: (character, tile) ->
    max = @hp_max ? @hp
    return null unless tile.hp < max
    takes:
      ap: 10
      items:
        timber: 4
        pelt: 1
        sabre_tooth: 1
        horn: 1
        stone_spear: 1
    gives:
      tile_hp: 5
      xp:
        crafter: 5

  text:
    built: 'Incanting the ritual words of the hunter\'s song, you make your offering to the animal spirits. You sense that they are pleased with your gifts; this building is now a shrine for all hunters.'
