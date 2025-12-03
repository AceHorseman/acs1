PlantManager = CS.Wnd_Simple.CreateWindow("PlantManager");
ModifierMain:AddWindow("PlantManager",PlantManager);
function PlantManager.WndOnHotKey()
	if QFForeInte~=nil and QFForeInte.GetKeyDownKeyStr~=nil then
		if QFForeInte.GetKeyForeverDownStr("mouse 0") and QFForeInte.GetKeyDownKeyStr("4") then
			if PlantManager.isShowing then
				PlantManager:Hide();
			else
				local EasyUse=ModifierMain:FindWindow("EasyUse");
				if EasyUse~=nil then
					EasyUse.PlantSetting();
				else
					PlantManager:Show();
				end
			end
		end
	end
end
function PlantManager:OnInit()
	self.listType=0;
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">PlantManager_Title"));
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);
	self.ThingsAttributeNameTrue = {}
	self.ThingsAttributeDisplayName = 
	{
		"名字:Name","华丽程度:Beauty","数量:Count","捆绑MOD:",
		"捆绑装备MOD:","捆绑符咒MOD:","血量:HP","灵气值:",
		"动态灵气值:DynamicLing","品阶:Rate","描述:Desc",
		
		"蕴养灵煞速度:","蕴养灵煞停止时间:","灵煞值:","灵植生长速度:",
		"蕴养灵煞下降生长速度:","生长度:","生长度(保持):","年龄:",
		"成熟程度:","生长程度:(下项开始禁止修改!)",
		
		"捆绑Modifier:BindModifier","捆绑天气:BindWeather",
		"挡光度:BlockLight","掩体度:BlockMissile","最大灵气:LingMax","最小灵气:LingMin",
		"耐久度:MaxHitPoints","最大堆叠数:MaxStack","3D模型路径:ModPath","模型不在地上的缩放度:ModScale",
		"无五行属性:NoElementKind","可被选中:SelectAble","图片路径:TexPath","图片缩放比例:TexScale",
		"地图块ID:TileID","使用血量:UseHitPoints","视野半径:VisionRadius","可见:VisualAble",
		
	};
	self.Things={};
	self.MapThings={};
	self.MapThingsDisplayName={};
	self.OldThingsAttributeNameTrue={};
	self.SearchThings={};
	PlantManager.listtypes=0;
	
	
	self.ChooseThingNum = 1;
	self.ThingsAttributeCount=38;
	QFWDModifierMainUI:AddLable2(self,"lable3111",QFLanguage.GetText(">PlantManager_lable3111"),self.sx/10,self.sy/10*2,200,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2);
	self.inputid1:SetSize(50, 25, false);
	self.inputid1.m_title.restrict = "[0-9]";
	self.inputid1.m_title.maxLength = 5;
	self.ShowLableThing = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc",QFLanguage.GetText(">PlantManager_ShowLableNpc")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*1.5,300,35);
	QFWDModifierMainUI:AddButton2(self,"bntChooseThing",QFLanguage.GetText(">ThingManager_bntChooseThing"),self.sx/10*3,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"bntChooseThingShow","选中",self.sx/10*5.5,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false);
	self.CheckBox1 = self:AddCheckBox("bntChooseThingShow",QFLanguage.GetText(">ThingManager_bntChooseThingShow"),self.sx/10*4.5,self.sy/10*2);
	self.CheckBox1.selected = false;
	self.CheckBox2 = self:AddCheckBox("bntSetset",QFLanguage.GetText(">PlantManager_bntSetset"),self.sx/10*5.75,self.sy/10*2);
	self.CheckBox2.selected = true;
	self.CheckBoxs3 = self:AddCheckBox("bntMSearch",QFLanguage.GetText(">ThingManager_bntMSearch"),self.sx/10*7,self.sy/10*2);
	self.CheckBoxs3.selected = true;
	--QFWDModifierMainUI:AddButton2(self,"bntListThingBaseAttribute","显示基础属性",self.sx/10,self.sy/10*7):SetSize(self.sx/10*1.2, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"bntListThingBntAttribute","显示按钮属性",self.sx/10*2,self.sy/10*7):SetSize(self.sx/10*1.2, 25, false);

	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute",QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*3,300,35);
	self.ShowLableAttribute:SetSize(self.sx/10*7, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">ThingManager_lable3"),self.sx/10,self.sy/10*3.5,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*3.5);
	self.input1:SetSize(50, 25, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 3;
	QFWDModifierMainUI:AddLable2(self,"lable4",QFLanguage.GetText(">ThingManager_lable4"),self.sx/10,self.sy/10*4,200,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","清",self.sx/10*2,self.sy/10*4);
	self.input2:SetSize(self.sx/10*6, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSet",QFLanguage.GetText(">ThingManager_bntSet"),self.sx/10*3,self.sy/10*4.5,nil,nil,QFLanguage.GetText(">ThingManager_Tips1")):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesSetNpc",QFLanguage.GetText(">ThingManager_bntYesSetNpc"),self.sx/10*5.5,self.sy/10*4.5,nil,nil,QFLanguage.GetText(">ThingManager_Tips2")):SetSize(self.sx/10*1.2, 25, false);
	self.CheckBox3 = self:AddCheckBox("NoGrass",QFLanguage.GetText(">PlantManager_NoGrass"),self.sx/10,self.sy/10*5.5);
	self.CheckBox3.selected = true;
	self.CheckBox4 = self:AddCheckBox("NoStone",QFLanguage.GetText(">PlantManager_NoStone"),self.sx/10*3,self.sy/10*5.5);
	self.CheckBox4.selected = true;
	local sy=6;
	QFWDModifierMainUI:AddLable2(self,"lable16",QFLanguage.GetText(">BuildingManager_lable16"),self.sx/10,self.sy/10*sy,200,35);
	--sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntTL",QFLanguage.GetText(">BuildingManager_bntTL"),self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntST",QFLanguage.GetText(">BuildingManager_bntST"),self.sx/10*5.75,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntTLST",QFLanguage.GetText(">BuildingManager_bntTLST"),self.sx/10*7,self.sy/10*sy,nil,nil,QFLanguage.GetText(">BuildingManager_Tips36")):SetSize(self.sx/10*1.2, 25, false);
	
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable5",QFLanguage.GetText(">BuildingManager_lable5"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable6",QFLanguage.GetText(">PlantManager_lable6"),self.sx/10,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntRepairAll",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*2,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable7",QFLanguage.GetText(">PlantManager_lable7"),self.sx/10*3.5,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAll",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable9",QFLanguage.GetText(">PlantManager_lable9"),self.sx/10*6,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntChangeAll",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	

	-- QFWDModifierMainUI:AddLable2(self,"lable8","变成灵植:",self.sx/10,self.sy/10*7,200,35);
	-- QFWDModifierMainUI:AddButton2(self,"bntChangeAllLingPlant","当前列表",self.sx/10*2,self.sy/10*7):SetSize(self.sx/10*1.2, 25, false);

	self.ThingListCOP = self:AddCOP("NpcList",-self.sx/10*4.15,self.sy/10*0.7,2);
	self.ThingAttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*9.85,self.sy/10*0.7,1);
	
	-- QFWDModifierMainUI:AddLable2(self,"plable1","召唤的坐标:",self.sx/10*7,self.sy/10*1.5,200,35);
	-- QFWDModifierMainUI:AddLable2(self,"lablex","横坐标X:",self.sx/10*7,self.sy/10*2,200,35);
	-- self.input11 = QFWDModifierMainUI:AddInput2(self,"input11","80",self.sx/10*8,self.sy/10*2);
	-- self.input11:SetSize(40, 25, false);
	-- self.input11.m_title.restrict = "[0-9]";
	-- self.input11.m_title.maxLength = 3;
	-- QFWDModifierMainUI:AddLable2(self,"labley","纵坐标Y:",self.sx/10*7,self.sy/10*2.5,200,35);
	-- self.input21 = QFWDModifierMainUI:AddInput2(self,"input21","80",self.sx/10*8,self.sy/10*2.5);
	-- self.input21:SetSize(40, 25, false);
	-- self.input21.m_title.restrict = "[0-9]";
	-- self.input21.m_title.maxLength = 3;
	QFWDModifierMainUI:AddButton2(self,"bntUpdataThingList",QFLanguage.GetText(">AddManager_bntAllThing"),-self.sx/10*0.9,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSearchThing",QFLanguage.GetText(">AddManager_bntSearchThing"),-self.sx/10*1.8,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch",QFLanguage.GetText(">AddManager_inputSearch"),-self.sx/10*4,self.sy/10*9);
	self.inputSearch:SetSize(140, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntPageUp","<",-self.sx/10*3.85,self.sy/10*0.9,nil,nil,QFLanguage.GetText(">AddManager_bntPageUp")):SetSize(self.sx/10*0.3, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntPageDown",">",-self.sx/10*0.58,self.sy/10*0.9,nil,nil,QFLanguage.GetText(">AddManager_bntPageDown")):SetSize(self.sx/10*0.3, 25, false);
	
	-- QFWDModifierMainUI:AddButton2(self,"bntUpdataAllNpcList","NPC列表",-self.sx/10*2.65,self.sy/10*8.65):SetSize(self.sx/10*1.2, 25, false);
	-- QFWDModifierMainUI:AddButton2(self,"bntListBuff","AllMF",-self.sx/10*4,self.sy/10*8.65):SetSize(self.sx/10*0.6, 25, false);
	-- QFWDModifierMainUI:AddButton2(self,"bntListFeature","AllFT",-self.sx/10*3.45,self.sy/10*8.65):SetSize(self.sx/10*0.6, 25, false);
	self.chooseNpcNum = 0;
	QFWDlib.OnInit();
	self:PlantManagerIn();
	self.window:Center();
end

function PlantManager:OnShowUpdate()
	
end

function PlantManager:OnShown()
	PlantManager.isShowing = true
	
end

function PlantManager:OnUpdate()
	if PlantManager.isShowing == true then
		local num = tonumber(PlantManager.input1.m_title.text);
		if num == nil then
			PlantManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
			return;
		elseif num > #PlantManager.ThingsAttributeDisplayName then
			PlantManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
			return;
--		elseif num==5 then
--			num = tonumber(PlantManager.input2.m_title.text);
--			if  num ~= nil then
--				if num <= #QFWDlib.race then
--					PlantManager.ShowLableAttribute.text="当前选择的属性: "..PlantManager.Attributes[num].."  种类: "..QFWDlib.race[tonumber(PlantManager.input2.m_title.text)];
--				end
--			end
--			PlantManager.ShowLableAttribute.text="当前选择的属性: "..PlantManager.Attributes[num];
		elseif num==0 then
			PlantManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
		else
			PlantManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..": "..PlantManager.ThingsAttributeDisplayName[num];
		end
		if num ~= PlantManager.AttributeFlag then
			PlantManager.AttributeFlag = num;
			PlantManager.input2.m_title.text = PlantManager.ThingsAttributeNameTrue[num];
		end
	end

end

function PlantManager:OnHide()
	PlantManager.isShowing = false;
	ModifierMain.showWindow=0;
end

function PlantManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		
		if obj.name == "bntUpdataThingList" then
			PlantManager:GetAllThingInMap();
			PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips19")..QFLanguage.GetText(">PlantManager_Tips20")..tostring(#PlantManager.MapThings);
			PlantManager.HadSearch=0;
			return;
		end
		if obj.name == "bntChooseThing" then
			local num=tonumber(PlantManager.inputid1.m_title.text);
			if num == nil then
				num=1;
			end
			PlantManager:ChooseThingNumAndGetAttribute(num);
			if PlantManager.CheckBox1.selected then
				PlantManager:ChooseThingShow();
			end
			PlantManager.ShowLableThing.text = QFLanguage.GetText(">PlantManager_ShowLableNpc")..": "..tostring(PlantManager.MapThings[PlantManager.ChooseThingNum].def.ThingName);
			PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips1");
			return;
		end
		-- if obj.name == "bntChooseThingShow" then
			-- PlantManager:ChooseThingShow();
			-- PlantManager.ShowLable.text = "选中成功!"
		-- end
		if obj.name == "bntSet" then
			local num=tonumber(PlantManager.input1.m_title.text);
			if num == nil then
				num=1;
			end
			PlantManager:SetThingAttributeByNum(PlantManager.input2.m_title.text,num);
			PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips21");
			return;
		end
		if obj.name == "bntListThingBaseAttribute" then
			PlantManager:UpdateThingAttributeUseHaveData(nil);
			PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips22");
		end
		if obj.name == "bntSearchThing" then
			local name=PlantManager.inputSearch.m_title.text;
			if PlantManager:SearchDisplayName(name) then
				PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips23");
				PlantManager.HadSearch=1;
			else
				PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips24");
			end
			return;
		end
		if obj.name == "bntRepairAll" then
			if PlantManager.HadSearch==1 then
				if PlantManager:RepairAll(1) then
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips2");
				else
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips3");
				end
			else
				if PlantManager:RepairAll(0) then
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips4");
				else
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips5");
				end
			end
			return;
		end
		if obj.name == "bntRemoveAll" then
			if PlantManager.HadSearch==1 then
				if PlantManager:RemoveAll(1) then
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips6");
				else
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips7");
				end
			else
				if PlantManager:RemoveAll(0) then
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips8");
				else
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips9");
				end
			end
			return;
		end
		if obj.name == "bntChangeAll" then
			if PlantManager.HadSearch==1 then
				if PlantManager:ChangeAll(1) then
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips10");
				else
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips11");
				end
			else
				if PlantManager:ChangeAll(0) then
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips12");
				else
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips13");
				end
			end
			return;
		end
		if obj.name == "bntChangeAllLingPlant" then
			if PlantManager.HadSearch==1 then
				if PlantManager:ChangeToLingPlant(1) then
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips14");
				else
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips15");
				end
			else
				if PlantManager:ChangeToLingPlant(0) then
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips16");
				else
					PlantManager.ShowLable.text = QFLanguage.GetText(">PlantManager_Tips17");
				end
			end
			return;
		end
		if obj.name == "bntPageUp" then
			PlantManager:ShowAllThingNameUP();
			PlantManager.ShowLable.text = QFLanguage.GetText(">AddManager_bntPageUp").."!"
			return;
		end
		if obj.name == "bntPageDown" then
			PlantManager:ShowAllThingNameDown();
			PlantManager.ShowLable.text = QFLanguage.GetText(">AddManager_bntPageDown").."!"
			return;
		end
		
		if obj.name == "bntYesSetNpc" then
			PlantManager:SetTrueThingAttribute();
			PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips2");
			return;
		end
		if obj.name == "bntTLST" then
			if PlantManager:TongLingAndSuTi() then
				PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips52");
			else
				PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips53");
			end
			return;
		end
		if obj.name == "bntTL" then
			if PlantManager:TongLing() then
				PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips54");
			else
				PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips55");
			end
			return;
		end
		if obj.name == "bntST" then
			if PlantManager:SuTi() then
				PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips56");
			else
				PlantManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips57");
			end
			return;
		end
	end
	
	
end

function PlantManager:PlantManagerIn()
	PlantManager:GetAllThingInMap();
	PlantManager:ChooseThingNumAndGetAttribute(1);
end
function PlantManager:ChangeAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if PlantManager.MapThings==nil or PlantManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(PlantManager.MapThings) do
			localValue:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player);
		end
	else
		if PlantManager.findArrey==nil or PlantManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(PlantManager.findArrey) do
			localThing=PlantManager.MapThings[localValue];
			localThing:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player);
		end
	end
	return true;
end
function PlantManager:RemoveAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if PlantManager.MapThings==nil or PlantManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(PlantManager.MapThings) do
			ThingMgr:RemoveThing(localValue, true, true);
		end
	else
		if PlantManager.findArrey==nil or PlantManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(PlantManager.findArrey) do
			localThing=PlantManager.MapThings[localValue];
			ThingMgr:RemoveThing(localThing, true, true);
		end
	end
	return true;
end
function PlantManager:RepairAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if PlantManager.MapThings==nil or PlantManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(PlantManager.MapThings) do
			localValue:AddHealth(localValue.MaxHp-localValue.Hp);
		end
	else
		if PlantManager.findArrey==nil or PlantManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(PlantManager.findArrey) do
			localThing=PlantManager.MapThings[localValue];
			localThing:AddHealth(localValue.MaxHp-localValue.Hp);
		end
	end
	return true;
end
function PlantManager:ChangeToLingPlant(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if PlantManager.MapThings==nil or PlantManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(PlantManager.MapThings) do
			localValue:ChangeToLingPlant();
		end
	else
		if PlantManager.findArrey==nil or PlantManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(PlantManager.findArrey) do
			localThing=PlantManager.MapThings[localValue];
			localThing:ChangeToLingPlant();
		end
	end
	return true;
end
function PlantManager:SetThingAttributeByNum(attribute,num)
	PlantManager.ThingsAttributeNameTrue[num] = attribute;
	PlantManager:UpdateThingAttributeUseHaveData(nil);
end
function PlantManager:ChooseThingShow()
	local needShowThing=PlantManager.MapThings[PlantManager.ChooseThingNum];
	CS.Wnd_GameMain.Instance:ShowThingInfo(needShowThing, nil);
	CS.MapCamera.Instance:LookKey(needShowThing.Key);
	--CS.MapCamera.Instance.MainCamera.backgroundColor = CS.UnityEngine.Color.red;
	--CS.MapCamera.Instance.MainCamera.allowHDR = true;
	--CS.MapCamera.Instance.MainCamera.orthographic=false;
	--CS.MapCamera.Instance.MainCamera.fieldOfView = 90;
	--CS.MapCamera.Instance.MainCamera.clearFlags=CS.UnityEngine.Skybox;
	--CS.MapCamera.Instance.MainCamera.transform:Rotate(0, 0, 90);
end
function PlantManager:UpdateThingAttributeUseHaveData(obj)
	if obj == nil then
		obj=PlantManager.ThingAttributeListCOP;
	end
	obj.m_list:RemoveChildrenToPool();
	local num = 1;
	for z=1,#PlantManager.ThingsAttributeDisplayName do
		PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(PlantManager.ThingsAttributeDisplayName[num]),"");
		PlantManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(PlantManager.ThingsAttributeNameTrue[num]),"");
		num = num + 1;
	end
end
function PlantManager:ChooseThingNum(num)
	PlantManager.ChooseThingNum = num;
end
function PlantManager:ChooseThingNumAndGetAttribute(num)
	PlantManager.AttributeFlag = 0;
	PlantManager.ChooseThingNum = num;
	PlantManager:GetChooseThingAttribute(PlantManager.MapThings[PlantManager.ChooseThingNum]);
	PlantManager.ShowLableThing.text = QFLanguage.GetText(">PlantManager_ShowLableNpc")..": "..tostring(PlantManager.MapThings[PlantManager.ChooseThingNum].def.ThingName);
end
function PlantManager:UpdateThingAttribute()
	PlantManager:GetAllThingInMap();
end
function PlantManager:GetAllThingInMap(easyList)
	local list = {};
	local num =1;
	local otherData=0;
	local localKey=nil;
	local localValue=nil;
	PlantManager.MapThings={};
	if easyList ~= nil and easyList~={} then
		list = easyList;
		otherData=1;
		PlantManager.inputid1.m_title.text="1";
		--PlantManager:ChooseThingNumAndGetAttribute(1);
		PlantManager.ChooseThingNum = 1;
		PlantManager.ShowLableThing.text = QFLanguage.GetText(">PlantManager_ShowLableNpc")..": "..tostring(easyList[1].def.ThingName);
	else
		list = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.Plant);
	end
	if list == nil then
		print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">PlantManager_Tips18"))
		return
	end
	local obj=PlantManager.ThingListCOP;
	obj.m_list:RemoveChildrenToPool();
	if PlantManager.CheckBox3.selected==false or otherData==1 then
		for localKey, localValue in pairs(list) do
			if localValue ~= nil then
				local icon = localValue.def.TexPath;
				local name = localValue.def.Name;
				local displayName = localValue.def._ThingName;
				if num<201 then
					if displayName ~= nil then
						PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon)
					else
						PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon)
					end
				end
				PlantManager.MapThings[num] = localValue;
				num = num +1;
			end
		end
	else
		if PlantManager.CheckBox4.selected then
			for localKey, localValue in pairs(list) do
				if localValue ~= nil then
					if localValue.def.Name ~= "Grass" and localValue.def.Name ~= "LongGrass" and localValue.def.Name ~= "IceGrass" and localValue.def.Name ~= "Reed" and localValue.def.Parent ~= "RockBase" then
						if num<201 then
							local icon = localValue.def.TexPath;
							local name = localValue.def.Name;
							local displayName = localValue.def._ThingName;
							--if num<2500 then
								if displayName ~= nil then
									PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon)
								else
									PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon)
								end
							--end
						end
						PlantManager.MapThings[num] = localValue;
						num = num +1;
						--print(item.Name)
					end
				end
			end
		else
			for localKey, localValue in pairs(list) do
				if localValue ~= nil then
					if localValue.def.Name ~= "Grass" and localValue.def.Name ~= "LongGrass" and localValue.def.Name ~= "IceGrass" and localValue.def.Name ~= "Reed" then
						if num<201 then
							local icon = localValue.def.TexPath;
							local name = localValue.def.Name;
							local displayName = localValue.def._ThingName;
							--if num<2500 then
								if displayName ~= nil then
									PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(displayName).."  "..name,icon)
								else
									PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon)
								end
							--end
						end
						PlantManager.MapThings[num] = localValue;
						num = num +1;
						--print(item.Name)
					end
				end
			end
		end
	end
	PlantManager.ShowPage=1;
	PlantManager.AllPage=#PlantManager.MapThings/200;
	local page=math.floor(PlantManager.AllPage);
	if page~=PlantManager.AllPage then
		PlantManager.AllPage=page+1;
	else
		PlantManager.AllPage=page;
	end
	obj.m_title.text = QFLanguage.GetText(">PlantManager_Tips21").."("..tostring(PlantManager.ShowPage).."/"..tostring(PlantManager.AllPage)..")";
	
	PlantManager:GetChooseThingAttribute(PlantManager.MapThings[PlantManager.ChooseThingNum]);
	-- for localKey, localValue in pairs(PlantManager.MapThings[1].def.Tags) do
		-- if localValue ~= nil then
		-- print(localValue.Name)
		-- end
	-- end
	-- num=1;
	-- if QFWDlib.Things[2] ~= nil then
		-- for localKey, localValue in pairs(QFWDlib.Things[2]) do
			-- item = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, localValue);
			-- if item ~= nil then
				-- PlantManager.Things[num] = item.Name;
				-- num = num +1;
				-- print(item.Name)
			-- end
		-- end
	-- end
	
end
function PlantManager:ShowAllThingNameUP(obj)
	if obj==nil then
		obj=PlantManager.ThingListCOP;
	end
	if PlantManager.ShowPage==nil or PlantManager.AllPage==nil then
		return;
	end
	PlantManager.ShowPage=PlantManager.ShowPage-1;
	if PlantManager.ShowPage==0 then
		PlantManager.ShowPage=1;
		return;
	end
	local page=PlantManager.ShowPage-1;
	
	PlantManager.listtypes=0;
	local localKey=nil;
	local localValue=nil;
	local def,icon;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">PlantManager_Tips21").."("..tostring(PlantManager.ShowPage).."/"..tostring(PlantManager.AllPage)..")";
	for localKey, localValue in pairs(PlantManager.MapThings) do
		num=num+1;
		if num>page*200 then
			if num <= (page+1)*200 then
				local icon = localValue.def.TexPath;
				local name = localValue.def.Name;
				local displayName = localValue.def._ThingName;
				--if num<2500 then
					if displayName ~= nil then
						PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(displayName).."  "..tostring(name),icon)
					else
						PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(name),icon)
					end
				--end
			else
				break;
			end
		end
	end
	
end
function PlantManager:ShowAllThingNameDown(obj)
	if obj==nil then
		obj=PlantManager.ThingListCOP;
	end
	if PlantManager.ShowPage==nil or PlantManager.AllPage==nil then
		return;
	end
	PlantManager.ShowPage=PlantManager.ShowPage+1;
	if PlantManager.ShowPage>PlantManager.AllPage then
		PlantManager.ShowPage=PlantManager.AllPage;
		return;
	end
	local page=PlantManager.ShowPage-1;
	
	PlantManager.listtypes=0;
	local localKey=nil;
	local localValue=nil;
	local def,icon;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">PlantManager_Tips21").."("..tostring(PlantManager.ShowPage).."/"..tostring(PlantManager.AllPage)..")";
	for localKey, localValue in pairs(PlantManager.MapThings) do
		num=num+1;
		if num>page*200 then
			if num <= (page+1)*200 then
				local icon = localValue.def.TexPath;
				local name = localValue.def.Name;
				local displayName = localValue.def._ThingName;
				--if num<2500 then
					if displayName ~= nil then
						PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(displayName).."  "..tostring(name),icon)
					else
						PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(name),icon)
					end
				--end
			else
				break;
			end
		end
	end
end
function PlantManager:SearchDisplayName(name)
	local findList=PlantManager.MapThings;
	local findNum=nil;
	PlantManager.findArrey={};
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(findList) do 
		if localValue.def~=nil then
			local info=localValue.def._ThingName;
			info=info.."  "..tostring(localValue.def.Name);
			info=info.."  "..tostring(localValue.m_szName);
			if PlantManager.CheckBoxs3.selected then
				info=info.."  "..tostring(localValue:GetDesc());
			end
			findNum,_=string.find(info, name);
			if findNum ~= nil and findNum ~= 0 then
				PlantManager.findArrey[num]=localKey;
				num=num+1;
			end
		end
	end
	if PlantManager.findArrey=={} then
		return false;
	end
	local obj=PlantManager.ThingListCOP;
	obj.m_list:RemoveChildrenToPool();
	for localKey, localValue in pairs(PlantManager.findArrey) do
		local TrueThing = PlantManager.MapThings[localValue];
		if TrueThing ~= nil then
			local icon = TrueThing.def.TexPath;
			-- if icon==nil then
				-- icon = TrueThing.def.Building.WoodTexPath;
			-- end
			-- if icon==nil then
				-- icon = TrueThing.def.Plant.RipedTexPath;
			-- end
			local name = TrueThing.def.Name;
			local displayName = TrueThing.def._ThingName;
			if displayName ~= nil then
				PlantManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..displayName.."  "..name,icon)
			else
				PlantManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..name,icon)
			end
			--print(item.Name)
		end
	end
	--PlantManager:GetChooseThingAttribute(PlantManager.MapThings[PlantManager.ChooseThingNum]);
	
	return true;
end
function PlantManager:GetChooseThingAttribute(thingObj)
	-- local b = thingObj.TagData:GetTagNames();
		-- for k, v in pairs(b) do
				-- print(v)
		-- end
	
	if thingObj.def == nil then
		local obj=PlantManager.ThingAttributeListCOP;
		obj.m_list:RemoveChildrenToPool();
		obj.m_title.text = QFLanguage.GetText(">PlantManager_Tips22");
		return;
	end
	PlantManager.ThingsAttributeName = 
	{
		thingObj.def.ThingName,thingObj.def.Beauty,thingObj.Count,thingObj.m_sMod,
		thingObj.m_sEqMod,thingObj.m_spell,thingObj.Hp,thingObj.LingV,
		thingObj.DynamicLing,thingObj.Rate,thingObj.def.Desc,
		
		thingObj.YunYangLingShaSpeed,thingObj.YunYangLingShaSpeedStopTime,thingObj.LingShaValue,thingObj.LingPlantAddvSpeed,
		thingObj.GrowSpeedDownByYunYang,thingObj.GrowAddP,thingObj.GrowAddKeep,thingObj.Age,
		thingObj.HarvestProgress,thingObj.GrowProgress,
		
		thingObj.def.BindModifier,thingObj.def.BindWeather,
		thingObj.def.BlockLight,thingObj.def.BlockMissile,thingObj.def.LingMax,thingObj.def.LingMin,
		thingObj.def.MaxHitPoints,thingObj.def.MaxStack,thingObj.def.ModPath,thingObj.def.ModScale,
		thingObj.def.NoElementKind,thingObj.def.SelectAble,thingObj.def.TexPath,thingObj.def.TexScale,
		thingObj.def.TileID,thingObj.def.UseHitPoints,thingObj.def.VisionRadius,thingObj.def.VisualAble,

	}
	local obj=PlantManager.ThingAttributeListCOP;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">PlantManager_Tips23");
	PlantManager.ThingsAttributeNameTrue={};
	local num = 1;
	--print(#PlantManager.ThingsAttributeDisplayName)
	for z=1,#PlantManager.ThingsAttributeDisplayName do
		PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(PlantManager.ThingsAttributeDisplayName[num]),"");
		PlantManager.ThingsAttributeNameTrue[num] = tostring(PlantManager.ThingsAttributeName[num]);
		PlantManager.OldThingsAttributeNameTrue[num] = PlantManager.ThingsAttributeNameTrue[num];
		PlantManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(PlantManager.ThingsAttributeNameTrue[num]),"");
		num = num + 1;
	end
	
end
function PlantManager:SetTrueThingAttribute(obj)
	if obj == nil then
		obj=PlantManager.MapThings[PlantManager.ChooseThingNum];
	end
	local num=22;
	local thingName = obj.def.Name;
	if not PlantManager.CheckBox2.selected then
		local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Plant, thingName);
		thingDef.BindModifier=PlantManager.ThingsAttributeNameTrue[num];
		num=num+1;
		thingDef.BindWeather=PlantManager.ThingsAttributeNameTrue[num];
		num=num+1;
		thingDef.BlockLight=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.BlockMissile=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.LingMax=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.LingMin=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		
		num=num+1;
		thingDef.MaxHitPoints=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.MaxStack=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.ModPath=tostring(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.ModScale=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
			
		num=num+1;
		thingDef.NoElementKind=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.SelectAble=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.TexPath=tostring(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.TexScale=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		
		num=num+1;
		thingDef.TileID=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.UseHitPoints=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.VisionRadius=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		num=num+1;
		thingDef.VisualAble=tonumber(PlantManager.ThingsAttributeNameTrue[num]);
		
		
		obj:ChangeDef(thingDef);
	end


	local z=1;--name
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:SetName("");
		else
			obj:SetName(PlantManager.ThingsAttributeNameTrue[z]);
		end
	end
	z=z+1;--beauty
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:ChangeBeauty(0);
		else
			obj:ChangeBeauty(num);
		end
	end
	z=z+1;--count
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:ChangeCount(0,true);
			--obj.Lock:ChangeTotalCount(0, true);
		else
			--obj.Lock:ChangeTotalCount(num, true);
			obj:ChangeCount(num);
		end
	end
	z=z+1;--捆绑MOD
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sMod="";
		else
			obj.m_sMod=PlantManager.ThingsAttributeNameTrue[z];
		end
	end
	z=5;--捆绑装备MOD
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sEqMod="";
		else
			obj.m_sEqMod=PlantManager.ThingsAttributeNameTrue[z];
		end
	end
	z=z+1;--捆绑符咒MOD
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_spell="";
		else
			obj.m_spell=PlantManager.ThingsAttributeNameTrue[z];
		end
	end
	z=z+1;--血量
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:AddHealth(-obj.Hp);
		else
			obj:AddHealth(num - obj.Hp);
		end
	end
	z=z+1;--灵气值
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:AddLing(-obj.LingV);
		else
			obj:AddLing(num - obj.LingV);
		end
	end
	z=9;--动态灵气
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:DynamicAddLing(0);
		else
			obj:DynamicAddLing(num);
		end
	end
	z=z+1;--rate
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.Rate=0;
		else
			obj.Rate=num;
		end
	end
	z=z+1;--desc
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sDesc = "";
		else
			obj.m_sDesc=PlantManager.ThingsAttributeNameTrue[z];
		end
	end
	z=z+1;--营养灵沙速度
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.YunYangLingShaSpeed = 0;
		else
			obj.YunYangLingShaSpeed=num;
		end
	end
	z=z+1;--营养灵沙停止时间
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.YunYangLingShaSpeedStopTime = 0;
		else
			obj.YunYangLingShaSpeedStopTime=num;
		end
	end
	z=z+1;--灵沙值
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.LingShaValue = 0;
		else
			obj.LingShaValue=num;
		end
	end
	z=z+1;--灵植生长速度
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.LingPlantAddvSpeed = 0;
		else
			obj.LingPlantAddvSpeed=num;
		end
	end
	z=z+1;--营养灵沙下降生长速度
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.GrowSpeedDownByYunYang = 0;
		else
			obj.GrowSpeedDownByYunYang=num;
		end
	end
	z=z+1;--生长度
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.GrowAddP = 0;
		else
			obj.GrowAddP=num;
		end
	end
	z=z+1;--生长度(保持)
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.GrowAddKeep = 0;
		else
			obj.GrowAddKeep=num;
		end
	end
	z=z+1;--年龄
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.Age = 0;
		else
			obj.Age=num;
		end
	end
	z=z+1;--成熟进程
	
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	--print(z,num)
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.HarvestProgress = 0;
		else
			obj.HarvestProgress=num;
			--print(z,num)
		end
	end
	z=z+1;--生长进程
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z]);
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.GrowProgress = 0;
		else
			obj.GrowProgress=num;
		end
	end
	obj:UpdateSize(true);
	obj:UpdateTex(true);
	obj:UpdateMineShadow();
	-- local AttributeList = PlantManager.ThingsAttributeName;
	-- local num=0;
	-- for z=1,#AttributeList do
		-- if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
			-- num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
			-- if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
				-- AttributeList[z] = nil;
			-- else
				-- if num == nil then
					-- AttributeList[z] = PlantManager.ThingsAttributeNameTrue[z];
				-- else
					-- AttributeList[z] = num;
				-- end
			-- end
		-- end
	-- end
	--obj:OnClearDraw()
	--obj:OnDraw(true);
end
function PlantManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function PlantManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function PlantManager:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*4.1, 20, false);
	-- obj.m_title:CreateDisplayObject();
	obj.m_title.text = value;
	if icon ~= nil then
		obj.m_icon.icon = icon;
	else
		obj.m_icon.icon = "";
	end
	--obj.onClick:AddListener(MapSet.ListChildOnClick);
	--btn.onClick.AddListener(OnBtnClick);
	return obj;
end
function PlantManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(PlantManager.ListChildOnClick);
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
function PlantManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(PlantManager.ListChildOnClick2);
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
function PlantManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	PlantManager.TheClickBnt = tonumber(Eventss.data.name);
	PlantManager:SetSetting();
	
end
function PlantManager:SetSetting2(types)
	local obj=nil;
	if types==nil then
		obj=PlantManager.input1;
	else
		obj=PlantManager.input1;
	end
	obj.m_title.text=tostring(PlantManager.TheClickBnt);

end
function PlantManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	PlantManager.TheClickBnt = tonumber(Eventss.data.name);
	PlantManager:SetSetting2();
	
end
function PlantManager:SetSetting()
	local obj=nil;
	local types=PlantManager.listtypes;
	if types==nil or types==0 then
		obj=PlantManager.inputid1;
	else
		obj=PlantManager.input8;
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(PlantManager.TheClickBnt);
		PlantManager:ChooseThingNumAndGetAttribute(PlantManager.TheClickBnt);
		if PlantManager.CheckBox1.selected then
			PlantManager:ChooseThingShow();
		end
		PlantManager.ShowLableThing.text = QFLanguage.GetText(">PlantManager_ShowLableNpc")..": "..tostring(PlantManager.MapThings[PlantManager.ChooseThingNum].def.ThingName);
	else
		obj.m_title.text=tostring(PlantManager.TheClickBnt);
	end
		--PlantManager:ChooseThingNumAndGetAttribute(PlantManager.TheClickBnt);
end
function PlantManager:TongLingAndSuTi()
	if PlantManager:TongLing(true) then
		PlantManager:SuTi();
		return true;
	end
	return false;
end
function PlantManager:TongLing(auto)
	local obj=PlantManager.MapThings[PlantManager.ChooseThingNum];
	local TMgr = CS.XiaWorld.TongLingMgr.Instance;
	local key=obj.ID;
	local tl,tl2 = nil;
	if obj==nil or TMgr==nil then
		return false;
	end
	if obj.JGBack==1 then
		obj.JGBack=0;
	end
	if TMgr.Tonglingdatas:TryGetValue(key,tl2) or tl2~=nil then
		TMgr.Tonglingdatas:Remove(key);
	end
	tl = TMgr:SetItemTongLing(key, 1, CS.XiaWorld.TongLingMgr.TongLingType.Active, 1, 0);
	if auto~=nil then
		local localKey;
		for localKey=0,4 do
			tl.Property[localKey]=5;
		end
	end
	return true;
	-- local localKey;
	-- for localKey=0,4 do
		-- tl.Property[localKey]=5;
	-- end
	--TMgr.Tonglingdatas:Add(key,tl);
	-- if tl~=nil then
		-- print("MOD版修改器:1")
		-- return true;
	-- else
		-- print("MOD版修改器:2")
		-- return false;
	-- end
end
function PlantManager:SuTi()
	local obj=PlantManager.MapThings[PlantManager.ChooseThingNum];
	local TMgr = CS.XiaWorld.TongLingMgr.Instance;
	if obj==nil or TMgr==nil then
		return false;
	end
	if obj.JGBack==1 then
		obj.JGBack=0;
		PlantManager:TongLing();
	end
	TMgr:ZaoHuaSuTi(obj.ID);
	return true;
end