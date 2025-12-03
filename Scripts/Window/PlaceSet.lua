local PlaceSet = CS.Wnd_Simple.CreateWindow("PlaceSet");
ModifierMain:AddWindow("PlaceSet",PlaceSet);
function PlaceSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">PlaceSet_Title"));
	self:SetSize(self.sx,self.sy);
	local sy=1;
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sy/10*6,self.sy/10*sy,300,35);
	sy = sy+0.5;
	
	--QFWDModifierMainUI:AddLable2(self,"tlable1","解锁地点:",self.sx/10,self.sy/10*1.5,200,35);
	QFWDModifierMainUI:AddLable2(self,"l1",QFLanguage.GetText(">PlaceSet_l1"),self.sx/10,self.sy/10*sy,self.sx/10*2,35);
	sy = sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">PlaceSet_lable1"),self.sx/10,self.sy/10*sy,self.sx/10*1,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*1.6,self.sy/10*sy);
	self.input1:SetSize(self.sx/10*2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntUnlockPlace",QFLanguage.GetText(">AchievementManager_UnlockOne"),self.sx/10*5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntUnlockAllPlace",QFLanguage.GetText(">AchievementManager_UnlockAll"),self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bnt_13",QFLanguage.GetText(">FlagSet_bntUpdateLIst"),self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("MgrGet_OutspreadMgr");
		PlaceSet.OutMgr=func:Invoke();
		if PlaceSet.OutMgr~=nil then
			sy = sy+1;
			QFWDModifierMainUI:AddLable2(self,"l2",QFLanguage.GetText(">PlaceSet_l2"),self.sx/10,self.sy/10*sy,self.sx/10*2,35);
			sy = sy+0.5;
			QFWDModifierMainUI:AddLable2(self,"lable2",QFLanguage.GetText(">PlaceSet_lable2"),self.sx/10,self.sy/10*sy,self.sx/10*1,35);
			self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","0",self.sx/10*1.6,self.sy/10*sy);
			self.input2:SetSize(self.sx/10*2, 25, false);
			self.input2.m_title.text=tostring(PlaceSet.OutMgr.Influence);
			QFWDModifierMainUI:AddButton2(self,"bnt_2",QFLanguage.GetText(">FlagSet_bntWorldFlagSet"),self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
			sy = sy+1;
			QFWDModifierMainUI:AddLable2(self,"l3",QFLanguage.GetText(">PlaceSet_l3"),self.sx/10,self.sy/10*sy,self.sx/10*2,35);
			sy = sy+0.5;
			QFWDModifierMainUI:AddLable2(self,"lable31",QFLanguage.GetText(">PlaceSet_lable1"),self.sx/10,self.sy/10*sy,self.sx/10*1,35);
			self.input31 = QFWDModifierMainUI:AddInput2(self,"input31","1",self.sx/10*1.6,self.sy/10*sy);
			self.input31:SetSize(self.sx/10*1, 25, false);
			QFWDModifierMainUI:AddLable2(self,"lable32",QFLanguage.GetText(">JHNpcManager_lable1XS1"),self.sx/10*3,self.sy/10*sy,self.sx/10*1,35);
			self.input32 = QFWDModifierMainUI:AddInput2(self,"input32","1",self.sx/10*3.6,self.sy/10*sy);
			self.input32:SetSize(self.sx/10*1, 25, false);
			QFWDModifierMainUI:AddButton2(self,"bnt_33",QFLanguage.GetText(">FlagSet_bntUpdateLIst"),self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
			sy = sy+0.5;
			QFWDModifierMainUI:AddLable2(self,"lable33",QFLanguage.GetText(">BuildingManager_lable4"),self.sx/10*1,self.sy/10*sy,self.sx/10*1,35);
			self.input33 = QFWDModifierMainUI:AddInput2(self,"input33","1",self.sx/10*1.6,self.sy/10*sy);
			self.input33:SetSize(self.sx/10*3, 25, false);
			QFWDModifierMainUI:AddButton2(self,"bnt_31",QFLanguage.GetText(">JHNpcManager_bntChangeList"),self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
			QFWDModifierMainUI:AddButton2(self,"bnt_32",QFLanguage.GetText(">JHNpcManager_bntYesList"),self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
			
			
		end
	end
	-- QFWDModifierMainUI:AddLable2(self,"labley2","数量:",self.sx/10*4.5,self.sy/10*2,200,35);
	-- self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","1",self.sx/10*5,self.sy/10*2);
	-- self.input2:SetSize(30, 20, false);
	-- self.input2.m_title.restrict = "[0-9]";
	-- self.input2.m_title.maxLength = 2;
	
	-- QFWDModifierMainUI:AddLable2(self,"labley3","等级:",self.sx/10*5.5,self.sy/10*2,200,35);
	-- self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*6,self.sy/10*2);
	-- self.input3:SetSize(20, 20, false);
	-- self.input3.m_title.restrict = "[0-9]";
	-- self.input3.m_title.maxLength = 1;
	self.placenum = {};
	self.cop1 = self:AddCOP("cop1",-self.sx/10*4.15,self.sy/10*0.7,2);
	self.cop2 = self:AddCOP2("cop2",self.sx/10*9.85,self.sy/10*0.7);
	self.Types = 0;
	PlaceSet:UpdateList();
	self.window:Center();
end

function PlaceSet:OnShowUpdate()
	
end

function PlaceSet:OnShown()
	PlaceSet.isShowing = true;
	if PlaceSet.OutMgr~=nil then
		PlaceSet.input2.m_title.text=tostring(PlaceSet.OutMgr.Influence);
	end
end

function PlaceSet:OnUpdate()

end

function PlaceSet:OnHide()
	PlaceSet.isShowing = false;
	ModifierMain.showWindow=0;
end
function PlaceSet:GetKey(x,y)
	if x > Map.Size then
		x = Map.Size;
		print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">AddManager_Tips24"));
	end
	if y > Map.Size then
		y = Map.Size;
		print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">AddManager_Tips25"));
	end
	return x + y * (Map.Size);

end
function PlaceSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntUnlockPlace" then
			if  tonumber(PlaceSet.input1.m_title.text) ~= nil  then
				PlaceSet.input1.m_title.text = PlaceSet.placenum[tonumber(PlaceSet.input1.m_title.text)];
			end
			PlaceSet:UnlockOnePlace(PlaceSet.input1.m_title.text);
			--PlacesMgr:UnLockPlace(PlaceSet.input1.m_title.text);
			--PlacesMgr:UnlockAll();
			PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips1")..PlaceSet.input1.m_title.text;
			PlaceSet:UpdateList(PlaceSet.cop2);
			return;
		end
		if obj.name == "bntUnlockAllPlace" then
			PlaceSet:UnlockPlace();
			PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips2");
			PlaceSet:UpdateList(PlaceSet.cop2);
			return;
		end
		if obj.name == "bnt_13" then
			if PlaceSet:UpdateList() then
				PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips3");
			else
				PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips4");
			end
			--PlaceSet:UpdateList(PlaceSet.cop);
			return;
		end
		----------------------------------------------
		if obj.name == "bnt_2" then
			if PlaceSet:SetInfluence() then
				PlaceSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips26");
			else
				PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips5");
			end
			--PlaceSet:UpdateList(PlaceSet.cop);
			return;
		end
		----------------------------------------------
		if obj.name == "bnt_32" then
			if PlaceSet:YesRegList() then
				PlaceSet.ShowLable.text = QFLanguage.GetText(">MapSet_Tips8");
			else
				PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips6");
			end
			--PlaceSet:UpdateList(PlaceSet.cop);
			return;
		end
		if obj.name == "bnt_31" then
			if PlaceSet:SetRegAttribute() then
				PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips7");
			else
				PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips8");
			end
			--PlaceSet:UpdateList(PlaceSet.cop);
			return;
		end
		if obj.name == "bnt_33" then
			if PlaceSet:SearchAllRegion() then
				PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips9");
			else
				PlaceSet.ShowLable.text = QFLanguage.GetText(">PlaceSet_Tips10");
			end
			--PlaceSet:UpdateList(PlaceSet.cop);
			return;
		end
		-- if obj.name == "bntAllGod" then
			-- if obj.text == "关闭" then
				-- CS.GameMain.Instance.KnowEveryGod = false;
				-- obj.text = "开启";
				-- PlaceSet.ShowLable.text = "已经关闭上帝模式。";
			-- else
				-- CS.GameMain.Instance.KnowEveryGod = true
				-- obj.text = "关闭";
				-- PlaceSet.ShowLable.text = "已经开启上帝模式。";
			-- end
			-- return;
		-- end
	end
end
---------------------------------------
function PlaceSet:SetRegAttribute()
	if PlaceSet.Types ~= 1 then
		return false;
	end
	local num=tonumber(PlaceSet.input32.m_title.text);
	local str=tostring(PlaceSet.input33.m_title.text);
	PlaceSet.AttributeNew[num]=str;
	if PlaceSet:ShowRegOld() then
		return true;
	else
		return false;
	end
end
function PlaceSet:ShowRegOld(tobj)
	local listName=
	{
	"吸引力:Attractive","吸引力倍率:AttractiveScale","自动信仰NPCID:AutoFaithNpcId","信仰:Faith",":FaithAddToBuildSkipT",
	":FaithAddToNpcT","信仰收集等级:FaithCollectLevel","信仰收集速度附加值P:FaithCollectSpeedAddp","被信仰者ID:FaithNpcId",
	"纯增加:IncreaseDur","增加倍率:IncreateScale","最后产出时间:LastAutoProductDay","等级:Level","最大信仰值:MaxFaith",
	"最大储存面积:MaxStorageSize","人口:Population","稳定性:Stability",
	
	"监督[0.false 1.true]:IsSupervise","特殊焦点[0.false 1.true]:SpecialFocus",
	"显示前名:DisplayPrefix","显示后名:DisplaySuffix","地区名:RegionName",
	};
	local localKey=nil;
	local localValue=nil;
	local obj=tobj;
	if obj==nil then
		obj=PlaceSet.cop2;
	end
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">PlaceSet_Tips11");
	for localKey, localValue in pairs(listName) do
		PlaceSet:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(localValue));
		PlaceSet:AddChildToList(obj,"0"..tostring(localKey),tostring(PlaceSet.AttributeNew[localKey]));
	end
	return true;
end
function PlaceSet:YesRegList()
	if PlaceSet.Types ~= 1 then
		return false;
	end
	local num=tonumber(PlaceSet.input31.m_title.text);
	if num ==nil or num<=0 then
		return false;
	end
	local name=PlaceSet.RegList[num];
	if name==nil then
		return false;
	end
	local reg=PlaceSet.OutMgr:GetRegion(name);
	if reg==nil then
		return false;
	end
	num=1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.Attractive=num;
	end
	
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.AttractiveScale=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.AutoFaithNpcId=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.Faith=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.FaithAddToBuildSkipT=num;
	end
	
	
	-- num=num+1;
	-- if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		-- local num=tonumber(PlaceSet.AttributeNew[num]);
		-- if num==nil then
			-- num=0;
		-- end
		-- reg.FaithAddToBuildSkipT=num;
	-- end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.FaithAddToNpcT=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.FaithCollectLevel=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.FaithCollectSpeedAddp=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.FaithNpcId=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.IncreaseDur=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.IncreateScale=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.LastAutoProductDay=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.Level=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.MaxFaith=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.MaxStorageSize=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.Population=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		reg.Stability=num;
	end
	
	
	
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		if num==0 then
			reg.IsSupervise=false;
		else
			reg.IsSupervise=true;
		end
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tonumber(PlaceSet.AttributeNew[num]);
		if num==nil then
			num=0;
		end
		if num==0 then
			reg.SpecialFocus=false;
		else
			reg.SpecialFocus=true;
		end
	end


	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tostring(PlaceSet.AttributeNew[num]);
		reg.DisplayPrefix=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tostring(PlaceSet.AttributeNew[num]);
		reg.DisplaySuffix=num;
	end
	num=num+1;
	if PlaceSet.AttributeNew[num]~=PlaceSet.AttributeOld[num] then
		local num=tostring(PlaceSet.AttributeNew[num]);
		reg.RegionName=num;
	end
	print(num)
	return true;
end
function PlaceSet:SearchAllRegion()
	local mgr= PlaceSet.OutMgr;
	if mgr==nil then
		return false;
	end
	local save=CS.XiaWorld.SaveLoad.SL_GAME();
	if save==nil then
		return false;
	end
	mgr:Save(save);
	local data=save.Outspread;
	if data==nil then
		return false;
	end
	local reg=data.Regions;
	if reg==nil then
		return false;
	end
	local localKey=nil;
	local localValue=nil;
	PlaceSet.RegList={};
	local num=1;
	for localKey, localValue in pairs(reg) do
		if localValue~=nil then
			PlaceSet.RegList[num]=localKey;
			num=num+1;
		end
		--print(tostring(localKey));
	end
	
	PlaceSet:ShowAllReg();
	--print("MOD版修改器:这里！")
	return true;
end
function PlaceSet:ShowAllReg(tobj)
	local obj=tobj;
	if obj==nil then
		obj=PlaceSet.cop1;
	end
	PlaceSet.Types=1
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">PlaceSet_Tips12");
	local num = 1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(PlaceSet.RegList) do
		local reg=PlaceSet.OutMgr:GetRegion(localValue);
		local icon = "";
		if reg~=nil then
			if reg.def~= nil and reg.def.Icon~=nil then
				icon=reg.def.Icon;
			end
			if reg.DisplayName ~= nil then
				PlaceSet:AddChildToList(obj,tostring(localKey),tostring(num)..": "..tostring(reg.DisplayName),icon);
			else
				PlaceSet:AddChildToList(obj,tostring(localKey),tostring(num)..": "..tostring(localValue),icon);
			end
			num = num+1;
		end
	end
	if PlaceSet.RegList[1]~=nil then
		PlaceSet:ShowRegAttribute(1);
	end
	return true;
end
function PlaceSet:ShowRegAttribute(tnum,tobj)
	local name=PlaceSet.RegList[tnum];
	if name==nil then
		return false;
	end
	local obj=tobj;
	if obj==nil then
		obj=PlaceSet.cop2;
	end
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">PlaceSet_Tips11");
	local num = 1;
	local localKey=nil;
	local localValue=nil;
	local reg=PlaceSet.OutMgr:GetRegion(name);
	local list=
	{
	reg.Attractive,reg.AttractiveScale,reg.AutoFaithNpcId,reg.Faith,reg.FaithAddToBuildSkipT,
	reg.FaithAddToNpcT,reg.FaithCollectLevel,reg.FaithCollectSpeedAddp,reg.FaithNpcId,
	reg.IncreaseDur,reg.IncreateScale,reg.LastAutoProductDay,reg.Level,reg.MaxFaith,
	reg.MaxStorageSize,reg.Population,reg.Stability,
	
	reg.IsSupervise,reg.SpecialFocus,
	reg.DisplayPrefix,reg.DisplaySuffix,reg.RegionName,
	};
	local listName=
	{
	"吸引力:Attractive","吸引力倍率:AttractiveScale","自动信仰NPCID:AutoFaithNpcId","信仰:Faith",":FaithAddToBuildSkipT",
	":FaithAddToNpcT","信仰收集等级:FaithCollectLevel","信仰收集速度附加值P:FaithCollectSpeedAddp","被信仰者ID:FaithNpcId",
	"纯增加:IncreaseDur","增加倍率:IncreateScale","最后产出时间:LastAutoProductDay","等级:Level","最大信仰值:MaxFaith",
	"最大储存面积:MaxStorageSize","人口:Population","稳定性:Stability",
	
	"监督[0.false 1.true]:IsSupervise","特殊焦点[0.false 1.true]:SpecialFocus",
	"显示前名:DisplayPrefix","显示后名:DisplaySuffix","地区名:RegionName",
	};
	PlaceSet.AttributeOld={};
	PlaceSet.AttributeNew={};
	for localKey, localValue in pairs(listName) do
		PlaceSet.AttributeNew[num]=tostring(list[num]);
		PlaceSet.AttributeOld[num]=PlaceSet.AttributeNew[num];
		PlaceSet:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue));
		PlaceSet:AddChildToList(obj,"0"..tostring(num),tostring(PlaceSet.AttributeNew[num]));
		num=num+1;
	end
	print(num-1)
	return true;
end
---------------------------------------
function PlaceSet:SetInfluence(num)
	local tnum=tonumber(num);
	
	if tnum==nil then
		tnum=tonumber(PlaceSet.input2.m_title.text);
	end
	if tnum==nil then
		return false;
	else
		local mgr= PlaceSet.OutMgr;
		if mgr==nil then
			return false;
		end
		mgr:AddInfluence(tnum-tonumber(mgr.Influence));
		--local influ=CS.XiaWorld.OutspreadMgrInfluence.
	end
	return true;
end
--------------------------------------
function PlaceSet:UnlockOnePlace(paces)
	PlacesMgr:UnLockPlace(paces);
end
function PlaceSet:UnlockPlace()
	PlacesMgr:UnlockAll();
end
function PlaceSet:UpdateList(tobj)
	local obj=tobj;
	if obj==nil then
		obj=PlaceSet.cop2;
	end
	PlaceSet.Types=0
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">PlaceSet_Tips13");
	local num = 1;
	local localKey=nil;
	local localValue=nil;
	if PlacesMgr.Places==nil then
		return false;
	end
	for localKey, localValue in pairs(PlacesMgr.Places) do
		--local displayName = tostring(PlacesMgr:GetPlaceDef().DisplayName);
		local info=nil;
		if localValue.UnLock then
			info = "U";
		else
			info = "L";
		end
		info=info.." "..tostring(localValue.ArrivedCount);
		PlaceSet.placenum[num] = tostring(localKey);
		local icon = "";
		if PlacesMgr:GetPlaceDef(localKey).Icon~= nil then
			icon=PlacesMgr:GetPlaceDef(localKey).Icon;
		end
		if PlacesMgr:GetPlaceDef(localKey).DisplayName ~= nil then
			PlaceSet:AddChildToList(obj,tostring(num),tostring(num)..": "..info.."--"..PlacesMgr:GetPlaceDef(localKey).DisplayName.."--"..tostring(localKey),icon);
		else
			PlaceSet:AddChildToList(obj,tostring(num),tostring(num)..": "..info.."--"..tostring(localKey).."--"..tostring(PlacesMgr:GetPlaceDef(localKey).Desc),icon);
		end
		num = num+1;
	end
	return true;
end
function PlaceSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function PlaceSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function PlaceSet:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*4.1, 30, false);
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
function PlaceSet:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(PlaceSet.ListChildOnClick);
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
function PlaceSet:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(PlaceSet.ListChildOnClick2);
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
function PlaceSet.ListChildOnClick(Eventss)
	PlaceSet.TheClickBnt = tonumber(Eventss.data.name);
	--print("MOD版修改器:Click1!");
	if PlaceSet.Types==1 then
		PlaceSet.input31.m_title.text=tostring(PlaceSet.TheClickBnt);
		PlaceSet:ShowRegAttribute(PlaceSet.TheClickBnt);
	end
end
function PlaceSet.ListChildOnClick2(Eventss)
	PlaceSet.TheClickBnt = tonumber(Eventss.data.name);
	--print("MOD版修改器:Click2!");
	if PlaceSet.Types==0 or PlaceSet.Types==nil then
		PlaceSet.input1.m_title.text=tostring(PlaceSet.TheClickBnt);
	elseif PlaceSet.Types==1 then
		PlaceSet.input32.m_title.text=tostring(PlaceSet.TheClickBnt);
		if PlaceSet.AttributeNew~=nil and PlaceSet.AttributeNew[PlaceSet.TheClickBnt]~=nil then
			PlaceSet.input33.m_title.text=tostring(PlaceSet.AttributeNew[PlaceSet.TheClickBnt]);
		else
			PlaceSet.Types=0;
		end
	end
end