function StartScreen()
	cls()
	print("Start Screen",0,0,7)

    if btn(4) then
        PLAYER = P_Init(math.random(20,220), 68, 0, 0, 0, 0, 3)
        PLAYING=true
    end
end
function Game()
    cls()
    print("Game",0,0,7)
    print("vx,vy"..PLAYER.vx..","..PLAYER.vy,0,5,7)
    if PLAYER then
        PLAYER:Update()
        PLAYER:Collide()
        PLAYER:Draw()
    end
end

function GameOver()
    cls()
    print("Game Over",0,0,7)
end