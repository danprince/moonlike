import defaultbl, p from require "moon"
util = require "util"
rot = require "rotLove/rotLove/rotLove"
mobs = require "models/mobs"
tiles = require "models/tiles"
SpriteCache = require "spritecache"

DEFAULT_MOVE = { x: 0, y: 0 }
TILE_SIZE = 20
WORLD_WIDTH = 51
WORLD_HEIGHT = 33

local sprites
local spritecache
local shader
local fov
local color
local player
local world

-- create an instance of a given model, using a metatable to fall back
-- to the original properties of the model
-- for example:
-- mouse = make_instance mobs.moonmouse, { x: 10, y: 10 }
-- now mouse has instance props and model props
make_instance = (model, instance) ->
  metatable = {
    __index: (table, property) -> model[property]
  }

  setmetatable instance, metatable
  return instance

-- helper function for drawing sprites, takes a sprite position,
-- a color and coords. Values should be normalized, not multiplied
-- by tilesize!
draw_sprite = (sprite, color, x, y) ->
  frame = spritecache sprite
  rx = x * TILE_SIZE
  ry = y * TILE_SIZE
  love.graphics.setColor unpack color
  love.graphics.setShader shader
  love.graphics.draw sprites, frame, rx, ry

-- helper for checking whether a given coord is valid
valid_coord = (x, y) ->
  x >= 0 and y >= 0 and x < world.width and y < world.height

-- helper for checking whether light can pass through this tile
light_passes = (fov, x, y) ->
  if valid_coord x, y
    world.items[x][y] == 1
  else
    false

-- testing entity list
entities = {
  make_instance mobs.moonmouse,    { pos: { 5, 6 } },
  make_instance mobs.moonmote,     { pos: { 6, 6 } },
  make_instance mobs.moonspider,   { pos: { 5, 7 } },
  make_instance mobs.moonmilipede, { pos: { 6, 7 } },
  make_instance mobs.moonmosquito, { pos: { 5, 8 } },
  make_instance mobs.mooncrab,     { pos: { 6, 8 } },
  make_instance mobs.moonfiend,    { pos: { 5, 9 } },
  make_instance mobs.moonstalker,  { pos: { 6, 9 } },
  make_instance mobs.moonwraith,   { pos: { 5, 10 } },
  make_instance mobs.moongobbler,  { pos: { 6, 10 } }
}

-- movement table
movement = defaultbl({
  h: { x: -1, y: 0 },
  j: { x: 0,  y: 1},
  k: { x: 0,  y: -1},
  l: { x: 1,  y: 0}
}, -> DEFAULT_MOVE)


----------------------
-- initialise function
----------------------
love.load = ->
  player = make_instance mobs.moonman, { x: 0, y: 0 }
  world = util.Array2D WORLD_WIDTH, WORLD_HEIGHT, 0

  love.window.setMode world.width * TILE_SIZE, world.height * TILE_SIZE
  sprites = love.graphics.newImage("assets/sprites.png")
  spritecache = SpriteCache sprites, TILE_SIZE
  shader = love.graphics.newShader "shaders/color.fs"

  map = rot.Map.Cellular\new world.width - 2, world.height - 2
  map\randomize .6
  map\create (x, y, val) -> world.items[x][y] = val

  fov = rot.FOV.Bresenham\new light_passes, { topology: 4 }
  color = rot.Color\new!

---------------------
-- main draw function
---------------------
love.draw = ->
  ts = TILE_SIZE

  -- draw all tiles with the appropriate fov mask
  fov\compute player.x, player.y, 10, (x, y, r, v) ->
    if not valid_coord x, y
      return false

    local tile
    val = world.items[x][y]
    tile = if val == 1 then tiles.core_floor else tiles.core_wall
    light_color = color\interpolate { 0, 0, 0 }, tile.color, v
    draw_sprite tile.sprite, light_color, x, y

  for i = 1, #entities  do
    entity = entities[i]
    { x, y } = entity.pos
    draw_sprite entity.sprite, entity.color, x, y

  draw_sprite player.sprite, player.color, player.x, player.y
  armor = mobs.moonman4
  draw_sprite armor.sprite, armor.color, player.x, player.y

----------------------
-- keyhandler function
----------------------
love.keypressed = (key) ->
  love.graphics.print key, 100, 100
  move = movement[key]
  player.x = player.x + move.x
  player.y = player.y + move.y

