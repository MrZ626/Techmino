local gc=love.graphics
local gc_push,gc_pop,gc_clear,gc_origin=gc.push,gc.pop,gc.clear,gc.origin
local gc_translate,gc_scale,gc_rotate=gc.translate,gc.scale,gc.rotate
local gc_setCanvas,gc_setShader=gc.setCanvas,gc.setShader
local gc_draw,gc_line,gc_rectangle=gc.draw,gc.line,gc.rectangle
local gc_print,gc_printf=gc.print,gc.printf
local gc_setColor,gc_setLineWidth=gc.setColor,gc.setLineWidth
local gc_stencil,gc_setStencilTest=gc.stencil,gc.setStencilTest

local int,ceil,rnd=math.floor,math.ceil,math.random
local max,min,sin,modf=math.max,math.min,math.sin,math.modf
local setFont,mDraw,mStr=setFont,mDraw,mStr
local SKIN,TEXTURE,IMG=SKIN,TEXTURE,IMG
local TEXT,COLOR,GAME,TIME=TEXT,COLOR,GAME,TIME
local shader_alpha,shader_lighter=SHADER.alpha,SHADER.lighter
local shader_fieldSatur,shader_blockSatur=SHADER.fieldSatur,SHADER.blockSatur
local drawableText,missionEnum,minoColor=drawableText,missionEnum,minoColor

local RCPB={5,33,195,33,100,5,100,60}
local attackColor={
	{COLOR.dH,COLOR.Z},
	{COLOR.H,COLOR.Z},
	{COLOR.lV,COLOR.Z},
	{COLOR.lR,COLOR.Z},
	{COLOR.dG,COLOR.C},
}
local hideBoardStencil={
	up=function()gc_rectangle('fill',0,0,300,300)end,
	down=function()gc_rectangle('fill',0,300,300,300)end,
	all=function()gc_rectangle('fill',0,0,300,600)end,
}
local dialFrame=DOGC{70,70,
	{'setLW',2},
	{'dCirc',35,35,30,6},
	{'setCL',1,1,1,.6},
	{'setLW',4},
	{'dCirc',35,35,30,6},
}
local multiple=DOGC{15,15,
	{'setLW',3},
	{'line',2,2,12,12},
	{'line',2,12,12,2},
}
local spinCenterImg=DOGC{9,9,
	{'setCL',1,1,1,.2},
	{'fRect',0,0,9,9},
	{'setCL',1,1,1,.6},
	{'fRect',1,1,7,7},
	{'setCL',1,1,1,.8},
	{'fRect',2,2,5,5},
	{'setCL',1,1,1},
	{'fRect',3,3,3,3},
}
local playerBoarders=DOGC{334,614,
	{'setLW',2},
	{'dRect',16,1,302,612},
	{'dRect',318,9,15,604},
	{'dRect',1,9,15,604},
}
local gridLines do
	local L={300,640,{'setLW',2}}
	for x=1,9 do table.insert(L,{'line',30*x,0,30*x,640})end
	for y=0,20 do table.insert(L,{'line',0,10+30*y,300,10+30*y})end
	gridLines=DOGC(L)
end
local LDmarks=gc.newSpriteBatch(DOGC{14,5,{'clear',1,1,1}},15,'static')
for i=0,14 do LDmarks:add(3+20*i,615)end
local bpmImage=DOGC{31,12,
	{'setFT',15},
	{'print',"BPM",0,-5}
}
local kpmImage=DOGC{31,12,
	{'setFT',15},
	{'print',"KPM",0,-5}
}
local function boardTransform(mode)
	if mode then
		if mode=="U-D"then
			gc_translate(0,590)
			gc_scale(1,-1)
		elseif mode=="L-R"then
			gc_translate(300,0)
			gc_scale(-1,1)
		elseif mode=="180"then
			gc_translate(300,590)
			gc_scale(-1,-1)
		end
	end
end
local function applyFieldOffset(P,notNorm)
	if not notNorm then gc_translate(150,0)end
	local O=P.fieldOff
	gc_translate(O.x+150,O.y+300)
	gc_rotate(O.a)
	gc_translate(-150,-300)
end
local function stencilBoard()gc_rectangle('fill',0,-10,300,610)end

local function drawRow(h,V,L,showInvis)
	local texture=SKIN.curText
	local t=TIME()*4
	for i=1,10 do
		if L[i]>0 then
			if V[i]>0 then
				gc_setColor(1,1,1,V[i]*.05)
				gc_draw(texture[L[i]],30*i-30,-30*h)
			elseif showInvis then
				gc_setColor(1,1,1,.3+.08*sin(.5*(h-i)+t))
				gc_rectangle('fill',30*i-30,-30*h,30,30)
			end
		end
	end
end
local function drawField(P)
	local ENV=P.gameEnv
	local V,F=P.visTime,P.field
	local start=int((P.fieldBeneath+P.fieldUp)/30+1)
	local showInvis=GAME.replaying

	if P.falling==-1 then--Blocks only
		if ENV.upEdge then
			gc_setShader(shader_lighter)
			gc_translate(0,-4)
			--<drawRow>
				for j=start,min(start+21,#F)do drawRow(j,V[j],F[j])end
			--</drawRow>
			gc_setShader(shader_fieldSatur)
			gc_translate(0,4)
		end

		--<drawRow>
			for j=start,min(start+21,#F)do drawRow(j,V[j],F[j],showInvis)end
		--</drawRow>
	else--With falling animation
		local stepY=ENV.smooth and(P.falling/(ENV.fall+1))^2.5*30 or 30
		local alpha=P.falling/ENV.fall
		local h=1
		if ENV.upEdge then
			gc_push('transform')
			gc_setShader(shader_lighter)
			gc_translate(0,-4)
			--<drawRow>
				for j=start,min(start+21,#F)do
					while j==P.clearingRow[h]do
						h=h+1
						gc_translate(0,-stepY)
					end
					drawRow(j,V[j],F[j])
				end
			--</drawRow>
			gc_setShader(shader_fieldSatur)
			gc_pop()
			h=1
		end

		gc_push('transform')
		--<drawRow>
			for j=start,min(start+21,#F)do
				while j==P.clearingRow[h]do
					h=h+1
					gc_translate(0,-stepY)
					gc_setColor(1,1,1,alpha)
					gc_rectangle('fill',0,30-30*j,300,stepY)
				end
				drawRow(j,V[j],F[j],showInvis)
			end
		--</drawRow>
		gc_pop()
	end
	gc_setShader()
end
local function drawFXs(P)
	--LockFX
	for i=1,#P.lockFX do
		local S=P.lockFX[i]
		if S[3]<.5 then
			gc_setColor(1,1,1,2*S[3])
			gc_rectangle('fill',S[1],S[2],60*S[3],30)
		else
			gc_setColor(1,1,1,2-2*S[3])
			gc_rectangle('fill',S[1]+30,S[2],60*S[3]-60,30)
		end
	end

	--DropFX
	for i=1,#P.dropFX do
		local S=P.dropFX[i]
		gc_setColor(1,1,1,.6-S[5]*.6)
		local w=30*S[3]*(1-S[5]*.5)
		gc_rectangle('fill',30*S[1]-30+15*S[3]-w*.5,-30*S[2],w,30*S[4])
	end

	--MoveFX
	local texture=SKIN.curText
	for i=1,#P.moveFX do
		local S=P.moveFX[i]
		gc_setColor(1,1,1,.6-S[4]*.6)
		gc_draw(texture[S[1]],30*S[2]-30,-30*S[3])
	end

	--ClearFX
	for i=1,#P.clearFX do
		local S=P.clearFX[i]
		local t=S[2]
		local x=t<.3 and 1-(3.3333*t-1)^2 or 1
		local y=t<.2 and 5*t or 1-1.25*(t-.2)
		gc_setColor(1,1,1,y)
		gc_rectangle('fill',150-x*150,15-S[1]*30-y*15,300*x,y*30)
	end
end
local drawGhost={
	color=function(P,clr,alpha)
		gc_setColor(1,1,1,alpha)
		local texture=SKIN.curText
		local CB=P.cur.bk
		for i=1,#CB do for j=1,#CB[1]do
			if CB[i][j]then
				gc_draw(texture[clr],30*(j+P.curX-1)-30,-30*(i+P.ghoY-1))
			end
		end end
	end,
	gray=function(P,_,alpha)
		gc_setColor(1,1,1,alpha)
		local texture=SKIN.curText
		local CB=P.cur.bk
		for i=1,#CB do for j=1,#CB[1]do
			if CB[i][j]then
				gc_draw(texture[21],30*(j+P.curX-1)-30,-30*(i+P.ghoY-1))
			end
		end end
	end,
	colorCell=function(P,clr,alpha)
		clr=minoColor[clr]
		gc_setColor(clr[1],clr[2],clr[3],alpha)
		local CB=P.cur.bk
		for i=1,#CB do for j=1,#CB[1]do
			if CB[i][j]then
				gc_rectangle('fill',30*(j+P.curX-1)-30,-30*(i+P.ghoY-1),30,30)
			end
		end end
	end,
	grayCell=function(P,_,alpha)
		gc_setColor(1,1,1,alpha)
		local CB=P.cur.bk
		for i=1,#CB do for j=1,#CB[1]do
			if CB[i][j]then
				gc_rectangle('fill',30*(j+P.curX-1)-30,-30*(i+P.ghoY-1),30,30)
			end
		end end
	end,
	colorLine=function(P,clr,alpha)
		clr=minoColor[clr]
		gc_setColor(clr[1],clr[2],clr[3],alpha)
		gc_setLineWidth(4)
		local CB=P.cur.bk
		for i=1,#CB do for j=1,#CB[1]do
			if CB[i][j]then
				gc_rectangle('line',30*(j+P.curX-1)-30+4,-30*(i+P.ghoY-1)+4,22,22)
			end
		end end
	end,
	grayLine=function(P,_,alpha)
		gc_setColor(1,1,1,alpha)
		gc_setLineWidth(4)
		local CB=P.cur.bk
		for i=1,#CB do for j=1,#CB[1]do
			if CB[i][j]then
				gc_rectangle('line',30*(j+P.curX-1)-30+4,-30*(i+P.ghoY-1)+4,22,22)
			end
		end end
	end,
}
local function drawBlockOutline(P,texture,trans)
	shader_alpha:send('a',trans)
	gc_setShader(shader_alpha)
	local CB=P.cur.bk
	for i=1,#CB do for j=1,#CB[1]do
		if CB[i][j]then
			local x=30*(j+P.curX)-60-3
			local y=30-30*(i+P.curY)-3
			gc_draw(texture,x,y)
			gc_draw(texture,x+6,y+6)
			gc_draw(texture,x+6,y)
			gc_draw(texture,x,y+6)
		end
	end end
	gc_setShader()
end
local function drawBlockShade(P,alpha)
	gc_setColor(1,1,1,alpha)
	local CB=P.cur.bk
	for i=1,#CB do for j=1,#CB[1]do
		if CB[i][j]then
			gc_rectangle('fill',30*(j+P.curX)-60,30-30*(i+P.curY),30,30)
		end
	end end
end
local function drawBlock(P,clr)
	gc_setColor(1,1,1)
	gc_setShader(shader_blockSatur)
	local texture=SKIN.curText[clr]
	local CB=P.cur.bk
	for i=1,#CB do for j=1,#CB[1]do
		if CB[i][j]then
			gc_draw(texture,30*(j+P.curX-1)-30,-30*(i+P.curY-1))
		end
	end end
	gc_setShader()
end
local function drawNextPreview(P,B)
	gc_setColor(1,1,1,.8)
	local y=int(P.gameEnv.fieldH+1-modf(B.sc[1]))+ceil(P.fieldBeneath/30)
	B=B.bk
	local x=int(6-#B[1]*.5)
	local cross=TEXTURE.puzzleMark[-1]
	for i=1,#B do for j=1,#B[1]do
		if B[i][j]then
			gc_draw(cross,30*(x+j-2),30*(1-y-i))
		end
	end end
end
local function drawBuffer(P)
	local h=0
	for i=1,#P.atkBuffer do
		local A=P.atkBuffer[i]
		local bar=A.amount*30
		if h+bar>600 then bar=600-h end
		if not A.sent then
			--Appear
			if A.time<20 then
				bar=bar*(20*A.time)^.5*.05
			end
			if A.countdown>0 then
				--Timing
				gc_setColor(attackColor[A.lv][1])
				gc_rectangle('fill',303,599-h,11,-bar)
				gc_setColor(1,1,1)
				for j=30,A.cd0-30,30 do
					gc_rectangle('fill',303,599-h-bar*(j/A.cd0),6,2)
				end
				gc_setColor(attackColor[A.lv][2])
				gc_rectangle('fill',303,599-h-bar,11,bar*(1-A.countdown/A.cd0))
			else
				--Warning
				local a=math.sin((TIME()-i)*30)*.5+.5
				local c1,c2=attackColor[A.lv][1],attackColor[A.lv][2]
				gc_setColor(c1[1]*a+c2[1]*(1-a),c1[2]*a+c2[2]*(1-a),c1[3]*a+c2[3]*(1-a))
				gc_rectangle('fill',303,599-h,11,-bar)
			end
		else
			gc_setColor(attackColor[A.lv][1])
			bar=bar*(20-A.time)*.05
			gc_rectangle('fill',303,599-h,11,-bar)
			--Disappear
		end
		h=h+bar
	end
	if P.gameEnv.bufferWarn then
		local sum=P.atkBufferSum1
		if sum>=8 then
			gc_push('transform')
			gc_translate(300,max(0,600-30*sum))
			gc_scale(min(.2+sum/50,1))
			gc_setColor(1,.2+min(sum*.02,.8)*(.5+.5*sin(TIME()*min(sum,32))),.2,min(sum/30,.8))
			setFont(100)
			if sum>20 then
				local d=P.atkBufferSum-sum
				if d>.5 then
					gc_translate(d^.5*(rnd()-.5)*15,d^.5*(rnd()-.5)*15)
				end
			end
			gc_printf(int(sum),-300,-20,292,'right')
			gc_pop()
		end
	end
end
local function drawB2Bbar(P)
	local a,b=P.b2b,P.b2b1 if a>b then a,b=b,a end
	gc_setColor(.8,1,.2)
	gc_rectangle('fill',-14,599,11,-b*.6)
	gc_setColor(P.b2b<40 and COLOR.Z or P.b2b<=800 and COLOR.lR or COLOR.lB)
	gc_rectangle('fill',-14,599,11,-a*.6)
	if TIME()%.5<.3 then
		gc_setColor(1,1,1)
		gc_rectangle('fill',-15,b<40 and 568.5 or 118.5,13,3)
	end
end
local function drawLDI(P,ENV)--Lock Delay Indicator
	if ENV.easyFresh then
		gc_setColor(1,1,1)
	else
		gc_setColor(1,.26,.26)
	end
	if P.lockDelay>=0 then
		gc_rectangle('fill',0,602,300*P.lockDelay/ENV.lock,6)--Lock delay indicator
	end
	if P.freshTime>0 then
		LDmarks:setDrawRange(1,min(P.freshTime,15))
		gc_draw(LDmarks)
	end
end
local function drawHold(P)
	local ENV=P.gameEnv
	if ENV.holdCount==0 then return end

	local holdQueue=P.holdQueue
	local N=ENV.holdCount*72
	gc_push('transform')
	gc_translate(-140,20)
		gc_setColor(0,0,0,.4)gc_rectangle('fill',0,0,124,N+8)
		gc_setColor(1,1,1)gc_rectangle('line',0,0,124,N+8)
		if #holdQueue<ENV.holdCount and P.nextQueue[1]then
			N=1
		else
			N=P.holdTime+1
		end
		gc_push('transform')
			gc_translate(62,40)
			gc_setShader(shader_blockSatur)
			for n=1,#holdQueue do
				if n==N then gc_setColor(.6,.4,.4)end
				local bk,clr=holdQueue[n].bk,holdQueue[n].color
				local texture=SKIN.curText[clr]
				local k=#bk>2 and 2.2/#bk or 1
				gc_scale(k)
				for i=1,#bk do for j=1,#bk[1]do
					if bk[i][j]then
						gc_draw(texture,30*(j-#bk[1]*.5)-30,-30*(i-#bk*.5))
					end
				end end
				gc_scale(1/k)
				gc_translate(0,72)
			end
			gc_setShader()
		gc_pop()
	gc_pop()
end
local function drawDial(x,y,speed)
	gc_setColor(1,1,1)
	setFont(25)mStr(int(speed),x,y-18)
	gc_draw(dialFrame,x,y,nil,nil,nil,35,35)
	gc_draw(IMG.dialNeedle,x,y,2.094+(speed<=175 and .02094*speed or 4.712-52.36/(speed-125)),nil,nil,5,4)
end
local function drawFinesseCombo_norm(P)
	if P.finesseCombo>2 then
		local S=P.stat
		local t=P.finesseComboTime
		local str=P.finesseCombo.."x"
		if S.finesseRate==5*S.piece then
			gc_setColor(.9,.9,.3,t*.2)
			gc_print(str,20,570)
			gc_setColor(.9,.9,.3,1.2-t*.1)
		elseif S.maxFinesseCombo==S.piece then
			gc_setColor(.7,.7,1,t*.2)
			gc_print(str,20,570)
			gc_setColor(.7,.7,1,1.2-t*.1)
		else
			gc_setColor(1,1,1,t*.2)
			gc_print(str,20,570)
			gc_setColor(1,1,1,1.2-t*.1)
		end
		gc_print(str,20,600,nil,1+t*.08,nil,0,30)
	end
end
local function drawFinesseCombo_remote(P)
	if P.finesseCombo>2 then
		local S=P.stat
		if S.finesseRate==5*S.piece then
			gc_setColor(.9,.9,.3)
		elseif S.maxFinesseCombo==S.piece then
			gc_setColor(.7,.7,1)
		else
			gc_setColor(1,1,1)
		end
		gc_print(P.finesseCombo.."x",20,570)
	end
end
local function drawLife(life)
	gc_setColor(1,1,1)
	gc_draw(IMG.lifeIcon,475,595,nil,.8)
	if life>3 then
		gc_draw(multiple,502,602)
		setFont(20)gc_print(life,517,595)
	else
		if life>1 then gc_draw(IMG.lifeIcon,500,595,nil,.8)end
		if life>2 then gc_draw(IMG.lifeIcon,525,595,nil,.8)end
	end
end
local function drawMission(P)
	if not P.curMission then return end
	local L=P.gameEnv.mission
	local cur=P.curMission

	--Draw current mission
	setFont(35)
	if P.gameEnv.missionkill then
		gc_setColor(1,.7+.2*sin(TIME()*6.26),.4)
	else
		gc_setColor(1,1,1)
	end
	gc_print(missionEnum[L[cur]],85,110)

	--Draw next mission
	setFont(20)
	for i=1,3 do
		local m=L[cur+i]
		if m then
			m=missionEnum[m]
			gc_print(m,87-28*i,117)
		else
			break
		end
	end
end
local function drawStartCounter(P)
	local count=179-P.frameRun
	gc_push('transform')
		gc_translate(300,300)
		local num=int(count/60)+1
		local d=count%60
		if num==3 then
			gc_setColor(.7,.8,.98)
			if d>45 then gc_rotate((d-45)^2*.00355)end
		elseif num==2 then
			gc_setColor(.98,.85,.75)
			if d>45 then gc_scale(1+(d/15-3)^2,1)end
		elseif num==1 then
			gc_setColor(1,.7,.7)
			if d>45 then gc_scale(1,1+(d/15-3)^2)end
		end
		if d<20 then gc_scale((d/20)^.4)end
		setFont(100)
		mStr(num,0,-70)
	gc_pop()
end

local draw={}
draw.applyFieldOffset=applyFieldOffset
draw.drawGhost=drawGhost
function draw.drawNext_norm(P)
	local ENV=P.gameEnv
	local texture=SKIN.curText
	gc_translate(316,20)
		local N=ENV.nextCount*72
		gc_setColor(0,0,0,.4)gc_rectangle('fill',0,0,124,N+8)
		gc_setColor(1,1,1)gc_rectangle('line',0,0,124,N+8)
		N=1
		gc_push('transform')
			gc_translate(62,40)
			gc_setShader(shader_blockSatur)
			while N<=ENV.nextCount and P.nextQueue[N]do
				local bk,sprite=P.nextQueue[N].bk,texture[P.nextQueue[N].color]
				local k=#bk>2 and 2.2/#bk or 1
				gc_scale(k)
				for i=1,#bk do for j=1,#bk[1]do
					if bk[i][j]then
						gc_draw(sprite,30*(j-#bk[1]*.5)-30,-30*(i-#bk*.5))
					end
				end end
				gc_scale(1/k)
				N=N+1
				gc_translate(0,72)
			end
			gc_setShader()
		gc_pop()

		if ENV.bagLine then
			gc_setColor(.8,.5,.5)
			for i=-P.pieceCount%ENV.bagLine,N-1,ENV.bagLine do--i=phase
				gc_rectangle('fill',2,72*i+3,120,2)
			end
		end
	gc_translate(-316,-20)
end
function draw.drawNext_hidden(P)
	local ENV=P.gameEnv
	local texture=SKIN.curText
	gc_translate(316,20)
		local N=ENV.nextCount*72
		gc_setColor(.5,0,0,.4)gc_rectangle('fill',0,0,124,N+8)
		gc_setColor(1,1,1)gc_rectangle('line',0,0,124,N+8)
		N=min(ENV.nextStartPos,P.pieceCount+1)
		gc_push('transform')
			gc_translate(62,40)
			gc_setShader(shader_blockSatur)
			local queue=P.nextQueue
			while N<=ENV.nextCount and queue[N]do
				local bk,sprite=queue[N].bk,texture[queue[N].color]
				local k=#bk>2 and 2.2/#bk or 1
				gc_scale(k)
				for i=1,#bk do for j=1,#bk[1]do
					if bk[i][j]then
						gc_draw(sprite,30*(j-#bk[1]*.5)-30,-30*(i-#bk*.5))
					end
				end end
				gc_scale(1/k)
				N=N+1
				gc_translate(0,72)
			end
			gc_setShader()
		gc_pop()

		if ENV.bagLine then
			gc_setColor(.8,.5,.5)
			for i=-P.pieceCount%ENV.bagLine,N-1,ENV.bagLine do--i=phase
				gc_rectangle('fill',2,72*i+3,120,2)
			end
		end
	gc_translate(-316,-20)
end
function draw.drawTargetLine(P,r)
	local d=P.fieldBeneath+P.fieldUp
	if r<21+d/30 and r>0 then
		gc_setLineWidth(3)
		gc_setColor(1,r>10 and 0 or .2+.8*rnd(),.5)
		gc_push('transform')
		applyFieldOffset(P)
		r=600-30*(r)+d
		gc_line(0,r,300,r)
		gc_pop()
	end
end

function draw.norm(P)
	local ENV=P.gameEnv
	local FBN,FUP=P.fieldBeneath,P.fieldUp
	local t=TIME()
	gc_push('transform')
		gc_translate(P.x,P.y)
		gc_scale(P.size)

		--Field-related things
		gc_push('transform')
			applyFieldOffset(P)

			--Draw username
			setFont(30)
			gc_setColor(1,1,1)
			mStr(P.username,150,-60)

			--Fill field
			gc_setColor(0,0,0,.6)
			gc_rectangle('fill',0,-10,300,610)

			--Stenciled in-field things
			gc_stencil(stencilBoard)
			gc_setStencilTest('equal',1)
			gc_push('transform')
				boardTransform(ENV.flipBoard)

				--Draw grid
				if ENV.grid then
					gc_setColor(1,1,1,ENV.grid)
					gc_draw(gridLines,0,(FBN+FUP+10)%30-50)
				end

				--Move camera
				gc_translate(0,600+FBN+FUP)

				local fieldTop=-ENV.fieldH*30
				--Draw dangerous area
				gc_setColor(1,0,0,.3)
				gc_rectangle('fill',0,fieldTop,300,-FUP-FBN-fieldTop-620)

				--Draw field
				drawField(P)

				--Draw spawn line
				gc_setLineWidth(4)
				gc_setColor(1,sin(t)*.4+.5,0,.5)
				gc_rectangle('fill',0,fieldTop-FBN-2,300,4)

				--Draw height limit line
				gc_setColor(.4,.7+sin(t*12)*.3,1,.7)
				gc_rectangle('fill',0,-ENV.heightLimit*30-FBN-2,300,4)

				--Draw FXs
				drawFXs(P)

				--Draw current block
				if P.cur and P.waiting==-1 then
					local curColor=P.cur.color

					local trans=P.lockDelay/ENV.lock
					local centerX=30*(P.curX+P.cur.sc[2])-15

					--Draw ghost & rotation center
					if ENV.ghost then
						drawGhost[ENV.ghostType](P,curColor,ENV.ghost)
						if ENV.center then
							gc_setColor(1,1,1,ENV.center)
							gc_draw(spinCenterImg,centerX,-30*(P.ghoY+P.cur.sc[1])+15,nil,nil,nil,4,4)
						end
					elseif GAME.replaying then
						drawGhost.gray(P,nil,.15)
					end

					local dy=ENV.smooth and P.ghoY~=P.curY and(P.dropDelay/ENV.drop-1)*30 or 0
					gc_translate(0,-dy)
						--Draw block & rotation center
						if ENV.block then
							drawBlockOutline(P,SKIN.curText[curColor],trans)
							drawBlock(P,curColor)
							if ENV.center then
								gc_setColor(1,1,1,ENV.center)
								gc_draw(spinCenterImg,centerX,-30*(P.curY+P.cur.sc[1])+15,nil,nil,nil,4,4)
							end
						elseif GAME.replaying then
							drawBlockShade(P,trans*.3)
						end
					gc_translate(0,dy)
				end

				--Draw next preview
				if ENV.nextPos and P.nextQueue[1]then
					drawNextPreview(P,P.nextQueue[1])
				end

				--Draw AI's drop destination
				if P.AI_dest then
					local texture=TEXTURE.puzzleMark[21]
					local L=P.AI_dest
					for i=1,#L,2 do
						gc_draw(texture,30*L[i],-30*L[i+1]-30)
					end
				end
			gc_pop()
			gc_setStencilTest()

			gc_setLineWidth(2)
			P:drawNext()
			drawHold(P)
			drawBuffer(P)
			drawB2Bbar(P)
			drawLDI(P,ENV)

			--Draw boarders
			gc_setColor(P.frameColor)
			gc_draw(playerBoarders,-17,-12)

			--Draw target selecting pad
			if GAME.modeEnv.royaleMode then
				if P.atkMode then
					gc_setColor(1,.8,0,P.swappingAtkMode*.02)
					gc_rectangle('fill',RCPB[2*P.atkMode-1],RCPB[2*P.atkMode],90,35,8,4)
				end
				gc_setColor(1,1,1,P.swappingAtkMode*.025)
				setFont(35)
				for i=1,4 do
					gc_rectangle('line',RCPB[2*i-1],RCPB[2*i],90,35,8,4)
					gc_printf(text.atkModeName[i],RCPB[2*i-1]-4,RCPB[2*i]+4,200,"center",nil,.5)
				end
			end

			--Board cover
			if ENV.hideBoard then
				gc_stencil(hideBoardStencil[ENV.hideBoard])
				gc_setStencilTest('equal',1)
				gc_setLineWidth(20)
				for i=0,24 do
					gc_setColor(COLOR.rainbow_gray(t*.626+i*.1))
					gc_line(20*i-190,-2,20*i+10,602)
				end
				gc_setStencilTest()
			end

			--Spike
			local sp,spt=P.spike,P.spikeTime
			if ENV.showSpike and spt>0 and sp>=10 then
				local rg=10/sp
				gc_setColor(rg,rg,1,min(spt/30,.8))
				local x,y=150,100
				if spt>85 then
					local d=2*(spt-85)*min(sp/50,1)
					x,y=x+(rnd()-.5)*d,y+(rnd()-.5)*d
				end
				mDraw(P.spikeText,x,y,nil,min(.3+(sp/26)*.4+spt/100*.3,1))
			end

			--Bonus texts
			TEXT.draw(P.bonus)

			--Display Ys
			-- gc_setLineWidth(6)
			-- if P.curY then gc_setColor(COLOR.R)	gc_line(0,611-P.curY*30,300,610-P.curY*30)end
			-- if P.ghoY then gc_setColor(COLOR.G)	gc_line(0,615-P.ghoY*30,300,615-P.ghoY*30)end
			-- if P.minY then gc_setColor(COLOR.B)	gc_line(0,619-P.minY*30,300,620-P.minY*30)end
			-- 										gc_line(0,600-P.garbageBeneath*30,300,600-P.garbageBeneath*30)
		gc_pop()

		--Mode informations
		if GAME.curMode.mesDisp then
			gc_setColor(1,1,1)
			GAME.curMode.mesDisp(P)
		end

		--Speed dials & FinesseCombo
		if P.type=='remote'then
			drawDial(535,545,P.dropSpeed)
			drawFinesseCombo_remote(P)
		else
			drawDial(510,515,P.dropSpeed)
			drawDial(555,570,P.keySpeed)
			gc_draw(bpmImage,540,490)
			gc_draw(kpmImage,494,583)
			drawFinesseCombo_norm(P)
		end

		--Score & Time
		setFont(25)
		local tm=int(P.stat.time*100)*.01
		gc_setColor(0,0,0,.3)
		gc_print(P.score1,18,509)
		gc_print(tm,18,539)
		gc_setColor(COLOR.lY)gc_print(P.score1,20,510)
		gc_setColor(COLOR.N)gc_print(tm,20,540)

		if P.life>0 then drawLife(P.life)end
		drawMission(P)
		if P.frameRun<180 then drawStartCounter(P)end
	gc_pop()
end
function draw.small(P)
	--Update canvas
	P.frameWait=P.frameWait-1
	if P.frameWait==0 then
		P.frameWait=10
		gc_setCanvas(P.canvas)
		gc_clear(0,0,0,.4)
		gc_push('transform')
		gc_origin()
		gc_setColor(1,1,1,P.result and max(20-P.endCounter,0)*.05 or 1)

		--Field
		local F=P.field
		local texture=SKIN.curTextMini
		for j=1,#F do
			for i=1,10 do if F[j][i]>0 then
				gc_draw(texture[F[j][i]],6*i-6,120-6*j)
			end end
		end

		--Draw boarder
		if P.alive then
			gc_setLineWidth(2)
			gc_setColor(P.frameColor)
			gc_rectangle('line',0,0,60,120)
		end

		--Draw badge
		if GAME.modeEnv.royaleMode then
			gc_setColor(1,1,1)
			for i=1,P.strength do
				gc_draw(IMG.badgeIcon,12*i-7,4,nil,.5)
			end
		end

		--Draw result
		if P.result then
			gc_setColor(1,1,1,min(P.endCounter,60)*.01)
			setFont(20)mDraw(drawableText[P.result],30,60,nil,P.size)
			setFont(15)mStr(P.modeData.place,30,82)
		end
		gc_pop()
		gc_setCanvas()
	end

	--Draw Canvas
	gc_setColor(1,1,1)
	local size=P.size
	gc_draw(P.canvas,P.x,P.y,nil,size*10)
	if P.killMark then
		gc_setColor(1,0,0)
		gc_rectangle('fill',P.x+40*size,P.y+40*size,160*size,160*size)
	end
end
function draw.demo(P)
	local _
	local ENV=P.gameEnv
	local curColor=P.cur.color

	--Camera
	gc_push('transform')
		gc_translate(P.x,P.y)
		gc_scale(P.size)
		gc_push('transform')
			applyFieldOffset(P,true)

			--Frame
			gc_setColor(0,0,0,.6)
			gc_rectangle('fill',0,0,300,600)
			gc_setLineWidth(2)
			gc_setColor(1,1,1)
			gc_rectangle('line',-1,-1,302,602)

			gc_push('transform')
				gc_translate(0,600)
				drawField(P)
				drawFXs(P)
				if P.cur and P.waiting==-1 then
					if ENV.ghost then drawGhost[ENV.ghostType](P,curColor,ENV.ghost)end
					if ENV.block then
						local dy=ENV.smooth and P.ghoY~=P.curY and(P.dropDelay/ENV.drop-1)*30 or 0
						gc_translate(0,-dy)
						drawBlockOutline(P,SKIN.curText[curColor],P.lockDelay/ENV.lock)
						drawBlock(P,curColor)
						gc_translate(0,dy)
					end
				end
			gc_pop()

			local blockImg=TEXTURE.miniBlock
			local skinSet=ENV.skin
			--Draw hold
			local N=1
			while P.holdQueue[N]do
				local id=P.holdQueue[N].id
				_=minoColor[skinSet[id]]
				gc_setColor(_[1],_[2],_[3],.3)
				_=blockImg[id]
				gc_draw(_,15,40*N-10,nil,16,nil,0,_:getHeight()*.5)
				N=N+1
			end

			--Draw next
			N=1
			while N<=ENV.nextCount and P.nextQueue[N]do
				local id=P.nextQueue[N].id
				_=minoColor[skinSet[id]]
				gc_setColor(_[1],_[2],_[3],.3)
				_=blockImg[id]
				gc_draw(_,285,40*N-10,nil,16,nil,_:getWidth(),_:getHeight()*.5)
				N=N+1
			end
		gc_pop()
		TEXT.draw(P.bonus)
	gc_pop()
end

return draw