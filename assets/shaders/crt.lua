-- CRT Shader for LÖVE (GLSL)
return [[
extern vec2 screen_size;
// Set this to your clear color (0.96, 0.37, 0.37) darkened by 40%
const vec3 clear_color = vec3(0.43, 0.55, 0.88) * 0.6;

vec2 curve(vec2 uv) {
    uv = uv * 2.0 - 1.0;
    float c = 0.077; // curvature amount (30% less prominent than 0.11)
    uv.x *= 1.0 + c * pow(uv.y, 2.0);
    uv.y *= 1.0 + c * pow(uv.x, 2.0);
    uv = (uv + 1.0) / 2.0;
    return uv;
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    // Curvature
    vec2 uv = texture_coords;
    uv = curve(uv);
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        return vec4(clear_color, 1.0); // outside screen, use darkened clear color
    }
    vec4 pixel = Texel(tex, uv) * color;

    // Scanlines (thinner and consistent)
    float scan = 0.92 + 0.08 * sin(screen_coords.y * 2.5);
    pixel.rgb *= scan;

    // Shadow mask (RGB triads)
    float mask = 0.96 + 0.04 * cos(screen_coords.x * screen_size.x * 3.0);
    pixel.r *= mask;
    pixel.g *= 0.98 + 0.02 * cos(screen_coords.x * screen_size.x * 3.0 + 2.0);
    pixel.b *= 0.98 + 0.02 * cos(screen_coords.x * screen_size.x * 3.0 + 4.0);

    // Subtle vignette
    float vignette = mix(1.0, smoothstep(0.8, 0.2, length(uv - 0.5)), 0.15); // 0.15 = subtle strength
    pixel.rgb *= vignette;

    return pixel;
}
]]
