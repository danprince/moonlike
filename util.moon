Array2D = (width, height, default_fill=nil) ->
  items = {}

  for x = 0, width do
    items[x] = {}
    for y = 0, height do
      items[x][y] = default_fill

  return {
    width: width,
    height: height,
    items: items
  }

-- Converts HSL to RGB. (input and output range: 0 - 255)
hsl = (h, s, l, a) ->
  if s <= 0 then return l, l, l, a
  h, s, l = h / 256 * 6, s / 255, l / 255
  c = (1 - math.abs(2 * l - 1)) * s
  x = (1 - math.abs(h % 2 - 1)) * c
  m, r, g, b = (l - .5 * c), 0, 0, 0
  if h < 1     then r, g, b = c, x, 0
  elseif h < 2 then r, g, b = x, c, 0
  elseif h < 3 then r, g, b = 0, c, x
  elseif h < 4 then r, g, b = 0, x, c
  elseif h < 5 then r, g, b = x, 0, c
  else              r, g, b = c, 0, x

  (r + m) * 255, (g + m) * 255, (b + m) * 255, a

{
  Array2D: Array2D,
  hsl: hsl
}

