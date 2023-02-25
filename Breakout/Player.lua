-- Player script
function P_Init(_x,_y,_w,_h)
  local p= {
    x=_x,
    y=_y,
    vx=0,
    vy=0,
    c=3,
    w=_w,
    h=_h,
    Init=P_Init,
    Update=P_Update,
    Draw=P_Draw
  }
  return p
end

function P_Update()
end

function P_Draw()
end
