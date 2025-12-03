local AchievementManager = CS.Wnd_Simple.CreateWindow("AchievementManager");
ModifierMain:AddWindow("AchievementManager",AchievementManager);
function AchievementManager:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">AchievementManager_Title"));
	self:SetSize(self.sx,self.sy);

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*6,self.sy/10,300,35);
	
	
	QFWDModifierMainUI:AddLable2(self,"tlable1",QFLanguage.GetText(">AchievementManager_tlable1"),self.sx/10,self.sy/10*1.5,200,35);
	QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">AchievementManager_lable1"),self.sx/10,self.sy/10*2,200,35);
	self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*1.8,self.sy/10*2.1);
	self.input3:SetSize(160, 20, false);
	self.input3.m_title.restrict = "[0-9]";
	self.input3.m_title.maxLength = 8;
	QFWDModifierMainUI:AddLable2(self,"lable2",QFLanguage.GetText(">AchievementManager_lable2"),self.sx/10,self.sy/10*2.5,200,35);
	self.input4 = QFWDModifierMainUI:AddInput2(self,"input4","1",self.sx/10*1.8,self.sy/10*2.6);
	self.input4:SetSize(160, 20, false);
	self.input4.m_title.restrict = "[0-9]";
	self.input4.m_title.maxLength = 3;
	QFWDModifierMainUI:AddButton2(self,"UnlockOne",QFLanguage.GetText(">AchievementManager_UnlockOne"),self.sx/10*5,self.sy/10*2.1):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"UnlockAll",QFLanguage.GetText(">AchievementManager_UnlockAll"),self.sx/10*5,self.sy/10*2.6):SetSize(self.sx/10*1.2, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">AchievementManager_lable3"),self.sx/10,self.sy/10*3.5,200,35);
	QFWDModifierMainUI:AddButton2(self,"UnlockAllWX",QFLanguage.GetText(">AchievementManager_UnlockAllWX"),self.sx/10*5,self.sy/10*3.5):SetSize(self.sx/10*1.2, 20, false);
	
	self.AchievementListCOP=self:AddCOP("RaceList",self.sx/10*9.85,self.sy/10*0.7);
	AchievementManager.CanUseDll=false;
	AchievementManager.Func=nil;
	AchievementManager:IsCanUseDll();
	AchievementManager:AchievementManagerIn();
	self.window:Center();
end

function AchievementManager:OnShowUpdate()
	
end

function AchievementManager:OnShown()
	AchievementManager.isShowing = true
end

function AchievementManager:OnUpdate()

end

function AchievementManager:OnHide()
	AchievementManager.isShowing = false;
	ModifierMain.showWindow=0;
end
-- function AchievementManager:GetKey(x,y)
	-- if x > Map.Size then
		-- x = Map.Size;
		-- self.WorldLuaHelper:ShowMsgBox("输入的X值溢出！","异常");
	-- end
	-- if y > Map.Size then
		-- y = Map.Size;
		-- self.WorldLuaHelper:ShowMsgBox("输入的Y值溢出！","异常");
	-- end
	-- return x + y * (Map.Size);

-- end
function AchievementManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "UnlockOne" then
			local num = tonumber(AchievementManager.input3.m_title.text);
			AchievementManager:UnlockAllAchievements(num,0);
			AchievementManager.ShowLable.text = QFLanguage.GetText(">AchievementManager_Tips1");
			return;
		end
		if obj.name == "UnlockAll" then
			AchievementManager:UnlockAllAchievements(0,-1);
			AchievementManager.ShowLable.text = QFLanguage.GetText(">AchievementManager_Tips2");
			return;
		end
		if obj.name == "UnlockAllWX" then
			local t,c = AchievementManager:UnlockAllWX();
			if t then
				AchievementManager.ShowLable.text = QFLanguage.GetText(">AchievementManager_Tips5").."  "..tostring(c);
			else
				AchievementManager.ShowLable.text = QFLanguage.GetText(">AchievementManager_Tips6");
			end
			return;
		end
	end
end

function AchievementManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function AchievementManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function AchievementManager:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*3.2,20, false);
	obj.m_title.text = value;
	return obj;
end
function AchievementManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(AchievementManager.ListChildOnClick);
	obj.m_title.text = QFLanguage.GetText(">AchievementManager_Title2");
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
function AchievementManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	AchievementManager.TheClickBnt = tonumber(Eventss.data.name);
	AchievementManager:SetSetting();
	
end
function AchievementManager:SetSetting(types)
	local obj=nil;
	if types==nil then
		obj=AchievementManager.input3;
	else
		obj=AchievementManager.input3;
	end
	obj.m_title.text=tostring(AchievementManager.TheClickBnt);
	--AchievementManager:ChooseThingNumAndGetAttribute(AchievementManager.TheClickBnt);
end
function AchievementManager:AchievementManagerIn()
	self.AchievementMgr = CS.GameWatch.Instance.Achievement;
	if self.AchievementMgr==nil then
		print(QFLanguage.GetText(">MODName")..QFLanguage.GetText(">AchievementManager_Tips3"));
		return false;
	end
	self.AchievementList=self.AchievementMgr.Achievements;
	if self.AchievementList==nil then
		print(QFLanguage.GetText(">MODName")..QFLanguage.GetText(">AchievementManager_Tips4"));
		return false;
	end
	AchievementManager.AchievementListCOP.m_list:RemoveChildrenToPool();
	local num = 1;
	local info = nil;
	local k,v;
	for k, v in pairs(self.AchievementList) do
		
		if v.Name~=nil then
			--print(v.Name)
			QFWDlib.AllAchievements[num]=v;
			if v.UnLock then
				info=tostring(v.ID)..": T  "..tostring(v.Name);
			else
				info=tostring(v.ID)..": F  "..tostring(v.Name);
			end
			
			AchievementManager:AddChildToList(AchievementManager.AchievementListCOP,tostring(v.ID),info);
			num=num+1;
		end
	end
end
function AchievementManager:IsCanUseDll()
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("UnLockAchievement");
		if func~=nil then
			AchievementManager.Func=func;
			AchievementManager.CanUseDll=true;
			print(QFLanguage.GetText(">MODName")..":Dll can use!")
			return true;
		end
	end
	return false;
end



function AchievementManager:UnlockAllWX()
	local k,v,lk,lk2,lv2;
	local WXMgr=CS.AllIllustratedHandMgr;
	if WXMgr==nil then return false,0; end
	--print("Here1!")
	local WXMgrIns=WXMgr.Instance;
	if WXMgrIns==nil then return false,0; end
	--print("Here2!")
	--local WXData = WXMgrIns.m_IllDatas;
	--if WXData==nil then return false; end
	--print("Here3!")
	v=0;
	for k=1,#QFWDlib.IllHandType do
		for lk=1,#QFWDlib.IllHandLabel do
			lv=WXMgrIns:GetDatas(QFWDlib.IllHandType[k],QFWDlib.IllHandLabel[lk]);
			if lv~=nil then
				for lk2, lv2 in pairs(lv) do
					if lv2~=nil then
						WXMgrIns:SetLighten(QFWDlib.IllHandType[k],QFWDlib.IllHandLabel[lk],lv2.name,1,true);
						v=v+1;
					end
				end
			end
		end
	end
	return true,v;
end
function AchievementManager:UnlockAllAchievements(tnum,types)
	local num=1;
	if AchievementManager.CanUseDll then
		if types == -1 then
			for y=1,#QFWDlib.AllAchievements do
				QFStr=tostring(QFWDlib.AllAchievements[num].ID);
				AchievementManager.Func:Invoke();
				num=num+1;
			end
			return;
		else
			QFStr=tostring(tnum);
			AchievementManager.Func:Invoke();
		end
		
	else
		if types == -1 then
			for y=1,#QFWDlib.AllAchievements do
				self.AchievementMgr:UnLockAchievement(QFWDlib.AllAchievements[num].ID);
				num=num+1;
			end
			return;
		else
			self.AchievementMgr:UnLockAchievement(tnum);
		end
	end
	AchievementManager:AchievementManagerIn();
	
end
