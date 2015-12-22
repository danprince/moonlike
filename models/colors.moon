-- model file for keeping track of the colors that are used in the game
-- colors are stored as tables of the form { r, g, b }
{
  -- level 0-4
  rock:  { { 044, 058, 054 }, { 080, 105, 098 }, { 017, 085, 066 }, { 047, 212, 165 }, { 154, 245, 219 } },
  -- level 5-9
  magma: { { 058, 041, 044 }, { 105, 092, 080 }, { 085, 049, 017 }, { 212, 125, 047 }, { 245, 197, 154 } },
  -- level 10-15
  core:  { { 054, 044, 058 }, { 098, 080, 105 }, { 065, 017, 085 }, { 163, 047, 212 }, { 218, 154, 245 } },
  -- mob/item colors
  palette: { { 047, 138, 216 }, { 047, 212, 216 }, { 128, 216,047 }, { 216, 158, 047 }, { 216, 47, 72 } }
}
