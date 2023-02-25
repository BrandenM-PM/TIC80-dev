-- Player script
function P_Init(_x,_y,_w,_h)
  return PLAYER = {
    x=_x,
    y=_y,
    vx=0,
    vy=0,
    c=3,
    w=_w,
    h=_h,
    Init=P_Init,
    Upd=P_Update,
    Drw=P_Draw
  }
end

function P_Update()
end

function P_Draw()
end
