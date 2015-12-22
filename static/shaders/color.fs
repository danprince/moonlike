vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
  vec4 pixel = Texel(texture, texture_coords);

  // maintain alpha channel to retain shape of sprite
  float alpha = pixel.a;

  return vec4(color.r, color.g, color.b, alpha);
}
