local ThingManager = CS.Wnd_Simple.CreateWindow("ThingManager");
ModifierMain:AddWindow("ThingManager",ThingManager);
function ThingManager.WndOnHotKey()
	if QFForeInte~=nil and QFForeInte.GetKeyDownKeyStr~=nil then
		if QFForeInte.GetKeyForeverDownStr("mouse 0") and QFForeInte.GetKeyDownKeyStr("2") then
			if ThingManager.isShowing then
				ThingManager:Hide();
			else
				local EasyUse=ModifierMain:FindWindow("EasyUse");
				if EasyUse~=nil then
					EasyUse.ItemSetting();
				else
					ThingManager:Show();
				end
			end
		end
	end
end
function ThingManager:OnInit()
	self.ThingManagerMore = ModifierMain:FindWindow("ThingManagerMore");
	self.listType=0;
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">ThingManager_Title"));
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">ThingManager_ShowLable"),self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);
	self.ThingsAttributeNameTrue = {}
	self.Things={};
	self.MapThings={};
	self.MapThingsDisplayName={};
	self.OldThingsAttributeNameTrue={};
	self.SearchThings={};
	
	ThingManager.listtypes=0;
	
	self.ChooseThingNum = 1;
	self.ThingsAttributeCount=38;
	QFWDModifierMainUI:AddLable2(self,"lable3111",QFLanguage.GetText(">ThingManager_lable3111"),self.sx/10,self.sy/10*2,200,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2);
	self.inputid1:SetSize(50, 25, false);
	self.inputid1.m_title.restrict = "[0-9]";
	self.inputid1.m_title.maxLength = 5;
	self.ShowLableThing = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc",QFLanguage.GetText(">ThingManager_ShowLableNpc")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*1.5,300,35);
	QFWDModifierMainUI:AddButton2(self,"bntChooseThing",QFLanguage.GetText(">ThingManager_bntChooseThing"),self.sx/10*3,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false);

	self.CheckBox1 = self:AddCheckBox("bntChooseThingShow",QFLanguage.GetText(">ThingManager_bntChooseThingShow"),self.sx/10*4.5,self.sy/10*2);
	self.CheckBox1.selected = false;
	self.CheckBox2 = self:AddCheckBox("bntSetset",QFLanguage.GetText(">ThingManager_bntSetset"),self.sx/10*5.75,self.sy/10*2);
	self.CheckBox2.selected = false;
	self.CheckBox3 = self:AddCheckBox("bntMSearch",QFLanguage.GetText(">ThingManager_bntMSearch"),self.sx/10*7,self.sy/10*2);
	self.CheckBox3.selected = true;
	--QFWDModifierMainUI:AddButton2(self,"bntListThingBaseAttribute","显示基础属性",self.sx/10,self.sy/10*7):SetSize(self.sx/10*1.2, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"bntListThingBntAttribute","显示按钮属性",self.sx/10*2,self.sy/10*7):SetSize(self.sx/10*1.2, 25, false);

	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute",QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*3,300,35);
	self.ShowLableAttribute:SetSize(self.sx/10*7, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">ThingManager_lable3"),self.sx/10,self.sy/10*3.5,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*3.5);
	self.input1:SetSize(self.sx/10*2, 25, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 3;
	QFWDModifierMainUI:AddLable2(self,"lable4",QFLanguage.GetText(">ThingManager_lable4"),self.sx/10,self.sy/10*4,200,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","清",self.sx/10*2,self.sy/10*4);
	self.input2:SetSize(self.sx/10*2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSet",QFLanguage.GetText(">ThingManager_bntSet"),self.sx/10*4.5,self.sy/10*3.5,nil,nil,QFLanguage.GetText(">ThingManager_Tips1")):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesSetNpc",QFLanguage.GetText(">ThingManager_bntYesSetNpc"),self.sx/10*4.5,self.sy/10*4,nil,nil,QFLanguage.GetText(">ThingManager_Tips2")):SetSize(self.sx/10*1.2, 25, false);
	local sy=5;
	QFWDModifierMainUI:AddLable2(self,"lable131",QFLanguage.GetText(">ThingManager_lable131"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable14",QFLanguage.GetText(">ThingManager_lable14"),self.sx/10,self.sy/10*sy,self.sx/10,35);
	self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*2,self.sy/10*sy);
	self.input3:SetSize(self.sx/10*2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntButton13",QFLanguage.GetText(">ThingManager_bntButton13"),self.sx/10*4.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManager_Tips3")):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntButton14",QFLanguage.GetText(">ThingManager_bntButton14"),self.sx/10*5.75,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManager_Tips4")):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntButton15",QFLanguage.GetText(">ThingManager_bntButton15"),self.sx/10*7,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManager_Tips5")):SetSize(self.sx/10*1.2, 25, false);
	sy=sy+0.7;
	QFWDModifierMainUI:AddLable2(self,"lable16",QFLanguage.GetText(">BuildingManager_lable16"),self.sx/10,self.sy/10*sy,200,35);
	--sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntTL",QFLanguage.GetText(">BuildingManager_bntTL"),self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntST",QFLanguage.GetText(">BuildingManager_bntST"),self.sx/10*5.75,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntTLST",QFLanguage.GetText(">BuildingManager_bntTLST"),self.sx/10*7,self.sy/10*sy,nil,nil,QFLanguage.GetText(">BuildingManager_Tips36")):SetSize(self.sx/10*1.2, 25, false);
	
	--sy=sy+1;
	--QFWDModifierMainUI:AddLable2(self,"lable15","数据拷贝:",self.sx/10,self.sy/10*sy,200,35);
	--sy=sy+0.5;
	--QFWDModifierMainUI:AddButton2(self,"bntButton16","拷贝数据",self.sx/10*5.75,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"bntButton17","粘贴数据",self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	if ModifierMain.lib~=nil then
		sy=sy+0.7;
		--QFWDModifierMainUI:AddLable2(self,"lable18","种族:",self.sx/10*2.5,self.sy/10*sy,self.sx/10,35);
		-- self.input18 = QFWDModifierMainUI:AddInput2(self,"input18","JYCat",self.sx/10*3.5,self.sy/10*sy);
		-- self.input18:SetSize(self.sx/10*2, 25, false);
		QFWDModifierMainUI:AddLable2(self,"lable17",QFLanguage.GetText(">ThingManager_lable17"),self.sx/10,self.sy/10*sy,self.sx/10*1.5,35);
		QFWDModifierMainUI:AddButton2(self,"bntEggThing",QFLanguage.GetText(">ThingManager_bntEggThing"),self.sx/10*7,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManager_Tips6")):SetSize(self.sx/10*1.2, 25, false);
	end
	sy=sy+0.7;
	QFWDModifierMainUI:AddLable2(self,"lable5",QFLanguage.GetText(">BuildingManager_lable5"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable6",QFLanguage.GetText(">ThingManager_lable6"),self.sx/10,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntRepairAll",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*2,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable7",QFLanguage.GetText(">ThingManager_lable7"),self.sx/10*3.5,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAll",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable9",QFLanguage.GetText(">BuildingManager_lable9"),self.sx/10*6,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntChangeAll",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);

	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable13",QFLanguage.GetText(">ThingManager_lable13"),self.sx/10,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntReDrow",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*2,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable11",QFLanguage.GetText(">ThingManager_lable11"),self.sx/10*3.5,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntChangeUse",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable12",QFLanguage.GetText(">ThingManager_lable12"),self.sx/10*6,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntChangeCantUse",QFLanguage.GetText(">BuildingManager_bntRepairAll"),self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);

	self.ThingListCOP = self:AddCOP("NpcList",-self.sx/10*4.15,self.sy/10*0.7,2);
	self.ThingAttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*9.85,self.sy/10*0.7,1);
	
	QFWDModifierMainUI:AddButton2(self,"bntUpdataThingList",QFLanguage.GetText(">AddManager_bntAllThing"),-self.sx/10*0.9,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSearchThing",QFLanguage.GetText(">AddManager_bntSearchThing"),-self.sx/10*1.8,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch",QFLanguage.GetText(">AddManager_inputSearch"),-self.sx/10*4,self.sy/10*9);
	self.inputSearch:SetSize(140, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowBase",QFLanguage.GetText(">ThingManager_bntShowBase"),self.sx/10*10,self.sy/10*9):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowFB",QFLanguage.GetText(">ThingManager_bntShowFB"),self.sx/10*11.5,self.sy/10*9):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowEquip",QFLanguage.GetText(">ThingManager_bntShowEquip"),self.sx/10*13,self.sy/10*9):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntPageUp","<",-self.sx/10*3.85,self.sy/10*0.9,nil,nil,QFLanguage.GetText(">AddManager_bntPageUp")):SetSize(self.sx/10*0.3, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntPageDown",">",-self.sx/10*0.58,self.sy/10*0.9,nil,nil,QFLanguage.GetText(">AddManager_bntPageDown")):SetSize(self.sx/10*0.3, 25, false);
	
	-- -- QFWDModifierMainUI:AddButton2(self,"bntUpdataAllNpcList","NPC列表",-self.sx/10*2.65,self.sy/10*8.65):SetSize(self.sx/10*1.2, 25, false);
	-- -- QFWDModifierMainUI:AddButton2(self,"bntListBuff","AllMF",-self.sx/10*4,self.sy/10*8.65):SetSize(self.sx/10*0.6, 25, false);
	-- -- QFWDModifierMainUI:AddButton2(self,"bntListFeature","AllFT",-self.sx/10*3.45,self.sy/10*8.65):SetSize(self.sx/10*0.6, 25, false);
-- local Me = CS.ModsMgr.Instance:FindMod("QFWDModeifiers", nil, true);
-- local MePath = Me.Path;
-- local MeDll = CS.System.IO.Path.Combine(MePath, "Scripts//Lib//ClassLibrary.dll");
-- local asm = CS.System.Reflection.Assembly.LoadFrom(MeDll);
-- local lib = asm:GetType("QFLib.QFLib");
-- local func=lib:GetMethod("FertilizeOrHatchEgg2");
-- print(func:Invoke());
	ThingManager.chooseNpcNum = 0;
	ThingManager.ListTypes=0;
	ThingManager.NowThing=nil;
	self:LoadThingMgr();
	self.window:Center();
end

function ThingManager:OnShowUpdate()
	
end

function ThingManager:OnShown()
	ThingManager.isShowing = true
end

function ThingManager:OnUpdate()
	if ThingManager.isShowing == true then
		local num = tonumber(ThingManager.input1.m_title.text);
		if num == nil then
			ThingManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
			return;
		elseif num > #ThingManager.ThingsAttributeDisplayName then
			ThingManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
			return;
		elseif num==0 then
			ThingManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3");
		else
			ThingManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..": "..ThingManager.ThingsAttributeDisplayName[num];
		end
		if num ~= ThingManager.AttributeFlag then
			ThingManager.AttributeFlag = num;
			ThingManager.input2.m_title.text = tostring(ThingManager.ThingsAttributeNameTrue[num]);
		end
	end

end

function ThingManager:OnHide()
	ThingManager.isShowing = false;
	ModifierMain.showWindow=0;
end
function ThingManager:ForeInte()
	if QFWDlib.race==nil or QFWDlib.race=={} then
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
	end
	
end
function ThingManager:LoadThingMgr()
	ThingManager:ForeInte();
	ThingManager:GetAllThingInMap();
	ThingManager:ChooseThingNumAndGetAttribute(1);
end
function ThingManager:OnObjectEvent(t,obj,context)
	--print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntEggThing" then
			local num=ThingManager.FertilizeOrHatchEgg();
			if num==0 then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips7");
			elseif num==-1 then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips8");
			elseif num==1 then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips9");
			elseif num==2 then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips10");
			else
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips11");
			end
		end
		if obj.name == "bntButton13" then
			if ThingManager:BindThing() then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips12");
			else
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips13");
			end
			return;
		end
		-- if obj.name == "bntButton16" then
			-- if ThingManager:GetThingData() then
				-- ThingManager.ShowLable.text = "拷贝物品数据成功!";
			-- else
				-- ThingManager.ShowLable.text = "拷贝物品数据失败!";
			-- end
			-- return;
		-- end
		-- if obj.name == "bntButton17" then
			-- if ThingManager:PasteThingData() then
				-- ThingManager.ShowLable.text = "粘贴物品数据成功!";
			-- else
				-- ThingManager.ShowLable.text = "粘贴物品数据失败!";
			-- end
			-- return;
		-- end
		-- if obj.name == "bntButton18" then
			-- if ThingManager:PasteThing() then
				-- ThingManager.ShowLable.text = "复制物品成功!";
			-- else
				-- ThingManager.ShowLable.text = "复制物品失败!";
			-- end
			-- return;
		-- end
		if obj.name == "bntButton14" then
			ThingManager:UpdateNPCList(nil,0);
			ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips14");
			return;
		end
		if obj.name == "bntButton15" then
			ThingManager:UpdateNPCList(nil,1);
			ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips15");
			return;
		end
		if obj.name == "bntUpdataThingList" then
			ThingManager:GetAllThingInMap();
			ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips16");
			ThingManager.HadSearch=0;
			return;
		end
		if obj.name == "bntPageUp" then
			ThingManager:ShowAllThingNameUP();
			ThingManager.ShowLable.text = QFLanguage.GetText(">AddManager_bntPageUp").."!"
			return;
		end
		if obj.name == "bntPageDown" then
			ThingManager:ShowAllThingNameDown();
			ThingManager.ShowLable.text = QFLanguage.GetText(">AddManager_bntPageDown").."!"
			return;
		end
		if obj.name == "bntChooseThing" then
			local num=tonumber(ThingManager.inputid1.m_title.text);
			if num == nil then
				num=1;
			end
			ThingManager:ChooseThingNumAndGetAttribute(num);
			--ThingManager.ShowListNum=0;
			if ThingManager.CheckBox1.selected then
				ThingManager:ChooseThingShow();
			end
			ThingManager.ShowLableThing.text = QFLanguage.GetText(">ThingManager_ShowLableNpc")..": "..tostring(ThingManager.MapThings[ThingManager.ChooseThingNum].def.ThingName);
			ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips17");
			return;
		end
		if obj.name == "bntShowBase" then
			-- ThingManager:ChooseThingShow();
			ThingManager:GetChooseThingAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]);
			--ThingManager.ShowListNum=0;
			ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips18");
			return;
		end
		if obj.name == "bntShowFB" then
			-- ThingManager:ChooseThingShow();
			if ThingManager:GetChooseThingFBAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]) then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips19");
				
			else
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips20");
			end
			return;
		end
		if obj.name == "bntSet" then
			local num=tonumber(ThingManager.input1.m_title.text);
			if num == nil then
				num=1;
			end
			ThingManager:SetThingAttributeByNum(ThingManager.input2.m_title.text,num);
			ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips21");
			return;
		end
		if obj.name == "bntListThingBaseAttribute" then
			ThingManager:UpdateThingAttributeUseHaveData(nil);
			ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips22");
			return;
		end
		if obj.name == "bntSearchThing" then
			local name=ThingManager.inputSearch.m_title.text;
			if ThingManager:SearchDisplayName(name) then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips23");
				ThingManager.HadSearch=1;
			else
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips24");
			end
			
			return;
		end
		
		if obj.name == "bntYesSetNpc" then
			if ThingManager.ShowListNum == 1 then
				ThingManager:SetTrueThingFBAttribute();
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips25");
			else
				ThingManager:SetTrueThingAttribute();
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips26");
			end
			return;
		end
		if obj.name == "bntRepairAll" then
			if ThingManager.HadSearch==1 then
				if ThingManager:RepairAll(1) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips27");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips28");
				end
			else
				if ThingManager:RepairAll(0) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips29");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips30");
				end
			end
			return;
		end
		if obj.name == "bntRemoveAll" then
			if ThingManager.HadSearch==1 then
				if ThingManager:RemoveAll(1) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips31");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips32");
				end
			else
				if ThingManager:RemoveAll(0) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips33");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips34");
				end
			end
			return;
		end
		if obj.name == "bntReDrow" then
			if ThingManager.HadSearch==1 then
				if ThingManager:ReDrow(1) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips35");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips36");
				end
			else
				if ThingManager:ReDrow(0) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips37");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips38");
				end
			end
			return;
		end
		if obj.name == "bntChangeUse" then
			if ThingManager.HadSearch==1 then
				if ThingManager:ChangeUse(1) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips39");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips40");
				end
			else
				if ThingManager:ChangeUse(0) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips41");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips42");
				end
			end
			return;
		end
		if obj.name == "bntChangeCantUse" then
			if ThingManager.HadSearch==1 then
				if ThingManager:ChangeCantUse(1) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips43");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips44");
				end
			else
				if ThingManager:ChangeCantUse(0) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips45");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips46");
				end
			end
			return;
		end
		if obj.name == "bntChangeAll" then
			if ThingManager.HadSearch==1 then
				if ThingManager:ChangeAll(1) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips47");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips48");
				end
			else
				if ThingManager:ChangeAll(0) then
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips49");
				else
					ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips50");
				end
			end
			return;
		end
		if obj.name == "bntShowEquip" then
			if ThingManager.MapThings[ThingManager.ChooseThingNum]~=nil then
				self.ThingManagerMore:Show();
				self.ThingManagerMore:ThingManagerMoreIn(ThingManager.MapThings[ThingManager.ChooseThingNum]);
				ThingManager:Hide();
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips51");
			end
			return;
		end
		if obj.name == "bntTLST" then
			if ThingManager:TongLingAndSuTi() then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips52");
			else
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips53");
			end
			return;
		end
		if obj.name == "bntTL" then
			if ThingManager:TongLing() then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips54");
			else
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips55");
			end
			return;
		end
		if obj.name == "bntST" then
			if ThingManager:SuTi() then
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips56");
			else
				ThingManager.ShowLable.text = QFLanguage.GetText(">ThingManager_Tips57");
			end
			return;
		end
	end
end
function ThingManager.FertilizeOrHatchEgg()
	QFObj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	--QFStr=tostring(ThingManager.input18.m_title.text);
	QFStr="";
	local func=ModifierMain.lib:GetMethod("FertilizeOrHatchEgg");
	local num=func:Invoke();
	if num==2 then
		QFObj:OnClearDraw();
		QFObj:OnDraw(true);
	elseif num==1 then
		ThingMgr:RemoveThing(QFObj, true, true);
	end
	return num;
end
function ThingManager:GetThingData(thingObj)
	if thingObj == nil then
		thingObj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	local save = thingObj:GetSaveData();
	if save==nil then
		return false;
	else
		ThingManager.NowThing = save;
		return true;
	end
end
function ThingManager:PasteThingData(thingObj)
	if thingObj == nil then
		thingObj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	local save = ThingManager.NowThing;
	if save==nil then
		return false;
	else
		local id=thingObj.ID;
		local key=thingObj.Key;
		--save.Key=thingObj.Key;
		--save.ID=thingObj.ID;
		save.Ns[0]=thingObj.ID;
		save.Ns[2]=thingObj.Key;
		if (thingObj.AtRoom ~= nil) then
			save.AtRoomID = thingObj.AtRoom.ID;
		end
		-- thingObj:LoadSaveData(save);
		-- thingObj.ID=id;
		thingObj:SetPostion(key,true);
		thingObj:OnClearDraw()
		thingObj:OnDraw(true);
		return true;
	end
end
function ThingManager:UpdateNPCList(obj,types)
	if obj==nil then
		obj=ThingManager.ThingAttributeListCOP;
	end
	obj.m_list:RemoveChildrenToPool();
	local NpcLists={};
	ThingManager.ListTypes=1;
	if types==0 then
		obj.m_title.text = QFLanguage.GetText(">ThingManager_Tips58");
		NpcLists=Map.Things:GetActiveNpcs();
	else
		obj.m_title.text = QFLanguage.GetText(">ThingManager_Tips59");
		NpcLists=Map.Things.m_lisNpcs;--:GetActiveNpcs();
	end
	local k,v=nil,nil;
	local num=0;
	ThingManager.NpcList={};
	for k,v in pairs(NpcLists) do
		if v~=nil then
			num=num+1;
			ThingManager.NpcList[num]=v;
			ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v:GetName()));
		end
	end
	return obj;
end
function ThingManager:BindThing(obj)
	if obj == nil then
		obj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	local num=tonumber(ThingManager.input3.m_title.text);
	if num==nil then
		num=1;
		ThingManager.input3.m_title.text = 1;
		return false;
	end
	local npc=ThingManager.NpcList[num];
	if npc==nil then
		return false;
	else
		if obj.def~=nil and obj.def.Parent=="Item_BodyPracticeBase" then
			if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
				npc.PropertyMgr.Practice.BodyPracticeData:AddQuenchingItem(obj, obj.Count);
				--print("MOD版修改器:绑定体修成功！")
			else
				obj:BindItem2Npc(npc);
			end
		else
			obj:BindItem2Npc(npc);
		end
		return true;
	end
end

function ThingManager:ReDrow(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:OnClearDraw()
			localValue:OnDraw(true);
			--localValue:Draw();
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localValue:OnClearDraw()
			localValue:OnDraw(true);
			--localThing:Draw();
		end
	end
	return true;
end
function ThingManager:ChangeCantUse(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:SetActable(false);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localThing:SetActable(false);
		end
	end
	return true;
end
function ThingManager:ChangeUse(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:SetActable(true);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localThing:SetActable(true);
		end
	end
	return true;
end
function ThingManager:ChangeAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localThing:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player);
		end
	end
	return true;
end
function ThingManager:RemoveAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			ThingMgr:RemoveThing(localValue, true, true);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			ThingMgr:RemoveThing(localThing, true, true);
		end
	end
	return true;
end
function ThingManager:RepairAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:AddHealth(localValue.MaxHp-localValue.Hp);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localThing:AddHealth(localValue.MaxHp-localValue.Hp);
		end
	end
	return true;
end
function ThingManager:SetThingAttributeByNum(attribute,num)
	ThingManager.ThingsAttributeNameTrue[num] = attribute;
	ThingManager:UpdateThingAttributeUseHaveData(nil);
end
function ThingManager:ChooseThingShow()
	local needShowThing=ThingManager.MapThings[ThingManager.ChooseThingNum];
	if needShowThing.Key==nil or needShowThing.Key<=0 then
		ThingManager.CheckBox1.selected=false;
		return false
	end
	CS.Wnd_GameMain.Instance:ShowThingInfo(needShowThing, nil);
	CS.MapCamera.Instance:LookKey(needShowThing.Key);
	return true;
	--CS.MapCamera.Instance.MainCamera.backgroundColor = CS.UnityEngine.Color.red;
	--CS.MapCamera.Instance.MainCamera.allowHDR = true;
	--CS.MapCamera.Instance.MainCamera.orthographic=false;
	--CS.MapCamera.Instance.MainCamera.fieldOfView = 90;
	--CS.MapCamera.Instance.MainCamera.clearFlags=CS.UnityEngine.Skybox;
	--CS.MapCamera.Instance.MainCamera.transform:Rotate(0, 0, 90);
end
function ThingManager:UpdateThingAttributeUseHaveData(obj)
	if obj == nil then
		obj=ThingManager.ThingAttributeListCOP;
	end
	obj.m_list:RemoveChildrenToPool();
	local num = 1;
	for z=1,#ThingManager.ThingsAttributeDisplayName do
		ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(ThingManager.ThingsAttributeDisplayName[num]),"");
		ThingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(ThingManager.ThingsAttributeNameTrue[num]),"");
		num = num + 1;
	end
end
function ThingManager:ChooseThingNum(num)
	ThingManager.ChooseThingNum = num;
end
function ThingManager:ChooseThingNumAndGetAttribute(num)
	ThingManager.AttributeFlag = 0;
	ThingManager.ChooseThingNum = num;
	ThingManager:GetChooseThingAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]);
	ThingManager.ShowLableThing.text = QFLanguage.GetText(">ThingManager_ShowLableNpc")..": "..tostring(ThingManager.MapThings[ThingManager.ChooseThingNum].def.ThingName);
end
function ThingManager:UpdateThingAttribute()
	ThingManager:GetAllThingInMap();
end
function ThingManager:GetAllThingInMap(easyList)
	local list = {};
	local list2 = {};
	local num =1;
	local localKey=nil;
	local localValue=nil;
	ThingManager.MapThings={};
	if easyList ~= nil and easyList~={} then
		list = easyList;
		ThingManager.inputid1.m_title.text="1";
		ThingManager.ChooseThingNum = 1;
		ThingManager.ShowLableThing.text = QFLanguage.GetText(">ThingManager_ShowLableNpc")..": "..tostring(easyList[1].def.ThingName);
	else
		list = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.Item);
		list2 = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.None);
	end
	if list == nil then
		print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">ThingManager_Tips60"))
		return
	end
	local obj=ThingManager.ThingListCOP;
	obj.m_list:RemoveChildrenToPool();
	for localKey, localValue in pairs(list) do
		if localValue ~= nil then
			if num<201 then
				local icon = localValue.def.TexPath;
				-- if icon==nil then
					-- icon = localValue.def.Building.WoodTexPath;
				-- end
				-- if icon==nil then
					-- icon = localValue.def.Plant.RipedTexPath;
				-- end
				local name = localValue.def.Name;
				local displayName = localValue.def._ThingName;
				if displayName ~= nil then
					if localValue.IsFaBao then
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..tostring(localValue.Fabao.OName),icon);
					else
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon);
					end
				else
					ThingManager:AddChildToList(obj,"0"..tostring(num),tostring(num)..": "..name,icon);
				end
			end
			ThingManager.MapThings[num] = localValue;
			num = num +1;
		end
	end
	if list2~=nil and list2~={} then
		for localKey, localValue in pairs(list2) do
			if localValue ~= nil then
				if num<201 then
					local icon = localValue.def.TexPath;
					-- if icon==nil then
						-- icon = localValue.def.Building.WoodTexPath;
					-- end
					-- if icon==nil then
						-- icon = localValue.def.Plant.RipedTexPath;
					-- end
					local name = localValue.def.Name;
					local displayName = localValue.def._ThingName;
					if displayName ~= nil then
						if localValue.IsFaBao then
							ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(displayName).."  "..tostring(localValue.Fabao.OName),icon);
						else
							ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(displayName).."  "..tostring(name),icon);
						end
					else
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(name),icon);
					end
				end
				ThingManager.MapThings[num] = localValue;
				--if num<20 then
				--print(localValue.EquipByWho);
				--end
				num = num +1;
				--print(item.Name)
			end
		end
	end
	ThingManager.ShowPage=1;
	ThingManager.AllPage=#ThingManager.MapThings/200;
	local page=math.floor(ThingManager.AllPage);
	if page~=ThingManager.AllPage then
		ThingManager.AllPage=page+1;
	else
		ThingManager.AllPage=page;
	end
	obj.m_title.text = QFLanguage.GetText(">ThingManager_Tips61").."("..tostring(ThingManager.ShowPage).."/"..tostring(ThingManager.AllPage)..")";
	
	ThingManager:GetChooseThingAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]);
	-- for localKey, localValue in pairs(ThingManager.MapThings[1].def.Tags) do
		-- if localValue ~= nil then
		-- print(localValue.Name)
		-- end
	-- end
	-- num=1;
	-- if QFWDlib.Things[2] ~= nil then
		-- for localKey, localValue in pairs(QFWDlib.Things[2]) do
			-- item = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, localValue);
			-- if item ~= nil then
				-- ThingManager.Things[num] = item.Name;
				-- num = num +1;
				-- print(item.Name)
			-- end
		-- end
	-- end
	
end
function ThingManager:ShowAllThingNameUP(obj)
	if obj==nil then
		obj=ThingManager.ThingListCOP;
	end
	if ThingManager.ShowPage==nil or ThingManager.AllPage==nil then
		return;
	end
	ThingManager.ShowPage=ThingManager.ShowPage-1;
	if ThingManager.ShowPage==0 then
		ThingManager.ShowPage=1;
		return;
	end
	local page=ThingManager.ShowPage-1;
	
	ThingManager.listtypes=0;
	local localKey=nil;
	local localValue=nil;
	local def,icon;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">ThingManager_Tips61").."("..tostring(ThingManager.ShowPage).."/"..tostring(ThingManager.AllPage)..")";
	for localKey, localValue in pairs(ThingManager.MapThings) do
		num=num+1;
		if num>page*200 then
			if num <= (page+1)*200 then
				local icon = localValue.def.TexPath;
				local name = localValue.def.Name;
				local displayName = localValue.def._ThingName;
				if displayName ~= nil then
					if localValue.IsFaBao then
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(displayName).."  "..tostring(localValue.Fabao.OName),icon);
					else
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(displayName).."  "..tostring(name),icon);
					end
				else
					ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(name),icon);
				end
			else
				break;
			end
		end
	end
	
end
function ThingManager:ShowAllThingNameDown(obj)
	if obj==nil then
		obj=ThingManager.ThingListCOP;
	end
	if ThingManager.ShowPage==nil or ThingManager.AllPage==nil then
		return;
	end
	ThingManager.ShowPage=ThingManager.ShowPage+1;
	if ThingManager.ShowPage>ThingManager.AllPage then
		ThingManager.ShowPage=ThingManager.AllPage;
		return;
	end
	local page=ThingManager.ShowPage-1;
	
	ThingManager.listtypes=0;
	local localKey=nil;
	local localValue=nil;
	local def,icon;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">ThingManager_Tips61").."("..tostring(ThingManager.ShowPage).."/"..tostring(ThingManager.AllPage)..")";
	for localKey, localValue in pairs(ThingManager.MapThings) do
		num=num+1;
		if num>page*200 then
			if num <= (page+1)*200 then
				local icon = localValue.def.TexPath;
				local name = localValue.def.Name;
				local displayName = localValue.def._ThingName;
				if displayName ~= nil then
					if localValue.IsFaBao then
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..tostring(localValue.Fabao.OName),icon);
					else
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..tostring(name),icon);
					end
				else
					ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(name),icon);
				end
			else
				break;
			end
		end
	end
end
function ThingManager:SearchDisplayName(name)
	local findList=ThingManager.MapThings;
	local findNum=nil;
	ThingManager.findArrey={};
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(findList) do 
		if localValue.def~=nil then
			local info=localValue.def._ThingName;
			info=info.."  "..tostring(localValue.def.Name);
			info=info.."  "..tostring(localValue.m_szName);
			if localValue.IsFaBao then
				info=info.."  "..tostring(localValue.Fabao.OName);
			end
			if ThingManager.CheckBox3.selected then
				info=info.."  "..tostring(localValue:GetDesc());
			end
			findNum,_=string.find(info, name);
			if findNum ~= nil and findNum ~= 0 then
				ThingManager.findArrey[num]=localKey;
				num=num+1;
			end
		end
	end
	if ThingManager.findArrey=={} then
		return false;
	end
	local obj=ThingManager.ThingListCOP;
	obj.m_list:RemoveChildrenToPool();
	for localKey, localValue in pairs(ThingManager.findArrey) do
		local TrueThing = ThingManager.MapThings[localValue];
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
				if TrueThing.IsFaBao then
					ThingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..displayName.."  "..tostring(TrueThing.Fabao.OName),icon);
				else
					ThingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..displayName.."  "..name,icon);
				end
			else
				ThingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..name,icon)
			end
			--print(item.Name)
		end
	end
	--ThingManager:GetChooseThingAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]);
	
	return true;
end
-- function ThingManager:ChangeAttributeState(thingObj,num)
	-- ThingManager.ListTypes=0;
	-- if num==0 or num==nil then
		-- ThingManager.ThingsAttributeName = 
		-- {
			-- thingObj.def.ThingName,thingObj.def.Beauty,thingObj.Count,thingObj.m_sMod,
			-- thingObj.m_sEqMod,thingObj.m_spell,thingObj.Hp,thingObj.LingV,
			-- thingObj.DynamicLing,thingObj.Rate,thingObj.def.Desc,thingObj:GetQuality(),
			-- thingObj.LingPower,thingObj.YouPower,thingObj.IsLockInBag,thingObj.EquipVision,
			-- thingObj.FengshuiActiveState,thingObj.TaskFlag,thingObj.PackBuilding,thingObj.FSItemState,--thingObj.ElementKind,
			-- thingObj.IsNormalWeapon,
			
			-- thingObj.def.BindModifier,thingObj.def.BindWeather,
			-- thingObj.def.BlockLight,thingObj.def.BlockMissile,thingObj.def.LingMax,thingObj.def.LingMin,
			-- thingObj.def.MaxHitPoints,thingObj.def.MaxStack,thingObj.def.ModPath,thingObj.def.ModScale,
			-- thingObj.def.NoElementKind,thingObj.def.SelectAble,thingObj.def.TexPath,thingObj.def.TexScale,
			-- thingObj.def.TileID,thingObj.def.UseHitPoints,thingObj.def.VisionRadius,thingObj.def.VisualAble,
		-- };
		-- ThingManager.ThingsAttributeDisplayName = 
		-- {
			-- "名字:Name","华丽程度:Beauty","数量:Count","捆绑MOD:",
			-- "捆绑装备MOD:","捆绑符咒MOD:","血量:HP","灵气值:",
			-- "动态灵气值:DynamicLing","品阶:Rate","描述:Desc","品质:Quality",
			-- --"动态灵气值:DynamicLing"
			-- "灵萃数:LingPower","幽萃数:YouPower","背包锁定:IsLockInBag","装备样子:EquipVision",
			-- "风水活跃状态:FengshuiActiveState","工作标志号:TaskFlag","建筑打包号:PackBuilding","物品FS状态:FSItemState",
			
			-- "正常的武器:IsNormalWeapon(1.false 2.true)",--"元素属性:ElementKind(1-6)",
			
			-- "捆绑Modifier:(注意:以下禁止修改!)","捆绑天气:BindWeather",
			-- "挡光度:BlockLight","掩体度:BlockMissile","最大灵气:LingMax","最小灵气:LingMin",
			-- "耐久度:MaxHitPoints","最大堆叠数:MaxStack","3D模型路径:ModPath","模型不在地上的缩放度:ModScale",
			-- "无五行属性:NoElementKind","可被选中:SelectAble","图片路径:TexPath","图片缩放比例:TexScale",
			-- "地图块ID:TileID","使用血量:UseHitPoints","视野半径:VisionRadius","可见:VisualAble",
			
		-- };
	-- else
		
	-- end
-- end
function ThingManager:GetChooseThingAttribute(thingObj)
	-- -- local b = thingObj.TagData:GetTagNames();
		-- -- for k, v in pairs(b) do
				-- -- print(v)
		-- -- end
	-- --ThingManager:ChangeAttributeState(thingObj,0);
	ThingManager.ListTypes=0;
	QFObj=thingObj;
	local obj=ThingManager.ThingAttributeListCOP;
	ThingManager.ShowListNum=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">ThingManager_Tips62");
	ThingManager.ThingsAttributeDisplayName=
	{
	"编号:ID","品阶:Rate","创造时间:CreateTime","不堆迷雾:NoStackFlag","租借自:RentFrom",
	"故事命令:StoryCMD","被谁装备:EquipByWho","装备模样:EquipVision","风水活跃状态:FengshuiActiveState","江湖NPC搬移:JHNpcCarryIndex",
	"灵萃数:LingPower","幽萃数:YouPower","道淬数:DaoPower","任务标志:TaskFlag","风水状态:FSItemState",--":",
	--":",":",":",":",":",
	"数量:Count","美观:Beauty","灵气:LingV","品质:Quality","血量:Hp",
	"动态灵气:DynamicLing",
	"鱼体型:FishScale",--":",":",":",
	-- ":",":",":",":",":",
	-- ":",":",":",":",":",
	
	"作者:Author","来自MOD:FromMod","描述:Desc","装备模组:EqMod","模组:Mod",
	"符咒:spell","贴图:TexPath",--":",":",":",
	"名字:Name",--":",":",":",":",
	
	"隐藏HUD:HideHUD","正常武器:IsNormalWeapon","需要点击:NeedClick",--":",":",
	-- ":",":",":",":",":",
	-- ":",":",":",":",":",
	
	-- ":",":",":",":",":",
	-- ":",":",":",":",":",
	"元素类型:ElementKind","阵营:Camp","朝向:Dir"--,":",":",
	
	};
	ThingManager.ThingsAttributeAttribute=
	{
	thingObj.ID,thingObj.Rate,thingObj.CreateTime,thingObj.NoStackFlag,thingObj.RentFrom,
	thingObj.StoryCMD,thingObj.EquipByWho,thingObj.EquipVision,thingObj.FengshuiActiveState,thingObj.JHNpcCarryIndex,
	thingObj.LingPower,thingObj.YouPower,thingObj.DaoPower,thingObj.TaskFlag,thingObj.FSItemState,--thingObj.,
	--thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	thingObj.Count,thingObj.Beauty,thingObj.LingV,thingObj:GetQuality(),thingObj.Hp,
	thingObj.DynamicLing,
	thingObj.FishScale,--thingObj.,thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	
	thingObj.Author,thingObj.FromMod,thingObj:GetDesc(),thingObj:GetEquptMod(),thingObj:GetModPath(),
	thingObj.m_spell,thingObj.TexPath,--thingObj.,thingObj.,thingObj.,
	thingObj:GetName(),--thingObj.,thingObj.,thingObj.,thingObj.,
	
	thingObj.HideHUD,thingObj.IsNormalWeapon,thingObj.NeedClick,--thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	thingObj.ElementKind,thingObj.Camp,thingObj.Dir--,thingObj.,thingObj.,
	};
	local nowNum=#ThingManager.ThingsAttributeDisplayName;
	if thingObj.HelianValue~=nil then
		local lobj=thingObj.HelianValue;
		local listName=
		{
		"(合炼)定义ID:defid","(合炼)NPCID:npcid","(合炼)版本:Version","(合炼)NPC名字:npcname","(合炼)参数:sparam",
		"(合炼)激活:isactive"--,
		};
		local list=
		{
		lobj.defid,lobj.npcid,lobj.Version,lobj.npcname,lobj.sparam,
		lobj.isactive--,
		};
		local snum=0;
		for snum=1,#listName do
			ThingManager.ThingsAttributeDisplayName[nowNum+snum]=listName[snum];
			ThingManager.ThingsAttributeAttribute[nowNum+snum]=list[snum];
		end
		nowNum=nowNum+#listName;
	end
	local HorseD=thingObj:GetHorseData();
	if HorseD~=nil then
		local lobj=HorseD;
		local listName=
		{
		"(灵契)品阶:LingQiRate","(灵契)偏移X:OffsetX","(灵契)偏移Y:OffsetY","(灵契)偏移Z:OffsetZ","(灵契)比例:Scale",
		"(灵契)速度:Speed",
		"(灵契)来自种族:FromRace","(灵契)模型:Mod","(灵契)模型名:ModName","(灵契)骑乘声:RideBip"--,
		};
		local list=
		{
		lobj.HRate,lobj.OffsetX,lobj.OffsetY,lobj.OffsetZ,lobj.Scale,
		lobj.Speed,
		lobj.FromRace,lobj.Mod,lobj.ModName,lobj.RideBip--,
		};
		local snum=0;
		for snum=1,#listName do
			ThingManager.ThingsAttributeDisplayName[nowNum+snum]=listName[snum];
			ThingManager.ThingsAttributeAttribute[nowNum+snum]=list[snum];
		end
		nowNum=nowNum+#listName;
		--print(tostring(nowNum));
	end
	--print(tostring(nowNum));
	thingObj:GetCapeData();
	if thingObj.CapeData~= nil then
		local lobj=thingObj.CapeData;
		local listName=
		{
		"(披风)飘荡X:FlowMoveX","(披风)飘荡Y:FlowMoveY","(披风)飘荡程度:FlowRot",
		
		"(披风)颜色红:ColorR","(披风)颜色绿:ColorG","(披风)颜色蓝:ColorB","(披风)飘荡颜色:FlowColor","(披风)飘荡纹理:FlowTexture",
		"(披风)主要纹理:MainTexture","(披风)表面纹理:MaskTexture","(披风)垫子:Mat"--,
		};
		local list=
		{
		lobj.FlowMoveX,lobj.FlowMoveY,lobj.FlowRot,
		lobj.ColorR,lobj.ColorG,lobj.ColorB,lobj.FlowColor,lobj.FlowTexture,
		lobj.MainTexture,lobj.MaskTexture,lobj.Mat--,
		
		};
		local snum=0;
		for snum=1,#listName do
			ThingManager.ThingsAttributeDisplayName[nowNum+snum]=listName[snum];
			ThingManager.ThingsAttributeAttribute[nowNum+snum]=list[snum];
		end
		nowNum=nowNum+#listName;
		--print(tostring(nowNum));
	end
	if thingObj.def~=nil and ThingManager.CheckBox2.selected then
		local lobj=thingObj.def;
		local listName=
		{
		"(Xml)美观:Beauty","(Xml)锁光:BlockLight","(Xml)绑定投射物:BlockMissile","(Xml)投影:CastShadow","(Xml)无效:Disable",
		"(Xml)去污:FilthLeaving","(Xml)框架状态:FrameStep","(Xml)可成长:GrowAble","(Xml)保持模型颜色:KeepModelColor","(Xml)最大灵气:LingMax",
		"(Xml)最小灵气:LingMin","(Xml)最大耐久:MaxHitPoints","(Xml)最大堆叠:MaxStack","(Xml)模型大小:ModScale","(Xml)无元素:NoElementKind",
		"(Xml)品阶:Rate","(Xml)可选中:SelectAble","(Xml)贴图大小:TexScale","(Xml)瓦片贴图号:TileID","(Xml)使用耐久:UseHitPoints",
		"(Xml)视野范围:VisionRadius","(Xml)可视:VisualAble",--"(Xml):","(Xml):","(Xml):",
		
		"(Xml)绑定词条:BindModifier","(Xml)绑定天气:BindWeather","(Xml)类名:ClassName","(Xml)颜色字:ColorTxt","(Xml)描述:Desc",
		"(Xml)法宝贴图:FabaoTexPath","(Xml)来自MOD:FromMod","(Xml)模型路径:ModPath","(Xml)父类:Parent","(Xml)贴图路径:TexPath",
		--"(Xml):","(Xml):","(Xml):","(Xml):","(Xml):",
		
		"(Xml)碰撞体种类:ColliderKind","(Xml)元素类型:ElementKind","(Xml)物品类型:Type"--,"(Xml):","(Xml):"
		};
		local list=
		{
		lobj.Beauty,lobj.BlockLight,lobj.BlockMissile,lobj.CastShadow,lobj.Disable,
		lobj.FilthLeaving,lobj.FrameStep,lobj.GrowAble,lobj.KeepModelColor,lobj.LingMax,
		lobj.LingMin,lobj.MaxHitPoints,lobj.MaxStack,lobj.ModScale,lobj.NoElementKind,
		lobj.Rate,lobj.SelectAble,lobj.TexScale,lobj.TileID,lobj.UseHitPoints,
		lobj.VisionRadius,lobj.VisualAble,--lobj.,lobj.,lobj.,
		
		lobj.BindModifier,lobj.BindWeather,lobj.ClassName,lobj.ColorTxt,lobj.Desc,
		lobj.FabaoTexPath,lobj.FromMod,lobj.ModPath,lobj.Parent,lobj.TexPath,
		--lobj.,lobj.,lobj.,lobj.,lobj.,
		
		lobj.ColliderKind,lobj.ElementKind,lobj.Type--,lobj.,lobj.,
		};
		local snum=0;
		for snum=1,#listName do
			ThingManager.ThingsAttributeDisplayName[nowNum+snum]=listName[snum];
			ThingManager.ThingsAttributeAttribute[nowNum+snum]=list[snum];
		end
		nowNum=nowNum+#listName;
		local lobjl=lobj.Ling;
		if lobjl~=nil then
		
			local listNamel=
			{
			"(Xml)聚灵:AddionLing","(Xml)聚灵范围:AddionRadius","(Xml)AddionFailing","(Xml)AddionFailRadius","(Xml)Attenuation",
			"(Xml)Absorption","(Xml)Accommodate","(Xml)LingSource","(Xml)LingNum","(Xml)LvUpNeedLing",
			
			
			
			};
			local listl=
			{
			lobjl.AddionLing,lobjl.AddionRadius,lobjl.AddionFailing,lobjl.AddionFailRadius,lobjl.Attenuation,
			lobjl.Absorption,lobjl.Accommodate,lobjl.LingSource,lobjl.LingNum,lobjl.LvUpNeedLing,
			};
			local snuml=0;
			for snuml=1,#listNamel do
				ThingManager.ThingsAttributeDisplayName[nowNum+snuml]=listNamel[snuml];
				ThingManager.ThingsAttributeAttribute[nowNum+snuml]=listl[snuml];
			end
			nowNum=nowNum+#listNamel;
		end
	end
	--print(nowNum);
	ThingManager.ThingsAttributeNameTrue={};
	local num = 1;
	local z=0;
	for z=1,#ThingManager.ThingsAttributeDisplayName do
		ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(ThingManager.ThingsAttributeDisplayName[num]),"");
		ThingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(ThingManager.ThingsAttributeAttribute[num]),"");
		ThingManager.ThingsAttributeNameTrue[num] = tostring(ThingManager.ThingsAttributeAttribute[num]);
		ThingManager.OldThingsAttributeNameTrue[num]=ThingManager.ThingsAttributeNameTrue[num];
		num = num + 1;
	end
end
function ThingManager:SetTrueThingAttribute(thingObj)
	if thingObj == nil then
		thingObj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	local num=0;
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.ID=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.Rate=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.CreateTime=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.NoStackFlag=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.RentFrom=lnum;
		end
	end
	---5
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.StoryCMD=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.EquipByWho=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.EquipVision=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.FengshuiActiveState=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.JHNpcCarryIndex=lnum;
		end
	end
	---10
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.LingPower=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.YouPower=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		if thingObj.DaoPower~=nil then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				thingObj.DaoPower=lnum;
			end
		--else
		--	local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		--	if lnum~=nil then
		--		thingObj:DoSoulCrystalYouPowerUp(thingObj,0,0,lnum,1, 1);
		--	end
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.TaskFlag=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.FSItemState=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj:ChangeCount(lnum,true);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj:ChangeBeauty(lnum);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnumo=tonumber(ThingManager.OldThingsAttributeNameTrue[num]);
		if lnumo==nil then
			lnumo=0;
		end
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num])-lnumo;
		if lnum~=nil then
			thingObj:AddLing(lnum, 0);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj:SetQuality(lnum);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnumo=tonumber(ThingManager.OldThingsAttributeNameTrue[num]);
		if lnumo==nil then
			lnumo=0;
		end
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num])-lnumo;
		if lnum~=nil then
			thingObj:AddHealth(lnum);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj:DynamicAddLing(lnum);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		if thingObj.FishScale~=nil then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				thingObj.FishScale=lnum;
			end
		end
	end
-----------------------------------
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.Author=nil;
		else
			thingObj.Author=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.FromMod=nil;
		else
			thingObj.FromMod=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.m_sDesc=nil;
		else
			thingObj.m_sDesc=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.m_sEqMod=nil;
		else
			thingObj.m_sEqMod=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.m_sMod=nil;
		else
			thingObj.m_sMod=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.m_spell=nil;
		else
			thingObj.m_spell=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.TexPath=nil;
		else
			thingObj.TexPath=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj:SetName("");
		else
			thingObj:SetName(lnum);
		end
	end
----------------------------------
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="1" then
			thingObj.HideHUD=true;
		else
			thingObj.HideHUD=false;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="1" then
			thingObj.IsNormalWeapon=true;
		else
			thingObj.IsNormalWeapon=false;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="1" then
			thingObj.NeedClick=true;
		else
			thingObj.NeedClick=false;
		end
	end
----------------------------------------
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			local tobj=QFWDlib.ItemsElementTypes[lnum+1];
			thingObj:SetElementKind(tobj);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			local tobj=QFWDlib.FightCamp[lnum+1];
			thingObj:SetCamp(tobj);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			local tobj=QFWDlib.ThingDir[lnum+1];
			thingObj:Rot(tobj);
		end
	end
	if thingObj.HelianValue~=nil then
		local lobj=thingObj.HelianValue;
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.defid=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.npcid=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Version=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.npcname=lnum;
			else
				lobj.npcname="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.sparam=lnum;
			else
				lobj.sparam="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum=="1" then
				lobj.isactive=true;
			else
				lobj.isactive=false;
			end
		end
	end
	if thingObj.HorseData~=nil then
		local lobj=thingObj.HorseData;
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.HRate=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.OffsetX=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.OffsetY=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.OffsetZ=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Scale=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Speed=lnum;
			end
		end
		
		---------------------------------------
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil and QFWDlib.race[lnum]~=nil then
				lobj.FromRace=QFWDlib.race[lnum];
			else
				lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil and lnum~="" and lnum~="nil" then
					lobj.FromRace=lnum;
				end
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Mod=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.ModName=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.RideBip=lnum;
			end
		end
		--print(tostring(num));
	end
	--print(tostring(num));
	if thingObj.CapeData~=nil then
		local lobj=thingObj.CapeData;
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FlowMoveX=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FlowMoveY=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FlowRot=lnum;
			end
		end
		--------------------------
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.ColorR=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.ColorG=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.ColorB=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FlowColor=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FlowTexture=lnum;
			end
		end
		------
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.MainTexture=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.MaskTexture=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tostring(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Mat=lnum;
			end
		end
		--print(tostring(num));
	end
	if thingObj.def~=nil and ThingManager.CheckBox2.selected then
		local lobj=thingObj.def;
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Beauty=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.BlockLight=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.BlockMissile=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.CastShadow=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Disable=lnum;
			end
		end
		
		
		
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FilthLeaving=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FrameStep=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.GrowAble=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.KeepModelColor=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.LingMax=lnum;
			end
		end


		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.LingMin=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.MaxHitPoints=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.MaxStack=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.ModScale=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.NoElementKind=lnum;
			end
		end

		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Rate=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.SelectAble=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.TexScale=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.TileID=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.UseHitPoints=lnum;
			end
		end

		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.VisionRadius=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.VisualAble=lnum;
			end
		end


		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.BindModifier=lnum;
			else
				lobj.BindModifier="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.BindWeather=lnum;
			else
				lobj.BindWeather="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.ClassName=lnum;
			else
				lobj.ClassName="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.ColorTxt=lnum;
			else
				lobj.ColorTxt="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.Desc=lnum;
			else
				lobj.Desc="";
			end
		end


		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.FabaoTexPath=lnum;
			else
				lobj.FabaoTexPath="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.FromMod=lnum;
			else
				lobj.FromMod="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.ModPath=lnum;
			else
				lobj.ModPath="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.Parent=lnum;
			else
				lobj.Parent="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.TexPath=lnum;
			else
				lobj.TexPath="";
			end
		end

		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				local tobj=QFWDlib.ColliderKind[lnum+1];
				thingObj:Rot(tobj);
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				local tobj=QFWDlib.ItemsElementTypes[lnum+1];
				thingObj:Rot(tobj);
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				local tobj=QFWDlib.ThingTypes[lnum+1];
				thingObj:Rot(tobj);
			end
		end
		local lobjl=lobj.Ling;
		if lobjl~=nil then
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.AddionLing=lnum;
				end
			end
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.AddionRadius=lnum;
				end
			end
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.AddionFailing=lnum;
				end
			end
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.AddionFailRadius=lnum;
				end
			end
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.Attenuation=lnum;
				end
			end

			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.Absorption=lnum;
				end
			end
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.Accommodate=lnum;
				end
			end
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.LingSource=lnum;
				end
			end
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.LingNum=lnum;
				end
			end
			num=num+1;
			if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
				local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
				if lnum~=nil then
					lobjl.LvUpNeedLing=lnum;
				end
			end

		end
	end
	--print(num)
	thingObj:OnClearDraw()
	thingObj:OnDraw(true);
end
function ThingManager:GetChooseThingFBAttribute(thingObj)
	if thingObj.IsFaBao==false then
		if thingObj.IsFabaoEmbryo then
			thingObj:ActiveFabaoEmbryo();
		end
		return false;
	end
	ThingManager.AttributeFlag =0;
	ThingManager.ShowListNum = 1;
	local FBData = thingObj.Fabao;
	if FBData==nil then
		return false;
	end
	ThingManager.ListTypes=0;
	--print(FBData.OName)
	ThingManager.ThingsAttributeDisplayName = 
	{
			--"无:None",
			--
			"回灵速度:LingRecover","灵气容量:MaxLing",
			"飞行速度:FlySpeed","转弯速度:RotSpeed","击退强度:KnockBackAddition","击退抵抗:KnockBackResistance",
			"体积:Scale","拖尾长度:TailLenght","攻击间隔(攻速):AttackRate",--,"飞行速度(移速):MoveSpeed"
			"法宝威力(基础):AttackPower",
			"天劫洗炼数:"
			
	};
	local obj=ThingManager.ThingAttributeListCOP;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">ThingManager_Tips63");
	ThingManager.ThingsAttributeNameTrue={};
	local xxx=1;
	for xxx=1 ,#QFWDlib.ItemsFBAttribute-1 do
		ThingManager.ThingsAttributeNameTrue[xxx]=tostring(FBData:GetProperty(QFWDlib.ItemsFBAttribute[xxx]));
		ThingManager.OldThingsAttributeNameTrue[xxx] = ThingManager.ThingsAttributeNameTrue[xxx];
		ThingManager:AddChildToList(obj,tostring(xxx),tostring(xxx)..": "..tostring(ThingManager.ThingsAttributeDisplayName[xxx]),"");
		ThingManager:AddChildToList(obj,"0"..tostring(xxx)," "..tostring(ThingManager.ThingsAttributeNameTrue[xxx]),"");
	end
	xxx=10;
	ThingManager.ThingsAttributeNameTrue[xxx]=tostring(FBData:GetProperty(QFWDlib.ItemsFBAttribute[xxx])/FBData:GetGodAddtion());
	ThingManager.OldThingsAttributeNameTrue[xxx] = ThingManager.ThingsAttributeNameTrue[xxx];
	ThingManager:AddChildToList(obj,tostring(xxx),tostring(xxx)..": "..tostring(ThingManager.ThingsAttributeDisplayName[xxx]),"");
	ThingManager:AddChildToList(obj,"0"..tostring(xxx)," "..tostring(ThingManager.ThingsAttributeNameTrue[xxx]),"");
	xxx=11;
	ThingManager.ThingsAttributeNameTrue[xxx]=tostring(FBData.GodCount);
	ThingManager.OldThingsAttributeNameTrue[xxx] = ThingManager.ThingsAttributeNameTrue[xxx];
	ThingManager:AddChildToList(obj,tostring(xxx),tostring(xxx)..": "..tostring(ThingManager.ThingsAttributeDisplayName[xxx]),"");
	ThingManager:AddChildToList(obj,"0"..tostring(xxx)," "..tostring(ThingManager.ThingsAttributeNameTrue[xxx]),"");

	return true;
end
function ThingManager:SetTrueThingFBAttribute(obj)
	if obj == nil then
		obj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	if obj.IsFaBao==false then
		return false;
	end
	local FBData = obj.Fabao;
	if FBData==nil then
		return false
	end
	local xxx=1;
	local numnum=0;
	for xxx=1 ,#QFWDlib.ItemsFBAttribute do
		if ThingManager.OldThingsAttributeNameTrue[xxx]~=ThingManager.ThingsAttributeNameTrue[xxx] then
			numnum=tonumber(ThingManager.ThingsAttributeNameTrue[xxx]);
			if numnum==nil then
				numnum=0;
			end
			FBData:SetProperty(QFWDlib.ItemsFBAttribute[xxx], numnum);
		end
	end
	xxx=11;
	if ThingManager.OldThingsAttributeNameTrue[xxx]~=ThingManager.ThingsAttributeNameTrue[xxx] then
		numnum=tonumber(ThingManager.ThingsAttributeNameTrue[xxx]);
		local oldnumnum=tonumber(ThingManager.OldThingsAttributeNameTrue[xxx]);
		--print(numnum,oldnumnum,xxx)
		if numnum==nil then
			numnum=0;
		end
		FBData:AddGodCount(numnum - oldnumnum);
	end
	--obj:Draw();
end
function ThingManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function ThingManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function ThingManager:AddChildToList(tobj,name,value,icon)
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
function ThingManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(ThingManager.ListChildOnClick);
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
function ThingManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(ThingManager.ListChildOnClick2);
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
function ThingManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	ThingManager.TheClickBnt = tonumber(Eventss.data.name);
	ThingManager:SetSetting();
	
end
function ThingManager:SetSetting()
	local obj=nil;
	local types=ThingManager.listtypes;
	if types==nil or types==0 then
		obj=ThingManager.inputid1;
	else
		obj=ThingManager.input8;
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(ThingManager.TheClickBnt);
		ThingManager:ChooseThingNumAndGetAttribute(ThingManager.TheClickBnt);
		if ThingManager.CheckBox1.selected then
			ThingManager:ChooseThingShow();
		end
		ThingManager.ShowLableThing.text = QFLanguage.GetText(">ThingManager_ShowLableNpc")..": "..tostring(ThingManager.MapThings[ThingManager.ChooseThingNum].def.ThingName);
	else
		obj.m_title.text=tostring(ThingManager.TheClickBnt);
	end
		--ThingManager:ChooseThingNumAndGetAttribute(ThingManager.TheClickBnt);
end
function ThingManager:SetSetting2()
	local obj=nil;
	local types=ThingManager.ListTypes;
	if types==nil or ThingManager.ListTypes==0 then
		obj=ThingManager.input1;
	else
		obj=ThingManager.input3;
	end
	obj.m_title.text=tostring(ThingManager.TheClickBnt);

end
function ThingManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	ThingManager.TheClickBnt = tonumber(Eventss.data.name);
	ThingManager:SetSetting2();
	
end
function ThingManager:TongLingAndSuTi()
	if ThingManager:TongLing(true) then
		ThingManager:SuTi();
		return true;
	end
	return false;
end
function ThingManager:TongLing(auto)
	local obj=ThingManager.MapThings[ThingManager.ChooseThingNum];
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
function ThingManager:SuTi()
	local obj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	local TMgr = CS.XiaWorld.TongLingMgr.Instance;
	if obj==nil or TMgr==nil then
		return false;
	end
	if obj.JGBack==1 then
		obj.JGBack=0;
		ThingManager:TongLing();
	end
	TMgr:ZaoHuaSuTi(obj.ID);
	return true;
end
