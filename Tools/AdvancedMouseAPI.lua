
-- Advanced mouse API
mouse={m=mouse,x=0,y=0,px=0,py=0,lb=false,plb=false,mb=false,pmb=false,rb=false,prb=false,LEFT=1,MIDDLE=2,RIGHT=3}function mouse:__call()x,y,lb,mb,rb,sx,sy=self.m()self.px=self.x;self.py=self.y;self.x=x;self.y=y;self.plb=self.lb;self.lb=lb;self.pmb=self.mb;self.mb=mb;self.prb=self.rb;self.rb=rb;self.scroll=sy;return x,y,lb,mb,rb,sx,sy end;function mouse.is_locked()return peek(0x7FC3F,1)>0 and true or false end;function mouse.toggle_lock()poke(0x7FC3F,peek(0x7FC3F,1)>0 and 0 or 1,1)end;function mouse.in_bound(x,y,a,b)return mouse.x>=x and mouse.x<x+a and mouse.y>=y and mouse.y<y+b end;function mouse.clicked(c)c=c or 1;if c==1 then return mouse.lb and not mouse.plb elseif c==2 then return mouse.mb and not mouse.pmb elseif c==3 then return mouse.rb and not mouse.prb end end;function mouse.pressed(c)c=c or 1;if c==1 then return mouse.lb elseif c==2 then return mouse.mb elseif c==3 then return mouse.rb end end;function mouse.released(c)c=c or 1;if c==1 then return not mouse.lb and mouse.plb elseif c==2 then return not mouse.mb and mouse.pmb elseif c==3 then return not mouse.rb and mouse.prb end end;function mouse:__tostring()return string.format('(%s, %s)',self.x,self.y)end;setmetatable(mouse,mouse)
