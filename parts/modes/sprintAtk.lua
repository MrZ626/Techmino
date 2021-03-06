return{
	color=COLOR.green,
	env={
		infHold=true,
		drop=1e99,lock=1e99,
		dropPiece=function(P)if P.stat.atk>=100 then P:win('finish')end end,
		bg='matrix',bgm='new era',
	},
	load=function()
		PLY.newPlayer(1)
	end,
	mesDisp=function(P)
		setFont(45)
		mStr(("%.1f"):format(P.stat.atk),69,190)
		mStr(("%.2f"):format(P.stat.atk/P.stat.row),69,310)
		mText(drawableText.atk,69,243)
		mText(drawableText.eff,69,363)
	end,
	score=function(P)return{P.stat.atk<=100 and math.floor(P.stat.atk)or 100,P.stat.time}end,
	scoreDisp=function(D)return D[1].." Attack  "..STRING.time(D[2])end,
	comp=function(a,b)return a[1]>b[1]or a[1]==b[1]and a[2]<b[2]end,
	getRank=function(P)
		if P.stat.atk<40 then return end
		local T=P.stat.time
		return
		T<40 and 5 or
		T<50 and 4 or
		T<70 and 3 or
		T<100 and 2 or
		T<150 and 1 or
		0
	end,
}