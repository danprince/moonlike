moon = require "moon"
util = require "util"
rot = require "rotLove/rotLove/rotLove"
mobs = require "models/mobs"
tiles = require "models/tiles"
SpriteCache = require "spritecache"

DEFAULT_MOVE = { x: 0, y: 0 }
TILE_SIZE = 30
WORLD_WIDTH = 100
WORLD_HEIGHT = 60

local sprites
local spritecache
local shader

movement = moon.defaultbl({
  h: { x: -1, y: 0 },
  j: { x: 0,  y: 1},
  k: { x: 0,  y: -1},
  l: { x: 1,  y: 0}
}, -> DEFAULT_MOVE)

player = { x: 0, y: 0 }

world = util.Array2D WORLD_WIDTH, WORLD_HEIGHT, 0

love.load = ->
  sprites = love.graphics.newImage("assets/sprites.png")
  spritecache = SpriteCache sprites, TILE_SIZE
  shader = love.graphics.newShader "shaders/color.fs"

  m = rot.Map.Brogue\new WORLD_WIDTH, WORLD_HEIGHT
  callback = (x, y, val) ->
    world.items[x][y] = val

  m\create(callback)

draw_sprite = (sprite, color, x, y) ->
  frame = spritecache sprite
  rx = x * TILE_SIZE
  ry = y * TILE_SIZE
  love.graphics.setColor unpack color
  love.graphics.setShader shader
  love.graphics.draw sprites, frame, rx, ry

love.draw = ->
  ts = TILE_SIZE

  for x = 0, world.width do
    for y = 0, world.height do
      local tile
      val = world.items[x][y]

      if val == 1 then
        tile = tiles.moss
      else
        tile = tiles.rock

      draw_sprite tile.sprite, tile.color, x, y

  mob = mobs.moonmote
  draw_sprite mob.sprite, mob.color, player.x, player.y


love.keypressed = (key) ->
  love.graphics.print key, 100, 100
  move = movement[key]
  player.x = player.x + move.x
  player.y = player.y + move.y

