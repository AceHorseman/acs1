local EasyUse = CS.Wnd_Simple.CreateWindow("EasyUse");
ModifierMain:AddWindow("EasyUse",EasyUse);
EasyUse.LastSelectThing=nil;
EasyUse.LastSelectThingType=0;
function EasyUse.WndOnHotKey()
	if QFForeInte~=nil and QFForeInte.GetKeyDownKeyStr~=nil then
		if QFForeInte.GetKeyForeverDownStr("right shift") and QFForeInte.GetKeyDownKeyStr("1") then
			if EasyUse.isShowing then
				EasyUse:Hide();
			else
				EasyUse:Show();
			end
		end
		--if QFForeInte.GetKeyForeverDownStr("mouse 1") and QFForeInte.GetKeyDownKeyStr("4") then
		--	local lKey = CS.UI_WorldLayer.Instance.MouseGridKey;
		--	if lKey~=nil then
		--		local lthing=EasyUse.LastSelectThing;
		--		if lthing~=nil then
		--			--lthing:ClearDraw();
		--			--lthing:SetPostion(lKey,true,true,false);
		--			
		--			--lthing:Draw();
		--			lthing:SetPostionOnly(lKey);
		--			lthing:AfterLoad();
		--		end
		--	end
		--end
		--<Mouse1+4>鼠标右键长按+数字4键点按。移动当前选中的物体到鼠标的位置。（注意：需开启快捷按钮后才能生效！）
    
	end
end
function EasyUse.ForeInte()
	EasyUse.NpcManager = ModifierMain:FindWindow("NpcManager");
	EasyUse.ThingManager = ModifierMain:FindWindow("ThingManager");
	EasyUse.BuildingManager=ModifierMain:FindWindow("BuildingManager");
	EasyUse.PlantManager = ModifierMain:FindWindow("PlantManager");
	EasyUse.AddManager = ModifierMain:FindWindow("AddManager");
	EasyUse.WorldLuaHelper = CS.WorldLuaHelper();
end
function EasyUse:GameIn()
	if EasyUse.HaveRegister==nil or EasyUse.HaveRegister == false then
		EasyUse.ForeInte();
		EasyUse.HaveRegister = false;
		if QFForeInte.CheckValue(701) then
			EasyUse.OpenEasyUse(true);
		end
	end
end
function EasyUse:OnInit()
	EasyUse:GameIn();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">EasyUse_Title"));
	self:SetSize(self.sx,self.sy);
	EasyUse.EasychooseThing = {};
	self.jc=1;
	self.Point={};
	--QFWDModifierMainUI:AddButton2(self,"bntRemoveWeather","移除全部",self.sx/10*7.5,self.sy/10*2):SetSize(self.sx/10*1.2, 20, false);

	-- QFWDModifierMainUI:AddButton2(self,"bntWeatherSet","添加事件!",self.sx/10*6,self.sy/10*3):SetSize(self.sx/10*1.5, 25, false);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">EasyUse_Tips1"),self.sx/10*1,self.sy/10,self.sx/10*8,35);
	
	
	--QFWDModifierMainUI:AddLable2(self,"tlable1","事件设置:",self.sx/10,self.sy/10*1.5,200,35);
	typesss=0;
	EasyUse.BntList={};
	EasyUse.LabList={};
	local syy=2.1;
	self.lab1=QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">EasyUse_Tips2")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*(syy-0.1),200,35);
	EasyUse.LabList[1]=self.lab1;
	EasyUse.BntList[1]=QFWDModifierMainUI:AddButton2(self,"bntChooseNpc",QFLanguage.GetText(">EasyUse_bntChooseNpc"),self.sx/10*4,self.sy/10*syy);
	EasyUse.BntList[2]=QFWDModifierMainUI:AddButton2(self,"bntChooseNpcre",QFLanguage.GetText(">EasyUse_bntChooseNpcre"),self.sx/10*5.5,self.sy/10*syy);

	syy= syy+0.5;
	self.lab2=QFWDModifierMainUI:AddLable2(self,"lable2",QFLanguage.GetText(">EasyUse_Tips3")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*(syy-0.1),200,35);
	EasyUse.LabList[2]=self.lab2;
	EasyUse.BntList[3]=QFWDModifierMainUI:AddButton2(self,"bntChooseItem",QFLanguage.GetText(">EasyUse_bntChooseNpc"),self.sx/10*4,self.sy/10*syy);
	EasyUse.BntList[4]=QFWDModifierMainUI:AddButton2(self,"bntChooseItemre",QFLanguage.GetText(">EasyUse_bntChooseNpcre"),self.sx/10*5.5,self.sy/10*syy);

	syy= syy+0.5;
	self.lab3=QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">EasyUse_Tips4")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*(syy-0.1),200,35);
	EasyUse.LabList[3]=self.lab3;
	EasyUse.BntList[5]=QFWDModifierMainUI:AddButton2(self,"bntChooseBuilding",QFLanguage.GetText(">EasyUse_bntChooseNpc"),self.sx/10*4,self.sy/10*syy);
	EasyUse.BntList[6]=QFWDModifierMainUI:AddButton2(self,"bntChooseBuildingre",QFLanguage.GetText(">EasyUse_bntChooseNpcre"),self.sx/10*5.5,self.sy/10*syy);

	syy= syy+0.5;
	self.lab4=QFWDModifierMainUI:AddLable2(self,"lable4",QFLanguage.GetText(">EasyUse_Tips5")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*(syy-0.1),200,35);
	EasyUse.LabList[4]=self.lab4;
	EasyUse.BntList[7]=QFWDModifierMainUI:AddButton2(self,"bntChoosePlant",QFLanguage.GetText(">EasyUse_bntChooseNpc"),self.sx/10*4,self.sy/10*syy);
	EasyUse.BntList[8]=QFWDModifierMainUI:AddButton2(self,"bntChoosePlantre",QFLanguage.GetText(">EasyUse_bntChooseNpcre"),self.sx/10*5.5,self.sy/10*syy);

	syy= syy+0.5;
	self.lab5=QFWDModifierMainUI:AddLable2(self,"lable5",QFLanguage.GetText(">EasyUse_Tips6")..": X:"..QFLanguage.GetText(">AddManager_Tips3").."  Y:"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*(syy-0.1),200,35);
	EasyUse.LabList[6]=self.lab5;
	syy= syy+0.5;
	self.lab6=QFWDModifierMainUI:AddLable2(self,"lable6",QFLanguage.GetText(">EasyUse_Tips7")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*(syy-0.1),200,35);
	EasyUse.LabList[5]=self.lab6;
	EasyUse.BntList[9]=QFWDModifierMainUI:AddButton2(self,"bntAddItem",QFLanguage.GetText(">EasyUse_bntAddItem"),self.sx/10*4,self.sy/10*syy);
	EasyUse.BntList[10]=QFWDModifierMainUI:AddButton2(self,"bntAllItemre",QFLanguage.GetText(">EasyUse_bntAllItemre"),self.sx/10*5.5,self.sy/10*syy);
	local nuum=1;
	for nuum=1,10 do
		EasyUse.BntList[nuum]:SetSize(self.sx/10*0.8, 25, false);
	end
	syy= syy+1;
	self.EasyUseCheckBox=self:AddCheckBox("EasyUse",QFLanguage.GetText(">EasyUse_EasyUse"),self.sx/10*8,self.sy/10*1);
	self.EasyUseCheckBox2=self:AddCheckBox("EasyUseGird",QFLanguage.GetText(">EasyUse_EasyUseGird"),self.sx/10*8,self.sy/10*1.5);
	if TimeSetSpeed ~= nil then
		self.EasyUseCheckBox3=self:AddCheckBox("EasyUseMoreSpeed",QFLanguage.GetText(">EasyUse_EasyUseMoreSpeed"),self.sx/10*8,self.sy/10*2.5);
		if QFForeInte.CheckValue(703) then
			self.EasyUseCheckBox3.selected = true;
		else
			self.EasyUseCheckBox3.selected = false;
		end
	end
	self.EasyUseCheckBox4=self:AddCheckBox("EasyUseHotKey",QFLanguage.GetText(">EasyUse_EasyUseHotKey"),self.sx/10*8,self.sy/10*2);
	
	if QFForeInte.CheckValue(701) then
		self.EasyUseCheckBox.selected = true;
	else
		self.EasyUseCheckBox.selected = false;
	end
	if QFForeInte.CheckValue(702) then
		self.EasyUseCheckBox2.selected = true;
	else
		self.EasyUseCheckBox2.selected = false;
	end
	if QFForeInte.CheckValue(704) then
		self.EasyUseCheckBox4.selected = true;
	else
		self.EasyUseCheckBox4.selected = false;
	end
	-- self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*3);
	-- self.input1:SetSize(240, 25, false);
	-- self.input1.m_title.restrict = "[0-9]";
	-- self.input1.m_title.maxLength = 6;
	self.window:Center();
	if CS.MapCamera~=nil and CS.MapCamera.Instance~=nil then
		EasyUse.Gird=true;
	end
end

function EasyUse:OnShowUpdate()
	
end

function EasyUse:OnShown()
	if EasyUse.typesss==0 then
		EasyUse.ShowLable.color=CS.UnityEngine.Color(0,1,0,1);
		EasyUse.ShowLable.text=QFLanguage.GetText(">EasyUse_Tips8");
		EasyUse.EasyUseCheckBox.visible=false;
	else
		EasyUse.ShowLable.color=CS.UnityEngine.Color(1,0,0,1);
		EasyUse.ShowLable.text=QFLanguage.GetText(">EasyUse_Tips1");
		EasyUse.EasyUseCheckBox.visible=true;
	end
	EasyUse.isShowing = true;
end
function EasyUse:ShowKey(key)
	if EasyUse.Gird and EasyUse.EasyUseCheckBox2.selected then
		CS.MapCamera.Instance:ShowGridMask(true);
		CS.MapCamera.Instance:SetGridMaskPos(CS.XiaWorld.GridMgr.Inst:Grid2Pos(key));
	end
end
function EasyUse:OnUpdate()
	if EasyUse.isShowing then
		if CS.UnityEngine.Input.GetKeyDown(CS.UnityEngine.KeyCode.P) then
			if EasyUse.typesss==0 then
				EasyUse.typesss=1;
				EasyUse.ShowLable.color=CS.UnityEngine.Color(1,0,0,1);
				EasyUse.ShowLable.text=QFLanguage.GetText(">EasyUse_Tips1");
				--EasyUse.sx=680;
				EasyUse:SetSize(EasyUse.sx,EasyUse.sy);
				EasyUse.window:Center();
				local nuum=1;
				EasyUse.ShowLable.x=EasyUse.sx/10*1;
				for nuum=1,5 do
					EasyUse.BntList[2*nuum-1].x=EasyUse.sx/10*4;
					EasyUse.BntList[2*nuum].x=EasyUse.sx/10*5.5;
					EasyUse.BntList[2*nuum].visible=true;
					EasyUse.LabList[nuum].x=EasyUse.sx/10;
					--EasyUse.BntList[nuum]:Hide();
				end
				EasyUse.LabList[6].x=EasyUse.sx/10;
				EasyUse.EasyUseCheckBox.visible=true;
				EasyUse.EasyUseCheckBox2.visible=true;
				if TimeSetSpeed ~= nil then
					EasyUse.EasyUseCheckBox3.visible=true;
				end
				EasyUse.BntList[9].visible=true;
				return;
			else
				EasyUse.typesss = 0;
				EasyUse.ShowLable.text=QFLanguage.GetText(">EasyUse_Tips8");
						EasyUse.ShowLable.color=CS.UnityEngine.Color(0,1,0,1);
				--EasyUse.sx=600;
				EasyUse:SetSize(EasyUse.sx/10*4.5,EasyUse.sy/10*5.5);
				local nuum=1;
				EasyUse.ShowLable.x=EasyUse.sx/10*0.3;
				for nuum=1,5 do
					EasyUse.BntList[2*nuum-1].x=EasyUse.sx/10*3;
					EasyUse.BntList[2*nuum].x=EasyUse.sx/10*4;
					EasyUse.BntList[2*nuum].visible=false;
					EasyUse.LabList[nuum].x=EasyUse.sx/10*0.3;
					--EasyUse.BntList[nuum]:Hide();
				end
				EasyUse.LabList[6].x=EasyUse.sx/10*0.3;
				EasyUse.window:SetXY(0, 0);
				EasyUse.EasyUseCheckBox.visible=false;
				EasyUse.EasyUseCheckBox2.visible=false;
				if TimeSetSpeed ~= nil then
					EasyUse.EasyUseCheckBox3.visible=false;
				end
				EasyUse.BntList[9].visible=false;
			end
		end
		if EasyUse.typesss==0 then
			if EasyUse.jc>=10 then
				EasyUse.jc=1;
				EasyUse:UpdateData();
			else
				EasyUse.jc=EasyUse.jc+1;
			end
		end
	end
	
end

function EasyUse:OnHide()
	if EasyUse.typesss==0 then
		EasyUse.ShowLable.text=QFLanguage.GetText(">EasyUse_Tips8");
	else
		EasyUse.ShowLable.text=QFLanguage.GetText(">EasyUse_Tips1");
		if EasyUse.Gird then
			CS.MapCamera.Instance:ShowGridMask(false);
		end
	end
	EasyUse.isShowing = false;
	ModifierMain.showWindow=0;
	-- local LineMgr=CS.MapRender.Instance.LineView;
	-- print(1)
	-- --local line=CS.UnityEngine.LineRenderer();
	-- print(2)
	-- local x=CS.XiaWorld.GridMgr.Inst:Grid2Pos(1);
	-- print(3)
	-- local y=CS.XiaWorld.GridMgr.Inst:Grid2Pos(192*50);
	-- print(4)
	-- --line:SetPosition(0, x);
	-- --line:SetPosition(1, y);
	-- print(5)
	-- --LineMgr.lines:Add(-2, line);
	-- print(6)
	-- LineMgr:SetLineBegin(-2, nil,y);
end

function EasyUse:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		
		if obj.name == "bntChooseNpc" then
			if EasyUse.EasychooseThing[1]~=nil then
				self.NpcManager:Show();
				EasyUse.NpcSetting(EasyUse.EasychooseThing[1][1]);
				EasyUse:Hide();
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "bntChooseNpcre" then
			if EasyUse.EasychooseThing[1]~=nil then
				ThingMgr:RemoveThing(EasyUse.EasychooseThing[1][1],true,true);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		
		if obj.name == "bntChooseItem" then
			if EasyUse.EasychooseThing[2]~=nil then
				EasyUse.ItemSetting(EasyUse.EasychooseThing[2][1]);
				EasyUse:Hide();
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "bntChooseItemre" then
			if EasyUse.EasychooseThing[2]~=nil then
				ThingMgr:RemoveThing(EasyUse.EasychooseThing[2][1],true,true);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "bntChooseBuilding" then
			if EasyUse.EasychooseThing[3]~=nil then
				EasyUse.BuildingSetting(EasyUse.EasychooseThing[3][1]);
				EasyUse:Hide();
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "bntChooseBuildingre" then
			if EasyUse.EasychooseThing[3]~=nil then
				ThingMgr:RemoveThing(EasyUse.EasychooseThing[3][1],true,true);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "bntChoosePlant" then
			if EasyUse.EasychooseThing[4]~=nil then
				EasyUse.PlantSetting(EasyUse.EasychooseThing[4][1]);
				EasyUse:Hide();
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "bntChoosePlantre" then
			if EasyUse.EasychooseThing[4]~=nil then
				ThingMgr:RemoveThing(EasyUse.EasychooseThing[4][1],true,true);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "bntAddItem" then
			if EasyUse.Point~=nil and EasyUse.Point~={} then
				showalone=1;
				self.AddManager:Show();
				self.AddManager:SetXY(EasyUse.Point.x,EasyUse.Point.y);
				EasyUse:Hide();
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "bntAllItemre" then
			if EasyUse:AllItemre() then
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips9");
			else
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips10");
			end
			return;
		end
		if obj.name == "EasyUse" then
			if self.EasyUseCheckBox.selected then
				EasyUse.OpenEasyUse(true);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips11");
			else
				EasyUse.OpenEasyUse(false);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips12");
			end
			QFForeInte.SetBool(701,self.EasyUseCheckBox.selected);
			return;
		end
		if obj.name == "EasyUseGird" then
			if self.EasyUseCheckBox2.selected then
				--World:SetFlag(6201, 1);
				--EasyUse.OpenEasyUse(true);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips13");
			else
				--World:SetFlag(6201, 0);
				if EasyUse.Gird then
					CS.MapCamera.Instance:ShowGridMask(false);
				end
				--EasyUse.OpenEasyUse(false);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips14");
			end
			QFForeInte.SetBool(702,self.EasyUseCheckBox2.selected);
			
			return;
		end
		if obj.name == "EasyUseMoreSpeed" then
			if self.EasyUseCheckBox3.selected then
				--World:SetFlag(6202, 0);
				--EasyUse.OpenEasyUse(true);
				TimeSetSpeed.SetBtn(true);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips15");
			else
				--World:SetFlag(6202, 1);
				--EasyUse.OpenEasyUse(false);
				TimeSetSpeed.SetBtn(false);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips16");
			end
			QFForeInte.SetBool(703,self.EasyUseCheckBox3.selected);
			
			return;
		end
		if obj.name == "EasyUseHotKey" then
			if self.EasyUseCheckBox4.selected then
				--World:SetFlag(6202, 0);
				--EasyUse.OpenEasyUse(true);
				--TimeSetSpeed.SetBtn(true);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips21");
			else
				--World:SetFlag(6202, 1);
				--EasyUse.OpenEasyUse(false);
				--TimeSetSpeed.SetBtn(false);
				EasyUse.ShowLable.text = QFLanguage.GetText(">EasyUse_Tips22");
			end
			QFForeInte.SetBool(704,self.EasyUseCheckBox4.selected);
			
			return;
		end
	end
end
function EasyUse.NpcSetting(thing)
	--if thing==nil then
	--	thing=EasyUse.LastSelectThing;
	--end
	--if EasyUse.LastSelectThingType==1 then
	--	EasyUse.NpcManager:Show();
	--	EasyUse.NpcManager:ShowNpcListIn({thing});
	--else
	--	EasyUse.NpcManager:Show();
	--end
	if thing==nil then
		thing=EasyUse.LastSelectThing;
		if thing==nil then
			local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
			if Key~=nil then
				thing=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Npc);
			end
			if thing==nil then
				EasyUse.NpcManager:Show();
			else
				EasyUse.NpcManager:Show();
				EasyUse.NpcManager:ShowNpcListIn({thing});
			end
		else
			if thing~=nil and EasyUse.LastSelectThingType==1 then
				EasyUse.NpcManager:Show();
				EasyUse.NpcManager:ShowNpcListIn({thing});
			else
				local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
				if Key~=nil then
					thing=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Npc);
				end
				if thing==nil then
					EasyUse.NpcManager:Show();
				else
					EasyUse.NpcManager:Show();
					EasyUse.NpcManager:ShowNpcListIn({thing});
				end
			end
		end
		
	else
		EasyUse.NpcManager:Show();
		EasyUse.NpcManager:ShowNpcListIn({thing});
	end
end
function EasyUse.ItemSetting(thing)
	if thing==nil then
		thing=EasyUse.LastSelectThing;
		if thing==nil then
			local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
			if Key~=nil then
				thing=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Item);
			end
			if thing==nil then
				EasyUse.ThingManager:Show();
			else
				EasyUse.ThingManager:Show();
				EasyUse.ThingManager:GetAllThingInMap({thing});
			end
		else
			if thing~=nil and EasyUse.LastSelectThingType==2 then
				EasyUse.ThingManager:Show();
				EasyUse.ThingManager:GetAllThingInMap({thing});
			else
				local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
				if Key~=nil then
					thing=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Item);
				end
				if thing==nil then
					EasyUse.ThingManager:Show();
				else
					EasyUse.ThingManager:Show();
					EasyUse.ThingManager:GetAllThingInMap({thing});
				end
			end
		end
		
	else
		EasyUse.ThingManager:Show();
		EasyUse.ThingManager:GetAllThingInMap({thing});
	end
	--EasyUse.ThingManager:Show();
	--EasyUse.ThingManager:GetAllThingInMap({thing});
	
end
function EasyUse.BuildingSetting(thing)
	--if thing==nil then
	--	thing=EasyUse.LastSelectThing;
	--end
	----EasyUse.BuildingManager:Show();
	----EasyUse.BuildingManager:GetAllThingInMap({thing});
	--if EasyUse.LastSelectThingType==3 then
	--	EasyUse.BuildingManager:Show();
	--	EasyUse.BuildingManager:GetAllThingInMap({thing});
	--else
	--	EasyUse.BuildingManager:Show();
	--end
	--if thing==nil then
	--	thing=EasyUse.LastSelectThing;
	--end
	if thing==nil then
		thing=EasyUse.LastSelectThing;
		if thing==nil then
			local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
			if Key~=nil then
				thing=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Building);
			end
			if thing==nil then
				EasyUse.BuildingManager:Show();
			else
				EasyUse.BuildingManager:Show();
				EasyUse.BuildingManager:GetAllThingInMap({thing});
			end
		else
			if thing~=nil and EasyUse.LastSelectThingType==3 then
				EasyUse.BuildingManager:Show();
				EasyUse.BuildingManager:GetAllThingInMap({thing});
			else
				local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
				if Key~=nil then
					thing=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Building);
				end
				if thing==nil then
					EasyUse.BuildingManager:Show();
				else
					EasyUse.BuildingManager:Show();
					EasyUse.BuildingManager:GetAllThingInMap({thing});
				end
			end
		end
		
	else
		EasyUse.BuildingManager:Show();
		EasyUse.BuildingManager:GetAllThingInMap({thing});
	end
end
function EasyUse.PlantSetting(thing)
	--if thing==nil then
	--	thing=EasyUse.LastSelectThing;
	--end
	----EasyUse.PlantManager:Show();
	----EasyUse.PlantManager:GetAllThingInMap({thing});
	--if EasyUse.LastSelectThingType==4 then
	--	EasyUse.PlantManager:Show();
	--	EasyUse.PlantManager:GetAllThingInMap({thing});
	--else
	--	EasyUse.PlantManager:Show();
	--end
	if thing==nil then
		thing=EasyUse.LastSelectThing;
		if thing==nil then
			local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
			if Key~=nil then
				thing=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Plant);
			end
			if thing==nil then
				EasyUse.PlantManager:Show();
			else
				EasyUse.PlantManager:Show();
				EasyUse.PlantManager:GetAllThingInMap({thing});
			end
		else
			if thing~=nil and EasyUse.LastSelectThingType==4 then
				EasyUse.PlantManager:Show();
				EasyUse.PlantManager:GetAllThingInMap({thing});
			else
				local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
				if Key~=nil then
					thing=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Plant);
				end
				if thing==nil then
					EasyUse.PlantManager:Show();
				else
					EasyUse.PlantManager:Show();
					EasyUse.PlantManager:GetAllThingInMap({thing});
				end
			end
		end
		
	else
		EasyUse.PlantManager:Show();
		EasyUse.PlantManager:GetAllThingInMap({thing});
	end
end
function EasyUse:AllItemre()
	if EasyUse.Key==nil or EasyUse.Key==0 then
		return false;
	end
	-- local thingList = Map.Things:GetThingsAtGrid(EasyUse.Key);
	-- if thingList=={} or thingList==nil or then
		-- return false;
	-- end
	local thing=nil;
	local num=1;
	for num=1, #QFWDlib.ThingTypes do 
		thing=Map.Things:GetThingAtGrid(EasyUse.Key,QFWDlib.ThingTypes[num]);
		if thing~=nil then
			ThingMgr:RemoveThing(thing,true,true);
		end
	end
	return true;
end
function EasyUse:UpdateData()
	if CS.UI_WorldLayer==nil or CS.UI_WorldLayer.Instance==nil then
		return false;
	end
	local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
	if Key<=0 then
		EasyUse.lab5.text=QFLanguage.GetText(">EasyUse_Tips6")..": X:"..QFLanguage.GetText(">AddManager_Tips3").." Y:"..QFLanguage.GetText(">AddManager_Tips3");
		EasyUse.lab6.text=QFLanguage.GetText(">EasyUse_Tips7")..":"..QFLanguage.GetText(">AddManager_Tips3");
		EasyUse.Point={};
		EasyUse.Key=nil;
		return false;
	else
		local position= EasyUse:GetXY(Key);
		EasyUse.Point=position;
		EasyUse.Key=Key;
		EasyUse.lab5.text=QFLanguage.GetText(">EasyUse_Tips6")..": X: "..tostring(position.x).."  Y: "..tostring(position.y);
		EasyUse.lab6.text=QFLanguage.GetText(">EasyUse_Tips7")..": "..tostring(Key);
	end
	
	local npc=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Npc);
	local Item=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Item);
	local Building=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Building);
	local Plant=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Plant);
--	print(1)
	if npc~=nil then
		EasyUse.lab1.text=QFLanguage.GetText(">EasyUse_Tips2")..": "..tostring(npc:GetName());
		EasyUse.EasychooseThing[1]={};
		EasyUse.EasychooseThing[1][1]=npc;
	else
		EasyUse.lab1.text=QFLanguage.GetText(">EasyUse_Tips2")..":"..QFLanguage.GetText(">AddManager_Tips3");;
		EasyUse.EasychooseThing[1]=nil;
	end
	if Item~=nil then
		EasyUse.lab2.text=QFLanguage.GetText(">EasyUse_Tips3")..": "..tostring(Item:GetName());
		EasyUse.EasychooseThing[2]={};
		EasyUse.EasychooseThing[2][1]=Item;
	else
		EasyUse.lab2.text=QFLanguage.GetText(">EasyUse_Tips3")..":"..QFLanguage.GetText(">AddManager_Tips3");;
		EasyUse.EasychooseThing[2]=nil;
	end
	if Building~=nil then
		EasyUse.lab3.text=QFLanguage.GetText(">EasyUse_Tips4")..": "..tostring(Building:GetName());
		EasyUse.EasychooseThing[3]={};
		EasyUse.EasychooseThing[3][1]=Building;
	else
		EasyUse.lab3.text=QFLanguage.GetText(">EasyUse_Tips4")..":"..QFLanguage.GetText(">AddManager_Tips3");;
		EasyUse.EasychooseThing[3]=nil;
	end
	if Plant~=nil then
		EasyUse.lab4.text=QFLanguage.GetText(">EasyUse_Tips5")..": "..tostring(Plant:GetName());
		EasyUse.EasychooseThing[4]={};
		EasyUse.EasychooseThing[4][1]=Plant;
	else
		EasyUse.lab4.text=QFLanguage.GetText(">EasyUse_Tips5")..":"..QFLanguage.GetText(">AddManager_Tips3");;
		EasyUse.EasychooseThing[4]=nil;
	end
	--local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
	EasyUse:ShowKey(Key);
end
function EasyUse:GetKey(x,y)
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
function EasyUse:GetXY(key)
	local position={};
	position.y=math.floor(key/Map.Size);
	position.x=key%Map.Size;
	return position;
end
function EasyUse.OpenEasyUse(IsOpen)
	if IsOpen and (not EasyUse.HaveRegister) then
		local Event = GameMain:GetMod("_Event");
		Event:RegisterEvent(g_emEvent.SelectNpc,EasyUse.AddNpcBtn,"EasyUse");
		Event:RegisterEvent(g_emEvent.SelectItem,EasyUse.AddItemBtn,"EasyUse");
		Event:RegisterEvent(g_emEvent.SelectPlant,EasyUse.AddPlantBtn,"EasyUse");
		Event:RegisterEvent(g_emEvent.SelectBuilding,EasyUse.AddBuildingBtn,"EasyUse");
		EasyUse.HaveRegister=true;
		--print("MOD版修改器:MOD版修改器:RegisterEvent!")
	elseif EasyUse.HaveRegister then
		local Event = GameMain:GetMod("_Event");
		Event:UnRegisterEvent(g_emEvent.SelectNpc, "EasyUse");
		Event:UnRegisterEvent(g_emEvent.SelectItem, "EasyUse");
		Event:UnRegisterEvent(g_emEvent.SelectPlant, "EasyUse");
		Event:UnRegisterEvent(g_emEvent.SelectBuilding, "EasyUse");
		if EasyUse.LastSelectThing~=nil then
			EasyUse.LastSelectThing:RemoveBtnData(QFLanguage.GetText(">EasyUse_bntChooseNpc"));
			EasyUse.LastSelectThing=nil;
		end
		EasyUse.HaveRegister=false;
	end
end
function EasyUse.AddNpcBtn(evt, thing, objs)
	if thing~=nil and thing ~= EasyUse.LastSelectThing then
		EasyUse.AddBtn(1, thing);
		if EasyUse.LastSelectThing~=nil then
			EasyUse.LastSelectThing:RemoveBtnData(QFLanguage.GetText(">EasyUse_bntChooseNpc"));
		end
		EasyUse.LastSelectThing = thing;
		EasyUse.LastSelectThingType=1;
	end
	
end
function EasyUse.AddItemBtn(evt, thing, objs)
	if thing~=nil and thing ~= EasyUse.LastSelectThing then
		EasyUse.AddBtn(2, thing);
		if EasyUse.LastSelectThing~=nil then
			EasyUse.LastSelectThing:RemoveBtnData(QFLanguage.GetText(">EasyUse_bntChooseNpc"));
		end
		EasyUse.LastSelectThing = thing;
		EasyUse.LastSelectThingType=2;
	end
	
end
function EasyUse.AddPlantBtn(evt, thing, objs)
	if thing~=nil and thing ~= EasyUse.LastSelectThing then
		EasyUse.AddBtn(3, thing);
		if EasyUse.LastSelectThing~=nil then
			EasyUse.LastSelectThing:RemoveBtnData(QFLanguage.GetText(">EasyUse_bntChooseNpc"));
		end
		EasyUse.LastSelectThing = thing;
		EasyUse.LastSelectThingType=3;
	end
	
end
function EasyUse.AddBuildingBtn(evt, thing, objs)
	if thing~=nil and thing ~= EasyUse.LastSelectThing then
		EasyUse.AddBtn(4, thing);
		if EasyUse.LastSelectThing~=nil then
			EasyUse.LastSelectThing:RemoveBtnData(QFLanguage.GetText(">EasyUse_bntChooseNpc"));
		end
		EasyUse.LastSelectThing = thing;
		EasyUse.LastSelectThingType=4;
	end
	
end
--function EasyUse.AddBnt(evt, thing, objs)
--	--print("MOD版修改器:MOD版修改器:1!")
--	if thing~=nil and thing ~= EasyUse.LastSelectThing then
--		--print("MOD版修改器:MOD版修改器:2!")
--		if thing.ThingType==QFWDlib.ThingTypes[2] then
--			EasyUse.AddBtn(1, thing);
--		elseif thing.ThingType==QFWDlib.ThingTypes[3] then
--			EasyUse.AddBtn(2, thing);
--		elseif thing.ThingType==QFWDlib.ThingTypes[4] then
--			EasyUse.AddBtn(3, thing);
--		elseif thing.ThingType==QFWDlib.ThingTypes[5] then
--			EasyUse.AddBtn(4, thing);
--		
--		end
--		if EasyUse.LastSelectThing~=nil then
--			EasyUse.LastSelectThing:RemoveBtnData(QFLanguage.GetText(">EasyUse_bntChooseNpc"));
--		end
--		EasyUse.LastSelectThing = thing;
--	end
--end
function EasyUse.AddBtn(types,thing)
	thing:RemoveBtnData(QFLanguage.GetText(">EasyUse_bntChooseNpc"));
	if types==1 then
		thing:AddBtnData(
			QFLanguage.GetText(">EasyUse_bntChooseNpc"), 
			"res/Sprs/ui/icon_building01", 
			"GameMain:GetMod(\"ModifierMain\"):FindWindow(\"EasyUse\").NpcSetting(bind)", 
			QFLanguage.GetText(">EasyUse_Tips17"), 
			nil
		);
	elseif types==2 then
		thing:AddBtnData(
			QFLanguage.GetText(">EasyUse_bntChooseNpc"), 
			"res/Sprs/ui/icon_building01", 
			"GameMain:GetMod(\"ModifierMain\"):FindWindow(\"EasyUse\").ItemSetting(bind)", 
			QFLanguage.GetText(">EasyUse_Tips18"), 
			nil
		);
	elseif types==3 then
		thing:AddBtnData(
			QFLanguage.GetText(">EasyUse_bntChooseNpc"), 
			"res/Sprs/ui/icon_building01", 
			"GameMain:GetMod(\"ModifierMain\"):FindWindow(\"EasyUse\").PlantSetting(bind)", 
			QFLanguage.GetText(">EasyUse_Tips19"), 
			nil
		);
	elseif types==4 then
		thing:AddBtnData(
			QFLanguage.GetText(">EasyUse_bntChooseNpc"), 
			"res/Sprs/ui/icon_building01", 
			"GameMain:GetMod(\"ModifierMain\"):FindWindow(\"EasyUse\").BuildingSetting(bind)", 
			QFLanguage.GetText(">EasyUse_Tips20"), 
			nil
		);
	end
end

function EasyUse:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function EasyUse:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function EasyUse:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*8.8, 20, false);
	obj.m_title.text = value;
	obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function EasyUse:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	--obj.m_button.name = name;
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false);
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false);
	obj.m_title.text = "";
	obj.m_dele.text=QFLanguage.GetText(">CallBoss_Tips3");
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="无";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="无";
	obj.m_save:SetSize(0, 0, false);
	return obj;
end
