-- Tools
function Dist(fx,fy,tx,ty)
	local dx,dy=fx-tx,fy-ty
	return sqrt(dx*dx+dy*dy)
end

function Mid(a,b,c)
  if (a>b and a<c)or(a<b and a>c)then
    return a
  elseif(b>a and b<c)or(b<a and b>c)then
    return b
  else
    return c
  end
end

function Clamp(a,b,c)
  if a<b then
    return b
  elseif a>c then
    return c
  else
    return a
  end
end

function Lerp(a,b,t)
  return a+(b-a)*t
end

function CheckCollision(x1,y1,w1,h1,x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function CheckPointCollision(x1,y1,x2,y2,r)
  return Dist(x1,y1,x2,y2)<r
end


function Lerp(a,b,t)
  return a+(b-a)*t
end