-- model file for defining all mobile entitities
-- all mobs should have a sprite and a color

import palette from require "models/colors"

{
  -- monsters
  moonmote:     { sprite: {0, 2}, color: palette[1] },
  moonmouse:    { sprite: {1, 2}, color: palette[1] },
  moonmilipede: { sprite: {2, 2}, color: palette[2] },
  moonspider:   { sprite: {3, 2}, color: palette[2] },
  moonmosquito: { sprite: {4, 2}, color: palette[3] },
  mooncrab:     { sprite: {5, 2}, color: palette[3] },
  moonfiend:    { sprite: {6, 2}, color: palette[4] },
  moonstalker:  { sprite: {7, 2}, color: palette[4] },
  moonwraith:   { sprite: {8, 2}, color: palette[5] },
  moongobbler:  { sprite: {9, 2}, color: palette[5] },

  -- humans
  moonman:  { sprite: {0, 1}, color: { 66, 85, 124 } },
  moonman2: { sprite: {1, 1}, color: palette[5] },
  moonman3: { sprite: {2, 1}, color: palette[5] },
  moonman4: { sprite: {3, 1}, color: palette[5] }
}
