local gc=love.graphics
local dropSpeed={50,40,30,24,18,14,10,8,6,5,4,3,2,1,1,.5,.5,.25,.25}

return{
	color=COLOR.green,
	env={
		noTele=true,
		mindas=7,minarr=1,minsdarr=1,
		drop=60,wait=8,fall=20,
		task=function(P)P.modeData.target=10 end,
		dropPiece=function(P)
			if P.stat.row>=P.modeData.target then
				if P.modeData.target==200 then
					P:win('finish')
				else
					P.gameEnv.drop=dropSpeed[P.modeData.target/10]
					P.modeData.target=P.modeData.target+10
					SFX.play('reach')
				end
			end
		end,
		noInitSZO=true,
		bg='bg2',bgm='push',
	},
	pauseLimit=true,
	slowMark=true,
	load=function()
		PLY.newPlayer(1)
	end,
	mesDisp=function(P)
		setFont(45)
		mStr(P.stat.row,69,320)
		mStr(P.modeData.target,69,370)
		gc.rectangle('fill',25,375,90,4)
	end,
	score=function(P)return{math.min(P.stat.row,200),P.stat.time}end,
	scoreDisp=function(D)return D[1].." Lines   "..STRING.time(D[2])end,
	comp=function(a,b)return a[1]>b[1]or a[1]==b[1]and a[2]<b[2]end,
	getRank=function(P)
		local L=P.stat.row
		if L>=200 then
			local T=P.stat.time
			return
			T<=240 and 5 or
			T<=360 and 4 or
			3
		else
			return
			L>=150 and 2 or
			L>=100 and 1 or
			L>=20 and 0
		end
	end,
}