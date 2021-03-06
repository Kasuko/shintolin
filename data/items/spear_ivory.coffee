module.exports =
  name: 'ivory spear'
  plural: 'ivory spears'
  tags: ['weapon']
  weight: 8

  weapon_class: 'stab'
  break_odds: .0025
  accuracy: (attacker, target, tile) ->
    chance = .30
    chance += .10 if attacker.skills.indexOf('spear_2') isnt -1
    chance += .10 if attacker.skills.indexOf('spear_4') isnt -1
    chance
  damage: (attacker, target, tile) ->
    dmg = 6
    dmg += 1 if attacker.skills.indexOf('spear_1') isnt -1
    dmg += 1 if attacker.skills.indexOf('spear_3') isnt -1
    dmg

  craft: (character, tile) ->
    takes:
      ap: 15
      tools: ['stone']
      skill: 'hafting'
      items:
        ivory_tusk: 1
        staff: 1
        pelt_small: 1
    gives:
      items:
        spear_ivory: 1
      xp:
        crafter: 15
