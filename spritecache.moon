-- creates a cache of love quads that can be used to select a frame
-- from a given image
--
-- returns a function which can be used to lookup
-- an item in the cache
--
-- TODO reimplement this as a metatable rather than a lookup function
(image, frame_size) ->
  cache = {}

  s = frame_size
  w = image\getWidth!
  h = image\getHeight!

  (sprite) ->
    -- if the sprite is cached use it
    if cache[sprite]
      return cache[sprite]

    -- otherwise add it to the cache
    {x, y} = sprite
    rx = x * s
    ry = y * s
    cache[sprite] = love.graphics.newQuad rx, ry, s, s, w, h
    return cache[sprite]

