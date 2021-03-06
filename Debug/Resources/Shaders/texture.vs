attribute vec4 a_position;

uniform mat4 u_projectionMatrix;
uniform mat4 u_viewMatrix;
uniform mat4 u_worldMatrix;

uniform vec3 u_offset;

varying vec2 v_texCoords;

void main(void)
{
	v_texCoords = (a_position / 2.0) + 0.5;
	gl_Position = u_projectionMatrix * u_viewMatrix * u_worldMatrix * (a_position + vec4(u_offset, 0.0));
}