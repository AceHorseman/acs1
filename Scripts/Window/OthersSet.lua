local OthersSet = CS.Wnd_Simple.CreateWindow("OthersSet");
ModifierMain:AddWindow("OthersSet",OthersSet);
OthersSet.HotNoFog=false;
function OthersSet.WndOnHotKey()
	if QFForeInte~=nil and QFForeInte.GetKeyDownKeyStr~=nil then
		if QFForeInte.GetKeyForeverDownStr("mouse 1") then
			if QFForeInte.GetKeyDownKeyStr("1") then
				OthersSet:NoFogFunc();
			end
		end
		
	end
end

function OthersSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">OthersSet_Title"));
	self:SetSize(self.sx,self.sy);

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*1,self.sy/10,self.sx/10*8,35);
	self.sys=2;
	self.CheckBox1 = self:AddCheckBox("QuickWork",QFLanguage.GetText(">OthersSet_QuickWork"),self.sx/10*1,self.sy/10*self.sys);
	self.CheckBox1.selected = CS.GameMain.Instance.QuickWork;
	self.CheckBox2 = self:AddCheckBox("QuickBuild",QFLanguage.GetText(">OthersSet_QuickBuild"),self.sx/10*4,self.sy/10*self.sys);
	self.CheckBox2.selected = CS.GameMain.Instance.QuickBuild;
	self.sys=self.sys+0.5;
	self.CheckBox3 = self:AddCheckBox("NoEvent",QFLanguage.GetText(">OthersSet_NoEvent"),self.sx/10*1,self.sy/10*self.sys);
	self.CheckBox3.selected = CS.GameMain.Instance.NoEvent;
	self.CheckBox8 = self:AddCheckBox("NoBurning",QFLanguage.GetText(">OthersSet_NoBurning"),self.sx/10*4,self.sy/10*self.sys);
	self.CheckBox8.selected = CS.GameMain.Instance.NoBurning;
	self.sys=self.sys+0.5;
	self.CheckBox5 = self:AddCheckBox("NoNeed",QFLanguage.GetText(">OthersSet_NoNeed"),self.sx/10*1,self.sy/10*self.sys);
	self.CheckBox5.selected = CS.GameMain.Instance.NoNeed;
	self.CheckBox6 = self:AddCheckBox("NoDayNight",QFLanguage.GetText(">OthersSet_NoDayNight"),self.sx/10*4,self.sy/10*self.sys);
	self.CheckBox6.selected = CS.GameMain.Instance.NoDayNight;
	--self.sys=self.sys+0.5;
	--self.CheckBox7 = self:AddCheckBox("NoMonster","无怪物",self.sx/10*1,self.sy/10*self.sys);
	--self.CheckBox7.selected = CS.GameMain.Instance.NoMonster;
	--self.CheckBox4 = self:AddCheckBox("NoTilemap","无瓦片地图",self.sx/10*4,self.sy/10*self.sys);
	--self.CheckBox4.selected = CS.GameMain.Instance.NoTilemap;
	self.sys=self.sys+0.5;
	self.CheckBox9 = self:AddCheckBox("CloseAutoSave",QFLanguage.GetText(">OthersSet_CloseAutoSave"),self.sx/10*1,self.sy/10*self.sys);
	self.CheckBox9.selected = CS.GameMain.Instance.CloseAutoSave;
	self.CheckBox12 = self:AddCheckBox("ShowAllBuff",QFLanguage.GetText(">OthersSet_ShowAllBuff"),self.sx/10*4,self.sy/10*self.sys);
	self.CheckBox12.selected = CS.GameMain.Instance.ShowAllBuff;
	self.sys=self.sys+0.5;
	self.CheckBox13 = self:AddCheckBox("KnowEveryGod",QFLanguage.GetText(">OthersSet_KnowEveryGod"),self.sx/10*1,self.sy/10*self.sys);
	self.CheckBox13.selected = CS.GameMain.Instance.KnowEveryGod;
	self.CheckBox14 = self:AddCheckBox("AllGod",QFLanguage.GetText(">OthersSet_AllGod"),self.sx/10*4,self.sy/10*self.sys);
	self.CheckBox14.selected = CS.GameMain.Instance.AllGod;
	--self.sys=self.sys+0.5;
	--self.CheckBox11 = self:AddCheckBox("ShowDebug","显示Debug",self.sx/10*1,self.sy/10*self.sys);
	--self.CheckBox11.selected = CS.GameMain.Instance.ShowDebug;
	--self.CheckBox10 = self:AddCheckBox("BeginItem","BeginItem",self.sx/10*4,self.sy/10*self.sys);
	--self.CheckBox10.selected = CS.GameMain.Instance.BeginItem;
	self.sys=self.sys+0.5;
	self.CheckBox30 = self:AddCheckBox("CloseMapFog",QFLanguage.GetText(">OthersSet_CloseMapFog"),self.sx/10*1,self.sy/10*self.sys);
	self.CheckBox30.selected = CS.GameMain.Instance.NoFog;
	self.CheckBox16 = self:AddCheckBox("LingView",QFLanguage.GetText(">OthersSet_LingView"),self.sx/10*4,self.sy/10*self.sys);
	self.CheckBox16.selected = World.LingView;
	-- self.sys=self.sys+0.5;
	self.sys=self.sys+0.5;
	self.CheckBox17 = self:AddCheckBox("KongMing",QFLanguage.GetText(">OthersSet_KongMing"),self.sx/10*1,self.sy/10*self.sys);
	self.CheckBox17.selected = World.KongMing;
	--self.CheckBox15 = self:AddCheckBox("FengShui","风水显示",self.sx/10*4,self.sy/10*self.sys);
	--self.CheckBox15.selected = CS.Wnd_GameMain.Instance.openFengshui;
	-- self.CheckBox18 = self:AddCheckBox("HasTeacher","开局提示",self.sx/10*4,self.sy/10*self.sys);
	-- self.CheckBox18.selected = World.HasTeacher;
	-- QFWDModifierMainUI:AddLable2(self,"lable10","上帝模式:",self.sy/10,self.sy/10*6.5,200,35);
	-- if CS.GameMain.Instance.AllGod == true then
		-- QFWDModifierMainUI:AddButton2(self,"bntAllGod","关闭",self.sx/10*2,self.sy/10*6.5);
	-- else
		-- QFWDModifierMainUI:AddButton2(self,"bntAllGod","开启",self.sx/10*2,self.sy/10*6.5);
	-- end
	OthersSet.IsFight=false;
	if QFForeInte~=nil and  (not QFForeInte.FightMap) then
		self.CheckBox23 = self:AddCheckBox("ChangeAddLing9",QFLanguage.GetText(">OthersSet_ChangeAddLing9"),self.sx/10*4,self.sy/10*self.sys);
		self.CheckBox23.selected =QFForeInte.CheckValue(5);
		self.sys=self.sys+0.5;
		self.CheckBox19 = self:AddCheckBox("ChangeZhenXian",QFLanguage.GetText(">OthersSet_ChangeZhenXian"),self.sx/10*4,self.sy/10*self.sys);
		self.CheckBox19.selected =QFForeInte.CheckValue(1);
		self.CheckBox20 = self:AddCheckBox("ChangeToRange9999",QFLanguage.GetText(">OthersSet_ChangeToRange9999"),self.sx/10*1,self.sy/10*self.sys);
		self.CheckBox20.selected =QFForeInte.CheckValue(2);
		self.sys=self.sys+0.5;
		self.CheckBox21 = self:AddCheckBox("ChangeBuildding99999",QFLanguage.GetText(">OthersSet_ChangeBuildding99999"),self.sx/10*4,self.sy/10*self.sys);
		self.CheckBox21.selected =QFForeInte.CheckValue(3);
		self.CheckBox22 = self:AddCheckBox("ChangeBeauty999",QFLanguage.GetText(">OthersSet_ChangeBeauty999"),self.sx/10*1,self.sy/10*self.sys);
		self.CheckBox22.selected =QFForeInte.CheckValue(4);
		self.sys=self.sys+0.5;
		
		self.CheckBox24 = self:AddCheckBox("ChangeLing999",QFLanguage.GetText(">OthersSet_ChangeLing999"),self.sx/10*1,self.sy/10*self.sys);
		self.CheckBox24.selected =QFForeInte.CheckValue(6);
		-- self.CheckBox22 = self:AddCheckBox("ChangeToNoFog","关闭地图迷雾",self.sx/10*1,self.sy/10*self.sys);
		-- self.CheckBox22.selected =FileWRManager:CheckValue(5);
	else
		OthersSet.IsFight=true;
	end
	self.window:Center();
end

function OthersSet:OnShowUpdate()
	
end

function OthersSet:OnShown()
	OthersSet.isShowing = true
end

function OthersSet:OnUpdate()

end

function OthersSet:OnHide()
	OthersSet.isShowing = false;
	ModifierMain.showWindow=0;
	--WebHelper:Show();
end

function OthersSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "QuickWork" then
			CS.GameMain.Instance.QuickWork = self.CheckBox1.selected;
			if CS.GameMain.Instance.QuickWork then
				if (not OthersSet.IsFight) then
					World:SetFlag(6100, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6100, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "QuickBuild" then
			CS.GameMain.Instance.QuickBuild = self.CheckBox2.selected;
			if CS.GameMain.Instance.QuickBuild then
				if (not OthersSet.IsFight) then
					World:SetFlag(6101, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6101, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "NoEvent" then
			CS.GameMain.Instance.NoEvent = self.CheckBox3.selected;
			if CS.GameMain.Instance.NoEvent then
				if (not OthersSet.IsFight) then
					World:SetFlag(6102, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6102, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		-- if obj.name == "NoTilemap" then
			-- CS.GameMain.Instance.NoTilemap = self.CheckBox4.selected;
			-- if CS.GameMain.Instance.NoTilemap then
				-- World:SetFlag(6103, 1);
			-- else
				-- World:SetFlag(6103, 2);
			-- end
			-- OthersSet.ShowLable.text = "已调整。";
			-- return;
		-- end
		if obj.name == "NoNeed" then
			CS.GameMain.Instance.NoNeed = self.CheckBox5.selected;
			if CS.GameMain.Instance.NoNeed then
				if (not OthersSet.IsFight) then
					World:SetFlag(6104, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6104, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "NoDayNight" then
			CS.GameMain.Instance.NoDayNight = self.CheckBox6.selected;
			if CS.GameMain.Instance.NoDayNight then
				if (not OthersSet.IsFight) then
					World:SetFlag(6105, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6105, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		-- if obj.name == "NoMonster" then
			-- CS.GameMain.Instance.NoMonster = self.CheckBox7.selected;
			-- if CS.GameMain.Instance.NoMonster then
				-- World:SetFlag(6106, 1);
			-- else
				-- World:SetFlag(6106, 2);
			-- end
			-- OthersSet.ShowLable.text = "已调整。";
			-- return;
		-- end
		if obj.name == "NoBurning" then
			CS.GameMain.Instance.NoBurning = self.CheckBox8.selected;
			if CS.GameMain.Instance.NoBurning then
				if (not OthersSet.IsFight) then
					World:SetFlag(6107, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6107, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "CloseAutoSave" then
			CS.GameMain.Instance.CloseAutoSave = self.CheckBox9.selected;
			if CS.GameMain.Instance.CloseAutoSave then
				if (not OthersSet.IsFight) then
					World:SetFlag(6108, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6108, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "BeginItem" then
			CS.GameMain.Instance.BeginItem = self.CheckBox10.selected;
			if CS.GameMain.Instance.BeginItem then
				if (not OthersSet.IsFight) then
					World:SetFlag(6109, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6109, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		-- if obj.name == "ShowDebug" then
			-- CS.GameMain.Instance.ShowDebug = self.CheckBox11.selected;
			-- if CS.GameMain.Instance.ShowDebug then
				-- World:SetFlag(6110, 1);
			-- else
				-- World:SetFlag(6110, 2);
			-- end
			-- OthersSet.ShowLable.text = "已调整。";
			-- return;
		-- end
		if obj.name == "KnowEveryGod" then
			CS.GameMain.Instance.KnowEveryGod = self.CheckBox13.selected;
			if CS.GameMain.Instance.KnowEveryGod then
				if (not OthersSet.IsFight) then
					World:SetFlag(6111, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6111, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "AllGod" then
			CS.GameMain.Instance.AllGod = self.CheckBox14.selected;
			if CS.GameMain.Instance.AllGod then
				if (not OthersSet.IsFight) then
					World:SetFlag(6112, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6112, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "CloseMapFog" then
			--CS.GameMain.Instance.AllGod = self.CheckBox14.selected;
			CS.GameMain.Instance.NoFog = self.CheckBox30.selected;
			OthersSet.HotNoFog=CS.GameMain.Instance.NoFog;
			--CS.MapRender.Instance.Fog.enabled = not self.CheckBox30.selected;
			if CS.GameMain.Instance.NoFog then
				OthersSet:ShowMap();
				if (not OthersSet.IsFight) then
					World:SetFlag(6113, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6113, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "LingView" then
			World.LingView = self.CheckBox16.selected;
			if World.LingView then
				if (not OthersSet.IsFight) then
					World:SetFlag(6114, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6114, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		if obj.name == "KongMing" then
			World.KongMing = self.CheckBox17.selected;
			if World.KongMing then
				if (not OthersSet.IsFight) then
					World:SetFlag(6115, 1);
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6115, 2);
				end
			end
			OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips1");
			return;
		end
		-- if obj.name == "FengShui" then
			-- local num2=1;
			-- if self.CheckBox15.selected then
				-- CS.Wnd_GameMain.Instance.openFengshui=true;
				-- while not World.Fengshui do
					-- World:OpenFengshui();
					-- num2=num2+1;
					-- if num2>50 then
						-- break;
					-- end
				-- end
				-- World:SetFlag(6116, 1);
			-- else
				-- CS.Wnd_GameMain.Instance.openFengshui=false;
				-- while World.Fengshui do
					-- World:CloseFengshui();
					-- num2=num2+1;
					-- if num2>50 then
						-- break;
					-- end
				-- end
				-- World:SetFlag(6116, 2);
			-- end
			-- OthersSet.ShowLable.text = "已调整。";
			-- return;
		-- end
		if obj.name == "ChangeZhenXian" then
			if self.CheckBox19.selected then
				QFForeInte.SetValue(1,1);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips2");
			else
				QFForeInte.SetValue(1,2);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips3");
			end
			return;
		end
		if obj.name == "ChangeToRange9999" then
			if self.CheckBox20.selected then
				QFForeInte.SetValue(2,1);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips2");
			else
				QFForeInte.SetValue(2,2);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips3");
			end
			return;
		end
		if obj.name == "ChangeBuildding99999" then
			if self.CheckBox21.selected then
				QFForeInte.SetValue(3,1);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips2");
			else
				QFForeInte.SetValue(3,2);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips3");
			end
			return;
		end
		if obj.name == "ChangeBeauty999" then
			if self.CheckBox22.selected then
				QFForeInte.SetValue(4,1);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips2");
			else
				QFForeInte.SetValue(4,2);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips3");
			end
			return;
		end
		if obj.name == "ChangeAddLing9" then
			if self.CheckBox23.selected then
				QFForeInte.SetValue(5,1);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips2");
			else
				QFForeInte.SetValue(5,2);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips3");
			end
			return;
		end
		if obj.name == "ChangeLing999" then
			if self.CheckBox24.selected then
				QFForeInte.SetValue(6,1);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips2");
			else
				QFForeInte.SetValue(6,2);
				OthersSet.ShowLable.text = QFLanguage.GetText(">OthersSet_Tips3");
			end
			return;
		end
		-- if obj.name == "ChangeToNoFog" then
			-- if self.CheckBox22.selected then
				-- FileWRManager:WriteSettingWho(5,1);
				-- OthersSet:MapFog(0);
				-- OthersSet.ShowLable.text = "已开启。直接有效!并开局自动修改！";
			-- else
				-- FileWRManager:WriteSettingWho(5,0);
				-- OthersSet:MapFog(1);
				-- OthersSet.ShowLable.text = "已关闭。直接有效!";
			-- end
			-- return;
		-- end
	end
end
function OthersSet:GameIn()
	local num=World:GetFlag(6100);
	if num==1 then
		CS.GameMain.Instance.QuickWork=true;
	elseif num==2 then
		CS.GameMain.Instance.QuickWork=false;
	end
	num=World:GetFlag(6101);
	if num==1 then
		CS.GameMain.Instance.QuickBuild=true;
	elseif num==2 then
		CS.GameMain.Instance.QuickBuild=false;
	end
	num=World:GetFlag(6102);
	if num==1 then
		CS.GameMain.Instance.NoEvent=true;
	elseif num==2 then
		CS.GameMain.Instance.NoEvent=false;
	end
	-- num=World:GetFlag(6103);
	-- if num==1 then
		-- CS.GameMain.Instance.NoTilemap=true;
	-- elseif num==2 then
		-- CS.GameMain.Instance.NoTilemap=false;
	-- end
	num=World:GetFlag(6104);
	if num==1 then
		CS.GameMain.Instance.NoNeed=true;
	elseif num==2 then
		CS.GameMain.Instance.NoNeed=false;
	end
	num=World:GetFlag(6105);
	if num==1 then
		CS.GameMain.Instance.NoDayNight=true;
	elseif num==2 then
		CS.GameMain.Instance.NoDayNight=false;
	end
	-- num=World:GetFlag(6106);
	-- if num==1 then
		-- CS.GameMain.Instance.NoMonster=true;
	-- elseif num==2 then
		-- CS.GameMain.Instance.NoMonster=false;
	-- end
	num=World:GetFlag(6107);
	if num==1 then
		CS.GameMain.Instance.NoBurning=true;
	elseif num==2 then
		CS.GameMain.Instance.NoBurning=false;
	end
	num=World:GetFlag(6108);
	if num==1 then
		CS.GameMain.Instance.CloseAutoSave=true;
	elseif num==2 then
		CS.GameMain.Instance.CloseAutoSave=false;
	end
	-- num=World:GetFlag(6109);
	-- if num==1 then
		-- CS.GameMain.Instance.BeginItem=true;
	-- elseif num==2 then
		-- CS.GameMain.Instance.BeginItem=false;
	-- end
	-- num=World:GetFlag(6110);
	-- if num==1 then
		-- CS.GameMain.Instance.ShowDebug=true;
	-- elseif num==2 then
		-- CS.GameMain.Instance.ShowDebug=false;
	-- end
	num=World:GetFlag(6111);
	if num==1 then
		CS.GameMain.Instance.KnowEveryGod=true;
	elseif num==2 then
		CS.GameMain.Instance.KnowEveryGod=false;
	end
	num=World:GetFlag(6112);
	if num==1 then
		CS.GameMain.Instance.AllGod=true;
	elseif num==2 then
		CS.GameMain.Instance.AllGod=false;
	end
	num=World:GetFlag(6113);
	if num==1 then
		CS.GameMain.Instance.NoFog = true;
		OthersSet:ShowMap();
		--CS.MapRender.Instance.Fog.enabled = false;
	elseif num==2 then
		CS.GameMain.Instance.NoFog = false;
		
		--CS.MapRender.Instance.Fog.enabled = true;
	end
	num=World:GetFlag(6114);
	if num==1 then
		World.LingView=true;
	elseif num==2 then
		World.LingView=false;
	end
	num=World:GetFlag(6115);
	if num==1 then
		World.KongMing=true;
	elseif num==2 then
		World.KongMing=false;
	end
	-- num=World:GetFlag(6116);
	-- local num2=1;
	-- if num==1 then
		-- CS.Wnd_GameMain.Instance.openFengshui=true;
		-- while not World.Fengshui do
			-- World:OpenFengshui();
			-- num2=num2+1;
			-- if num2>50 then
				-- break;
			-- end
		-- end
	-- elseif num==2 then
		-- CS.Wnd_GameMain.Instance.openFengshui=false;
		-- while World.Fengshui do
			-- World:CloseFengshui();
			-- num2=num2+1;
			-- if num2>50 then
				-- break;
			-- end
		-- end
	-- end
end
function OthersSet:NoFogFunc()
	if OthersSet.HotNoFog then
		CS.GameMain.Instance.NoFog = false;
		OthersSet.HotNoFog=false;
	else
		CS.GameMain.Instance.NoFog = true;
		OthersSet.HotNoFog=true;
		OthersSet:ShowMap();
	end
end
function OthersSet:MapFog(a)
	if a==0 then
		CS.GameMain.Instance.NoFog = true;
		local map = Map.Size-1;
		for x=0,map do
			for y=0,map do
				CS.MapRender.Instance.Fog:Unfog(x, y);
			end
		end
	else
		CS.GameMain.Instance.NoFog = false;
	end
end
function OthersSet:ShowMap()
	local map = Map.Size-1;
	for x=0,map do
		for y=0,map do
			CS.MapRender.Instance.Fog:Unfog(x, y);
		end
	end
end


function OthersSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function OthersSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end