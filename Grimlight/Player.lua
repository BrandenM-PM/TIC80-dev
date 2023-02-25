function P_Init(_x,_y,_dx,_dy,_ax,_ay,_r)
    local player={
    -- handle collisions
        x=_x,
        y=_y,
        vx=_dx,
        vy=_dy,
        ax=_ax,
        ay=_ay,
        rr=_r-1,
        r=_r,
        m=3*_r,
        w=2*_r,
        h=_r,
        c=math.random(1,15),
        Update=P_Update,
        Collide=P_Collision,
		Draw=P_Draw
    }
    return player
end

function P_Update()
    local p = PLAYER
    p.vy = p.vy + 6.81 * (1/60) * p.m
	p.vx = p.vx * 0.88
	p.vy = p.vy * 0.99
    p.x = p.x + p.vx
    p.y = p.y + p.vy

    -- extra gravity
    -- p.vy = p.vy - 1.2


    if btn(2) then
        p.vx = p.vx - 0.5
    end
    if btn(3) then
        p.vx = p.vx + 0.5
    end

    -- jump
    if btnp(4) then
        p.vy = p.vy - 30
    end

    if p.vy < -30 then
        p.vy = -30
    end

end

function P_Draw()
    local p = PLAYER
    circ(p.x,p.y,p.r,p.c)
end

function P_Collision()
    local p = PLAYER
    -- implement collisions with walls
    if p.x < 0 + p.r then
        p.x = 0 + p.r
    end
    if p.x > 239 - p.r then
        p.x = 239 - p.r
    end
    if p.y > 135 - p.r then
        p.y = 135 - p.r
        p.vy = -p.vy // 2
    end
end

function P_Die()
end