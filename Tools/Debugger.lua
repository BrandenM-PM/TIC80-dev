-- #### SETUP! ####
debug = {} -- add stuff to this table!
debugcol = 15 -- text color
dirs={
  {1,0},{-1,0},{0,1},{0,-1},{1,1},
  {-1,-1},{1,-1},{-1,1}
}
-- ####

function PrintDebug(c, x, y)
  for d = 1, #debug do
    if not c then c = 15 end
    if not y then y = 2 end
    print(debug[d], x or 2, y, c)
    y = y + 8
  end
end

function AddDebug(str)
  debug[#debug + 1] = str
end

function ClearDebug()
  debug = {}
end

function xprint(txt, x, y, col, fixed,
  scale, smallfont, align,
  thin, blink)
  --[[
  txt=string
  this is the only obligatory
  argument. All others are	optional;

  x,y=coordinates;

  col=color
  number for borderless,
  table for outlined;

  fixed, scale, smallfont:
  same as in the	default TIC-80
  print function;

  align=-1(left),0(center),1(right);

  thin=true/false
  outline thickness;

  blink=number (frequency of blinking)
  --]]
  if blink then
    if t % (60 * blink) // (30 * blink) == 1 then
      return
    end
  end

  if not x then
    x = 120
    align = 0
  end
  if not y then
    y = 63
  end

  if not col then
    col = { 12, 0 }
  end
  if type(col) == "number" then
    col = { col }
  end

  if not scale then scale = 1 end

  local width = print(txt, 0, -100, 0, fixed,
  scale, smallfont)
  local posx = x
  if align == 0 then
    posx = x - (width // 2)
  elseif align == 1 then
    posx = x - width
  end

  if col[2] then
    local len = 8
    if thin then len = 4 end
    for o = 1, len do
      print(txt, posx + dirs[o][1],
      y + dirs[o][2], col[2], fixed, scale,
      smallfont)
    end
  end

  print(txt, posx, y, col[1], fixed, scale,
  smallfont)
end
