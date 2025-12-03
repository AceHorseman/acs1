local JoinnerSet = CS.Wnd_Simple.CreateWindow("JoinnerSet");
ModifierMain:AddWindow("JoinnerSet",JoinnerSet);
function JoinnerSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">JoinnerSet_Title"));
	self:SetSize(self.sx,self.sy);

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sy/10*6,self.sy/10,300,35);
	
	local sy=1.5;
	QFWDModifierMainUI:AddLable2(self,"tlable1",QFLanguage.GetText(">JoinnerSet_tlable1"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">JoinnerSet_lable1"),self.sx/10,self.sy/10*sy,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","Human",self.sx/10*1.5,self.sy/10*(sy+0.1));
	self.input1:SetSize(160, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"labley2",QFLanguage.GetText(">JoinnerSet_labley2"),self.sx/10*4.5,self.sy/10*sy,200,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","1",self.sx/10*5,self.sy/10*(sy+0.1));
	self.input2:SetSize(30, 20, false);
	self.input2.m_title.restrict = "[0-9]";
	self.input2.m_title.maxLength = 2;
	
	QFWDModifierMainUI:AddLable2(self,"labley3",QFLanguage.GetText(">JoinnerSet_labley3"),self.sx/10*5.5,self.sy/10*sy,200,35);
	self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*6,self.sy/10*(sy+0.1));
	self.input3:SetSize(40, 20, false);
	self.input3.m_title.restrict = "[0-9]";
	self.input3.m_title.maxLength = 3;
	QFWDModifierMainUI:AddButton2(self,"bntJoinerComming",QFLanguage.GetText(">JoinnerSet_bntJoinerComming"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	
	sy=sy+0.5;
	
	QFWDModifierMainUI:AddLable2(self,"tlable2",QFLanguage.GetText(">JoinnerSet_tlable2"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	
	QFWDModifierMainUI:AddLable2(self,"lable11",QFLanguage.GetText(">JoinnerSet_lable1"),self.sx/10,self.sy/10*sy,200,35);
	self.input11 = QFWDModifierMainUI:AddInput2(self,"input11","Human",self.sx/10*1.5,self.sy/10*(sy+0.1));
	self.input11:SetSize(160, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"labley21",QFLanguage.GetText(">JoinnerSet_labley2"),self.sx/10*4.5,self.sy/10*sy,200,35);
	self.input21 = QFWDModifierMainUI:AddInput2(self,"input21","1",self.sx/10*5,self.sy/10*(sy+0.1));
	self.input21:SetSize(30, 20, false);
	self.input21.m_title.restrict = "[0-9]";
	self.input21.m_title.maxLength = 2;
	
	QFWDModifierMainUI:AddLable2(self,"labley31",QFLanguage.GetText(">JoinnerSet_labley3"),self.sx/10*5.5,self.sy/10*sy,200,35);
	self.input31 = QFWDModifierMainUI:AddInput2(self,"input31","1",self.sx/10*6,self.sy/10*(sy+0.1));
	self.input31:SetSize(40, 20, false);
	self.input31.m_title.restrict = "[0-9]";
	self.input31.m_title.maxLength = 3;
	
	QFWDModifierMainUI:AddLable2(self,"labley41",QFLanguage.GetText(">JoinnerSet_labley41"),self.sx/10*6.7,self.sy/10*sy,200,35);
	self.input41 = QFWDModifierMainUI:AddInput2(self,"input51","1",self.sx/10*7.2,self.sy/10*(sy+0.1));
	self.input41:SetSize(30, 20, false);
	self.input41.m_title.restrict = "[0-9]";
	self.input41.m_title.maxLength = 1;
	QFWDModifierMainUI:AddButton2(self,"bntEnemyComming",QFLanguage.GetText(">JoinnerSet_bntJoinerComming"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"tlable3",QFLanguage.GetText(">JoinnerSet_tlable3"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable111",QFLanguage.GetText(">JoinnerSet_lable1"),self.sx/10,self.sy/10*sy,200,35);
	self.input111 = QFWDModifierMainUI:AddInput2(self,"input111","Human",self.sx/10*1.5,self.sy/10*(sy+0.1));
	self.input111:SetSize(160, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"labley211",QFLanguage.GetText(">JoinnerSet_labley2"),self.sx/10*4.5,self.sy/10*sy,200,35);
	self.input211 = QFWDModifierMainUI:AddInput2(self,"input211","1",self.sx/10*5,self.sy/10*(sy+0.1));
	self.input211:SetSize(30, 20, false);
	self.input211.m_title.restrict = "[0-9]";
	self.input211.m_title.maxLength = 2;
	
	QFWDModifierMainUI:AddLable2(self,"labley311",QFLanguage.GetText(">JoinnerSet_labley3"),self.sx/10*5.5,self.sy/10*sy,200,35);
	self.input311 = QFWDModifierMainUI:AddInput2(self,"input311","1",self.sx/10*6,self.sy/10*(sy+0.1));
	self.input311:SetSize(40, 20, false);
	self.input311.m_title.restrict = "[0-9]";
	self.input311.m_title.maxLength = 2;
	
	QFWDModifierMainUI:AddLable2(self,"labley411",QFLanguage.GetText(">JoinnerSet_labley411"),self.sx/10*6.7,self.sy/10*sy,200,35);
	self.input411 = QFWDModifierMainUI:AddInput2(self,"input411","0",self.sx/10*7.2,self.sy/10*(sy+0.1));
	self.input411:SetSize(30, 20, false);
	self.input411.m_title.restrict = "[0-9]";
	self.input411.m_title.maxLength = 2;
	QFWDModifierMainUI:AddButton2(self,"bntWalkComming",QFLanguage.GetText(">JoinnerSet_bntJoinerComming"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"tlable4",QFLanguage.GetText(">JoinnerSet_tlable4"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"labler1",QFLanguage.GetText(">JoinnerSet_lable1"),self.sx/10,self.sy/10*sy,200,35);
	self.inputr1 = QFWDModifierMainUI:AddInput2(self,"inputr1","Human",self.sx/10*1.5,self.sy/10*(sy+0.1));
	self.inputr1:SetSize(160, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"lableyr1",QFLanguage.GetText(">JoinnerSet_lableyr1"),self.sx/10*4.5,self.sy/10*sy,200,35);
	self.inputr2 = QFWDModifierMainUI:AddInput2(self,"inputr2","1",self.sx/10*5.5,self.sy/10*(sy+0.1));
	self.inputr2:SetSize(100, 20, false);
	self.inputr2.m_title.restrict = "[0-9]";
	QFWDModifierMainUI:AddButton2(self,"bntGodAnimalComming",QFLanguage.GetText(">JoinnerSet_bntJoinerComming"),self.sx/10*8,self.sy/10*5.1):SetSize(self.sx/10*1.2, 20, false);
	
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"tlablell1",QFLanguage.GetText(">JoinnerSet_tlablell1"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lablel2",QFLanguage.GetText(">JoinnerSet_lable1"),self.sx/10,self.sy/10*sy,200,35);
	self.inputl1 = QFWDModifierMainUI:AddInput2(self,"inputl1","Human",self.sx/10*1.5,self.sy/10*(sy+0.1));
	self.inputl1:SetSize(160, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntLingChongComming",QFLanguage.GetText(">JoinnerSet_bntJoinerComming"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	
	sy=sy+0.5;
	--QFWDModifierMainUI:AddLable2(self,"MakeMen","造人:",self.sx/10,self.sy/10*8,200,25);
	--QFWDModifierMainUI:AddButton2(self,"bntMakeMen","进入",self.sx/10*3,self.sy/10*8);
	QFWDModifierMainUI:AddLable2(self,"tlable5",QFLanguage.GetText(">JoinnerSet_tlable5"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"labler5",QFLanguage.GetText(">JoinnerSet_labler5"),self.sx/10,self.sy/10*sy,200,35);
	self.inputr5 = QFWDModifierMainUI:AddInput2(self,"inputr5","1",self.sx/10*1.5,self.sy/10*(sy+0.1));
	self.inputr5:SetSize(160, 20, false);
	
	QFWDModifierMainUI:AddButton2(self,"bntLunHuiNPCComming",QFLanguage.GetText(">JoinnerSet_bntJoinerComming"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);

	self.JoinerRaceCOP=self:AddCOP("RaceList",self.sx/10*9.85,self.sy/10*0.7);
	self.NpcListCOP = self:AddCOP2("NpcList",-self.sx/10*4.15,self.sy/10*0.7,2);
	QFWDModifierMainUI:AddButton2(self,"bntReload",QFLanguage.GetText(">JoinnerSet_bntReload"),self.sx/10*11.3,self.sy/10*(9.1)):SetSize(self.sx/10*1.2, 20, false);

	JoinnerSet:LoadingIn();
	self.window:Center();
end

function JoinnerSet:OnShowUpdate()
	
end

function JoinnerSet:OnShown()
	JoinnerSet.isShowing = true
end

function JoinnerSet:OnUpdate()

end

function JoinnerSet:OnHide()
	JoinnerSet.isShowing = false;
	ModifierMain.showWindow=0;
end
function JoinnerSet:GetKey(x,y)
	if x > Map.Size then
		x = Map.Size;
		self.WorldLuaHelper:ShowMsgBox("输入的X值溢出！","异常");
	end
	if y > Map.Size then
		y = Map.Size;
		self.WorldLuaHelper:ShowMsgBox("输入的Y值溢出！","异常");
	end
	return x + y * (Map.Size);

end
function JoinnerSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntJoinerComming" then
			if  tonumber(JoinnerSet.input1.m_title.text) ~= nil  then
				JoinnerSet.input1.m_title.text = QFWDlib.race[tonumber(JoinnerSet.input1.m_title.text)];
			end
			JoinnerSet:Joiner(JoinnerSet.input1.m_title.text,tonumber(JoinnerSet.input2.m_title.text),tonumber(JoinnerSet.input3.m_title.text));
			JoinnerSet.ShowLable.text = QFLanguage.GetText(">JoinnerSet_Tips1")..JoinnerSet.input1.m_title.text.."成功！".."数量:"..JoinnerSet.input2.m_title.text;
			return;
		end
		if obj.name == "bntEnemyComming" then
			if  tonumber(JoinnerSet.input11.m_title.text) ~= nil  then
				JoinnerSet.input11.m_title.text = QFWDlib.race[tonumber(JoinnerSet.input11.m_title.text)];
			end
			JoinnerSet:Enemy(JoinnerSet.input11.m_title.text,tonumber(JoinnerSet.input21.m_title.text),tonumber(JoinnerSet.input31.m_title.text),tonumber(JoinnerSet.input41.m_title.text));
			JoinnerSet.ShowLable.text = QFLanguage.GetText(">JoinnerSet_Tips2")..JoinnerSet.input11.m_title.text.."成功！".."数量:"..tostring(tonumber(JoinnerSet.input21.m_title.text)*2);
			return;
		end
		if obj.name == "bntWalkComming" then
			if  tonumber(JoinnerSet.input111.m_title.text) ~= nil  then
				JoinnerSet.input111.m_title.text = QFWDlib.race[tonumber(JoinnerSet.input111.m_title.text)];
			end
			JoinnerSet:WalkComing(JoinnerSet.input111.m_title.text,tonumber(JoinnerSet.input211.m_title.text),tonumber(JoinnerSet.input311.m_title.text),tonumber(JoinnerSet.input411.m_title.text));
			JoinnerSet.ShowLable.text = QFLanguage.GetText(">JoinnerSet_Tips3")..JoinnerSet.input111.m_title.text.."成功！".."数量:"..JoinnerSet.input211.m_title.text;
			return;
		end
		if obj.name == "bntGodAnimalComming" then
			if  tonumber(JoinnerSet.inputr1.m_title.text) ~= nil  then
				JoinnerSet.inputr1.m_title.text = QFWDlib.race[tonumber(JoinnerSet.inputr1.m_title.text)];
			end
			JoinnerSet:GodAnimalComming(JoinnerSet.inputr1.m_title.text,tonumber(JoinnerSet.inputr2.m_title.text));
			JoinnerSet.ShowLable.text = QFLanguage.GetText(">JoinnerSet_Tips4")..JoinnerSet.inputr1.m_title.text.."成功！".."停留时间:"..JoinnerSet.inputr2.m_title.text;
			return;
		end
		if obj.name == "bntLingChongComming" then
			if  tonumber(JoinnerSet.inputl1.m_title.text) ~= nil  then
				JoinnerSet.inputl1.m_title.text = QFWDlib.race[tonumber(JoinnerSet.inputl1.m_title.text)];
			end
			JoinnerSet:LingChongComming(JoinnerSet.inputl1.m_title.text);
			JoinnerSet.ShowLable.text = QFLanguage.GetText(">JoinnerSet_Tips5")..JoinnerSet.inputl1.m_title.text.."成功！";
			return;
		end
		if obj.name == "bntLunHuiNPCComming" then
			if JoinnerSet:LunHuiNPCComming() then
				JoinnerSet.ShowLable.text = QFLanguage.GetText(">JoinnerSet_Tips6")..tostring(JoinnerSet.NPCListName[tonumber(JoinnerSet.inputr5.m_title.text)]).."成功！";
			else
				JoinnerSet.ShowLable.text = QFLanguage.GetText(">JoinnerSet_Tips7");
			end
			return;
		end
		if obj.name == "bntReload" then
			JoinnerSet:LoadingIn();
			JoinnerSet.ShowLable.text = QFLanguage.GetText(">JoinnerSet_Tips8");
			return;
		end
		-- if obj.name == "bntMakeMen" then
			-- MakeMen:Show();
			-- return;
		-- end
		-- if obj.name == "bntAllGod" then
			-- if obj.text == "关闭" then
				-- CS.GameMain.Instance.KnowEveryGod = false;
				-- obj.text = "开启";
				-- JoinnerSet.ShowLable.text = "已经关闭上帝模式。";
			-- else
				-- CS.GameMain.Instance.KnowEveryGod = true
				-- obj.text = "关闭";
				-- JoinnerSet.ShowLable.text = "已经开启上帝模式。";
			-- end
			-- return;
		-- end
	end
end
function JoinnerSet:ForeInte()
	local localKey=nil;
	local localValue=nil;
	local num=0;
	local run=false;
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("GetRaces");
		local RaceList=func:Invoke();
		if RaceList~=nil then
			run=true;
			QFWDlib.race={};
			QFWDlib.raceName={};
			for localKey, localValue in pairs(RaceList) do
				if localValue~=nil and localKey~=nil and localValue.DisplayName~=nil then
					num=num+1;
					QFWDlib.race[num]=tostring(localKey);
					QFWDlib.raceName[num]=tostring(localValue.DisplayName);
				end
			end
			print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">JoinnerSet_Tips9"));
		end
	end
	return run;
end
function JoinnerSet:LoadingIn(obj,obj2)
	if obj==nil then
		obj=JoinnerSet.JoinerRaceCOP;
	end
	if obj2==nil then
		obj2=JoinnerSet.NpcListCOP;
	end
	JoinnerSet:ForeInte();
	obj.m_list:RemoveChildrenToPool();
	obj2.m_list:RemoveChildrenToPool();
	local localKey=0;
	local localValue=0;
	for localKey, localValue in pairs(QFWDlib.race) do
		--ThingMgr:GetDef(2,v.Item)
		--print(k);
		--ThingMgr:AddItemThing(2,v.Item);
		JoinnerSet:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..QFWDlib.raceName[localKey].."--"..localValue);
	end
	
	local LunHuiNPCList=NpcMgr:GetReincarnateIDs();
	JoinnerSet.NPCList={};
	JoinnerSet.NPCListName={};
	local num=1;
	local Date=nil;
	local name=nil;
	local sex=nil;
	local sman,swoman,sold=QFLanguage.GetText2(">JoinnerSet_Tips13"),QFLanguage.GetText2(">JoinnerSet_Tips14"),QFLanguage.GetText2(">JoinnerSet_Tips15");
	for localKey, localValue in pairs(LunHuiNPCList) do
		if localValue~=nil then
			Date=NpcMgr:GetReincarnateDataByID(localValue);
			if Date~=nil then
				name=tostring(Date.LastName)..tostring(Date.FristName);
				if name~="nilnil" then
					JoinnerSet.NPCList[localKey]=localValue;
					JoinnerSet.NPCListName[localValue]=name;
					sex=true;
					if Date.Sex==QFWDlib.NPCSexType[3] then
						sex=false;
					end
					if tostring(Date.Race) ~="" then
						if sex then
							JoinnerSet:AddChildToList(obj2,tostring(localValue),tostring(localValue)..": "..name.."  - "..sman.." -  "..tostring(Date.Age).." "..sold.." - "..tostring(Date.Race));
						else
							JoinnerSet:AddChildToList(obj2,tostring(localValue),tostring(localValue)..": "..name.."  - "..swoman.." -  "..tostring(Date.Age).." "..sold.." - "..tostring(Date.Race));
						end
					else
						if sex then
							JoinnerSet:AddChildToList(obj2,tostring(localValue),tostring(localValue)..": "..name.."  - "..sman.." -  "..tostring(Date.Age).." "..sold);
						else
							JoinnerSet:AddChildToList(obj2,tostring(localValue),tostring(localValue)..": "..name.."  - "..swoman.." -  "..tostring(Date.Age).." "..sold);
						end
					end
				end
			end
		end
	end
	
end
function JoinnerSet:Joiner(a,b,c)
	Map:AddJoiner(a, b, c, 0);
	--npc:InitBehaviour();
	-- local came = CS.UnityEngine.GameObject.Find("MainCamera");--:SetActive(false)
	-- if came==nil then
		-- print("MOD版修改器:jia")
	-- end
	--print(tostring(came.transform.positon.x))
	-- --Map:AddDelayEnemy(a, 1, 1, 0,1,0);
	-- -- for k, v in pairs(NpcMgr:) do
		-- -- --ThingMgr:GetDef(2,v.Item)
		-- -- print(k);
		-- -- --ThingMgr:AddItemThing(2,v.Item);
	-- -- end
	-- local go1 = CS.UnityEngine.GameObject("Cube");
	-- local go2 = CS.UnityEngine.GameObject("Sphere");
	-- local go3 = CS.UnityEngine.Time.time;
	-- CS.UnityEngine.Time.timeScale=10;

-- --访问对象属性
	-- print("MOD版修改器:GameObject1:", go1.name, "GameObject2:", go2.name)
	-- print("MOD版修改器:"..tostring(go3))
-- --修改对象属性
	-- go1.name = "Cube--"
	-- go2.name = "Sphere--"
	-- print("MOD版修改器:GameObject1:", go1.name, "GameObject2:", go2.name)
	-- print(go1.transform.positon)

--调用对象方法(调用对象方法时注意使用":"语法糖)
	--go1:SetActive(true)  --go1.SetActive(go1, false) 也可以这样调用
	--go2:SetActive(true)  --go2.SetActive(go2, false) 也可以这样调用
	
end
function JoinnerSet:LingChongComming(a)
	if CS.XiaWorld.ThingMgr~=nil then
		local ThingMgr=CS.XiaWorld.ThingMgr.Instance;
		ThingMgr:AddLingChong(a, CS.XiaWorld.World.Instance.map:RandomBronGrid(),World.map, CS.XiaWorld.Fight.g_emFightCamp.Player);
		return true;
	end
	return false;
end
function JoinnerSet:GodAnimalComming(a,b)
	--Map:AddWalker(a, b, "咸鱼中", 1, 0, "", c, d);
	Map:AddGodAnimal(a,b);
	--npc:InitBehaviour();
	--Map:AddEnemyAtKey(a, "E", 60,1,CS.XiaWorld.g_emNpcRichLable.Poor);
	--Map:AddHotFreePoint(60);
	--Map:AddWalker(1,"A")

end
function JoinnerSet:Enemy(a,b,c,d)
	local ss = CS.XiaWorld.g_emNpcRichLable.Poor;
	if d<=1 then
		ss = CS.XiaWorld.g_emNpcRichLable.Poorest;
	elseif d==2 then
		ss = CS.XiaWorld.g_emNpcRichLable.Poor;
	elseif d==3 then
		ss = CS.XiaWorld.g_emNpcRichLable.Normal;
	elseif d==4 then
		ss = CS.XiaWorld.g_emNpcRichLable.Rich;
	elseif d>=5 then
		ss = CS.XiaWorld.g_emNpcRichLable.Richest;
	end
	Map:AddDelayEnemy(a, b, c,0,ss,100,0);
	--npc:InitBehaviour();
	--Map:AddEnemyAtKey(a, "E", 60,1,CS.XiaWorld.g_emNpcRichLable.Poor);

end
function JoinnerSet:WalkComing(a,b,c,d)
	Map:AddWalker(a, b, QFLanguage.GetText(">JoinnerSet_Tips10"), 1, 0, "", c, d);
	--npc:InitBehaviour();
	--Map:AddGodAnimal(a,60);
	--Map:AddEnemyAtKey(a, "E", 60,1,CS.XiaWorld.g_emNpcRichLable.Poor);
	--Map:AddHotFreePoint(60);
	--Map:AddWalker(1,"A")

end
function JoinnerSet:LunHuiNPCComming()
	local num=tonumber(JoinnerSet.inputr5.m_title.text);
	if num==nil then
		return false;
	end
	
	local LH=CS.XiaWorld.NpcMgr.Instance:GetReincarnateDataByID(num);
	if LH==nil then
		return false;
	end
	--print(tostring(LH.Race),LH.LastName,LH.FristName)
	--local npc = CS.XiaWorld.NpcRandomMechine.MakeReincarnateNpc(num);
	local vx=CS.UnityEngine.Vector2(0,0);
	local race=LH.Race;
	if race==nil or tostring(race)=="" then
		race = "Human";
	end
	print(tostring(LH.Race).."   "..tostring(LH.Sex))
	local npc = CS.XiaWorld.NpcRandomMechine.RandomNpc(race, LH.Sex, 0, vx, LH.LastName, LH.FristName, true, 0, LH);
	CS.XiaWorld.NpcMgr.Instance:AddNpc(npc,CS.XiaWorld.World.Instance.map:RandomBronGrid(),World.map,CS.XiaWorld.Fight.g_emFightCamp.Player);
	CS.XiaWorld.ThingMgr.Instance:EquptNpc(npc, 0, CS.XiaWorld.g_emNpcRichLable.Richest, false, true, 0, 0, false, false);
	npc:ChangeRank(CS.XiaWorld.g_emNpcRank.Worker);
	-- local localKey=nil;
	-- local localValue=nil;
	-- local list = npc.savebtns;
	-- if list==nil or list=={} then
		-- print("MOD版修改器:bntlist is nil!")
		-- return false;
	-- end
	-- for localKey, localValue in pairs(list) do
		-- print(tostring(localValue.name)..tostring(localValue.desc)..tostring(localValue.lua)..tostring(localValue.cmd))
		
	-- end
	-- local trade=CS.XiaWorld.TradeMgr.LoopInterval;
	-- if trade~=nil then
		-- print(tostring(trade))
	-- else
		-- print("MOD版修改器:nil")
	-- end
	--npc:AddModifier("Modifier_WaitLeave",1, false, 1, 0, false, -1).Duration=66;
	--CS.XiaWorld.GameEventMgr.Instance:TriggerEvent(10083, npc, nil, nil, false, 0);
	-- local data=NpcMgr:GetReincarnateDataByID(num);
	-- if data~=nil then
		-- CS.XiaWorld.NpcMgr.Instance:AfterRebornNpc(npc,data);
	-- end
	return true;
end
function JoinnerSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function JoinnerSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function JoinnerSet:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*3.2, 20, false);
	obj.m_title.text = value;
	--obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function JoinnerSet:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(JoinnerSet.ListChildOnClick);
	obj.m_title.text = QFLanguage.GetText(">JoinnerSet_Tips11");
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false);
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false);
	obj.m_dele.text="无";
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="无";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="无";
	obj.m_save:SetSize(0, 0, false);
	return obj;
end
function JoinnerSet.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	JoinnerSet.TheClickBnt = tonumber(Eventss.data.name);
	JoinnerSet:SetSetting();
	
end
function JoinnerSet:SetSetting(types)
	local obj=nil;
	if types==nil then
		obj=JoinnerSet.input1;
	else
		obj=JoinnerSet.input1;
	end
	obj.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt]);
	JoinnerSet.input11.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt]);
	JoinnerSet.input111.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt]);
	JoinnerSet.inputr1.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt]);
	JoinnerSet.inputl1.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt]);
	
	--JoinnerSet:ChooseThingNumAndGetAttribute(JoinnerSet.TheClickBnt);
end
function JoinnerSet:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(JoinnerSet.ListChildOnClick2);
	obj.m_title.text = QFLanguage.GetText(">JoinnerSet_Tips12");
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false);
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false);
	obj.m_dele.text="无";
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="无";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="无";
	obj.m_save:SetSize(0, 0, false);
	return obj;
end
function JoinnerSet.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	JoinnerSet.TheClickBnt = tonumber(Eventss.data.name);
	JoinnerSet:SetSetting2();
	
end
function JoinnerSet:SetSetting2(types)
	local obj=nil;
	if types==nil then
		obj=JoinnerSet.inputr5;
	else
		obj=JoinnerSet.inputr5;
	end
	obj.m_title.text=tostring(JoinnerSet.TheClickBnt);
	--JoinnerSet:ChooseThingNumAndGetAttribute(JoinnerSet.TheClickBnt);
end
