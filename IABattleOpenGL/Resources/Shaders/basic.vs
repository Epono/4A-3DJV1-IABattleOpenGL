
attribute vec4 a_position;

uniform mat4 u_projectionMatrix;
uniform mat4 u_viewMatrix;
uniform mat4 u_worldMatrix;

varying vec3 v_normal;
varying vec4 v_color;

const vec3 c_lightDirection = vec3(1.f, 1.f, -1.f);

uniform vec3 u_offset;

#define VERTEX_LIGHTING 1

void main(void)
{
	gl_Position = u_projectionMatrix * u_viewMatrix * u_worldMatrix * (a_position + vec4(u_offset, 0.0));
gl_TexCoord[0].stp = gl_Vertex.xyz;

	// solution 1 : mettre le w a 0
	//vec4 normal = vec4(a_position.xyz, 0.0);
	//normal = normalize(normal);
	//normal = u_worldMatrix * normal;
	//v_normal = normal.xyz;

	// solution 2 : conversion mat4 vers mat3
	vec3 normal = a_position.xyz;
	normal = normalize(normal);
	normal = mat3(u_projectionMatrix) * normal;
	v_normal = normal;

#if VERTEX_LIGHTING
	vec3 L = normalize(c_lightDirection);
	float NdotL = max(dot(v_normal, L), 0.0);
	
	v_color = vec4(1.0, 0.3, 0.3, 1.0) * NdotL;
#else
	v_color = vec4(1.0, 1.0, 0.0, 1.0);
#endif
}