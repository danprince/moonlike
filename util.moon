{
  -- helper function for defining a 2d array
  -- keeps height and width stored as top level properties
  Array2D: (width, height, default_fill=nil) ->
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
}

