PARTICLES = {}

function ParticleInit()
  local number_of_particles = 1
  local velocity_x = 50
  local velocity_y = 50
  local ax = 0
  local ay = 0
  for i=1,number_of_particles do
    local vx = math.random(-velocity_x, velocity_x)
    local vy = math.random(-velocity_y, velocity_y)
    PARTICLES[i] = CreateParticle(math.random(20,220), 68, vx, vy, ax, ay, 3)
  end
end

function CreateParticle(_x,_y,_dx,_dy,_ax,_ay,_r)
  local particle={
    x=_x,
    y=_y,
    vx=_dx,
    vy=_dy,
    ax=_ax,
    ay=_ay,
    rr=_r-1,
    r=_r,
    m=30*_r,
    w=2*_r,
    h=_r,
    c=math.random(1,15),
    Move=Move,
    Collide=CollideWithList,
    SetGravity=SetGravity,
    Draw=Draw
  }
  return particle
end

function Move(particle,dt)
  particle.x = particle.x + particle.vx * dt
  particle.y = particle.y + particle.vy * dt
  particle.vx = particle.vx + particle.ax * dt
  particle.vy = particle.vy + particle.ay * dt

  if particle.x < 0 + particle.r then
    particle.x = 0 + particle.r
    particle.vx = -particle.vx
  end
  if particle.x > 239 - particle.r then
    particle.x = 239 - particle.r
    particle.vx = -particle.vx
  end
  if particle.y < 0 + particle.r then
    particle.y = 0 + particle.r
    particle.vy = -particle.vy
  end
  if particle.y > 135 - particle.r then
    particle.y = 135 - particle.r
    particle.vy = -particle.vy
  end
end

function Draw(particle)
  circ(particle.x,particle.y,particle.r,particle.c)
end

function CollideWithList(particle,particles)
  -- implement collisions with other particles
  for j=1,#particles do
    local other_particle = particles[j]
    if particle ~= other_particle then
      local dx = particle.x - other_particle.x
      local dy = particle.y - other_particle.y
      local distance = math.sqrt(dx * dx + dy * dy)
      if distance < particle.r + other_particle.r then
        local nx = dx / distance
        local ny = dy / distance
        local tx = -ny
        local ty = nx
        local dpTan1 = particle.vx * tx + particle.vy * ty
        local dpTan2 = other_particle.vx * tx + other_particle.vy * ty
        local dpNorm1 = particle.vx * nx + particle.vy * ny
        local dpNorm2 = other_particle.vx * nx + other_particle.vy * ny
        local m1 = (dpNorm1 * (particle.m - other_particle.m) + 2 * other_particle.m * dpNorm2) / (particle.m + other_particle.m)
        local m2 = (dpNorm2 * (other_particle.m - particle.m) + 2 * particle.m * dpNorm1) / (particle.m + other_particle.m)
        particle.vx = tx * dpTan1 + nx * m1
        particle.vy = ty * dpTan1 + ny * m1
        other_particle.vx = tx * dpTan2 + nx * m2
        other_particle.vy = ty * dpTan2 + ny * m2

        local overlap = (particle.r + other_particle.r) - distance
        particle.x = particle.x + nx * overlap
        particle.y = particle.y + ny * overlap
        other_particle.x = other_particle.x - nx * overlap
        other_particle.y = other_particle.y - ny * overlap
      end
    end
  end
end

function SetGravity(particle,dt)
  particle.vy = particle.vy + 9.81 * dt * particle.m
  -- add friction to the particles
  particle.vx = particle.vx * 0.75
  particle.vy = particle.vy * 0.99
end
