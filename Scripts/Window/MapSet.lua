MapSet = CS.Wnd_Simple.CreateWindow("MapSet");
ModifierMain:AddWindow("MapSet",MapSet);
function MapSet.WndOnHotKey()
	if QFForeInte~=nil and QFForeInte.GetKeyDownKeyStr~=nil then
		if QFForeInte.GetKeyForeverDownStr("mouse 1") then
			if QFForeInte.GetKeyDownKeyStr("2") then
				MapSet:ShowMap();
			elseif QFForeInte.GetKeyDownKeyStr("3") then
				MapSet:RemoveDust();
			end
		end
		
	end
end
function MapSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">MapSet_Title"));
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sy/10*3,self.sy/10,300,35);
	local sy=2;
	QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">MapSet_lable1"),self.sx/10*0.5,self.sy/10*sy,200,35);
	--sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntShowMap",QFLanguage.GetText(">MapSet_bntShowMap"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	
	--QFWDModifierMainUI:AddLable2(self,"lable2","地图灰尘:",self.sx/10*0.5,self.sy/10*(sy+0.1).5,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntClean",QFLanguage.GetText(">MapSet_bntClean"),self.sx/10*3.7,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">MapSet_lable3"),self.sx/10*0.5,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntClear1",QFLanguage.GetText(">MapSet_bntClear1"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClear11",QFLanguage.GetText(">MapSet_bntClear11"),self.sx/10*3.7,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntClear2",QFLanguage.GetText(">MapSet_bntClear2"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClear21",QFLanguage.GetText(">MapSet_bntClear21"),self.sx/10*3.7,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntClear3",QFLanguage.GetText(">MapSet_bntClear3"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClear31",QFLanguage.GetText(">MapSet_bntClear31"),self.sx/10*3.7,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntClear4",QFLanguage.GetText(">MapSet_bntClear4"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClear41",QFLanguage.GetText(">MapSet_bntClear41"),self.sx/10*3.7,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntClear5",QFLanguage.GetText(">MapSet_bntClear5"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClear51",QFLanguage.GetText(">MapSet_bntClear51"),self.sx/10*3.7,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntClear6",QFLanguage.GetText(">MapSet_bntClear6"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClear61",QFLanguage.GetText(">MapSet_bntClear61"),self.sx/10*3.7,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable4",QFLanguage.GetText(">MapSet_lable4"),self.sx/10*0.5,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntAreaManager",QFLanguage.GetText(">MapSet_bntAreaManager"),self.sx/10*3.7,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false);

	self.thingListObj = self:AddCOP("bntClearList",self.sx/10*9.85,self.sy/10*0.7);
	self.thingListObjList = self.thingListObj.m_list;
	self.thingListObj2 = self:AddCOP2("bntClearList2",-self.sx/10*4.15,self.sy/10*0.7);
	
	QFWDModifierMainUI:AddLable2(self,"lableID1",QFLanguage.GetText(">MapSet_lableID1"),self.sx/10*10.2,self.sy/10*8.7,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","0",self.sx/10*11,self.sy/10*8.8);
	self.input1:SetSize(40, 20, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 4;
	QFWDModifierMainUI:AddLable2(self,"lableID2",QFLanguage.GetText(">MapSet_lableID2"),self.sx/10*10.2,self.sy/10*9.2,200,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","0",self.sx/10*11,self.sy/10*9.3);
	self.input2:SetSize(40, 20, false);
	self.input2.m_title.restrict = "[0-9]";
	self.input2.m_title.maxLength = 4;
	QFWDModifierMainUI:AddButton2(self,"bntClearing",QFLanguage.GetText(">MapSet_bntClearing"),self.sx/10*11.8,self.sy/10*9.3):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClearingAll",QFLanguage.GetText(">MapSet_bntClearingAll"),self.sx/10*13,self.sy/10*9.3):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClearingOne",QFLanguage.GetText(">MapSet_bntClearingOne"),self.sx/10*13,self.sy/10*8.8):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntClearingUpdate",QFLanguage.GetText(">MapSet_bntClearingUpdate"),self.sx/10*11.8,self.sy/10*8.8):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntPasteData",QFLanguage.GetText(">MapSet_bntPasteData"),self.sx/10*8,self.sy/10*0.5):SetSize(self.sx/10*0.8, 20, false);
	
	--self.CheckBox1 = self:AddCheckBox("bntUnFog","地图迷雾",self.sx/10*3.7,self.sy/10*(sy+0.1));
	--self.CheckBox1.selected = not CS.GameMain.Instance.NoFog;
	local ky=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lableA1",QFLanguage.GetText(">MapSet_lableA1"),self.sx/10*0.5,self.sy/10*ky,200,35);
	self.TypesLab=QFWDModifierMainUI:AddLable2(self,"lableA2",QFLanguage.GetText(">MapSet_lableA2")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10*1.5,self.sy/10*ky,200,35);
	QFWDModifierMainUI:AddLable2(self,"lableA2",QFLanguage.GetText(">MapSet_lableA2")..":",self.sx/10*4,self.sy/10*ky,200,35);
	self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","2",self.sx/10*4.8,self.sy/10*(ky+0.1));
	self.input3:SetSize(self.sx/10*0.5, 20, false);
	self.input3.m_title.restrict = "[0-9]";
	self.input3.m_title.maxLength = 1;
	QFWDModifierMainUI:AddLable2(self,"lable7","X:",self.sx/10*8,self.sy/10*ky,200,35);
	self.input7 = QFWDModifierMainUI:AddInput2(self,"input7","1",self.sx/10*8.4,self.sy/10*(ky+0.1));
	self.input7:SetSize(80, 20, false);
	self.input7.m_title.restrict = "[0-9]";
	ky=ky+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable5",QFLanguage.GetText(">BuildingManager_lable3"),self.sx/10*1.5,self.sy/10*ky,200,35);
	self.input5 = QFWDModifierMainUI:AddInput2(self,"input5","1",self.sx/10*2.3,self.sy/10*(ky+0.1));
	self.input5:SetSize(self.sx/10*0.8, 20, false);
	self.input5.m_title.restrict = "[0-9]";
	self.input5.m_title.maxLength = 2;
	
	QFWDModifierMainUI:AddLable2(self,"lable6",QFLanguage.GetText(">MapSet_lable6"),self.sx/10*4,self.sy/10*ky,200,35);
	self.input4 = QFWDModifierMainUI:AddInput2(self,"input4","1",self.sx/10*4.8,self.sy/10*(ky+0.1));
	self.input4:SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lable8","Y:",self.sx/10*8,self.sy/10*ky,200,35);
	self.input8 = QFWDModifierMainUI:AddInput2(self,"input8","0",self.sx/10*8.4,self.sy/10*(ky+0.1));
	self.input8:SetSize(80, 20, false);
	self.input8.m_title.restrict = "[0-9]";
	ky=ky+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntSetList",QFLanguage.GetText(">MapSet_bntSetList"),self.sx/10*2,self.sy/10*ky):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesList",QFLanguage.GetText(">MapSet_bntYesList"),self.sx/10*3.5,self.sy/10*ky):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntUpdateList",QFLanguage.GetText(">MapSet_bntUpdateList"),self.sx/10*8.4,self.sy/10*ky):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesAllMap",QFLanguage.GetText(">MapSet_bntYesAllMap"),self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.2, 20, false);




	self.Thekey=1;
	self.MapAttributeType=1;
	self.listNum = nil;
	self.listThing = nil;
	QFWDlib.OnInit();
	MapSet:UseUpdateList();
	self.window:Center();
end

function MapSet:OnShowUpdate()
	
end

function MapSet:OnShown()
	MapSet.isShowing = true
	ModifierMain.showWindow=4;
	local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
	local position=MapSet:GetXY(Key);
	MapSet.input7.m_title.text=tostring(position.x);
	MapSet.input8.m_title.text=tostring(position.y);
end

function MapSet:OnUpdate()

end

function MapSet:OnHide()
	MapSet.isShowing = false;
	ModifierMain.showWindow=0;
end
function MapSet:GetXY(key)
	local position={};
	position.y=math.floor(key/Map.Size);
	position.x=key%Map.Size;
	return position;
end
function MapSet:PasteData()
	if MapThingList==nil or MapThingList=={} then
		return false;
	end
	MapSet:ShowThing(_,_,0);
	
	return true ;
end
function MapSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		-- if obj.name == "bntUnFog" then
			-- if MapSet.CheckBox1.selected then
				-- MapSet:MapFog(1);
				-- MapSet.ShowLable.text = "已经开启地图迷雾。";
			-- else
				-- MapSet:MapFog(0);
				-- MapSet.ShowLable.text = "已经关闭地图迷雾。";
			-- end
			-- return;
		-- end
		if obj.name == "bntPasteData" then
			MapSet:PasteData();
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips1");
			return;
		end
		if obj.name == "bntShowMap" then
			MapSet:ShowMap();
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips2");
			return;
		end
		if obj.name == "bntClean" then
			MapSet:RemoveDust();
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips3");
			return;
		end
		if obj.name == "bntClear1" then
			MapSet:Search(1);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips4");
			return;
		end
		if obj.name == "bntClear2" then
			MapSet:Search(2);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips4");
			return;
		end
		if obj.name == "bntClear3" then
			MapSet:Search(3);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips4");
			return;
		end
		if obj.name == "bntClear4" then
			MapSet:Search(4);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips4");
			return;
		end
		if obj.name == "bntClear5" then
			MapSet:Search(5);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips4");
			return;
		end
		if obj.name == "bntClear6" then
			MapSet:Search(6);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips4");
			return;
		end
		if obj.name == "bntClear11" then
			MapSet:ShowThing(obj,1);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips5");
			MapSet.listNum = 1;
			return;
		end
		if obj.name == "bntClear21" then
			MapSet:ShowThing(obj,2);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips5");
			MapSet.listNum = 2;
			return;
		end
		if obj.name == "bntClear31" then
			MapSet:ShowThing(obj,3);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips5");
			MapSet.listNum = 3;
			return;
		end
		if obj.name == "bntClear41" then
			MapSet:ShowThing(obj,4);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips5");
			MapSet.listNum = 4;
			return;
		end
		if obj.name == "bntClear51" then
			MapSet:ShowThing(obj,5);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips5");
			MapSet.listNum = 5;
			return;
		end
		if obj.name == "bntClear61" then
			MapSet:ShowThing(obj,6);
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips5");
			MapSet.listNum = 6;
			return;
		end
		if obj.name == "bntUpdateList" then
			MapSet:UseUpdateList();
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips6");
			return;
		end
		if obj.name == "bntSetList" then
			MapSet:SetMapAttributeList();
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips7");
			return;
		end
		if obj.name == "bntYesList" then
			MapSet:YesMapAttributeList();
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips8");
			return;
		end
		if obj.name == "bntYesAllMap" then
			MapSet:SetAllMapAttributeList();
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips9");
			return;
		end
		if obj.name == "bntClearing" then
			if MapSet:RemoveThing(tonumber(MapSet.input1.m_title.text),tonumber(MapSet.input2.m_title.text)) then
				MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips10");
				--MapSet:UpdataThing();
			else
				MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips11");
			end
			return;
		end
		if obj.name == "bntClearingAll" then
			if MapSet:RemoveThing(2,0) then
				MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips12");
				--MapSet:UpdataThing();
			else
				MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips11");
			end
			return;
		end
		if obj.name == "bntClearingOne" then
			if MapSet:RemoveThing(tonumber(MapSet.input1.m_title.text),tonumber(MapSet.input1.m_title.text)) then
				MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips12");
				--MapSet:UpdataThing();
				--MapSet.input1.m_title.text = tostring(tonumber(MapSet.input1.m_title.text) + 1);
				--MapSet.input2.m_title.text = MapSet.input1.m_title.text;
			else
				MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips11");
			end
			return;
		end
		if obj.name == "bntClearingUpdate" then
				MapSet:UpdataThing();
			return;
		end
		if obj.name == "bntAreaManager" then
			MapSet:Hide();
			MapAreaSet:Show();
			MapSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips14");
			return;
		end
		-- if obj.name == "bntRandomSeedSet" then
			-- if MapSet.input3.m_title.text ~= nil then
				-- MapSet:SetARandomSeed(tonumber(MapSet.input3.m_title.text));
				-- MapSet.showWorldFlagLable.text = "修改随机种子的值为:"..MapSet.input3.m_title.text;
			-- else
				-- self.WorldLuaHelper:ShowMsgBox("你还没有输入待修改的值！","异常");
			-- end
			-- return;
		-- end
	end
end
function MapSet:SearchAllThing()
	--local came = CS.UnityEngine.GameObject.Find("MainCamera");--:SetActive(false)
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
	--came.transform.positon = CS.UnityEngine.Vector3(0,0,0);
	-- local go1 = CS.UnityEngine.GameObject("Cube");
	-- local go2 = CS.UnityEngine.GameObject("Sphere");
	-- --local go3 = CS.UnityEngine.Time.time;
	-- --local go4 = CS.UnityEngine.SceneManager.GetActiveScene()
	-- --CS.UnityEngine.Time.timeScale=10;

-- --访问对象属性
	-- print("MOD版修改器:GameObject1:", go1.name, "GameObject2:", go2.name)
	-- print("MOD版修改器:"..tostring(go3))
-- --修改对象属性
	-- go1.name = "Cube--"
	-- go2.name = "Sphere--"
	-- print("MOD版修改器:GameObject1:", go1.name, "GameObject2:", go2.name)
	-- print(go1.transform.positon)
	-- --print(go4.name)
-- ----调用对象方法(调用对象方法时注意使用":"语法糖)
	-- go1:SetActive(true)  --go1.SetActive(go1, false) 也可以这样调用
	-- go2:SetActive(true)  --go2.SetActive(go2, false) 也可以这样调用
	
	
	
	--GameMain:GetMod("BuildModeHelper"):ChangeWeather("ZuShiBiHu");
	--Map:AddGlobleModifier("Weather_LingUpWave")--("Human", "g_emThingDir.Up", 1, "g_emNpcRichLable.Poorest");
	--Map:AddJoiner("", 1, 1, 0);--CS.XiaWorld.ThingsData.BossList
	-- local npc = ThingMgr:AddNpc("Human",60,nil,CS.XiaWorld.Fight.g_emFightCamp.Player);
	-- npc:AddTitle("清风");
	-- npc.PropertyMgr:SetSex(CS.XiaWorld.g_emNpcSex.Female);
	--npc:AddFaith(60);
	--npc:AddSchoolScore(2,3000);
	--npc:NeckBroken();
	--npc:Kill();
	-- for k, v in pairs(Map.Things.m_Things) do
		-- --ThingMgr:GetDef(2,v.Item)
		-- --print(k,v);
		-- --ThingMgr:AddItemThing(2,v.Item);
	-- end
--Map.Things:GetPlayerActiveNpcs(CS.XiaWorld.g_emNpcRaceType.Wisdom)
--Map.Things:GetActiveNpcs();

end
function MapSet:UseUpdateList()
	local key=nil;
	local numX=tonumber(MapSet.input7.m_title.text);
	local numY=tonumber(MapSet.input8.m_title.text);
	key = MapSet:GetKey(numX,numY);
	if key<=0 then
		key=1;
	end
	MapSet.Thekey=key;
	local types=tonumber(MapSet.input3.m_title.text);
	if types==nil or types<1  then 
		types=1;
		MapSet.input3.m_title.text="1";
	end
	if types>3 then
		types=3;
		MapSet.input3.m_title.text="3";
	end
	MapSet.TypesLab.text = QFLanguage.GetText(">MapSet_Tips15")..": "..tostring(QFWDlib.MapAttributeTypesName[types]);
	MapSet.MapAttributeType=types;
	MapSet:ShowMapAttribute();
end
function MapSet:MapFog(a)
	if a==0 then
		CS.GameMain.Instance.NoFog = true;
		local map = Map.Size-1;
		local x=nil;
		local y=nil;
		for x=0,map do
			for y=0,map do
				CS.MapRender.Instance.Fog:Unfog(x, y);
			end
		end
	else
		CS.GameMain.Instance.NoFog = false;
	end
end
function MapSet:ShowMap()
	local map = Map.Size-1;
	local x=nil;
	local y=nil;
	for x=0,map do
		for y=0,map do
			CS.MapRender.Instance.Fog:Unfog(x, y);
		end
	end
end

function MapSet:GetKey(x,y)
	if x > Map.Size then
		x = Map.Size;
		--self.WorldLuaHelper:ShowMsgBox("输入的X值溢出！","异常");
	end
	if y > Map.Size then
		y = Map.Size;
		--self.WorldLuaHelper:ShowMsgBox("输入的Y值溢出！","异常");
	end
	return x + y * (Map.Size);

end

function MapSet:RemoveDust()
	-- local map = Map.Size-1;
	-- for x=0,map do
		-- for y=0,map do
			-- --CS.MapRender.Instance:RemoveDust(x + y * (Map.Size));
			-- CS.MapRender.Instance:RemoveFloor(x + y * (Map.Size));
		-- end
	-- end
	--Map:CallEnemie("1",2,g_emNpcRichLable.Normal,true,0,false,0);
	local localKey=nil;
	local localValue=nil;
	local mapDust = ThingMgr:GetThingList(g_emThingType.CMD);
	--local mapDust = ThingMgr:GetThingList(2);
	for localKey, localValue in pairs(mapDust) do
		--ThingMgr:GetDef(2,localValue.Item)
		--print(localKey,localValue);
		ThingMgr:RemoveThing(localValue,true,true);
		CS.MapRender.Instance:RemoveDust(localValue.Key);
		--ThingMgr:AddItemThing(2,localValue.Item);
	end
end
function MapSet:Search(a)
	-- local map = Map.Size-1;
	-- for x=0,map do
		-- for y=0,map do
			-- --CS.MapRender.Instance:RemoveDust(x + y * (Map.Size));
			-- CS.MapRender.Instance:RemoveFloor(x + y * (Map.Size));
		-- end
	-- end
	--Map:CallEnemie("1",2,g_emNpcRichLable.Normal,true,0,false,0);
	-- if a==0 then
		-- MapSet.mapListThing = ThingMgr:GetThingList(g_emThingType.None);
	-- else
	if a==1 then
		MapSet.mapListThing1 = ThingMgr:GetThingList(g_emThingType.Npc);
	elseif a==2 then
		MapSet.mapListThing2 = ThingMgr:GetThingList(g_emThingType.Item);
	elseif a==3 then
		MapSet.mapListThing3 = ThingMgr:GetThingList(g_emThingType.Plant);
	elseif a==4 then
		MapSet.mapListThing4 = ThingMgr:GetThingList(g_emThingType.Building);
	elseif a==5 then
		MapSet.mapListThing5 = ThingMgr:GetThingList(g_emThingType.Space);
	elseif a==6 then
		MapSet.mapListThing6 = ThingMgr:GetThingList(g_emThingType.CMD);
	end
	--local mapDust = ThingMgr:GetThingList(2);
	-- for k, v in pairs(MapSet.mapListThing1) do
		-- print(k,tostring(v));
		-- -- ThingMgr:RemoveThing(v,true,true);
		-- -- CS.MapRender.Instance:RemoveDust(v.Key);
		-- -- --ThingMgr:AddItemThing(2,v.Item);
	-- end
end
function MapSet:ShowThing(obj,a,types)
	-- local map = Map.Size-1;
	-- for x=0,map do
		-- for y=0,map do
			-- --CS.MapRender.Instance:RemoveDust(x + y * (Map.Size));
			-- CS.MapRender.Instance:RemoveFloor(x + y * (Map.Size));
		-- end
	-- end
	--Map:CallEnemie("1",2,g_emNpcRichLable.Normal,true,0,false,0);
	-- if a==0 then
		-- MapSet.mapListThing = ThingMgr:GetThingList(g_emThingType.None);
	-- else
	
	local info = nil;
	if types==0 then
		MapSet.thingListObj.m_title.text=QFLanguage.GetText(">MapSet_Tips16");
		self.listThing = MapThingList;
	else
		MapSet.thingListObj.m_title.text = QFLanguage.GetText(">MapSet_Tips17");
		if a==1 then
			self.listThing = MapSet.mapListThing1;
		elseif a==2 then
			self.listThing = MapSet.mapListThing2;
		elseif a==3 then
			self.listThing = MapSet.mapListThing3;
		elseif a==4 then
			self.listThing = MapSet.mapListThing4;
		elseif a==5 then
			self.listThing = MapSet.mapListThing5;
		elseif a==6 then
			self.listThing = MapSet.mapListThing6;
		end
	end
	
	local localKey=nil;
	local localValue=nil;
	MapSet:RemoveChildrenToList(MapSet.thingListObj)
	--local mapDust = ThingMgr:GetThingList(2);
	local num = 0;
	for localKey, localValue in pairs(self.listThing) do
		if num <= 2200 then
			MapSet:AddChildToList(MapSet.thingListObj,tostring(num),tostring(num)..":  "..tostring(localValue),localValue.def.TexPath);
		elseif num == 2201 then
			MapSet:AddChildToList(MapSet.thingListObj,tostring(num),QFLanguage.GetText(">MapSet_Tips18"));
			break;
		else
			break;
		end
		
		num = num + 1;
	end
end
function MapSet:UpdataThing()
	if MapSet.listNum==1 then
		self.listThing = MapSet.mapListThing1;
	elseif MapSet.listNum==2 then
		self.listThing = MapSet.mapListThing2;
	elseif MapSet.listNum==3 then
		self.listThing = MapSet.mapListThing3;
	elseif MapSet.listNum==4 then
		self.listThing = MapSet.mapListThing4;
	elseif MapSet.listNum==5 then
		self.listThing = MapSet.mapListThing5;
	elseif MapSet.listNum==6 then
		self.listThing = MapSet.mapListThing6;
	else 
		self.WorldLuaHelper:ShowMsgBox(QFLanguage.GetText(">MapSet_Tips19"),QFLanguage.GetText(">FlagSet_Tips8"));
		return;
	end
	MapSet:RemoveChildrenToList(MapSet.thingListObj);
	local num = 0;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(self.listThing) do
		
		if num <= 2200 then
			MapSet:AddChildToList(MapSet.thingListObj,tostring(num),tostring(num)..":  "..tostring(localValue),localValue.def.TexPath);
		elseif num == 2201 then
			MapSet:AddChildToList(MapSet.thingListObj,tostring(num),QFLanguage.GetText(">MapSet_Tips18"));
			break;
		else
			break;
		end
		
		num = num + 1;
	end
end
function MapSet:RemoveThing(rmin,rmax)
	local localKey=nil;
	local localValue=nil;
	local IsRemove = false;
	if rmin > rmax then
		for localKey, localValue in pairs(self.listThing) do
		--print(localKey,localValue);
			ThingMgr:RemoveThing(localValue,true,true);
			IsRemove = true;
		end
	else
		local num = 0;
		for localKey, localValue in pairs(self.listThing) do
		--print(localKey,localValue);
			if num >= rmin and num <= rmax then
				ThingMgr:RemoveThing(localValue,true,true);
				IsRemove = true;
			elseif num>rmax then
				break;
			end
			num = num + 1;
		end
	end
	return IsRemove;
end
function MapSet:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*4.2, 25, false);
	obj.m_title.text = value;
	if icon ~= nil then
		obj.m_icon.icon = icon;
	else
		obj.m_icon.icon = "";
	end

	--obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function MapSet:RemoveChildrenToList(tobj)
	--print("MOD版修改器:移除")
	tobj.m_list:RemoveChildrenToPool();
end
function MapSet:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(MapSet.ListChildOnClick3);
	obj.m_title.text = QFLanguage.GetText(">AddManager_Tips35");
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
function MapSet.ListChildOnClick3(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	MapSet.TheClickBnt = tonumber(Eventss.data.name);
	MapSet:SetSetting();
	
end
function MapSet:SetSetting(types)
	local obj=nil;
	if types==nil then
		obj=MapSet.input1;
	else
		obj=MapSet.input1;
	end
	--print(tostring(MapSet.TheClickBnt))
	--print("MOD版修改器:click!")
	obj.m_title.text=tostring(MapSet.TheClickBnt);
	MapSet.input2.m_title.text=tostring(MapSet.TheClickBnt);
	--MapSet:ChooseThingNumAndGetAttribute(MapSet.TheClickBnt);
end
function MapSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function MapSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function MapSet:ListChildOnClick()
	-- for k, v in pairs(self.listThing) do
		-- --print(k,v);
		-- if tostring(k) == context.data.name then
			-- ThingMgr:RemoveThing(v,true,true);
		-- end
	-- end
	--print("MOD版修改器:click")
	--local button = UnityEngine.EventSystems.EventSystem.current.currentSelectedGameObject;
	--print(button.m_title.text)
end
function MapSet:AddCOP2(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(MapSet.ListChildOnClick2);
	obj.m_title.text = QFLanguage.GetText(">MapSet_Tips20");
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
function MapSet.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	MapSet.TheClickBnt = tonumber(Eventss.data.name);
	MapSet:SetSetting2();
	
end
function MapSet:SetSetting2(types)
	local obj=nil;
	if types==nil then
		obj=MapSet.input5;
	else
		obj=MapSet.input5;
	end
	--print(tostring(MapSet.TheClickBnt))
	obj.m_title.text=tostring(MapSet.TheClickBnt);
	--MapSet:ChooseThingNumAndGetAttribute(MapSet.TheClickBnt);
end
function MapSet:ShowMapAttribute()
	MapSet.MapAttributeList={};
	MapSet.MapAttributeListNum={};
	local num=1;
	local types=nil;
	--local jcnum=1;
	if Map==nil or Map.Effect==nil then
		return false;
	end
	local e=Map.Effect;
	for num=1,#QFWDlib.MapAttributeTypes do
		--if Map~=nil then--and Map.Effect~=nil then
			types=QFWDlib.MapAttributeTypes[num];
			MapSet.MapAttributeList[num]=e:GetEffectData(MapSet.Thekey,types);
			if MapSet.MapAttributeList[num]==nil then
				MapSet.MapAttributeList[num]="nil";
			end
			MapSet.MapAttributeListNum[num]=num;
			--jcnum=jcnum+1;
		--end
	end
	MapSet:UpdataMapAttribute();
	--MapSet:ChooseThingNumAndGetAttribute(MapSet.TheClickBnt);
end
function MapSet:UpdataMapAttribute()
	local ym=MapSet.MapAttributeType;
	local num=nil;
	local Value=nil;
	MapSet.MapAttributeListValue={};
	MapSet.MapAttributeListValueOld={};
	MapSet.thingListObj2.m_list:RemoveChildrenToPool();
	for num=1,#QFWDlib.MapAttributeTypesDisplay do
		MapSet:AddChildToList(MapSet.thingListObj2,tostring(num),tostring(num)..":  "..tostring(QFWDlib.MapAttributeTypesDisplay[num]));
		if MapSet.MapAttributeList[num]==nil or MapSet.MapAttributeList[num]=="nil" then
			Value="nil";
		else
			if MapSet.MapAttributeType==1 then
				Value=MapSet.MapAttributeList[num].addp;
			elseif  MapSet.MapAttributeType==2  then
				Value=MapSet.MapAttributeList[num].addv;
			else
				Value=MapSet.MapAttributeList[num].basevalue;
			end
		end
		MapSet.MapAttributeListValue[num]=tostring(Value);
		MapSet.MapAttributeListValueOld[num]=MapSet.MapAttributeListValue[num];
		MapSet:AddChildToList(MapSet.thingListObj2,"0"..tostring(num),tostring(MapSet.MapAttributeListValue[num]));
	end
end
function MapSet:SetMapAttributeList()
	local num1=tonumber(MapSet.input5.m_title.text);
	local num2=tonumber(MapSet.input4.m_title.text);
	if num1<0 or num1==nil or num1>#MapSet.MapAttributeList then
		MapSet.input5.m_title.text="1";
		num1=1;
	end
	if num2==nil then
		num2=0;
		MapSet.input4.m_title.text=tostring(num2);
	end
	--print(num1,num2)
	MapSet.MapAttributeListValue[num1]=num2;
	MapSet:UpdataMapAttributeByHaveData();
end
function MapSet:UpdataMapAttributeByHaveData()
	local ym=MapSet.MapAttributeType;
	local num=nil;
	MapSet.thingListObj2.m_list:RemoveChildrenToPool();
	for num=1,#MapSet.MapAttributeList do
		MapSet:AddChildToList(MapSet.thingListObj2,tostring(num),tostring(num)..":  "..tostring(QFWDlib.MapAttributeTypesDisplay[num]));
		MapSet:AddChildToList(MapSet.thingListObj2,"0"..tostring(num),tostring(MapSet.MapAttributeListValue[num]));
	end
end
function MapSet:YesMapAttributeList()
	local length=#MapSet.MapAttributeList;
	local typess=MapSet.MapAttributeType;
	local key=MapSet.Thekey;
	MapSet:SetWantMapAttributeList(length,typess,key);
	MapSet:ShowMapAttribute();
	
end
function MapSet:SetWantMapAttributeList(length,typess,Thekey)
	local num=1;
	if typess==3 then
		for num=1,length do
			if MapSet.MapAttributeListValue[num]~=MapSet.MapAttributeListValueOld[num] then
				MapSet.MapAttributeListValue[num]=tonumber(MapSet.MapAttributeListValue[num]);
				if MapSet.MapAttributeListValue[num]==nil then
					MapSet.MapAttributeListValue[num]=0;
				end
				MapSet.MapAttributeListValueOld[num]=tonumber(MapSet.MapAttributeListValueOld[num]);
				if MapSet.MapAttributeListValueOld[num]==nil then
					MapSet.MapAttributeListValueOld[num]=0;
				end
				Map.Effect:AddEffectBase(Thekey,QFWDlib.MapAttributeTypes[num],MapSet.MapAttributeListValue[num]-MapSet.MapAttributeListValueOld[num]);
			end
		end
	elseif typess==2 then
		for num=1,length do
			if MapSet.MapAttributeListValue[num]~=MapSet.MapAttributeListValueOld[num] then
				MapSet.MapAttributeListValue[num]=tonumber(MapSet.MapAttributeListValue[num]);
				if MapSet.MapAttributeListValue[num]==nil then
					MapSet.MapAttributeListValue[num]=0;
				end
				MapSet.MapAttributeListValueOld[num]=tonumber(MapSet.MapAttributeListValueOld[num]);
				if MapSet.MapAttributeListValueOld[num]==nil then
					MapSet.MapAttributeListValueOld[num]=0;
				end
				Map.Effect:AddEffect(Thekey,QFWDlib.MapAttributeTypes[num],MapSet.MapAttributeListValue[num]-MapSet.MapAttributeListValueOld[num]);
			end
		end
	else
		for num=1,length do
			if MapSet.MapAttributeListValue[num]~=MapSet.MapAttributeListValueOld[num] then
				MapSet.MapAttributeListValue[num]=tonumber(MapSet.MapAttributeListValue[num]);
				if MapSet.MapAttributeListValue[num]==nil then
					MapSet.MapAttributeListValue[num]=0;
				end
				MapSet.MapAttributeListValueOld[num]=tonumber(MapSet.MapAttributeListValueOld[num]);
				if MapSet.MapAttributeListValueOld[num]==nil then
					MapSet.MapAttributeListValueOld[num]=0;
				end
				Map.Effect:AddEffect(Thekey,QFWDlib.MapAttributeTypes[num],0,MapSet.MapAttributeListValue[num]-MapSet.MapAttributeListValueOld[num]);
			end
		end
	end
end
function MapSet:SetAllMapAttributeList()
	local keybegin=1;
	local keyend=Map.Size*Map.Size-1;
	local typess=MapSet.MapAttributeType;
	local MapAttributeList={};
	local GetEffectData=nil;
	local oldvalue=nil;
	local newvalue=nil;
	local valuelist=MapSet.MapAttributeListValue;
	local num=1;
	local types=nil;
	local value=0;
	local numValue={};
	for num=1,#MapSet.MapAttributeListNum do
		numValue[num]=MapSet.MapAttributeListNum[num];
	end
	if typess==3 then
		for keybegin=1,keyend do
			for num=1,#MapSet.MapAttributeListNum do
				GetEffectData=Map.Effect:GetEffectData(keybegin,QFWDlib.MapAttributeTypes[numValue[num]]);
				if GetEffectData~=nil then
					oldvalue=GetEffectData.basevalue;
					if oldvalue==nil then
						oldvalue=0;
					end
					newvalue=valuelist[num]-oldvalue;
					Map.Effect:AddEffectBase(keybegin,QFWDlib.MapAttributeTypes[numValue[num]],newvalue);
				end
			end
		end
	elseif typess==2 then
		for keybegin=1,keyend do
			for num=1,#MapSet.MapAttributeListNum do
				GetEffectData=Map.Effect:GetEffectData(keybegin,QFWDlib.MapAttributeTypes[numValue[num]]);
				if GetEffectData~=nil then
					oldvalue=GetEffectData.addv;
					if oldvalue==nil then
						oldvalue=0;
					end
					newvalue=valuelist[num]-oldvalue;
					Map.Effect:AddEffect(keybegin,QFWDlib.MapAttributeTypes[numValue[num]],newvalue);
				end
			end
		end
	else
		for keybegin=1,keyend do
			for num=1,#MapSet.MapAttributeListNum do
				GetEffectData=Map.Effect:GetEffectData(keybegin,QFWDlib.MapAttributeTypes[numValue[num]]);
				if GetEffectData~=nil then
					oldvalue=GetEffectData.addp;
					if oldvalue==nil then
						oldvalue=0;
					end
					newvalue=valuelist[num]-oldvalue;
					Map.Effect:AddEffect(keybegin,QFWDlib.MapAttributeTypes[numValue[num]],0,newvalue);
				end
			end
		end
	end
end
-- local cuee = CS.UnityEngine;
-- local ui = CS.UnityEngine.UI;

-- 在 C# 的 Start 中调用
--用来初始化
-- function OnStart(gObj)
-- --获取一个 UnityEngine.UI 里的 Text
	-- local texts = GetComponentsInChildren(gObj,ui.Text);
	-- for i = 0, texts.Length - 1 do
	-- print(texts[i].text);
	-- end
-- end

-- --获取子组件
-- --gObj 父组件
-- --ty 要获取的子组件类型
-- --tag 组件的tag
-- --retys 返回要获取的所有组件
-- function GetComponentsInChildren(gObj,ty,tag)
-- --获取所有 ty 类型的组件
	-- local tys = gObj:GetComponentsInChildren(typeof(ty));
	-- if tag == nil then
-- --返回组件
		-- return tys;
	-- else
			-- --要返回的所有的 ty 类型的组件
		-- local retys = {};
			-- --循环查找 tag 相同的组件
		-- for i,v in pairs(tys) do
			-- --如果 tag 相等进入
			-- if v.gameObject.tag == tag then
			-- --将要获取的组件存到 retys 里
				-- table.insert(retys,v);
			-- end
		-- end
			-- --返回组件
		-- return retys;
	-- end
-- end
