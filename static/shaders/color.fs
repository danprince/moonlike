// FRAGMENT SHADER
// Colors non transparent pixels in texture with current color value,
// set from love with love.graphics.setColor

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
  vec4 pixel = Texel(texture, texture_coords);

  // maintain alpha channel to retain shape of sprite
  float alpha = pixel.a;

  return vec4(color.r, color.g, color.b, alpha);
}
