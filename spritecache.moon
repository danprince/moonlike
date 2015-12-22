util = require "util"
moon = require "moon"

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

    moon.p sprite

    rx = x * s
    ry = y * s
    cache[sprite] = love.graphics.newQuad rx, ry, s, s, w, h
    return cache[sprite]

