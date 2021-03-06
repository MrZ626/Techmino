local pc_drop={50,45,40,35,30,26,22,18,15,12}
local pc_lock={55,50,46,42,39,36,33,31,29,27}
local pc_fall={18,16,14,12,10,9,8,7,6,5}
local PCbase=require"parts.modes.PCbase"
local PClist=require"parts.modes.PClist"

local function task_PC(P)
	P.control=false
	for _=1,26 do YIELD()end
	P.control=true
	local base=PCbase[P.modeData.type]
	P:pushLineList(base[P.holeRND:random(#base)],P.modeData.symmetry)
end
local function check(P)
	local f=P.field
	if #f>0 then
		if #f+P.stat.row%4>4 then
			P:lose()
		end
	else
		local type=P.stat.pc<10 and 4 or 5
		local L=PClist[type][P.holeRND:random(#PClist[type])]
		local symmetry=P.holeRND:random()>.5
		P.modeData.type=type
		P.modeData.symmetry=symmetry
		P:pushNextList(L,symmetry)
		P.modeData.counter=P.stat.piece==0 and 20 or 0
		P:newTask(task_PC)

		local s=P.stat.pc*.25
		if math.floor(s)==s and s>0 then
			P.gameEnv.drop=pc_drop[s]or 10
			P.gameEnv.lock=pc_lock[s]or 25
			P.gameEnv.fall=pc_fall[s]or 4
			if s==10 then
				P:showTextF(text.maxspeed,0,-140,100,'appear',.6)
			end
		end
	end
end

return{
	color=COLOR.red,
	env={
		nextCount=5,
		holdCount=0,
		drop=60,lock=60,
		fall=20,
		sequence='none',
		freshLimit=15,
		dropPiece=check,
		RS="SRS",
		bg='rgb',bgm='oxygen',
	},
	pauseLimit=true,
	load=function()
		PLY.newPlayer(1)
		check(PLAYERS[1])
	end,
	mesDisp=function(P)
		setFont(70)
		mStr(P.stat.pc,69,300)
		mText(drawableText.pc,69,380)
	end,
	score=function(P)return{P.stat.pc,P.stat.time}end,
	scoreDisp=function(D)return D[1].." PCs   "..STRING.time(D[2])end,
	comp=function(a,b)return a[1]>b[1]or a[1]==b[1]and a[2]<b[2]end,
	getRank=function(P)
		local L=P.stat.pc
		return
		L>=50 and 5 or
		L>=42 and 4 or
		L>=26 and 3 or
		L>=18 and 2 or
		L>=10 and 1 or
		L>=3 and 0
	end,
}