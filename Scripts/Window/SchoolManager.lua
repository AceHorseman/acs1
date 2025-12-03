local SchoolManager = CS.Wnd_Simple.CreateWindow("SchoolManager");
ModifierMain:AddWindow("SchoolManager",SchoolManager);
function SchoolManager:OnInit()
	self.SchoolTangManager = ModifierMain:FindWindow("SchoolTangManager");
	self.listType=0;
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">SchoolManager_Title"));
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);

	local sy=1.5;
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc",QFLanguage.GetText(">SchoolManager_ShowLableNpc")..": "..QFLanguage.GetText(">SchoolManager_bntUpdataSchoolAttribute"),self.sx/10,self.sy/10*sy,300,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable3111",QFLanguage.GetText(">SchoolManager_lable3111"),self.sx/10,self.sy/10*sy,200,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*sy);
	self.inputid1:SetSize(self.sx/10, 25, false);
	self.inputid1.m_title.restrict = "[0-9]";
	self.inputid1.m_title.maxLength = 3;
	QFWDModifierMainUI:AddButton2(self,"bntUpdataSchoolAttribute",QFLanguage.GetText(">SchoolManager_bntUpdataSchoolAttribute"),self.sx/10*4,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntChooseSchool",QFLanguage.GetText(">SchoolManager_bntChooseSchool"),self.sx/10*3,self.sy/10*sy):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowAllSchool",QFLanguage.GetText(">SchoolManager_bntShowAllSchool"),self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	
	QFWDModifierMainUI:AddButton2(self,"bntRemoveSchool",QFLanguage.GetText(">SchoolManager_bntRemoveSchool"),self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	
	sy=sy+0.5;
	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute",QFLanguage.GetText(">SchoolManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10*1,self.sy/10*sy,300,35);
	self.ShowLableAttribute:SetSize(self.sx/10*5, 25, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">SchoolManager_lable3"),self.sx/10*1,self.sy/10*sy,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*sy);
	self.input1:SetSize(self.sx/10, 25, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 3;
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable4",QFLanguage.GetText(">SchoolManager_lable4"),self.sx/10*1,self.sy/10*sy,200,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","清风谷",self.sx/10*2,self.sy/10*sy);
	self.input2:SetSize(self.sx/10*3.5, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSetList",QFLanguage.GetText(">SchoolManager_bntSetList"),self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesSetList",QFLanguage.GetText(">SchoolManager_bntYesSetList"),self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable5",QFLanguage.GetText(">SchoolManager_lable5"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntEnterTangMgr",QFLanguage.GetText(">SchoolManager_bntEnterTangMgr"),self.sx/10,self.sy/10*sy):SetSize(self.sx/10*0.8, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"bntTest","测试",self.sx/10*4,self.sy/10*sy):SetSize(self.sx/10*0.8, 25, false);
	----
	--QFWDModifierMainUI:AddButton2(self,"bntTest2","测试2",self.sx/10*5,self.sy/10*sy):SetSize(self.sx/10*0.8, 25, false);


	self.AttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*9.85,self.sy/10*0.7,1);
	self.GlobleSchoolsListCOP = self:AddCOP("GlobleSchoolsListCOP",-self.sx/10*4.15,self.sy/10*0.7,2);
	
	SchoolManager.listtypes=0;
	self.chooseSchoolNum = 0;
	SchoolManager.numArrey=13;
	SchoolManager.boolArrey=3;
	SchoolManager.GlobleSchoolBaseAttributeName2=0;
	SchoolManager.SchoolAttribute=
	{
		SchoolMgr.Name,SchoolMgr.Prefix,SchoolMgr.Suffix,
		SchoolMgr.BaseScore,SchoolMgr.BadScore,SchoolMgr.GoodScore,SchoolMgr.DiscipleCount,
		SchoolMgr.UnLockScore,
		SchoolMgr.UnLockLevel,SchoolMgr.MasterID,SchoolMgr.FoodIndex,SchoolMgr.TalkGetSecret,
		
		SchoolMgr.AutoCook,SchoolMgr.Created,SchoolMgr.TipFengshui
	};
	SchoolManager.SchoolAttributeDisplayName=
	{
		"门派名:Name","前名:Prefix","后名:Suffix",
		
		"门派声望:BaseScore","邪:BadScore","正:GoodScore","内门弟子数:DiscipleCount",
		"解锁分:UnLockScore",
		"解锁等级:UnLockLevel","MasterID:","食物索引:FoodIndex","聊天获得秘闻:TalkGetSecret",
		"建派前弟子最大数量:Maximum number of people","山寨弟子最大数量:Maximum number of people","门派弟子最大数量:Maximum number of people","洞天弟子最大数量:Maximum number of people",
		"自动做饭:AutoCook","已创造:Created","顶部风水:TipFengshui"
		
	};
	SchoolManager.GlobleSchoolBaseAttributeName=
	{
	"门派名:Name","门派描述:Desc","门派功法:Gong","秘籍:Miji",
	"门主:GMaster","解锁建筑:UnLockBuilding","阵法信息:ZhenInfo","阵法名字:ZhenName",
	"门派ID:ID","功法等级:GLevel","元老:MinElder","阵法需要:ZhenEliderNeed",
	"门派等级:Level","级别:Rank","关系:Relation"
	};
	SchoolManager.GlobleSchoolBaseAttributeName2={};
	QFWDlib.OnInit();
	SchoolManager:ForeEnter();
	self.nowType=0;
	self.window:Center();
end

function SchoolManager:OnShowUpdate()
	
end

function SchoolManager:OnShown()
	SchoolManager.isShowing = true
	ModifierMain.showWindow=13;
end

function SchoolManager:OnUpdate()
	
end

function SchoolManager:OnHide()
	SchoolManager.isShowing = false;
	ModifierMain.showWindow=0;
end

function SchoolManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntEnterTangMgr" then
			SchoolManager:EnterTangMgr();
			SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips1");
			return;
		end
		if obj.name == "bntUpdataSchoolAttribute" then
			SchoolManager:GetSchoolAttribute();
			SchoolManager.nowType = 0;
			
			SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips2");
			return;
		end
		if obj.name == "bntUpdataSchoolsList" then
			SchoolManager:ShowNpcAttribute();
			SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips3");
			return;
		end
		if obj.name == "bntChooseSchool" then
			local num = 0;
			num = tonumber(SchoolManager.inputid1.m_title.text);
			if num == nil then
				SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips4");
				return;
			elseif num > #QFWDlib.GlobleSchools then
				SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips5");
				return;
			else
				SchoolManager.nowType = 1;
				SchoolManager:ShowChildGlobleSchoolAttribute(num);
				local schoolName = tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Name);
				SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips6")..": "..schoolName;
				SchoolManager.ShowLableNpc.text = QFLanguage.GetText(">SchoolManager_ShowLableNpc")..": "..schoolName;
				return;
			end
		end
		if obj.name == "bntSetList" then
			local num = 0;
			num = tonumber(SchoolManager.input1.m_title.text);
			if SchoolManager.nowType==0 then
				if num == nil then
					SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips4");
					return;
				elseif num > #SchoolManager.SchoolAttribute then
					SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips5");
					return;
				else
					SchoolManager:SetSchoolAttributeList(num,SchoolManager.input2.m_title.text)
					SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips7");
					return;
				end
			elseif SchoolManager.nowType==1 then
				if num == nil then
					SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips4");
					return;
				elseif num > #SchoolManager.GlobleSchoolBaseAttributeName2 then
					SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips5");
					return;
				else
					SchoolManager:SetGlobleSchoolAttributeList(num,SchoolManager.input2.m_title.text)
					SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips7");
					return;
				end
			end
		end
		if obj.name == "bntYesSetList" then
			if SchoolManager.nowType==0 then
				SchoolManager:SetTheSchoolAttribute();
			elseif SchoolManager.nowType==1 then
				SchoolManager:SetTheGlobleSchoolAttribute();
			end
			SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips8");
			return;
		end
		if obj.name == "bntRemoveSchool" then
			if SchoolManager.nowType==0 then
				--SchoolManager:SetTheSchoolAttribute();
				SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips9");
			elseif SchoolManager.nowType==1 then
				--SchoolManager:SetTheGlobleSchoolAttribute();
				SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips10");
				if SchoolManager:RemoveSchool() then
					SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips11");
				else
					SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips12");
				end
			end
			
			return;
		end
		if obj.name == "bntShowAllSchool" then
			if SchoolManager:ShowAllSchool() then
				SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips13");
			else
				SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips14");
			end
			
			return;
		end
	end
end
function SchoolManager:ShowAllSchool()
	return SchoolManager:RegetChildGlobleSchools();
end
function SchoolManager:RemoveSchool()
	local num = tonumber(SchoolManager.inputid1.m_title.text);
	if num==nil then
		return false;
	end
	local schoolDatas = QFWDlib.GlobleSchools[num];
	if schoolDatas==nil or schoolDatas.ID==nil then
		return false;
	end
	local MyID=schoolDatas.ID;
	local schools=CS.XiaWorld.SchoolGlobleMgr.m_mapSchoools;
	if schools ==nil then
		return false;
	end
	local localKey=nil;
	local localValue=nil;
	local schoolPower=CS.XiaWorld.SchoolGlobleMgr.SchoolPowerData;
	if schoolPower~=nil then
		for localKey, localValue in pairs(schoolPower) do
			if localValue~= nil and localValue.ID==MyID then
				schoolPower:Remove(localKey);
			end
		end
	end
	local schoolMsg=CS.XiaWorld.SchoolGlobleMgr.SchoolMsgs;
	if schoolMsg~=nil then
		for localKey, localValue in pairs(schoolMsg) do
			if localValue~= nil and (localValue.FSchool==MyID or localValue.TSchool==MyID )then
				schoolMsg:Remove(localValue);
			end
		end
	end
	for localKey, localValue in pairs(schools) do
		if localValue~= nil and localValue.ID==MyID then
			schools:Remove(localKey);
		end
	end

	return true;
end
function SchoolManager:EnterTangMgr()
	self.SchoolTangManager:Show();
	SchoolManager:Hide();
end
function SchoolManager:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y);
	obj.text = value;
	obj.name = names;
	obj.tooltips = texts;
	return obj;
end
function SchoolManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function SchoolManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function SchoolManager:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*4.1, 20, false);
	obj.m_title.text = value;
	--obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function SchoolManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(SchoolManager.ListChildOnClick);
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
function SchoolManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(SchoolManager.ListChildOnClick2);
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
function SchoolManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	SchoolManager.TheClickBnt = tonumber(Eventss.data.name);
	SchoolManager:SetSetting();
	
end
function SchoolManager:SetSetting(types)
	local obj=nil;
	if types==nil then
		obj=SchoolManager.inputid1;
	else
		obj=SchoolManager.inputid1;
	end
	obj.m_title.text=tostring(SchoolManager.TheClickBnt);
	SchoolManager.nowType = 1;
	SchoolManager:ShowChildGlobleSchoolAttribute(SchoolManager.TheClickBnt);
	local schoolName = tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Name);
	SchoolManager.ShowLable.text = QFLanguage.GetText(">SchoolManager_Tips6")..": "..schoolName;
	SchoolManager.ShowLableNpc.text =  QFLanguage.GetText(">SchoolManager_ShowLableNpc")..": "..schoolName;
end
function SchoolManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	SchoolManager.TheClickBnt = tonumber(Eventss.data.name);
	SchoolManager:SetSetting2();
	
end
function SchoolManager:SetSetting2()
	local obj=nil;
	local types=SchoolManager.nowType;
	if types==nil or types==0 then
		obj=SchoolManager.input1;
	else
		obj=SchoolManager.input1;
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(SchoolManager.TheClickBnt);
		
	elseif types<=8 then
		obj.m_title.text=tostring(SchoolManager.TheClickBnt);
	end
	local num = 0;
	num = tonumber(SchoolManager.input1.m_title.text);
	if num == nil then
		SchoolManager.ShowLableAttribute.text=QFLanguage.GetText(">SchoolTangManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
		return;
	elseif num==0 then
		SchoolManager.ShowLableAttribute.text=QFLanguage.GetText(">SchoolTangManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
	else
		if SchoolManager.nowType==0 then
			if num > #SchoolManager.SchoolAttributeDisplayName then
				SchoolManager.ShowLableAttribute.text=QFLanguage.GetText(">SchoolTangManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
				return;
			else
				SchoolManager.ShowLableAttribute.text=QFLanguage.GetText(">SchoolTangManager_ShowLableAttribute")..": "..SchoolManager.SchoolAttributeDisplayName[num];
			end
		elseif SchoolManager.nowType==1 then
			if num > #SchoolManager.GlobleSchoolBaseAttributeName2 then
				SchoolManager.ShowLableAttribute.text=QFLanguage.GetText(">SchoolTangManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
				return;
			else
				SchoolManager.ShowLableAttribute.text=QFLanguage.GetText(">SchoolTangManager_ShowLableAttribute")..": "..SchoolManager.GlobleSchoolBaseAttributeName2[num];
				SchoolManager.input2.m_title.text=SchoolManager.GlobleSchoolBaseAttribute[num];
			end
		end
	end
		--SchoolManager:ChooseThingNumAndGetAttribute(SchoolManager.TheClickBnt);
end




function SchoolManager:ForeEnter()
	SchoolManager:UpdataLibSchoolAttribute();
	SchoolManager:RegetChildGlobleSchools();
	print(QFLanguage.GetText(">MODName")..":Get schools' list success!");
	SchoolManager:UpdateChildGlobleSchools(SchoolManager.GlobleSchoolsListCOP);
	SchoolManager:GetSchoolAttribute();
end
function SchoolManager:SetGlobleSchoolAttributeList(num,value)
	SchoolManager.GlobleSchoolBaseAttribute[num] = value;
	SchoolManager:UpdateChildGlobleSchoolAttribute(SchoolManager.AttributeListCOP);
end
function SchoolManager:SetSchoolAttributeList(num,value)
	local level1=3+SchoolManager.numArrey;
	local level2=level1+SchoolManager.boolArrey;
	if num==1 then 
		num=1;
	elseif num <=3 then
		SchoolManager.SchoolAttributeStr[num]=value;
	elseif num<=level1 then
		SchoolManager.SchoolAttributeStr[num]=tonumber(value);
	elseif num<=level2 then
		if value=="true" or value =="True" or value=="TRUE" then
			SchoolManager.SchoolAttributeStr[num]=true;
		else
			SchoolManager.SchoolAttributeStr[num]=false;
		end
	else
		SchoolManager.SchoolAttributeStr[num]=tonumber(value);
	end
	SchoolManager:UpdateChildAttribute(SchoolManager.AttributeListCOP);
end
function SchoolManager:GetSchoolAttribute()
	SchoolManager:UpdataLibSchoolAttribute();
	SchoolManager.SchoolAttributeStr={};
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(SchoolManager.SchoolAttribute) do
		SchoolManager.SchoolAttributeStr[num]=localValue;
		num=num+1;
	end
	SchoolManager:UpdateChildAttribute(SchoolManager.AttributeListCOP);
end
function SchoolManager:UpdateChildAttribute(obj)
	SchoolManager:UpdataLibSchoolAttribute();
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">SchoolManager_Tips15");
	local num=1;
	local fixnum=3 + SchoolManager.numArrey;
	for z=1,fixnum do
		SchoolManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(SchoolManager.SchoolAttributeDisplayName[num]));
		SchoolManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(SchoolManager.SchoolAttributeStr[num]));
		num=num+1;
	end
	for z=1,SchoolManager.boolArrey do
		SchoolManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(SchoolManager.SchoolAttributeDisplayName[num]));
		if SchoolManager.SchoolAttributeStr[num] then
			SchoolManager:AddChildToList(obj,"0"..tostring(num),"true");
		else
			SchoolManager:AddChildToList(obj,"0"..tostring(num),"false");
		end
		
		num=num+1;
	end

	
	-- for k, v in pairs() do
		-- print(v.Name);
		-- num=num+1;
	-- end
	
end
function SchoolManager:ShowChildGlobleSchoolAttribute(tnum)
	local schoolDatas = QFWDlib.GlobleSchools[tnum];
	SchoolManager.chooseSchoolNum = tnum;
	local num=1;
	SchoolManager.GlobleSchoolBaseAttribute={};
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Name);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Desc);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Gong);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Miji);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].GMaster);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].UnLockBuilding);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ZhenInfo);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ZhenName);
	
	
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].GLevel);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].MinElder);
	num=num+1;
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ZhenEliderNeed);
	
	
	num=num+1;
	local level=1;
	if QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Level==QFWDlib.SchoolLevel[1] then
		level=1;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Level==QFWDlib.SchoolLevel[2] then
		level=2;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Level==QFWDlib.SchoolLevel[3] then
		level=3;
	else
		level=4;
	end
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(level);
	num=num+1;
	local rank=1;
	if QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[1] then
		rank=1;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[2] then
		rank=2;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[3] then
		rank=3;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[4] then
		rank=4;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[5] then
		rank=5;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[6] then
		rank=6;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[7] then
		rank=7;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[8] then
		rank=8;
	elseif QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Rank==QFWDlib.SchoolRank[9] then
		rank=9;
	end
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(rank);
	num=num+1;
	
	SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(SchoolMgr:GetSchoolRelation(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID));
	SchoolManager.RelationToMe = SchoolManager.GlobleSchoolBaseAttribute[num];
	local lnum=1;
	SchoolManager.GlobleSchoolBaseAttributeName2={};
	for lnum=1,#SchoolManager.GlobleSchoolBaseAttributeName do
		SchoolManager.GlobleSchoolBaseAttributeName2[lnum]=SchoolManager.GlobleSchoolBaseAttributeName[lnum];
	end
	local trd=CS.XiaWorld.TradeMgr;
	if trd~=nil then
		local trd2=trd.Instance;
		if trd2~=nil then
			local Trade= trd2:GetSchoolTrade(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
			local TradeDef=trd2:GetSchoolTradeDef(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID);
			if Trade~=nil and TradeDef~=nil then
				num=num+1;
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="全部随机数:AllRandomCount";
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.AllRandomCount);
				num=num+1;
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="到喜爱人情点:LikeFriendPoint";
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.LikeFriendPoint);
				num=num+1;
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="到喜爱关系点:LikeRelation";
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.LikeRelation);
				num=num+1;
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="价格:Price";
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.Price);
				num=num+1;
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="谈话:Talk";
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDef.Talk);
				num=num+1;
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="购买价格降低:BuyPriceReducep";
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(Trade.BuyPriceReducep);
				num=num+1;
				SchoolManager.GlobleSchoolBaseAttributeName2[num]="增加全局人情点:AddFreeGlobalFriendPoint";
				SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(Trade.FreeGlobalFriendPoint);
				if TradeDef.Gong~=nil then
					local TradeDefG=TradeDef.Gong;
					num=num+1;
					SchoolManager.GlobleSchoolBaseAttributeName2[num]="功法数量:Count";
					SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefG.Count);
					num=num+1;
					SchoolManager.GlobleSchoolBaseAttributeName2[num]="功法重置天数:ResetDay";
					SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefG.ResetDay);
					if TradeDefG.BuyPrice~=nil then
						local TradeDefGB=TradeDefG.BuyPrice;
						num=num+1;
						SchoolManager.GlobleSchoolBaseAttributeName2[num]="功法价格:Value";
						SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefGB.Value);
						num=num+1;
						SchoolManager.GlobleSchoolBaseAttributeName2[num]="功法需求人情点:FriendPoint";
						SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefGB.FriendPoint);
					end
					if TradeDefG.Condition~=nil then
						local TradeDefGC=TradeDefG.Condition;
						num=num+1;
						SchoolManager.GlobleSchoolBaseAttributeName2[num]="功法需求关系等级:NeedRank[0-7]";
						SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(TradeDefGC.NeedRank);
					end
				end
			end
		end
	end
	local GSchoolMgr=CS.XiaWorld.SchoolGlobleMgr;
	if GSchoolMgr~=nil and GSchoolMgr.Instance~=nil then
		local power=GSchoolMgr.Instance:GetSchoolPower(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID);
		if power~=nil then
			num=num+1;
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="大能击杀:DNKill";
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.DNKill);
			num=num+1;
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="送礼数:GiftCount";
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.GiftCount);
			num=num+1;
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="发生修正:HappenFix";
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.HappenFix);
			num=num+1;
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="地点锁定:LockPlace";
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.LockPlace);
			num=num+1;
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="门派战力:Power";
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.Power);
			num=num+1;
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="上贡提交日:SubmissionDay";
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.SubmissionDay);
			num=num+1;
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="已上贡:IsSubmission";
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.Suzerain);
			num=num+1;
			SchoolManager.GlobleSchoolBaseAttributeName2[num]="门派状态:State[0-3,无,正常,闭派,灭门]";
			SchoolManager.GlobleSchoolBaseAttribute[num]=tostring(power.State);
			
		end
	end
	SchoolManager.GlobleSchoolBaseAttributeOld={};
	local localKey,localValue=nil,nil;
	for num, localValue in pairs(SchoolManager.GlobleSchoolBaseAttribute) do
		SchoolManager.GlobleSchoolBaseAttributeOld[num]=localValue;
	end
	SchoolManager:UpdateChildGlobleSchoolAttribute(SchoolManager.AttributeListCOP);
end
function SchoolManager:UpdateChildGlobleSchoolAttribute(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">SchoolManager_Tips16")..tostring(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].Name);
	local num=1;
	local localKey,localValue=nil,nil;
	for localKey, localValue in pairs(SchoolManager.GlobleSchoolBaseAttributeOld) do
		SchoolManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(SchoolManager.GlobleSchoolBaseAttributeName2[num]));
		SchoolManager:AddChildToList(obj,"0"..tostring(localKey)," "..tostring(SchoolManager.GlobleSchoolBaseAttribute[num]));
		num=num+1;
	end
end
function SchoolManager:UpdateChildGlobleSchools(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">SchoolManager_Tips17");
	local num=1;
	local localKey,localValue=nil,nil;
	for localKey, localValue in pairs(QFWDlib.GlobleSchools) do
		SchoolManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(localValue.Name));
		num=num+1;
	end
end

function SchoolManager:SetTheSchoolAttribute()
	--SchoolManager:UpdataLibSchoolAttribute();
	SchoolMgr:ChangeSchoolName(SchoolManager.SchoolAttributeStr[2],SchoolManager.SchoolAttributeStr[3]);
	local num=4;
	
--
	-- SchoolMgr.Prefix=SchoolManager.SchoolAttributeStr[num];
	-- num=num+1;
	-- SchoolMgr.Suffix=SchoolManager.SchoolAttributeStr[num];
	-- num=num+1;
	
	SchoolMgr.BaseScore=SchoolManager.SchoolAttributeStr[num];
	num=num+1;
	SchoolMgr.BadScore=SchoolManager.SchoolAttributeStr[num];
	num=num+1;
	SchoolMgr.GoodScore=SchoolManager.SchoolAttributeStr[num];
	num=num+1;
	SchoolMgr.DiscipleCount=SchoolManager.SchoolAttributeStr[num];
	
	
	
	num=num+1;
	SchoolMgr:AddUnLockScore(SchoolManager.SchoolAttributeStr[num]-SchoolMgr.UnLockScore);
	num=num+1;
	SchoolMgr.UnLockLevel=SchoolManager.SchoolAttributeStr[num];
	num=num+1;
	SchoolMgr.MasterID=SchoolManager.SchoolAttributeStr[num];
	num=num+1;
	SchoolMgr.FoodIndex=SchoolManager.SchoolAttributeStr[num];

	num=num+1;
	SchoolMgr.TalkGetSecret=SchoolManager.SchoolAttributeStr[num];
	num=num+1;
	CS.XiaWorld.GameDefine.SchoolMaxNpc[0]=SchoolManager.SchoolAttributeStr[num];
	
	num=num+1;
	CS.XiaWorld.GameDefine.SchoolMaxNpc[1]=SchoolManager.SchoolAttributeStr[num];
	
	num=num+1;
	CS.XiaWorld.GameDefine.SchoolMaxNpc[2]=SchoolManager.SchoolAttributeStr[num];
	
	num=num+1;
	CS.XiaWorld.GameDefine.SchoolMaxNpc[3]=SchoolManager.SchoolAttributeStr[num];
	
	num=num+1;
	SchoolMgr.AutoCook=SchoolManager.SchoolAttributeStr[num];
	num=num+1;
	SchoolMgr.Created=SchoolManager.SchoolAttributeStr[num];
	num=num+1;
	SchoolMgr.TipFengshui=SchoolManager.SchoolAttributeStr[num];
	num=num+1;

	-- SchoolMgr.FoodIndex=SchoolManager.SchoolAttributeStr[num];
	-- num=num+1;
	
	--SchoolMgr.BaseScore=2000
	SchoolManager:UpdateChildAttribute(SchoolManager.AttributeListCOP);
	--SchoolManager:ShowChildGlobleSchoolAttribute(tonumber(SchoolManager.inputid1.m_title.text));
end
function SchoolManager:SetTheGlobleSchoolAttribute()
	local schoolDatas = QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum];
	local num=1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.Name = SchoolManager.GlobleSchoolBaseAttribute[num];
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.Desc = SchoolManager.GlobleSchoolBaseAttribute[num];
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.Gong = SchoolManager.GlobleSchoolBaseAttribute[num];
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.Miji = SchoolManager.GlobleSchoolBaseAttribute[num];
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.GMaster = SchoolManager.GlobleSchoolBaseAttribute[num];
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.UnLockBuilding = SchoolManager.GlobleSchoolBaseAttribute[num];
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.ZhenInfo = SchoolManager.GlobleSchoolBaseAttribute[num];
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.ZhenName = SchoolManager.GlobleSchoolBaseAttribute[num];
	end
	num=num+1;
	--print("MOD版修改器:true")
	
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.ID = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
	end
	local schoolID =tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.GLevel = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.MinElder = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		schoolDatas.ZhenEliderNeed = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		local level = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
		if level~=nil then
			schoolDatas.Level = QFWDlib.SchoolLevel[level];
		end
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		local rank = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
		if rank~=nil then
			schoolDatas.Rank = QFWDlib.SchoolRank[rank];
		end
	end
	num=num+1;
	if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
		local value = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])-tonumber(SchoolManager.GlobleSchoolBaseAttributeOld[num]);
		SchoolMgr:AddSchoolRelation(schoolID,value);
	end
	local trd=CS.XiaWorld.TradeMgr;
	if trd~=nil then
		local trd2=trd.Instance;
		if trd2~=nil then
			local Trade= trd2:GetSchoolTrade(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID)
			local TradeDef=trd2:GetSchoolTradeDef(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID);
			--local Trade
			--Trade=trd2.SchoolTrade;
			if Trade~=nil and TradeDef~=nil then
				num=num+1;
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.AllRandomCount = tostring(SchoolManager.GlobleSchoolBaseAttribute[num]);
				end
				num=num+1;
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.LikeFriendPoint = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
				end
				num=num+1;
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.LikeRelation = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
				end
				num=num+1;
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.Price = SchoolManager.GlobleSchoolBaseAttribute[num];
				end
				num=num+1;
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					TradeDef.Talk = SchoolManager.GlobleSchoolBaseAttribute[num];
				end
				num=num+1;
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					trd2:SetBuyPriceReduce(tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]));
					--Trade.FreeGlobalFriendPoint = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
				end
				num=num+1;
				--print("MOD版修改器:RunHere!",num)
				if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
					--print(SchoolManager.GlobleSchoolBaseAttribute[num])
					trd2:AddGlobalFriendPoint(tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]));
				end
				if TradeDef.Gong~=nil then
					local TradeDefG=TradeDef.Gong;
					num=num+1;
					if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
						TradeDefG.Count = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
					end
					num=num+1;
					if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
						TradeDefG.ResetDay = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
					end
					if TradeDefG.BuyPrice~=nil then
						local TradeDefGB=TradeDefG.BuyPrice;
						num=num+1;
						if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
							TradeDefGB.Value = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
						end
						num=num+1;
						if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
							TradeDefGB.FriendPoint = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
						end
					end
					if TradeDefG.Condition~=nil then
						local TradeDefGC=TradeDefG.Condition;
						num=num+1;
						if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
							TradeDefGC.NeedRank = QFWDlib.SchoolRelationRank[tonumber(SchoolManager.GlobleSchoolBaseAttribute[num])];
						end
					end
				end
			end
		end
	end
	local GSchoolMgr=CS.XiaWorld.SchoolGlobleMgr;
	if GSchoolMgr~=nil and GSchoolMgr.Instance~=nil then
		local power=GSchoolMgr.Instance:GetSchoolPower(QFWDlib.GlobleSchools[SchoolManager.chooseSchoolNum].ID);
		if power~=nil then
			num=num+1;
			--SchoolManager.GlobleSchoolBaseAttributeName2[num]="大能击杀:DNKill";
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.DNKill = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
			end
			num=num+1;
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.GiftCount = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
			end
			num=num+1;
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.HappenFix = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
			end
			num=num+1;
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.LockPlace = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
			end
			num=num+1;
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.Power = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
			end
			num=num+1;
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.SubmissionDay = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
			end
			num=num+1;
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				power.Suzerain = tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
			end
			num=num+1;
			if SchoolManager.GlobleSchoolBaseAttributeOld[num]~=SchoolManager.GlobleSchoolBaseAttribute[num] then
				local datanum=tonumber(SchoolManager.GlobleSchoolBaseAttribute[num]);
				--print(tostring(datanum))
				local data=QFWDlib.SchoolState[datanum+1];
				if data~=nil then
					--print("这里！")
					power.State = data;
				end
				--print("这里！！")
			end
			--print("这里！！！")
		end
	end
	
	SchoolManager:ShowChildGlobleSchoolAttribute(SchoolManager.chooseSchoolNum);
end
function SchoolManager:UpdataLibSchoolAttribute()
	SchoolManager.SchoolAttribute=
	{
		SchoolMgr.Name,SchoolMgr.Prefix,SchoolMgr.Suffix,
		SchoolMgr.BaseScore,SchoolMgr.BadScore,SchoolMgr.GoodScore,SchoolMgr.DiscipleCount,
		SchoolMgr.UnLockScore,
		SchoolMgr.UnLockLevel,SchoolMgr.MasterID,SchoolMgr.FoodIndex,SchoolMgr.TalkGetSecret,
		CS.XiaWorld.GameDefine.SchoolMaxNpc[0],CS.XiaWorld.GameDefine.SchoolMaxNpc[1],CS.XiaWorld.GameDefine.SchoolMaxNpc[2],CS.XiaWorld.GameDefine.SchoolMaxNpc[3],
		
		SchoolMgr.AutoCook,SchoolMgr.Created,SchoolMgr.TipFengshui
	};
end
function SchoolManager:RegetChildGlobleSchools(types)
	local num=1;
	QFWDlib.GlobleSchools={};
	local schools=CS.XiaWorld.SchoolGlobleMgr.m_mapSchoools;
	if schools ==nil then
		print(QFLanguage.GetText(">MODName")..":schoolData is nil");
		return false;
	end
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(schools) do
		--local schoolData=CS.XiaWorld.SchoolGlobleMgr.Instance:GetSchoolData(num);
		if localValue~= nil then
			QFWDlib.GlobleSchools[num] = localValue;
			
			num=num+1;
		end
	end
	--print("MOD版修改器:Get schools' list success!");
	if types==nil then
		SchoolManager:UpdateChildGlobleSchools(SchoolManager.GlobleSchoolsListCOP);
	end
	return true;
end