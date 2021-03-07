local c=COLOR
return{
	back="Back",
	anykey="Press any button",
	sureQuit="Press again to exit",
	newVersion="Thanks for updating! Check out the updates below.",
	httpTimeout="Network connection timed out",
	newDay="[Anti-addiction] New day, new beginning!",
	playedLong="[Anti-addiction] You've been playing quite a bit today. Make sure to take breaks.",
	playedTooMuch="[Anti-addiction] You've been playing too much today! You can't play any more.",

	atkModeName={"Random","Badges","K.O.s","Attackers"},
	royale_remain="$1 Players Remaining",
	cmb={nil,"1 Combo","2 Combo","3 Combo","4 Combo","5 Combo","6 Combo","7 Combo","8 Combo","9 Combo","10 Combo!","11 Combo!","12 Combo!","13 Combo!","14 Combo!!","15 Combo!!","16 Combo!!","17 Combo!!!","18 Combo!!!","19 Combo!!!","MEGACMB"},
	spin="-Spin ",
	clear={"Single","Double","Triple","Techrash","Pentacrash","Hexacrash"},
	mini="Mini",b2b="B2B ",b3b="B2B2B ",
	PC="Perfect Clear",HPC="Clear",
	hold="HOLD",next="NEXT",

	stage="Stage $1",
	great="Great!",
	awesome="Awesome!",
	almost="Almost!",
	continue="Keep going!",
	maxspeed="Max speed!",
	speedup="Speed up!",
	missionFailed="Wrong Clear",

	speedLV="speed level",
	line="Lines",atk="Attack",eff="Efficiency",
	rpm="RPM",tsd="TSD",
	grade="Grade",techrash="Techrash",
	wave="Wave",nextWave="Next",
	combo="Combo",maxcmb="Max Combo",
	pc="Perfect Clear",ko="KO",

	win="You Win!",
	finish="Finish",
	gameover="Game Over",
	pause="Pause",
	pauseCount="Pauses",
	finesse_ap="All Perfect",
	finesse_fc="Full Combo",

	page="Page:",

	ai_fixed="The AI is incompatible with fixed sequences.",
	ai_prebag="The AI is incompatible with custom sequences.",
	ai_mission="The AI is incompatible with custom missions.",
	saveDone="Data Saved",
	saveError="Failed to save:",
	loadError="Failed to read:",
	switchSpawnSFX="Switch on spawn SFX to play",
	ranks={"D","C","B","A","S"},

	needRestart="Effective after restart",

	exportSuccess="Exported successfully",
	importSuccess="Imported successfully",
	dataCorrupted="Data corrupted",

	VKTchW="Touch Weight",
	VKOrgW="Origin Weight",
	VKCurW="Cur. Pos. Weight",

	noScore="No Scores Yet",
	highScore="Personal Bests",
	newRecord="New Record!",

	getNoticeFail="Couldn't get announcements",
	getVersionFail="Unable to detect a new version",
	oldVersion="Version $1 is available now!",

	httpCode="Http status code",
	jsonError="Json error",

	noUsername="Please enter your username",
	wrongEmail="Wrong email address",
	noPassword="Please enter your password",
	diffPassword="Passwords don't match",
	registerSuccessed="Successfully registered!",
	registerFailed="Registration failed",
	loginSuccessed="Successfully logged in!",
	loginFailed="Login failed",
	accessSuccessed="Successfully authorized!",
	accessFailed="Authorization failed",
	wsSuccessed="WebSocket: connected",
	wsFailed="WebSocket: connection failed",
	wsDisconnected="WebSocket: disconnected",
	wsNoConn="WebSocket: you are not connected",
	wsClose="WebSocket closed: ",
	waitNetTask="Connecting, please wait",

	createRoomTooFast="Create room too fast!",
	createRoomSuccessed="Room successfully created!",
	joinRoom="joined the room.",
	leaveRoom="left the room.",
	notReady="Waiting",
	beReady="Ready",
	champion="$1 won",
	chatRemain="Online: ",
	chatStart="------Beginning of log------",
	chatHistory="------New messages below------",

	noRooms="No Rooms Now",
	roomsCreateFailed="Failed to create room",
	roomsFetchFailed="Failed to fetch rooms",

	errorMsg="An error has occurred and Techmino needs to restart.\nError info has been created, and you can send it to the author.",

	modInstruction="Select mods (modifiers) to use!\nMods will modify the game in different ways\n(and possibly break the game in weird ways).\nSome mods will make your game unranked.",
	modInfo={
		next="Next\nOverride the Next queue length",
		hold="Hold\nOverride the Hold queue length",
		hideNext="Hidden Next\nHide a few upcoming Next preview pieces",
		infHold="Infinite Hold\nYou can use the Hold function infinitely.",
		hideBlock="Hide current block:\nMake the piece you are controlling invisible",
		hideGhost="Hide ghost\nMake ghost invisible",
		hidden="Hide dropped blocks\nPieces fade disappear after lockdown",
		hideBoard="Hide board\nHide part of the board, or the entire board",
		flipBoard="Flip board\nFlip or rotate the board.",
		dropDelay="Falling speed\nOverride falling speed (unit: frames/block)",
		lockDelay="Lockdown delay\nOverride lockdown delay (unit: frames)",
		waitDelay="Spawn delay\nOverride spawn delay (unit: frames)",
		fallDelay="Line delay\nOverride line delay (unit: frames)",
		life="Life\nOverride number of lives players begin with",
		forceB2B="B2B only\nGame ends when B2B gauge drops below startup line",
		forceFinesse="Finesse only\nGame ends on finesse fault",
		tele="Teleport\nForce 0 DAS and 0 ARR movement",
		noRotation="No rotation\nRotation buttons are disabled",
		noMove="No movement\nLeft and right movement buttons are disabled",
		customSeq="Randomizer\nOverride the randomizer for the game",
		pushSpeed="Garbage speed\nOverride the speed at which garbage lines rise (unit: blocks/frame)",
		boneBlock="Bone\nPlay with the bone block skin",
	},
	pauseStat={
		"Time:",
		"Key/Rot./Hold:",
		"Piece:",
		"Row/Dig:",
		"Attack/DigAtk:",
		"Received:",
		"Clears:",
		"Spins:",
		"B2B/B3B/PC/HPC:",
		"Finesse:",
	},
	radar={"DEF","OFF","ATK","SEND","SPD","DIG"},
	radarData={
		"D'PM",
		"ADPM",
		"APM",
		"SPM",
		"L'PM",
		"DPM",
	},
	stat={
		"Times Launched:",
		"Play Count:",
		"Play Time:",
		"Key/Rot./Hold:",
		"Block/Row/Atk.:",
		"Recv./Res./Asc.:",
		"Dig/Dig Atk.:",
		"Eff./Dig Eff.:",
		"B2B/B3B:",
		"PC/HPC:",
		"FnsErrs./FnsRate:",
	},
	help={
		"Now you can play this - you probably do not need \"help\"?",
		"This is just an ordinary block game, not a certain one.",
		"It plays like TO/C2/KOS/TGM3 and others.",
		"",
		"Powered by Love 2D Engine",
		"Please send bugs or suggestions to the author.",
		"Make sure to only obtain the game from official sources;",
		"binaries obtained elsewhere might contain malware.",
		"The author is not responsible for any modified binaries.",
		"While the game is free, donations are appreciated."
	},
	staff={
		"Author: MrZ  E-mail: 1046101471@qq.com",
		"Powered by LOVE2D",
		"",
		"Program: MrZ, Particle_G, [T9972, FinnTenzor]",
		"Art: MrZ, ScF, [Gnyar, T0722]",
		"Music: MrZ, [T0722]",
		"Voice & Sound: Miya, Naki, MrZ",
		"Test: 思竣  Performance: 模电, HBM",
		"Translate: User670, MattMayuga, Mizu, Mr.Faq, ScF",
		"",
		"Special Thanks:",
		"User670, Big_True, Flyz, Farter,",
		"蕴空之灵, Teatube, [All test staff]",
	},
	used=[[
	Tools used:
		Beepbox
		GFIE
		Goldwave
	Libs used:
		Cold_Clear [MinusKelvin]
		json.lua [rxi]
		profile.lua [itraykov]
		simple-love-lights [dylhunn]
	]],
	support="Support author",
	group="Join our Discord: discord.gg/f9pUvkh",
	WidgetText={
		main={
			offline="Single",
			online="Multi",
			custom="Custom",
			stat="Statistics",
			setting="Settings",
			qplay="Q. Play",
			lang="言/A",
			help="Help",
			quit="Exit",
			music="Music Room",
			sound="SE Room",
		},
		main_simple={
			sprint="Sprint",
			marathon="Marathon",
		},
		mode={
			mod="Mods (F1)",
			start="Start",
		},
		mod={
			title="Mods",
			reset="Reset (tab)",
			unranked="Unranked",
		},
		pause={
			setting="Settings (S)",
			replay="Replay (P)",
			save="Save (O)",
			resume="Resume (esc)",
			restart="Retry (R)",
			quit="Quit (Q)",
		},
		net_menu={
			ffa="FFA",
			rooms="Rooms",
			chat="Chat",
		},
		net_rooms={
			fresh="Fresh",
			new="New room",
			join="Join",
			up="↑",
			down="↓",
		},
		net_game={
			ready="Ready",
		},
		net_chat={
			send="Send",
		},
		setting_game={
			title="Game Settings",
			graphic="←Video",
			sound="Sound→",

			ctrl="Control Settings",
			key="Key Mappings",
			touch="Touch Settings",
			reTime="Start Delay",
			RS="Rotation System",
			layout="Layout",
			autoPause="Pause when focus is lost",
			swap="Key Combination (Change Atk. Mode)",
			fine="Finesse Error Sound",
			appLock="App Lock (Password: 2+6)",
			simpMode="Simple mode",
		},
		setting_video={
			title="Video Settings",
			sound="←Sound",
			game="Game→",

			block="Draw Block",
			ghost="Ghost",
			center="Center",

			smooth="Smooth Drop",
			grid="Grid",
			upEdge="3D Block",
			bagLine="Bag Line",

			lockFX="Lock FX Level",
			dropFX="Drop FX Level",
			moveFX="Move FX Level",
			clearFX="Clear FX Level",
			splashFX="Splash FX Level",
			shakeFX="Field Sway Level",
			atkFX="Atk. FX Level",
			frame="Render Frame Rate",

			text="Action Text",
			score="Score Pop-up",
			warn="Danger Alert",
			highCam="Birds-eye View",
			nextPos="Next Preview",
			fullscreen="Full Screen",
			bg="Background",
			power="Power Info",
		},
		setting_sound={
			title="Sound Settings",

			game="←Game",
			graphic="Video→",

			sfx="SFX",
			spawn="Spawning",
			warn="Warning",
			bgm="BGM",
			stereo="Stereo",
			vib="Vibration",
			voc="Voice",
			cv="Voice Pack",
			apply="Apply",
		},
		setting_control={
			title="Control Settings",
			preview="Preview",

			das="DAS",arr="ARR",dascut="DAS cut",
			sddas="Soft Drop DAS",sdarr="Soft Drop ARR",
			ihs="Initial Hold",
			irs="Initial Rotation",
			ims="Initial Movement",
			reset="Reset",
		},
		setting_key={
			a1="Move Left",
			a2="Move Right",
			a3="Rotate Right",
			a4="Rotate Left",
			a5="Rotate 180°",
			a6="Hard Drop",
			a7="Soft Drop",
			a8="Hold",
			a9="Function1",
			a10="Function2",
			a11="Instant Left",
			a12="Instant Right",
			a13="Sonic Drop",
			a14="Down 1",
			a15="Down 4",
			a16="Down 10",
			a17="Left Drop",
			a18="Right Drop",
			a19="Left Zangi",
			a20="Right Zangi",
			restart="Retry",
		},
		setting_skin={
			title="Layout Settings",
			spin1="R",spin2="R",spin3="R",spin4="R",spin5="R",spin6="R",spin7="R",
			skinR="Reset Color",
			faceR="Reset Dir.",
		},
		setting_touch={
			default="Default",
			snap="Snap",
			option="Options",
			size="Size",
		},
		setting_touchSwitch={
			b1=	"Move Left:",	b2="Move Right:",	b3="Rotate Right:",	b4="Rotate Left:",
			b5=	"Rotate 180°:",	b6="Hard Drop:",	b7="Soft Drop:",	b8="Hold:",
			b9=	"Function1:",	b10="Function2:",	b11="Instant Left:",b12="Instant Right:",
			b13="Sonic Drop:",	b14="Down 1:",		b15="Down 4:",		b16="Down 10:",
			b17="Left Drop:",	b18="Right Drop:",	b19="Left Zangi:",	b20="Right Zangi:",
			norm="Normal",
			pro="Professional",
			hide="Show Virtual Keys",
			track="Auto Track",
			sfx="SFX",
			vib="VIB",
			icon="Icon",
			tkset="Track Settings",
			alpha="Alpha",
		},
		setting_trackSetting={
			VKDodge="Auto Dodge",
		},
		customGame={
			title="Custom Game",
			subTitle="Basic",
			defSeq="Default Seq.",
			noMsn="No missions",

			drop="Drop Delay",
			lock="Lock Delay",
			wait="Entry Delay",
			fall="Line Delay",

			bg="Background",
			bgm="Music",

			copy="Copy Field+Seq+Misn",
			paste="Paste Field+Seq+Misn",
			clear="Start-Clear",
			puzzle="Start-Puzzle",

			advance="More (A)",
			mod="Mods",
			field="Edit Field (F)",
			sequence="Edit Sequence (S)",
			mission="Edit Mission (M)",
		},
		custom_advance={
			title="Custom Game",
			subTitle="Advance",

			nextCount="Next",
			holdCount="Hold",
			infHold="Infinite Hold",
			phyHold="Physical Hold",
			bone="Bone Blocks",

			mindas="Min. DAS",
			minarr="Min. ARR",
			minsdarr="Min. SDARR",
			noTele="No Teleportation",
			fieldH="Field height",
			ospin="O-Spin",
			deepDrop="Deep Drop",
			target="Target",
			visible="Visibility",
			freshLimit="Lock Reset Limit",
			easyFresh="Normal Lock Reset",
			fineKill="100% Finesse",
			b2bKill="No B2B break",
			opponent="Opponent",
			life="Lives",
			pushSpeed="Garbage Speed",
		},
		custom_field={
			title="Custom Game",
			subTitle="Field",

			any="Erase",
			space="×",

			pushLine="Add Line(K)",
			delLine="Del Line(L)",

			copy="Copy",
			paste="Paste",
			clear="Clear",
			demo="Don't Show ×",

			newPage="New Page(N)",
			delPage="Del Page(M)",
			prevPage="Prev Page",
			nextPage="Next Page",
		},
		custom_sequence={
			title="Custom Game",
			subTitle="Sequence",

			sequence="Sequence",

			Z="Z",S="S",J="J",L="L",T="T",O="O",I="I",left="←",right="→",ten="→→",backsp="<X",reset="Reset",
			Z5="Z5",S5="S5",P="P",Q="Q",F="F",E="E",T5="T5",U="U",I3="I3",C="C",rnd="Rand",
			V="V",W="W",X="X",J5="J5",L5="L5",R="R",Y="Y",N="N",H="H",I5="I5",I2="I2",O1="O1",
			copy="Copy",paste="Paste",
		},
		custom_mission={
			title="Custom Game",
			subTitle="Mission",

			_1="1",_2="2",_3="3",_4="4",
			any1="any1",any2="any2",any3="any3",any4="any4",
			PC="PC",
			Z1="Z1",S1="S1",J1="J1",L1="L1",T1="T1",O1="O1",I1="I1",
			Z2="Z2",S2="S2",J2="J2",L2="L2",T2="T2",O2="O2",I2="I2",
			Z3="Z3",S3="S3",J3="J3",L3="L3",T3="T3",O3="O3",I3="I3",
			O4="O4",I4="I4",
			left="←",right="→",
			ten="→→",
			backsp="<X",
			reset="R",
			copy="Copy",
			paste="Paste",
			mission="Force Mission",
		},
		help={
			manual="Manual",
			dict="Little Z",
			staff="Staff",
			his="History",
			qq="Author's qq",
		},
		dict={
			title="TetroDictionary",
			link="Open URL",
			up="↑",
			down="↓",
		},
		stat={
			path="Open Data Folder",
			save="Data Management",
		},
		music={
			title="Music Room",
			arrow="→",
			now="Now Playing:",

			bgm="BGM",
			up="↑",
			play="Play",
			down="↓",
		},
		login={
			title="Log in",
			register="Sign up",
			email="Email address",
			password="Password",
			login="Log in",
		},
		register={
			title="Sign up",
			login="Log in",
			username="Username",
			email="Email address",
			password="Password",
			password2="Reenter password",
		},
		account={
			title="Account",
		},
		sound={
			title="SE Room",
			sfx="SFX",
			voc="VOICE",

			move="Movement",
			lock="Lock",
			drop="Drop",
			fall="Fall",
			rotate="Rotation",
			rotatekick="Rotation (kick)",
			hold="Hold",
			prerotate="Initial rotation",
			prehold="Initial hold",
			_pc="Clear and PC",

			clear1="clear 1",
			clear2="clear 2",
			clear3="clear 3",
			clear4="clear 4",
			spin0="spin 0",
			spin1="spin 1",
			spin2="spin 2",
			spin3="spin 3",

			_1="Single",
			_2="Double",
			_3="Triple",
			_4="Techrash",
			z0="Z-spin",
			z1="Z-spin 1",
			z2="Z-spin 2",
			z3="Z-spin 3",
			s0="S-spin",
			s1="S-spin 1",
			s2="S-spin 2",
			s3="S-spin 3",

			j0="J-spin",
			j1="J-spin 1",
			j2="J-spin 2",
			j3="J-spin 3",
			l0="L-spin",
			l1="L-spin 1",
			l2="L-spin 2",
			l3="L-spin 3",

			t0="T-spin",
			t1="T-spin 1",
			t2="T-spin 2",
			t3="T-spin 3",
			o0="O-spin",
			o1="O-spin 1",
			o2="O-spin 2",
			o3="O-spin 3",

			i0="I-spin",
			i1="I-spin 1",
			i2="I-spin 2",
			i3="I-spin 3",

			mini="Mini",
			b2b="B2B",
			b3b="B3B",
			pc="PC",
		},
		mg_15p={
			reset="Shuffle",
			color="Color",
			blind="Blind",
			slide="Slide",
			pathVis="Show Path",
			revKB="Reverse",
		},
		mg_schulteG={
			reset="Reset",
			rank="Size",
			blind="Blind",
			disappear="Hide",
			tapFX="Tap FX",
		},
		mg_pong={
			reset="Restart",
		},
		mg_AtoZ={
			level="Level",
			keyboard="Keyboard",
			reset="Reset",
		},
		mg_2048={
			reset="Reset",
			blind="Blind",
			tapControl="Tap control",

			skip="Skip Round",
		},
		mg_ten={
			reset="Reset",
			next="Next",
			blind="Blind",
			fast="Fast",
		},
		mg_dtw={
			reset="Reset",
			mode="Mode",
		},
		savedata={
			exportUnlock="Export progress",
			exportData="Export statistics",
			exportSetting="Export settings",
			exportVK="Export virtual key layout",

			importUnlock="Import progress",
			importData="Import statistics",
			importSetting="Import settings",
			importVK="Import virtual key layout",

			reset="RESET?",
			resetUnlock="Reset ranks",
			resetRecord="Reset records",
			resetData="Reset data",
		},
	},
	modes={
		["sprint_10l"]=			{"Sprint",			"10L",			"Clear 10 lines!"},
		["sprint_20l"]=			{"Sprint",			"20L",			"Clear 20 lines!"},
		["sprint_40l"]=			{"Sprint",			"40L",			"Clear 40 lines!"},
		["sprint_100l"]=		{"Sprint",			"100L",			"Clear 100 lines!"},
		["sprint_400l"]=		{"Sprint",			"400L",			"Clear 400 lines!"},
		["sprint_1000l"]=		{"Sprint",			"1000L",		"Clear 1000 lines!"},
		["sprintPenta"]=		{"Sprint",			"PENTOMINO",	"Clear 40 lines with 18 pentominoes."},
		["sprintMPH"]=			{"Sprint",			"MPH",			"Memoryless\nPreviewless\nHoldless"},
		["dig_10l"]=			{"Dig",				"10L",			"Dig 10 garbage lines."},
		["dig_40l"]=			{"Dig",				"40L",			"Dig 40 garbage lines."},
		["dig_100l"]=			{"Dig",				"100L",			"Dig 100 garbage lines."},
		["dig_400l"]=			{"Dig",				"400L",			"Dig 400 garbage lines."},
		["dig_1000l"]=			{"Dig",				"1000L",		"Dig 1000 garbage lines."},
		["drought_n"]=			{"Drought",			"100L",			"No I piece!"},
		["drought_l"]=			{"Drought",			"100L",			"WTF"},
		["marathon_n"]=			{"Marathon",		"NORMAL",		"200-line marathon with accelerating speed."},
		["marathon_h"]=			{"Marathon",		"HARD",			"200-line high-speed marathon."},
		["solo_e"]=				{"Battle",			"EASY",			"Defeat the AI!"},
		["solo_n"]=				{"Battle",			"NORMAL",		"Defeat the AI!"},
		["solo_h"]=				{"Battle",			"HARD",			"Defeat the AI!"},
		["solo_l"]=				{"Battle",			"LUNATIC",		"Defeat the AI!"},
		["solo_u"]=				{"Battle",			"ULTIMATE",		"Defeat the AI!"},
		["techmino49_e"]=		{"Tech 49",			"EASY",			"49-player battle.\nThe last one standing wins."},
		["techmino49_h"]=		{"Tech 49",			"HARD",			"49-player battle.\nThe last one standing wins."},
		["techmino49_u"]=		{"Tech 49",			"ULTIMATE",		"49-player battle.\nThe last one standing wins."},
		["techmino99_e"]=		{"Tech 99",			"EASY",			"99-player battle.\nThe last one standing wins."},
		["techmino99_h"]=		{"Tech 99",			"HARD",			"99-player battle.\nThe last one standing wins."},
		["techmino99_u"]=		{"Tech 99",			"ULTIMATE",		"99-player battle.\nThe last one standing wins."},
		["round_e"]=			{"Turn-Based",		"EASY",			"Chess mode"},
		["round_n"]=			{"Turn-Based",		"NORMAL",		"Chess mode"},
		["round_h"]=			{"Turn-Based",		"HARD",			"Chess mode"},
		["round_l"]=			{"Turn-Based",		"LUNATIC",		"Chess mode"},
		["round_u"]=			{"Turn-Based",		"ULTIMATE",		"Chess mode"},
		["master_beginner"]=	{"Master",			"LUNATIC",		"For 20G beginners."},
		["master_advance"]=		{"Master",			"ULTIMATE",		"Professional 20G challenge!"},
		["master_final"]=		{"Master",			"FINAL",		"20G: Unreachable end point!"},
		["master_phantasm"]=	{"Master",			"PHANTASM",		"20G: ???"},
		["GM"]=					{"GrandMaster",		"GM",			"To be a Grand Master, take \nthis challenge."},
		["rhythm_e"]=			{"Rhythm",			"EASY",			"200-line low-bpm rhythm marathon."},
		["rhythm_h"]=			{"Rhythm",			"HARD",			"200-line medium-bpm rhythm marathon"},
		["rhythm_u"]=			{"Rhythm",			"ULTIMATE",		"200-line high-bpm rhythm marathon."},
		["blind_e"]=			{"Blind",			"HALF",			"For novice players."},
		["blind_n"]=			{"Blind",			"ALL",			"For intermediate players."},
		["blind_h"]=			{"Blind",			"SUDDEN",		"For experienced players."},
		["blind_l"]=			{"Blind",			"SUDDEN+",		"For professionals."},
		["blind_u"]=			{"Blind",			"?",			"Are you ready?"},
		["blind_wtf"]=			{"Blind",			"WTF",			"You're not ready."},
		["classic_fast"]=		{"Classic",			"CTWC",			"High-speed classic mode."},
		["survivor_e"]=			{"Survivor",		"EASY",			"How long can you survive?"},
		["survivor_n"]=			{"Survivor",		"NORMAL",		"How long can you survive?"},
		["survivor_h"]=			{"Survivor",		"HARD",			"How long can you survive?"},
		["survivor_l"]=			{"Survivor",		"LUNATIC",		"How long can you survive?"},
		["survivor_u"]=			{"Survivor",		"ULTIMATE",		"How long can you survive?"},
		["attacker_h"]=			{"Attacker",		"HARD",			"Offensive practice!"},
		["attacker_u"]=			{"Attacker",		"ULTIMATE",		"Offensive practice!"},
		["defender_n"]=			{"Defender",		"NORMAL",		"Defensive practice!"},
		["defender_l"]=			{"Defender",		"LUNATIC",		"Defensive practice!"},
		["dig_h"]=				{"Driller",			"HARD",			"Digging practice!"},
		["dig_u"]=				{"Driller",			"ULTIMATE",		"Digging practice!"},
		["bigbang"]=			{"Big Bang",		"EASY",			"All-spin tutorial!\n[Under construction]"},
		["c4wtrain_n"]=			{"C4W Training",	"NORMAL",		"Infinite combos."},
		["c4wtrain_l"]=			{"C4W Training",	"LUNATIC",		"Infinite combos."},
		["pctrain_n"]=			{"PC Training",		"NORMAL",		"Simple Perfect Clear mode."},
		["pctrain_l"]=			{"PC Training",		"LUNATIC",		"Hard Perfect Clear mode."},
		["pc_n"]=				{"PC Challenge",	"NORMAL",		"Get PCs within 100 lines!"},
		["pc_h"]=				{"PC Challenge",	"HARD",			"Get PCs within 100 lines!"},
		["pc_l"]=				{"PC Challenge",	"LUNATIC",		"Get PCs within 100 lines!"},
		["tech_n"]=				{"Tech",			"NORMAL",		"Keep the B2B chain!"},
		["tech_n_plus"]=		{"Tech",			"NORMAL+",		"Spins & PC only"},
		["tech_h"]=				{"Tech",			"HARD",			"Keep the B2B chain!"},
		["tech_h_plus"]=		{"Tech",			"HARD+",		"Spins & PC only"},
		["tech_l"]=				{"Tech",			"LUNATIC",		"Keep the B2B chain!"},
		["tech_l_plus"]=		{"Tech",			"LUNATIC+",		"Spins & PC only"},
		["tech_finesse"]=		{"Tech",			"FINESSE",		"No finesse faults!"},
		["tech_finesse_f"]=		{"Tech",			"FINESSE+",		"No normal clears, no finesse faults!"},
		["tsd_e"]=				{"TSD Challenge",	"EASY",			"T-spin-doubles only!"},
		["tsd_h"]=				{"TSD Challenge",	"HARD",			"T-spin-doubles only!"},
		["tsd_u"]=				{"TSD Challenge",	"ULTIMATE",		"T-spin-doubles only!"},
		["zen"]=				{"Zen",				"200",			"200 lines without a time limit."},
		["ultra"]=				{"Ultra",			"EXTRA",		"Get the highest score within 2 min."},
		["infinite"]=			{"Infinite",		"",				"Sandbox mode."},
		["infinite_dig"]=		{"Infinite: Dig",	"",				"Dig, dig, dig."},
		["sprintFix"]=			{"Sprint",			"NO LEFT/RIGHT"},
		["sprintLock"]=			{"Sprint",			"NO ROTATIONS"},
		["marathon_bfmax"]=		{"Marathon",		"ULTIMATE"},
		["custom_clear"]=		{"Custom",			"NORMAL"},
		["custom_puzzle"]=		{"Custom",			"PUZZLE"},
	},
	getTip={refuseCopy=true,
		'Free-to-play block game with Battle Royale mode!',
		'Have you noticed what "rotating" does do to a block?',
		":pog:",
		"(RUR'U')R'FR2U'R'U'(RUR'F')",
		"\\jezevec/\\jezevec/\\jezevec/",
		"\\osk/\\osk/\\osk/",
		"#FreeTetraOnline",
		"↑↑↓↓←→←→BA",
		"$include<studio.h>",
		"0next 0hold.",
		"1next 0hold",
		"1next 1hold!",
		"1next 6hold!",
		"20G actually is a brand new game rule.",
		"40-line Sprint WR: 15.654s by VinceHD",
		"6next 1hold!",
		"6next 6hold?!",
		"ALL SPIN!",
		"Am G F G",
		"B2B2B???",
		"B2B2B2B does not exist..",
		"B2B2B2B exists?",
		"Back to Back 10 Combo Techrash PC!",
		"Bridge clear coming soon!",
		"Change logs in English can be found on Discord.",
		"Cheap UI & Music",
		"Color clear coming soon!",
		"COOL!!",
		"Decreasing DAS and ARR: faster but harder to control.",
		"Don't let a small glitch ruin your entire day!",
		"Don't look directly at the bugs!",
		"Enjoy the Techmino rotation system!",
		"Find out what's in the settings!",
		"Got any suggestions? Post them in our Discord!",
		"Headphones recommended for better experience.",
		"Hello world!",
		"if a==true",
		"Increase your frame rate for better experience.",
		"Initial [insert action] system can save your life.",
		"Is B2B2B2B possible?",
		"It's possible to finish 40L without left/right button.",
		"It's really loading! Not just a cutscene!",
		"Join our discord!",
		"l-=-1",
		"Let-The-Bass-Kick!",
		"LrL RlR LLr RRl RRR LLL FFF RfR RRf rFF",
		"Lua No.1",
		"Mix clear coming soon!",
		"Music of this game is made using Beepbox.",
		"Music too distracting? You can turn it off.",
		"O-Spin Triple!",
		"OHHHHHHHHHHHHHH",
		"Online mode is planned - please be patient.",
		"Piracy is no party!",
		"Play single-handedly!",
		"Powered by Love2D",
		"pps-0.01",
		"REGRET!!",
		"Secret number: 626",
		"Some S rank requirements are intentionally set to be difficult for even the best players.",
		"Split clear coming soon!",
		"Techmino = Technique + Tetromino",
		"Techmino has a Nspire-CX edition!",
		"Techmino is so fun!",
		"TetroDictionary is now available in English.",
		"There are only two unique triminoes: I3 and L3.",
		"There are three hidden modes in the game.",
		"There is a total of 18 different pentominoes.",
		"There is a total of 7 different tetrominoes.",
		"Try using two rotate buttons. All three is better.",
		"Warning: Programmer Art",
		"What about 20 PCs?",
		"What about 23 PCs in 100 lines?",
		"What about 26 TSDs?",
		"while(false)",
		"You are Grand Master!",
		"You can connect keyboard to your phone!",
		"You can open the save directory from the Stats page.",
		"You can perform a spin with 28 of the 29 minoes in this game; the exception being O1.",
		"You can set the spawning orientation for each tetromino.",
		"ZS JL T O I",
		{c.C,"Also try 15puzzle"},
		{c.C,"Also try Minecraft"},
		{c.C,"Also try Minesweeper"},
		{c.C,"Also try osu!"},
		{c.C,"Also try Phigros"},
		{c.C,"Also try Rubic's cube"},
		{c.C,"Also try Terraria"},
		{c.C,"Also try VVVVVV"},
		{c.fire,"Also try Cultris II"},
		{c.fire,"Also try Jstris"},
		{c.fire,"Also try Nullpomino"},
		{c.fire,"Also try Tetr.io"},
		{c.fire,"Also try Tetr.js"},
		{c.fire,"Also try Tetralegends"},
		{c.grape,"T-spin!"},
		{c.grey,"REGRET!!"},
		{c.lR,"Z ",c.lG,"S ",c.lSea,"J ",c.lOrange,"L ",c.lGrape,"T ",c.lY,"O ",c.lC,"I"},
		{c.lY,"COOL!!"},
		{c.R,"\"DMCA abusing\""},
		{c.R,"\"Intellectual property law\""},
		{c.R,"DT",c.W," Cannon=",c.grape,"TS",c.R,"D",c.W,"+",c.grape,"TS",c.R,"T",c.W," Cannon"},
		{c.R,"LrL ",c.G,"RlR ",c.B,"LLr ",c.orange,"RRl ",c.grape,"RRR ",c.grape,"LLL ",c.C,"FFF ",c.Y,"RfR ",c.Y,"RRf ",c.Y,"rFF"},
		{c.sky,"Lua",c.W," No.1"},
		{c.W,"What is ",c.lC,"Xspin"},
		{c.Y,"O-spin Triple!"},
	}
}
