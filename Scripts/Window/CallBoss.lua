local CallBoss = CS.Wnd_Simple.CreateWindow("CallBoss");
ModifierMain:AddWindow("CallBoss",CallBoss);
function CallBoss:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">CallBoss_Title"));
	self:SetSize(self.sx,self.sy);

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*6,self.sy/10,300,35);
	
	
	QFWDModifierMainUI:AddLable2(self,"tlable1",QFLanguage.GetText(">CallBoss_tlable1"),self.sx/10,self.sy/10*1.5,200,35);
	QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">CallBoss_lable1"),self.sx/10,self.sy/10*2,200,35);
	self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","Boss_Long",self.sx/10*1.5,self.sy/10*2.1);
	self.input3:SetSize(160, 20, false);
	
	QFWDModifierMainUI:AddButton2(self,"bntCallBossComming",QFLanguage.GetText(">CallBoss_bntCallBossComming"),self.sx/10*4,self.sy/10*2.1):SetSize(self.sx/10*1.2, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"plable1",QFLanguage.GetText(">CallBoss_plable1"),self.sx/10*7,self.sy/10*1.5,200,35);
	QFWDModifierMainUI:AddLable2(self,"lablex",QFLanguage.GetText(">AddManager_lablex"),self.sx/10*7,self.sy/10*2,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*8,self.sy/10*2.1);
	self.input1:SetSize(40, 20, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 3;
	QFWDModifierMainUI:AddLable2(self,"labley",QFLanguage.GetText(">AddManager_labley"),self.sx/10*7,self.sy/10*2.5,200,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","1",self.sx/10*8,self.sy/10*2.6);
	self.input2:SetSize(40, 20, false);
	self.input2.m_title.restrict = "[0-9]";
	self.input2.m_title.maxLength = 3;
	self.races = 
	{
		"蛟龙之影（弱）","凶凤之影（弱）","蛟龙之影","凶凤之影","烛龙之影"
	};
	self.race = 
	{
		"Boss_Long_Test","Boss_Feng_Test","Boss_Long","Boss_Feng","Boss_Zhulong"
	};
	self.CallBossCOP=self:AddCOP("RaceList",-self.sx/10*4.15,self.sy/10*0.7);
	QFWDlib.OnInit();
	CallBoss:LoadingIn();
	
	self.window:Center();
end

function CallBoss:OnShowUpdate()
	
end

function CallBoss:OnShown()
	CallBoss.isShowing = true
end

function CallBoss:OnUpdate()

end

function CallBoss:OnHide()
	CallBoss.isShowing = false;
	ModifierMain.showWindow=0;
end
function CallBoss:GetKey(x,y)
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
function CallBoss:LoadingIn()
	local k,v;
	for k, v in pairs(CallBoss.race) do
		CallBoss:AddChildToList(CallBoss.CallBossCOP,tostring(k),tostring(k)..": "..CallBoss.races[k].."--"..v);
	end
end
function CallBoss:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntCallBossComming" then
			if  tonumber(CallBoss.input3.m_title.text) ~= nil  then
				CallBoss.input3.m_title.text = CallBoss.race[tonumber(CallBoss.input3.m_title.text)];
			end
			CallBoss.ShowLable.text = QFLanguage.GetText(">CallBoss_Tips1")..CallBoss.input3.m_title.text.."！";
			Map:CallBoss(CallBoss.input3.m_title.text, CallBoss:GetKey(tonumber(CallBoss.input1.m_title.text),tonumber(CallBoss.input2.m_title.text)));
			
			return;
		end
		-- if obj.name == "bntSave" then
			-- if ModifierMain.lib~=nil then
				-- local func=ModifierMain.lib:GetMethod("SaveAllDataToFile");
				-- local MePath=QFWDModifierMainUI:GetPath();
				-- QFStr = MePath.."//QFWDModifiersSave//".."MapSaveNew"..tostring("111")..".txt";
				-- local ModifierList=func:Invoke();
				-- if ModifierList==0 then
					-- CallBoss.ShowLable.text ="成功!";
				-- else
					-- CallBoss.ShowLable.text ="失败!";
				-- end
			-- end
			-- return;
		-- end
		-- if obj.name == "bntLoad" then
			-- if ModifierMain.lib~=nil then
				-- local func=ModifierMain.lib:GetMethod("LoadFileToData");
				-- local MePath=QFWDModifierMainUI:GetPath();
				-- QFStr = MePath.."//QFWDModifiersSave//".."MapSaveNew"..tostring("111")..".txt";
				-- QFStr2 ="1";
				-- local ModifierList=func:Invoke();
				-- if ModifierList~=nil then
					-- CallBoss.ShowLable.text ="成功啦!";
					-- print(ModifierList.Version,ModifierList.MapSize)
					-- if ModifierList.World~=nil and ModifierList.World.thing then
						-- local things=ModifierList.World.thing.Things;
						-- if things~=nil then
							-- local localKey, localValue;
							-- local num=1;
							-- for localKey, localValue in pairs(things) do
								-- if localValue~=nil then
									-- print(localValue:GetName())
									-- num=num+1;
								-- end
								-- if num>100 then
									-- break;
								-- end
							-- end
						-- end
					-- end
				-- else
					-- CallBoss.ShowLable.text ="失败!";
				-- end
			-- end
			-- return;
		-- end
		--if obj.name == "bntSave2" then
		--	if CS.XiaWorld.RPGMapMgr~=nil then
		--		local RPGMgr=CS.XiaWorld.RPGMapMgr;
		--		
		--	end
		--	return;
		--end
		--if obj.name == "bntLoad2" then
		--	if ModifierMain.lib~=nil then
		--		local func=ModifierMain.lib:GetMethod("LoadFileToData");
		--		local MePath=QFWDModifierMainUI:GetPath();
		--		QFStr = MePath.."//QFWDModifiersSave//".."MapSaveNew"..tostring("111")..".txt";
		--		QFStr2 ="1";
		--		local ModifierList=func:Invoke();
		--		if ModifierList~=nil then
		--			CallBoss.ShowLable.text ="成功啦!";
		--			print(ModifierList.Version,ModifierList.MapSize)
		--			if ModifierList.World~=nil and ModifierList.World.thing then
		--				local things=ModifierList.World.thing.Things;
		--				if things~=nil then
		--					local localKey, localValue;
		--					local num=1;
		--					for localKey, localValue in pairs(things) do
		--						if localValue~=nil then
		--							print(localValue:GetName())
		--							num=num+1;
		--						end
		--						if num>100 then
		--							break;
		--						end
		--					end
		--				end
		--			end
		--		else
		--			CallBoss.ShowLable.text ="失败!";
		--		end
		--	end
		--	return;
		--end
	end
end

function CallBoss:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function CallBoss:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function CallBoss:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*3.6, 20, false);
	obj.m_title.text = value;
	obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function CallBoss:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	--obj.m_button.name = name;
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false);
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false);
	obj.m_title.text = QFLanguage.GetText(">CallBoss_Tips2");
	obj.m_dele.text=QFLanguage.GetText(">CallBoss_Tips3");
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="无";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="无";
	obj.m_save:SetSize(0, 0, false);
	--CallBoss:AddChildToList(obj,"1",CallBoss.race[1]);
	obj.m_list.onClickItem:Add(CallBoss.ListChildOnClick);
	
	-- local list = obj.m_list;
	-- list:AddItemFromPool("ui://0xrxw6g7hdhl0");
	return obj;
end
function CallBoss.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	CallBoss.TheClickBnt = tonumber(Eventss.data.name);
	CallBoss:SetSetting();
	
end
function CallBoss:SetSetting(types)
	local obj=nil;
	if types==nil then
		obj=CallBoss.input3;
	else
		obj=CallBoss.input3;
	end
	obj.m_title.text=tostring(CallBoss.race[CallBoss.TheClickBnt]);
end