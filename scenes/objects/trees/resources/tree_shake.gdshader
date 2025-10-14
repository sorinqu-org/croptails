shader_type canvas_item;

uniform float shake_intensity : hint_range(0.0, 10.0) = 1.0;
uniform float shake_speed : hint_range(0.0, 20.0) = 4.0;
uniform float sway_scale : hint_range(0.0, 2.0) = 0.25;
uniform float attenuation_power : hint_range(0.1, 5.0) = 2.0;
uniform bool invert_uv = false;

void vertex() {
    float v = UV.y;
    if (invert_uv) {
        v = 1.0 - v;
    }
    float height_factor = clamp(v, 0.0, 1.0);
    float attenuation = pow(height_factor, attenuation_power);

    float phase = TIME * shake_speed + UV.y * (sway_scale * 10.0);
    float wave = sin(phase);

    float gust = sin(TIME * (shake_speed * 0.3) + UV.y * 6.0) * 0.35;
    VERTEX.x += (wave + gust) * shake_intensity * attenuation;
}
