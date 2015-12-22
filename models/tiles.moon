-- model file for all tile types in the game
-- tiles should have a sprite, color
-- tiles should also have solid: true if they cannot be walked on

colors = require "models/colors"
import palette from colors

{
  rock_floor:  { sprite: {0, 0}, color: colors.rock[1] },
  rock_wall:   { solid: true,  sprite: {1, 0}, color: colors.rock[2] },
  magma_floor: { sprite: {0, 0}, color: colors.magma[1] },
  magma_wall:  { solid: true,  sprite: {1, 0}, color: colors.magma[2] },
  core_floor:  { sprite: {0, 0}, color: colors.core[1] },
  core_wall:   { solid: true,  sprite: {1, 0}, color: colors.core[2] },
  water: { solid: true,  sprite: {2, 0}, color: palette[1] },
  grass: { sprite: {3, 0}, color: palette[3] },
  opt1:  { sprite: {4, 0} },
  opt2:  { sprite: {5, 0} },
  opt3:  { sprite: {6, 0} },
  opt4:  { sprite: {7, 0} },
  opt5:  { sprite: {8, 0} },
  opt6:  { sprite: {9, 0} }
}
