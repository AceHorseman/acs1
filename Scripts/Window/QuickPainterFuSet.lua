local QuickPainterFuSet = CS.Wnd_Simple.CreateWindow("QuickPainterFuSet");
ModifierMain:AddWindow("QuickPainterFuSet",QuickPainterFuSet);
local GlobleDataMgr = CS.XiaWorld.GlobleDataMgr.Instance;
function QuickPainterFuSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.choseObj = nil;
	self.Fu_btn = nil;
	self:SetTitle(QFLanguage.GetText(">QuickPainterFuSet_Title"));
	self.sx = 680;
	self.sy = 600;
	self:SetSize(self.sx,self.sy);
	
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*1,self.sy/10,300,35);
	local sy=2;
	
	self.FuListCOP = self:AddCOP("FuList",-self.sx/10*4.15,self.sy/10*0.7,2);
	self.AllFuListCOP = self:AddCOP2("AllFuList",self.sx/10*9.85,self.sy/10*0.7,1);
	self.fuName = QFWDModifierMainUI:AddLable2(self,"fuName",QFLanguage.GetText(">QuickPainterFuSet_fuName"),self.sx/10,self.sy/10*sy,self.sx/10*2.5,25);
	QFWDModifierMainUI:AddButton2(self,"bntSetFu",QFLanguage.GetText(">QuickPainterFuSet_bntSetFu"),self.sx/10*4,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSetAllFu",QFLanguage.GetText(">QuickPainterFuSet_bntSetAllFu"),self.sx/10*5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntReOneFu",QFLanguage.GetText(">QuickPainterFuSet_bntReOneFu"),self.sx/10*6,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntClearMyFu",QFLanguage.GetText(">QuickPainterFuSet_bntClearMyFu"),self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowMyFu",QFLanguage.GetText(">QuickPainterFuSet_bntShowMyFu"),self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"fuq",QFLanguage.GetText(">QuickPainterFuSet_fuq"),self.sx/10,self.sy/10*sy,self.sx/10*1,25);
	self.FuValue = QFWDModifierMainUI:AddInput2(self,"FuValue","1",self.sx/10*2,self.sy/10*sy);
	self.FuValue:SetSize(self.sx/10, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddOneFu",QFLanguage.GetText(">QuickPainterFuSet_bntAddOneFu"),self.sx/10*6,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddAllFu",QFLanguage.GetText(">QuickPainterFuSet_bntAddAllFu"),self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowAllFu",QFLanguage.GetText(">QuickPainterFuSet_bntShowAllFu"),self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	
	sy=sy+1;
	self.OutShow=self:AddOutputArea("OutShow","",self.sx/10*1,self.sy/10*sy,self.sx/10*8,self.sy/10*6);
	--QFWDModifierMainUI:AddButton2(self,"Test","测试",self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	self.word={};
	self.word[1]=QFLanguage.GetText(">QuickPainterFuSet_Tips13");
	self.word[2]=QFLanguage.GetText(">QuickPainterFuSet_Tips14");
	self.word[3]=QFLanguage.GetText(">QuickPainterFuSet_Tips15");
	self.word[4]=QFLanguage.GetText(">QuickPainterFuSet_Tips16");
	self.word[5]=QFLanguage.GetText(">QuickPainterFuSet_Tips17");
	self.word[6]=QFLanguage.GetText(">QuickPainterFuSet_Tips18");
	self.word[7]=QFLanguage.GetText(">QuickPainterFuSet_Tips19");
	self.word[8]=QFLanguage.GetText(">QuickPainterFuSet_Tips20");
	self.word[9]=QFLanguage.GetText(">QuickPainterFuSet_Tips21");
	self.word[10]=QFLanguage.GetText(">QuickPainterFuSet_Tips22");
	self.word[11]=QFLanguage.GetText(">QuickPainterFuSet_Tips23");
	self.word[12]=QFLanguage.GetText(">QuickPainterFuSet_Tips24");
	self.word[13]=QFLanguage.GetText(">QuickPainterFuSet_Tips25");
	self.word[14]=QFLanguage.GetText(">QuickPainterFuSet_Tips26");
	self.word[15]=QFLanguage.GetText(">QuickPainterFuSet_Tips27");
	self.word[16]=QFLanguage.GetText(">QuickPainterFuSet_Tips28");
	self.word[17]=QFLanguage.GetText(">QuickPainterFuSet_Tips29");

	
	self.FuNameList={};
	self.FuNameListQ={};
	self.FuNameList2={};
	self.FuTNameList={};
	self.FuTNameList2={};
	self.Type=0;
	self.GMgr=CS.XiaWorld.GlobleDataMgr.Instance;
	self:ShowMyFuList();
	self:ShowAllFuList();
	self.window:Center();
end
-- function QuickPainterFuSet:Test()
	-- QFStr="/1.save";
	-- QFStr2="0";
	-- QFStr3="2000";
	-- local func=ModifierMain.lib:GetMethod("LoadFile");
	-- local save=func:Invoke();
	-- if save~=nil then
		-- print("MOD版修改器:成功！")
	-- else
		-- print("MOD版修改器:失败！")
	-- end
-- end
function QuickPainterFuSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		-- if obj.name == "Test" then
			-- QuickPainterFuSet:Test();
			-- QuickPainterFuSet.ShowLable.text = "测试成功!";
			-- return;
		-- end
		if obj.name == "bntSetFu" then
			QuickPainterFuSet:SetMyFu();
			QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips1");
			return;
		end
		if obj.name == "bntSetAllFu" then
			local num,num1=QuickPainterFuSet:SetAllMyFu();
			QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips2")..tostring(num).."  "..QFLanguage.GetText(">QuickPainterFuSet_Tips3")..tostring(num1);
			return;
		end
		if obj.name == "bntShowMyFu" then
			QuickPainterFuSet:ShowMyFuList();
			QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips4");
			return;
		end
		if obj.name == "bntShowAllFu" then
			QuickPainterFuSet:ShowAllFuList();
			QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips5");
			return;
		end
		if obj.name == "bntClearMyFu" then
			if QuickPainterFuSet:ReAllMyFu() then
				QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips6");
			else
				QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips7");
			end
			return;
		end
		if obj.name == "bntReOneFu" then
			if QuickPainterFuSet:ReOneMyFu() then
				QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips8");
			else
				QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips9");
			end
			return;
		end
		if obj.name == "bntAddOneFu" then
			if QuickPainterFuSet:AddOneToFu() then
				QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips10");
			else
				QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips11");
			end
			return;
		end
		if obj.name == "bntAddAllFu" then
			local num,num2=QuickPainterFuSet:AddAllToMyFu();
			QuickPainterFuSet.ShowLable.text = QFLanguage.GetText(">QuickPainterFuSet_Tips12")..tostring(num);
			
			return;
		end
	end
	
end
function QuickPainterFuSet:OnShowUpdate()
	
end
function QuickPainterFuSet:OnShown()
	QuickPainterFuSet.isShowing = true
end
function QuickPainterFuSet:OnUpdate()

end

function QuickPainterFuSet:OnHide()
	QuickPainterFuSet.isShowing = false;
	ModifierMain.showWindow=0;
end
function QuickPainterFuSet:ShowFuAttribu(names)
	local name=names;
	if name==nil then
		num=QuickPainterFuSet.TheClickBnt;
		if QuickPainterFuSet.Type==0 then
			name=QuickPainterFuSet.FuTNameList[num];
		else
			name=QuickPainterFuSet.FuTNameList2[num];
		end
	end
	--print(tostring(name))
	if name==nil then
		return false;
	end
	local spellDef = PracticeMgr:GetSpellDef(name);
	if spellDef==nil then
		return false;
	end
	local info="";
	if spellDef.DisplayName~=nil then
		info=info..QuickPainterFuSet.word[1]..":<font color=\"#DD0000\">"..tostring(spellDef.DisplayName).."</font>\n";
	end
	if spellDef.Desc~=nil then
		info=info..QuickPainterFuSet.word[2]..":<font color=\"#0000DD\">"..tostring(spellDef.Desc).."</font>\n";
	end
	if spellDef.Name~=nil then
		info=info..QuickPainterFuSet.word[3]..":"..tostring(spellDef.Name).."\n";
	end
	if spellDef.Template~=nil then
		info=info..QuickPainterFuSet.word[4]..":"..tostring(spellDef.Template).."\n";
	end
	if spellDef.UnLock~=nil then
		info=info..QuickPainterFuSet.word[5]..":"..tostring(spellDef.UnLock).."\n";
	end
	if spellDef.BaseFive~=nil then
		info=info..QuickPainterFuSet.word[6]..":"..tostring(spellDef.BaseFive).."\n";
	end
	local localKey,localValue;
	local info2="";
	if spellDef.SkillEffects~=nil then
		for localKey, localValue in pairs(spellDef.SkillEffects) do
			if localValue~=nil then
				info2=info2.."      "..QuickPainterFuSet.word[9]..":"..tostring(localValue.Name).."\n        "..QuickPainterFuSet.word[10]..":"..tostring(localValue.Level).."\n        "..QuickPainterFuSet.word[11]..":"..tostring(localValue.LevelOver).."\n        "..QuickPainterFuSet.word[12]..":"..tostring(localValue.Exp).."\n        "..QuickPainterFuSet.word[13]..":"..tostring(localValue.Type).."\n";
			end
		end
		info=info..QuickPainterFuSet.word[7]..":\n"..info2;
	end
	info2="";
	if spellDef.Effects~=nil then
		for localKey, localValue in pairs(spellDef.Effects) do
			if localValue~=nil then
				info2=info2.."      "..QuickPainterFuSet.word[9]..":"..tostring(localValue.Name).."\n        "..QuickPainterFuSet.word[14]..":"..tostring(localValue.AddV).."\n        "..QuickPainterFuSet.word[15]..":"..tostring(localValue.AddP).."\n        "..QuickPainterFuSet.word[16]..":"..tostring(localValue.BAddV).."\n        "..QuickPainterFuSet.word[17]..":"..tostring(localValue.BAddP).."\n        "..QuickPainterFuSet.word[13]..":"..tostring(localValue.Type).."\n";
			end
		end
		info=info..QuickPainterFuSet.word[8]..":\n"..info2;
	end
	QuickPainterFuSet.OutShow.title=info;
	return true;
end
function QuickPainterFuSet:AddAllToMyFu()
	local num=1;
	local trues=0;
	QuickPainterFuSet.Type=1;
	for num=1,#QuickPainterFuSet.FuTNameList2 do
		if QuickPainterFuSet:AddOneToFu(num) then
			trues=trues+1;
		end
	end
	QuickPainterFuSet:ShowMyFuList();
	return trues,#QuickPainterFuSet.FuTNameList2;
end
function QuickPainterFuSet:AddOneToFu(nums)
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves;
	local num=nums;
	if nums==nil then
		num=QuickPainterFuSet.TheClickBnt;
	end
	local name=self.FuTNameList2[num];
	if QuickPainterFuSet.Type==0 then
		return false;
	end
	local oq;
	if not FuSaves:TryGetValue(name,oq) or oq==nil then
		FuSaves:Remove(name);
		local q=tonumber(QuickPainterFuSet.FuValue.m_title.text);
		FuSaves:Add(name,q);
		if nums==nil then
			QuickPainterFuSet:ShowMyFuList();
		end
		return true;
	end
	return false;
end
function QuickPainterFuSet:ReOneMyFu(nums)
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves;
	local num=nums;
	if nums==nil then
		num=QuickPainterFuSet.TheClickBnt;
	end
	local name="";
	if QuickPainterFuSet.Type==0 then
		name=self.FuTNameList[num];
	else
		name=self.FuTNameList2[num];
	end
	local oq;
	if FuSaves:TryGetValue(name,oq) then
		FuSaves:Remove(name);
		if nums==nil then
			QuickPainterFuSet:ShowMyFuList();
		end
		return true;
	end
	return false;
end
function QuickPainterFuSet:ReAllMyFu()
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves;
	if FuSaves ~= nil then
		FuSaves:Clear();
		QuickPainterFuSet:ShowMyFuList();
		return true;
	end
	return false;
end
function QuickPainterFuSet:SetAllMyFu()
	local num=1;
	local trues=0;
	for num=1,#QuickPainterFuSet.FuTNameList do
		if QuickPainterFuSet:SetMyFu(num)==0 then
			trues=trues+1;
		end
	end
	QuickPainterFuSet:ShowMyFuList();
	return trues,#QuickPainterFuSet.FuTNameList;
end
function QuickPainterFuSet:SetMyFu(nums)
	local num=nums;
	if nums==nil then
		num=QuickPainterFuSet.TheClickBnt;
	end
	
	local q=tonumber(QuickPainterFuSet.FuValue.m_title.text);
	local name="";
	if QuickPainterFuSet.Type==0 then
		name=self.FuTNameList[num];
	else
		name=self.FuTNameList2[num];
	end
	--print("MOD版修改器:true1")
	if q==nil or q <= 0 then
		QuickPainterFuSet:ReOneMyFu(num);
		if nums==nil then
			QuickPainterFuSet:ShowMyFuList();
		end
		--print("MOD版修改器:true2")
		return 1;
	end
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves;
	local oq;
	if FuSaves:TryGetValue(name,oq) then
		FuSaves:Remove(name);
		FuSaves:Add(name,q);
		if nums==nil then
			QuickPainterFuSet:ShowMyFuList();
		end
		--print("MOD版修改器:true")
		return 0;
	end
	--print("MOD版修改器:true2")
	return -1;
end
function QuickPainterFuSet:ShowAllFuList()
	local allFuDate = PracticeMgr.m_mapSpellDefs;--获取所有符咒元素
	local localKey,localValue;
	local obj=QuickPainterFuSet.AllFuListCOP;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">QuickPainterFuSet_Tips30");
	--QuickPainterFuSet.Type=1;
	local num=0;
	QuickPainterFuSet.FuTNameList2={};
	QuickPainterFuSet.FuNameList2={};
	for localKey, localValue in pairs(allFuDate) do
		if localKey~=nil and localKey~="" and localValue~=nil then
			num=num+1;
			QuickPainterFuSet.FuTNameList2[num]=localValue.Name;
			if localValue.DisplayName~=nil then
				QuickPainterFuSet.FuNameList2[num] = localValue.DisplayName;
				QuickPainterFuSet:AddChildToList(obj,tostring(num),tostring(num).."."..tostring(localValue.DisplayName).."--"..tostring(localValue.Name),"res\\Sprs\\object\\object_fuzhou02a");
			else
				QuickPainterFuSet.FuNameList2[num] = localValue.Name;
				QuickPainterFuSet:AddChildToList(obj,tostring(num),tostring(num).."."..tostring(localValue.Name),"res\\Sprs\\object\\object_fuzhou02a");
			end
		end
	end
	QuickPainterFuSet:ShowFuAttribu(QuickPainterFuSet.FuTNameList2[1]);
end
function QuickPainterFuSet:ShowMyFuList()
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves;
	local localKey,localValue;
	local obj=QuickPainterFuSet.FuListCOP;
	local spellDef =nil;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">QuickPainterFuSet_Tips31");
	--QuickPainterFuSet.Type=0;
	local num=0;
	QuickPainterFuSet.FuTNameList={};
	QuickPainterFuSet.FuNameList={};
	QuickPainterFuSet.FuNameListQ={};
	for localKey, localValue in pairs(FuSaves) do
		if localKey~=nil and localKey~="" then
			spellDef = PracticeMgr:GetSpellDef(localKey);
			if spellDef~=nil then
				num=num+1;
				QuickPainterFuSet.FuTNameList[num]=spellDef.Name;
				QuickPainterFuSet.FuNameListQ[num]=localValue;
				if spellDef.DisplayName~=nil then
					QuickPainterFuSet.FuNameList[num] = spellDef.DisplayName;
					QuickPainterFuSet:AddChildToList(obj,tostring(num),tostring(num).."."..tostring(spellDef.DisplayName).."--"..tostring(localValue),"res\\Sprs\\object\\object_fuzhou02a");
				else
					QuickPainterFuSet.FuNameList[num] = spellDef.Name;
					QuickPainterFuSet:AddChildToList(obj,tostring(num),tostring(num).."."..tostring(spellDef.Name).."--"..tostring(localValue),"res\\Sprs\\object\\object_fuzhou02a");
				end
			end
		end
	end
end

function QuickPainterFuSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function QuickPainterFuSet:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(QuickPainterFuSet.ListChildOnClick);
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
function QuickPainterFuSet:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(QuickPainterFuSet.ListChildOnClick2);
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
function QuickPainterFuSet:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*4.1, 20, false);
	obj.m_title.text = value;
	if icon ~= nil then
		obj.m_icon.icon = icon;
	else
		obj.m_icon.icon = "";
	end
	return obj;
end
function QuickPainterFuSet:AddOutputArea(name,value,x,y,w,h)
	if w==nil or h==nil then
		w=600;
		h=300;
	end
	if x==nil then
		x=0;
	end
	if y==nil then
		y=0;
	end
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7zc5cnr",x,y);
	obj.m_title.richTextField.htmlText = value;
	obj.m_title.richTextField.textField.autoSize=2;
	obj.name = name;
	obj:SetSize(w, h, false);
	return obj;
end
function QuickPainterFuSet.ListChildOnClick(Eventss)
	QuickPainterFuSet.TheClickBnt = tonumber(Eventss.data.name);
	--print(QuickPainterFuSet.TheClickBnt)
	QuickPainterFuSet.Type=0;
	QuickPainterFuSet.fuName.text=tostring(QuickPainterFuSet.FuNameList[QuickPainterFuSet.TheClickBnt]);
	QuickPainterFuSet.FuValue.m_title.text=tostring(QuickPainterFuSet.FuNameListQ[QuickPainterFuSet.TheClickBnt]);
	QuickPainterFuSet:ShowFuAttribu();
end
function QuickPainterFuSet.ListChildOnClick2(Eventss)
	QuickPainterFuSet.TheClickBnt = tonumber(Eventss.data.name);
	--print(QuickPainterFuSet.TheClickBnt)
	QuickPainterFuSet.Type=1;
	QuickPainterFuSet.fuName.text=tostring(QuickPainterFuSet.FuNameList2[QuickPainterFuSet.TheClickBnt]);
	QuickPainterFuSet:ShowFuAttribu();
end