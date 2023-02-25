-- title:  Breakout 
-- author:  Branden Morin (brandenmorin14@gmail.com)
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

require("Breakout.Player")
require("Breakout.Ball")
require("Breakout.Brick")
require("Tools.Debugger")

-- Globals
GAMESTATE=nil
PLAYER=nil
BALL=nil
SCORE=nil
LIVES=nil

function BOOT()
  GAMESTATE="START"
  PLAYER=P_Init(10,10,20,5)
end

function TIC()
  if GAMESTATE=="START" then
    StartScreen()
  elseif GAMESTATE=="RUN" then
    Update()
    Draw()
  elseif GAMESTATE=="PAUSE" then
    Pause()
  elseif GAMESTATE=="OVER" then
    GameOver()
  end
end

-- Gameplay

function NewGame()
end

function StartScreen()
  cls(1)
  xprint("Start",2, 2)

  if btnp(4) then
    GAMESTATE="RUN"
  end
end

function Update()
  PLAYER.Update()
end

function Draw()
  cls(2)
  xprint("Run",2,2)
  PLAYER.Draw()
end

function Pause()
end

function GameOver()
end

--
-- <TILES>
-- 001:2222222222222222222222222222222222222222222222222222222222222222
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

