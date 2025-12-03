local AddManager = CS.Wnd_Simple.CreateWindow("AddManager");
local Nowkey=ModifierMain:AddWindow("AddManager",AddManager);
function AddManager.WndOnHotKey()
	if QFForeInte~=nil and QFForeInte.GetKeyDownKeyStr~=nil then
		if QFForeInte.GetKeyForeverDownStr("mouse 0") and QFForeInte.GetKeyDownKeyStr("5") then
			if AddManager.isShowing then
				AddManager:Hide();
			else
				AddManager:Show();
			end
		end
	end
end
function AddManager:OnInit()
	self.listType=0;
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">AddManager_Title"));
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AddManager_Tips1"),self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);

	self.TheClickBnt=1;
	
	self.ChooseThingNum = 1;
	self.ThingsAttributeCount=38;
	QFWDModifierMainUI:AddLable2(self,"lableT1",QFLanguage.GetText(">AddManager_lableT1"),self.sx/10,self.sy/10*1.5,200,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"inputT1","1",self.sx/10*1.8,self.sy/10*1.6);
	self.inputid1:SetSize(self.sx/10*3, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lableT2",QFLanguage.GetText(">AddManager_lableT2"),self.sx/10,self.sy/10*2,200,35);
	self.inputid2 = QFWDModifierMainUI:AddInput2(self,"inputT2","1",self.sx/10*1.8,self.sy/10*2.1);
	self.inputid2:SetSize(50, 20, false);
	self.inputid2.m_title.restrict = "[0-9]";
	self.inputid2.m_title.maxLength = 5;
	self.ShowLableThing = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc",QFLanguage.GetText(">AddManager_Tips2")..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10*6.2,self.sy/10,300,35);
	QFWDModifierMainUI:AddButton2(self,"bntChooseThing",QFLanguage.GetText(">AddManager_bntChooseThing"),self.sx/10*3,self.sy/10*2.1):SetSize(self.sx/10*0.8, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddThing",QFLanguage.GetText(">AddManager_bntAddThing"),self.sx/10*4,self.sy/10*2.1):SetSize(self.sx/10*0.8, 20, false);
	self.CheckBox = self:AddCheckBox("ChooseAutoCarry",QFLanguage.GetText(">AddManager_ChooseAutoCarry"),self.sx/10*5.2,self.sy/10*2.1);
	self.CheckBox.selected = true;
	self.CheckBox1 = self:AddCheckBox("ChooseAutoSP",QFLanguage.GetText(">AddManager_ChooseAutoSP"),self.sx/10*5.2,self.sy/10*1.6);
	self.CheckBox1.selected = false;
	self.CheckBox2 = self:AddCheckBox("ChooseAutoZW",QFLanguage.GetText(">AddManager_ChooseAutoZW"),self.sx/10*6.5,self.sy/10*1.6);
	self.CheckBox2.selected = false;
	self.CheckBox3 = self:AddCheckBox("bntMSearch",QFLanguage.GetText(">AddManager_bntMSearch"),self.sx/10*6.5,self.sy/10*2.1);
	self.CheckBox3.selected = true;
	
	local ky = 3;

	--QFWDModifierMainUI:AddButton2(self,"bntListThingBaseAttribute","显示基础属性",self.sx/10,self.sy/10*7):SetSize(self.sx/10*1.2, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"bntListThingBntAttribute","显示按钮属性",self.sx/10*2,self.sy/10*7):SetSize(self.sx/10*1.2, 25, false);
	--ky=3;
	QFWDModifierMainUI:AddLable2(self,"ShowLableGong",QFLanguage.GetText(">AddManager_Tips4"),self.sx/10*3,self.sy/10*ky,self.sx/10*5.6,35);
	QFWDModifierMainUI:AddLable2(self,"lable5",QFLanguage.GetText(">AddManager_lable5"),self.sx/10,self.sy/10*ky,self.sx/10*3,35);
	self.input5 = QFWDModifierMainUI:AddInput2(self,"input5","0",self.sx/10*1.8,self.sy/10*(ky+0.1));
	self.input5:SetSize(self.sx/10*1.1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowThingGong",QFLanguage.GetText(">AddManager_bntShowThingGong"),self.sx/10*8.5,self.sy/10*(ky+0.1)):SetSize(self.sx/10*1.1, 20, false);

	ky=ky+1;
	QFWDModifierMainUI:AddLable2(self,"ShowLableGong",QFLanguage.GetText(">AddManager_Tips5"),self.sx/10*3,self.sy/10*ky,self.sx/10*5.6,35);
	QFWDModifierMainUI:AddLable2(self,"lable6",QFLanguage.GetText(">AddManager_lable6"),self.sx/10,self.sy/10*ky,self.sx/10*3,35);
	self.input6 = QFWDModifierMainUI:AddInput2(self,"input6","0",self.sx/10*1.8,self.sy/10*(ky+0.1));
	self.input6:SetSize(self.sx/10*1.1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowThingEsoterica",QFLanguage.GetText(">AddManager_bntShowThingEsoterica"),self.sx/10*8.5,self.sy/10*(ky+0.1)):SetSize(self.sx/10*1.1, 20, false);

	ky=ky+1;
	QFWDModifierMainUI:AddLable2(self,"lablet7",QFLanguage.GetText(">AddManager_Tips6"),self.sx/10*3,self.sy/10*ky,self.sx/10*5.6,35);
	QFWDModifierMainUI:AddLable2(self,"lable7",QFLanguage.GetText(">AddManager_lable7"),self.sx/10,self.sy/10*ky,self.sx/10*3,35);
	self.input7 = QFWDModifierMainUI:AddInput2(self,"input7","0",self.sx/10*1.8,self.sy/10*(ky+0.1));
	self.input7:SetSize(self.sx/10*1.1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowThingSpell",QFLanguage.GetText(">AddManager_bntShowThingSpell"),self.sx/10*8.5,self.sy/10*(ky+0.1)):SetSize(self.sx/10*1.1, 20, false);
	ky = ky+1;
	QFWDModifierMainUI:AddLable2(self,"lableFB1",QFLanguage.GetText(">AddManager_lableFB1"),self.sx/10,self.sy/10*ky,200,35);
	self.inputFB1 = QFWDModifierMainUI:AddInput2(self,"inputFB1","清风牌物品",self.sx/10*1.8,self.sy/10*(ky+0.1));
	self.inputFB1:SetSize(120, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lableFB0",QFLanguage.GetText(">AddManager_lableFB0"),self.sx/10*4.1,self.sy/10*ky,200,35);
	self.inputFB0 = QFWDModifierMainUI:AddInput2(self,"inputFB2","1",self.sx/10*4.6,self.sy/10*(ky+0.1));
	self.inputFB0:SetSize(self.sx/10*0.6, 20, false);
	self.inputFB0.m_title.restrict = "[0-9]";
	QFWDModifierMainUI:AddLable2(self,"lableFB2",QFLanguage.GetText(">AddManager_lableFB2"),self.sx/10*5.2,self.sy/10*ky,200,35);
	self.inputFB2 = QFWDModifierMainUI:AddInput2(self,"inputFB2","12",self.sx/10*5.7,self.sy/10*(ky+0.1));
	self.inputFB2:SetSize(self.sx/10*0.6, 20, false);
	self.inputFB2.m_title.restrict = "[0-9]";
	self.inputFB2.m_title.maxLength = 2;

	QFWDModifierMainUI:AddLable2(self,"lableFB4",QFLanguage.GetText(">AddManager_lableFB4"),self.sx/10*6.3,self.sy/10*ky,200,35);
	self.inputFB4 = QFWDModifierMainUI:AddInput2(self,"inputFB4","14",self.sx/10*6.8,self.sy/10*(ky+0.1));
	self.inputFB4:SetSize(self.sx/10*0.6, 20, false);
	self.inputFB4.m_title.restrict = "[0-9]";
	self.inputFB4.m_title.maxLength = 2;
	
	QFWDModifierMainUI:AddLable2(self,"lableFB3",QFLanguage.GetText(">AddManager_lableFB3"),self.sx/10*7.4,self.sy/10*ky,200,35);
	self.inputFB3 = QFWDModifierMainUI:AddInput2(self,"inputFB3","1",self.sx/10*7.9,self.sy/10*(ky+0.1));
	self.inputFB3:SetSize(self.sx/10*0.6, 20, false);
	self.inputFB3.m_title.restrict = "[0-9]";
	self.inputFB3.m_title.maxLength = 6;
	QFWDModifierMainUI:AddLable2(self,"lableFB5",QFLanguage.GetText(">AddManager_lableFB5"),self.sx/10*8.5,self.sy/10*ky,200,35);
	self.inputFB5 = QFWDModifierMainUI:AddInput2(self,"inputFB5","12",self.sx/10*9,self.sy/10*(ky+0.1));
	self.inputFB5:SetSize(self.sx/10*0.6, 20, false);
	self.inputFB5.m_title.restrict = "[0-9]";
	self.inputFB5.m_title.maxLength = 6;
	-- QFWDModifierMainUI:AddLable2(self,"lableFB4","傀儡移速:",self.sx/10*4,self.sy/10*ky,200,35);
	-- self.inputFB4 = QFWDModifierMainUI:AddInput2(self,"inputFB4","66",self.sx/10*4.8,self.sy/10*ky);
	-- self.inputFB4:SetSize(120, 25, false);
	-- self.inputFB4.m_title.restrict = "[0-9]";
	-- self.inputFB4.m_title.maxLength = 4;
	-- QFWDModifierMainUI:AddButton2(self,"bntAddPuppet","添加傀儡",self.sx/10*8,self.sy/10*(ky - 0.25)):SetSize(self.sx/10*1.2, 25, false);
	ky = ky + 0.5;
	self.CheckBoxfb1 = self:AddCheckBox("IsFB",QFLanguage.GetText(">AddManager_IsFB"),self.sx/10,self.sy/10*ky);
	self.CheckBoxfb1.selected = false;
	-- self.CheckBoxfb2 = self:AddCheckBox("IsFightFB","战斗法宝",self.sx/10*2.5,self.sy/10*ky);
	-- self.CheckBoxfb2.selected = true;
	self.CheckBoxfb3 = self:AddCheckBox("IsFightFBO",QFLanguage.GetText(">AddManager_IsFightFBO"),self.sx/10*3,self.sy/10*ky);
	self.CheckBoxfb3.selected = false;
	self.CheckBoxfb4 = self:AddCheckBox("IsFightGodFB",QFLanguage.GetText(">AddManager_IsFightGodFB"),self.sx/10*4.5,self.sy/10*ky);
	self.CheckBoxfb4.selected = false;
	QFWDModifierMainUI:AddLable2(self,"ShowLableFBTypes",QFLanguage.GetText(">AddManager_Tips7"),self.sx/10,self.sy/10*(ky+0.5),self.sx*0.8,35);
	
	
	ky=ky+1.5;
	QFWDModifierMainUI:AddLable2(self,"lableP1",QFLanguage.GetText(">AddManager_lableP1"),self.sx/10,self.sy/10*ky,200,35);
	self.inputp1 = QFWDModifierMainUI:AddInput2(self,"inputp1","清风牌傀儡",self.sx/10*1.8,self.sy/10*(ky+0.1));
	self.inputp1:SetSize(120, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lableP2",QFLanguage.GetText(">AddManager_lableP2"),self.sx/10*4,self.sy/10*ky,200,35);
	self.inputp2 = QFWDModifierMainUI:AddInput2(self,"inputp2","6",self.sx/10*4.8,self.sy/10*(ky+0.1));
	self.inputp2:SetSize(120, 20, false);
	self.inputp2.m_title.restrict = "[0-9]";
	self.inputp2.m_title.maxLength = 3;
	ky = ky + 0.5;
	QFWDModifierMainUI:AddLable2(self,"lableP3",QFLanguage.GetText(">AddManager_lableP3"),self.sx/10,self.sy/10*ky,200,35);
	self.inputp3 = QFWDModifierMainUI:AddInput2(self,"inputp3","666666",self.sx/10*1.8,self.sy/10*(ky+0.1));
	self.inputp3:SetSize(120, 20, false);
	self.inputp3.m_title.restrict = "[0-9]";
	self.inputp3.m_title.maxLength = 8;
	QFWDModifierMainUI:AddLable2(self,"lableP4",QFLanguage.GetText(">AddManager_lableP4"),self.sx/10*4,self.sy/10*ky,200,35);
	self.inputp4 = QFWDModifierMainUI:AddInput2(self,"inputp4","66",self.sx/10*4.8,self.sy/10*(ky+0.1));
	self.inputp4:SetSize(120, 20, false);
	self.inputp4.m_title.restrict = "[0-9]";
	self.inputp4.m_title.maxLength = 4;
	QFWDModifierMainUI:AddButton2(self,"bntAddPuppet",QFLanguage.GetText(">AddManager_bntAddPuppet"),self.sx/10*8.5,self.sy/10*(ky - 0.15)):SetSize(self.sx/10*1, 20, false);

	self.ThingListCOP = self:AddCOP("ThingList",-self.sx/10*4.15,self.sy/10*0.7,2);
	self.ThingAttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*9.85,self.sy/10*0.7,1);
	
	--QFWDModifierMainUI:AddLable2(self,"plable1","添加的坐标:",self.sx/10*8,self.sy/10*1,200,35);
	QFWDModifierMainUI:AddLable2(self,"lablex",QFLanguage.GetText(">AddManager_lablex"),self.sx/10*8,self.sy/10*1.5,200,35);
	self.input111 = QFWDModifierMainUI:AddInput2(self,"input11","80",self.sx/10*8.8,self.sy/10*1.6);
	self.input111:SetSize(self.sx/10*0.8, 20, false);
	self.input111.m_title.restrict = "[0-9]";
	self.input111.m_title.maxLength = 3;
	QFWDModifierMainUI:AddLable2(self,"labley",QFLanguage.GetText(">AddManager_labley"),self.sx/10*8,self.sy/10*2,200,35);
	self.input211 = QFWDModifierMainUI:AddInput2(self,"input21","80",self.sx/10*8.8,self.sy/10*2.1);
	self.input211:SetSize(self.sx/10*0.8, 20, false);
	self.input211.m_title.restrict = "[0-9]";
	self.input211.m_title.maxLength = 3;
	QFWDModifierMainUI:AddButton2(self,"bntCheakKey",QFLanguage.GetText(">AddManager_bntCheakKey"),self.sx/10*8,self.sy/10*2.5):SetSize(self.sx/10*0.6, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntAutoKey",QFLanguage.GetText(">AddManager_bntAutoKey"),self.sx/10*9,self.sy/10*2.5):SetSize(self.sx/10*0.6, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"bntUpdataThingList","刷新列表",-self.sx/10*1.3,self.sy/10*8.65):SetSize(self.sx/10*1.2, 25, false);
	-- QFWDModifierMainUI:AddButton2(self,"bntUpdataAllNpcList","NPC列表",-self.sx/10*2.65,self.sy/10*8.65):SetSize(self.sx/10*1.2, 25, false);
	-- QFWDModifierMainUI:AddButton2(self,"bntListBuff","AllMF",-self.sx/10*4,self.sy/10*8.65):SetSize(self.sx/10*0.6, 25, false);
	-- QFWDModifierMainUI:AddButton2(self,"bntListFeature","AllFT",-self.sx/10*3.45,self.sy/10*8.65):SetSize(self.sx/10*0.6, 25, false);
	self.chooseNpcNum = 0;
	
	self.listtypes=0;
	self.listtypes2=0;
	self.ShowPage=1;
	self.AllPage=1;
	
	QFWDModifierMainUI:AddButton2(self,"bntAllThing",QFLanguage.GetText(">AddManager_bntAllThing"),-self.sx/10*0.9,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSearchThing",QFLanguage.GetText(">AddManager_bntSearchThing"),-self.sx/10*1.8,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch",QFLanguage.GetText(">AddManager_inputSearch"),-self.sx/10*4,self.sy/10*9);
	self.inputSearch:SetSize(self.sx/10*2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSearch2Thing",QFLanguage.GetText(">AddManager_bntSearchThing"),self.sx/10*13,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	self.inputSearch2 = QFWDModifierMainUI:AddInput2(self,"inputSearch2",QFLanguage.GetText(">AddManager_inputSearch"),self.sx/10*10,self.sy/10*9);
	self.inputSearch2:SetSize(self.sx/10*2.7, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntPageUp","<",-self.sx/10*3.85,self.sy/10*0.9,nil,nil,QFLanguage.GetText(">AddManager_bntPageUp")):SetSize(self.sx/10*0.3, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntPageDown",">",-self.sx/10*0.58,self.sy/10*0.9,nil,nil,QFLanguage.GetText(">AddManager_bntPageDown")):SetSize(self.sx/10*0.3, 25, false);
	
	self.ChooseThingName=nil;
	self:AddManagerIn();
	QFWDlib.OnInit();
	self.window:Center();
end

function AddManager:OnShowUpdate()
	
end

function AddManager:OnShown()
	if showalone == nil or showalone == 0 then
		local Key = CS.UI_WorldLayer.Instance.MouseGridKey;
		local position=AddManager:GetXY(Key);
		AddManager.input111.m_title.text=tostring(position.x);
		AddManager.input211.m_title.text=tostring(position.y);
	end
	AddManager.isShowing = true
end
function AddManager:GetXY(key)
	local position={};
	position.y = math.floor(key/Map.Size);
	position.x=key%Map.Size;
	return position;
end
function AddManager:SetXY(x,y)
	AddManager.input111.m_title.text=tostring(x);
	AddManager.input211.m_title.text=tostring(y);
end
function AddManager:OnUpdate()

end

function AddManager:OnHide()
	AddManager.isShowing = false;
	showalone = 0;
	ModifierMain.showWindow=0;

end

function AddManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then

		if obj.name == "bntCheakKey" then
			local mapKey=AddManager:GetKey(tonumber(AddManager.input111.m_title.text),tonumber(AddManager.input211.m_title.text));
			if AddManager:CheckKey(mapKey,-1) then
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips8");
				
			else
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips9");
			end
			return;
		end
		if obj.name == "bntAutoKey" then
			if AddManager:AutoKey() then
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips9");
			else
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips10");
			end
			return;
		end
		if obj.name == "bntUpdataThingList" then
			AddManager:GetAllThingInMap();
			return;
		end
		if obj.name == "bntChooseThing" then
			local num=tonumber(AddManager.inputid1.m_title.text);
			if num == nil then
				num=1;
			end
			AddManager:ChooseThingNumAndGetAttribute(num);
			AddManager.ShowLableThing.text = QFLanguage.GetText(">AddManager_Tips2").." "..tostring(AddManager.ChooseThingNumName);
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips11");
			return;
		end
		if obj.name == "bntAddThing" then
			if AddManager:AddThing() then
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips12");
			else
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips13");
			end
			return;
		end
		if obj.name == "bntShowThingGong" then
			AddManager:ShowAllGongName(AddManager.ThingAttributeListCOP);
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips14");
			return;
		end
		if obj.name == "bntShowThingEsoterica" then
			AddManager:ShowAllEsotericaName(AddManager.ThingAttributeListCOP);
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips15");
			return;
		end
		if obj.name == "bntShowThingSpell" then
			AddManager:ShowAllSpellName(AddManager.ThingAttributeListCOP);
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips16");
			return;
		end
		if obj.name == "bntAddPuppet" then
			AddManager:AddAPuppet(AddManager.inputp1.m_title.text,tonumber(AddManager.inputp2.m_title.text),tonumber(AddManager.inputp3.m_title.text),tonumber(AddManager.inputp4.m_title.text));
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips17");
			return;
		end
		
		
		if obj.name == "bntSet" then
			local num=tonumber(AddManager.input1.m_title.text);
			if num == nil then
				num=1;
			end
			AddManager:SetThingAttributeByNum(AddManager.input2.m_title.text,num);
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips18");
			return;
		end
		if obj.name == "bntListThingBaseAttribute" then
			AddManager:UpdateThingAttributeUseHaveData(nil);
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips19");
			return;
		end
		
		
		if obj.name == "bntSearchThing" then
			local name=AddManager.inputSearch.m_title.text;
			if AddManager:SearchDisplayName(name) then
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips20");
			else
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips21");
			end
			
			return;
		end
		if obj.name == "bntSearch2Thing" then
			local name=AddManager.inputSearch2.m_title.text;
			if AddManager:SearchDisplayName2(name) then
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips20");
			else
				AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips21");
			end
			
			return;
		end
		if obj.name == "bntAllThing" then
			--local name=AddManager.inputSearch.m_title.text;
			AddManager:ShowAllThingName(AddManager.ThingListCOP);
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips22");
			return;
		end
		
		if obj.name == "bntYesSetNpc" then
			AddManager:SetTrueThingAttribute();
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips23");
			return;
		end
		if obj.name == "bntPageUp" then
			AddManager:ShowAllThingNameUP();
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_bntPageUp").."!"
			return;
		end
		if obj.name == "bntPageDown" then
			AddManager:ShowAllThingNameDown();
			AddManager.ShowLable.text = QFLanguage.GetText(">AddManager_bntPageDown").."!"
			return;
		end
	end
	
	
end

function AddManager:AutoKey(keys)
	local x = nil;
	local y = nil;
	local key = nil;
	if keys~=nil then
		local position = AddManager:GetXY(keys);
		x=position.x;
		y=position.y;
	else
		x = tonumber(AddManager.input111.m_title.text);
		y = tonumber(AddManager.input211.m_title.text);
	end
	key = AddManager:GetKey(x,y);
	if AddManager:CheckKey(key,-1) then
		return key
	end
	local mapSize= Map.Size;
	local range = 1;
	local jc=0;
	local nowX = x;
	local nowY = y;
	local types = 1;--1向右，2向上，3.向左，4向下
	while true do
		if types==1 then
			nowX = nowX+1;
			jc = jc+1;
			if nowX >= mapSize-1 then
				types = 3;
				nowY = nowY + range;
				range = range + 1;
				jc = range - jc -1;
			else
				if jc >= range then
					jc = 0;
					types = types+1;
					if types>4 then
						types=1;
					end
				end
			end
		elseif types==2 then
			nowY = nowY+1;
			jc = jc+1;
			if nowY >= mapSize-1 then
				types = 4;
				range = range + 1;
				nowX = nowX - range;
				jc = range - jc -1;
			else
				if jc>=range then
					jc=0;
					types = types+1;
					range = range+1;
					if types>4 then
						types=1;
					end
				end
			end
		elseif types==3 then
			nowX = nowX - 1;
			jc = jc + 1;
			if nowX <= 0 then
				types = 1;
				nowY = nowY - range;
				range = range + 1;
				jc = range - jc -1;
			else
				if jc >= range then
					jc = 0;
					types = types+1;
					if types>4 then
						types=1;
					end
				end
			end
		else
			nowY = nowY-1;
			jc = jc + 1;
			if nowY <= 0 then
				types = 2;
				range = range + 1;
				nowX = nowX + range;
				jc = range - jc - 1;
			else
				if jc>=range then
					jc=0;
					types = types+1;
					range = range+1;
					if types>4 then
						types=1;
					end
				end
			end
		end
		key = AddManager:GetKey(nowX,nowY);
		if AddManager:CheckKey(key,-1) then
			if keys ~= nil then
				return key;
			else
				AddManager.input111.m_title.text=tostring(nowX);
				AddManager.input211.m_title.text=tostring(nowY);
				return true;
			end
		else
			if range>=mapSize then
				break;
			end
		end
	end
	return false;
end
function AddManager:CheckKey(mapKey,types)
	if types==-1 then
		local kkkk=1;
		for kkkk=3,5 do
			--print(kkkk);
			if Map.Things:GetThingAtGrid(mapKey,QFWDlib.ThingTypes[kkkk])~=nil then
				return false
			end
		end
		return true;
	elseif types<0 then
		local kkkk=1;
		for kkkk=2,7 do
			--print(kkkk);
			if Map.Things:GetThingAtGrid(mapKey,QFWDlib.ThingTypes[kkkk])~=nil then
				return false
			end
		end
		return true;
	else
		local thingType = QFWDlib.ThingTypes[types];
		local thing = Map.Things:GetThingAtGrid(mapKey,thingType);
		if thing==nil then
			return true;
		else
			return false;
		end
	end
end
function AddManager:GetKey(x,y)
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
function AddManager:AddManagerIn()
	local list = QFWDlib.AllThingItems;
	if list==nil then
		list={};
		-- print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">AddManager_Tips26"))
		-- return;
	end
	local _,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2);
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		local thingDef = localValue;
		if thingDef ~= nil and thingDef.Name~=nil then
			QFWDlib.AllThingItemsTrue[num] = thingDef.Name;
			if thingDef.ThingName ~= nil then
				QFWDlib.AllThingItemsTrueDisplayName[num] = thingDef.ThingName;
				--print(thingDef.ThingName);
			end
			num = num + 1;
		end
	end
	
	if MapListDef==nil then
		local lll=1;
		local add=1;
		for localKey, localValue in pairs(list) do 
			local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, localValue);
			if thingDef ~= nil then
				lll=1;
				add=1;
				for lll=1,#QFWDlib.AllThingItemsTrue do
					if QFWDlib.AllThingItemsTrue[lll]==localValue then
						add=0;
						break;
					end
				end
				if add==1 then
					QFWDlib.AllThingItemsTrue[num] = localValue;
					if thingDef.ThingName ~= nil then
						QFWDlib.AllThingItemsTrueDisplayName[num] = thingDef.ThingName;
						--print(thingDef.ThingName);
					end
					num = num + 1;
				end
			end
		end
	end

	num=tonumber(AddManager.inputid1.m_title.text);
	if num == nil then
		num=1;
	end
	AddManager:ChooseThingNumAndGetAttribute(num);
	AddManager.ShowLableThing.text = QFLanguage.GetText(">AddManager_Tips2").." "..tostring(AddManager.ChooseThingNumName);
	
	list = PracticeMgr:GetAllGongName();
	num=1;
	local gong = nil;
	for localKey, localValue in pairs(list) do 
		gong = PracticeMgr:GetGongDef(localValue);
		if gong.Name ~= "Gong_LOST" then
			QFWDlib.ThingItemGongTrue[num] = localValue;
			if gong.DisplayName~=nil then
				QFWDlib.ThingItemGongTrueDisplayName[num] = gong.DisplayName;
			end
			
			num=num+1
		end
	end
	if CS.XiaWorld~=nil and CS.XiaWorld.SchoolGlobleMgr and CS.XiaWorld.SchoolGlobleMgr.Instance~=nil and PracticeMgr.RGongMgr~=nil then
		--print("MOD版修改器:true")
		local numnum,z=1,0;
		local GlobleSchools={};
		local sg=CS.XiaWorld.SchoolGlobleMgr.Instance;
		local list = sg.SettingSchoolIds;
		--local ls=CS.XiaWorld.SchoolMgr.Instance;
		--if ls.
		local schoolData=nil;
		if list~=nil then
			for localKey, localValue in pairs(list) do 
				if localValue~=nil then
					schoolData=sg:GetSchoolData(localValue);
					if schoolData~= nil and schoolData.ID~=nil then
						GlobleSchools[numnum] = schoolData.ID;
						--print(GlobleSchools[numnum])
						numnum=numnum+1;
					end
				end
			end
		else
			for z=1,500 do
				schoolData=sg:GetSchoolData(z);
				if schoolData~= nil and schoolData.ID~=nil then
					GlobleSchools[numnum] = schoolData.ID;
					--print(GlobleSchools[numnum])
					numnum=numnum+1;
					
				end
			end
		end
		local rg=PracticeMgr.RGongMgr;
		for numnum=1,#GlobleSchools do
			list = rg:GetSchoolGongs(GlobleSchools[numnum]);
			if list~=nil and list~={} then
				for localKey, localValue in pairs(list) do 
					gong = rg:GetGongDef(localValue);
					if gong~=nil and gong.Name ~= "Gong_LOST" then
						QFWDlib.ThingItemGongTrue[num] = localValue;
						if gong.DisplayName~=nil then
							QFWDlib.ThingItemGongTrueDisplayName[num] = gong.DisplayName;
						end
						
						num=num+1
					end
				end
			end
		end
	end
	-- -- list = QFWDlib.ThingItemGong;
	-- -- num=1;
	-- -- local gong = nil;
	-- -- for localKey, localValue in pairs(list) do 
		-- -- gong = PracticeMgr:GetGongDef(localValue);
		-- -- if gong.Name ~= "Gong_LOST" then
			-- -- QFWDlib.ThingItemGongTrue[num] = QFWDlib.ThingItemGong[localKey];
			-- -- if gong.DisplayName~=nil then
				-- -- QFWDlib.ThingItemGongTrueDisplayName[num] = gong.DisplayName;
			-- -- end
			
			-- -- num=num+1
		-- -- end
	-- -- end
	-- -- local gongName= "Gong_LOST";
	-- -- for z=1,12 do
		-- -- gongName= "God_Gong_"..tostring(z);
		-- -- gong = PracticeMgr:GetGongDef(gongName);
		-- -- if gong.Name ~= "Gong_LOST" then
			-- -- QFWDlib.ThingItemGongTrue[num] = gongName;
			-- -- if gong.DisplayName~=nil then
				-- -- QFWDlib.ThingItemGongTrueDisplayName[num] = gong.DisplayName;
			-- -- end
			-- -- num=num+1;
		-- -- end
	-- -- end
	-- -- for z=1,22 do
		-- -- for y=1,6 do
			-- -- gongName= "Gong_"..tostring(z).."_"..QFWDlib.ThingItemGongType[y];
			
			-- -- gong = PracticeMgr:GetGongDef(gongName);
			-- -- if gong.Name ~= "Gong_LOST" then
				-- -- QFWDlib.ThingItemGongTrue[num] = gongName;
				-- -- if gong.DisplayName~=nil then
					-- -- QFWDlib.ThingItemGongTrueDisplayName[num] = gong.DisplayName;
				-- -- end
				-- -- num=num+1;
				-- -- --print(gongName)
			-- -- end
		-- -- end
	-- -- end
	--print("MOD版修改器:Get gong true!")
	print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">AddManager_Tips27"))
	list = CS.XiaWorld.EsotericaMgr.m_mapSysEsoterica;
	num=1;
	--local Esoterica = nil;
	for localKey, localValue in pairs(list) do 
		if localValue~=nil and localValue.Name ~= nil and localValue.Name ~= "Esoterica_SYS_LOST" then
			QFWDlib.ThingItemEsotericaTrue[num] = localValue.Name;
			if localValue.DisplayName ~= nil and localValue.DisplayName ~= "模组丢失" then
				QFWDlib.ThingItemEsotericaTrueDisplayName[num] = localValue.DisplayName;
			end
			num = num + 1;
		end
	end
	-- list = QFWDlib.ThingItemEsoterica;
	-- num=1;
	-- local Esoterica = nil;
	-- for localKey, localValue in pairs(list) do 
		-- Esoterica = EsotericaMgr:GetSysEsoterica(localValue,false);
		-- if Esoterica ~= nil then
			-- if Esoterica.Name ~= nil and Esoterica.Name ~= "Esoterica_SYS_LOST" then
				-- QFWDlib.ThingItemEsotericaTrue[num] = Esoterica.Name;
				-- if Esoterica.DisplayName ~= nil and Esoterica.DisplayName ~= "模组丢失" then
					-- QFWDlib.ThingItemEsotericaTrueDisplayName[num] = Esoterica.DisplayName;
				-- end
				-- num = num + 1;
			-- end
		-- end
	-- end
	--print("MOD版修改器:Get esoterica true!")
	print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">AddManager_Tips28"))
	
	list = CS.XiaWorld.PracticeMgr.s_mapSpellDefs;
	num=1;
	--local Esoterica = nil;
	QFWDlib.ThingItemSpellTrue={};
	QFWDlib.ThingItemSpellTrueDisplayName={};
	for localKey, localValue in pairs(list) do 
		if localValue~=nil and localValue.Name ~= nil and localValue.Name ~= "Spell_SYSLOST" then
			QFWDlib.ThingItemSpellTrue[num] = localValue.Name;
			if localValue.DisplayName ~= nil and localValue.DisplayName ~= "模组丢失" then
				QFWDlib.ThingItemSpellTrueDisplayName[num] = localValue.DisplayName;
			end
			num = num + 1;
		end
	end
	--print("MOD版修改器:Get spell true!")
	print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">AddManager_Tips29"))
	
	
	AddManager:ShowAllGongName(AddManager.ThingAttributeListCOP);
	AddManager:ShowAllThingName(AddManager.ThingListCOP);
end

function AddManager:ShowAllSpellName(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">AddManager_bntShowThingSpell");
	local localKey=nil;
	local localValue=nil;
	AddManager.listtypes2=2;
	AddManager.input5.m_title.text="0";
	AddManager.input6.m_title.text="0";
	for localKey, localValue in pairs(QFWDlib.ThingItemSpellTrue) do 
		if QFWDlib.ThingItemSpellTrueDisplayName[localKey]~=nil then
			AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemSpellTrueDisplayName[localKey]));
		else
			AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(localValue));
		end
	end
end
function AddManager:ShowAllGongName(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">AddManager_bntShowThingGong");
	local localKey=nil;
	local localValue=nil;
	AddManager.input6.m_title.text="0";
	AddManager.input7.m_title.text="0";
	AddManager.listtypes2=0;
	for localKey, localValue in pairs(QFWDlib.ThingItemGongTrue) do 
		if QFWDlib.ThingItemGongTrueDisplayName[localKey]~=nil then
			AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemGongTrueDisplayName[localKey]));
		else
			AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemGongTrue[localKey]));
		end
		
	end
end
function AddManager:ShowAllEsotericaName(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">AddManager_bntShowThingEsoterica");
	AddManager.listtypes2=1;
	local localKey=nil;
	local localValue=nil;
	AddManager.listtypes=1;
	AddManager.input5.m_title.text="0";
	AddManager.input7.m_title.text="0";
	for localKey, localValue in pairs(QFWDlib.ThingItemEsotericaTrue) do 
		if QFWDlib.ThingItemEsotericaTrueDisplayName[localKey]~=nil then
			AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemEsotericaTrueDisplayName[localKey]));
		else
			AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemEsotericaTrue[localKey]));
		end
		
	end
end
function AddManager:ShowAllThingName(obj)
	if obj==nil then
		obj=AddManager.ThingListCOP;
	end
	AddManager.listtypes=0;
	local localKey=nil;
	local localValue=nil;
	local def,icon;
	local num=0;
	AddManager.ShowPage=1;
	AddManager.AllPage=#QFWDlib.AllThingItemsTrue/200;
	
	local page=math.floor(AddManager.AllPage);
	if page~=AddManager.AllPage then
		AddManager.AllPage=page+1;
	else
		AddManager.AllPage=page;
	end
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">AddManager_Tips30").."("..tostring(AddManager.ShowPage).."/"..tostring(AddManager.AllPage)..")";
	for localKey, localValue in pairs(QFWDlib.AllThingItemsTrue) do
		num=num+1;
		if num>200 then
			break;
		end
		def=ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, localValue);
		if def~=nil then
			icon = def.TexPath;
		end
		if QFWDlib.AllThingItemsTrueDisplayName[localKey]~=nil then
			AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.AllThingItemsTrueDisplayName[localKey]),icon);
		else
			AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.AllThingItemsTrue[localKey]),icon);
		end
		
	end
	
end
function AddManager:ShowAllThingNameUP(obj)
	if obj==nil then
		obj=AddManager.ThingListCOP;
	end
	if AddManager.ShowPage==nil or AddManager.AllPage==nil then
		return;
	end
	AddManager.ShowPage=AddManager.ShowPage-1;
	if AddManager.ShowPage==0 then
		AddManager.ShowPage=1;
		return;
	end
	local page=AddManager.ShowPage-1;
	
	AddManager.listtypes=0;
	local localKey=nil;
	local localValue=nil;
	local def,icon;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">AddManager_Tips30").."("..tostring(AddManager.ShowPage).."/"..tostring(AddManager.AllPage)..")";
	for localKey, localValue in pairs(QFWDlib.AllThingItemsTrue) do
		num=num+1;
		if num>page*200 then
			if num <= (page+1)*200 then
				def=ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, localValue);
				if def~=nil then
					icon = def.TexPath;
				end
				if QFWDlib.AllThingItemsTrueDisplayName[localKey]~=nil then
					AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.AllThingItemsTrueDisplayName[localKey]),icon);
				else
					AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.AllThingItemsTrue[localKey]),icon);
				end
			else
				break;
			end
		end
	end
	
end
function AddManager:ShowAllThingNameDown(obj)
	if obj==nil then
		obj=AddManager.ThingListCOP;
	end
	if AddManager.ShowPage==nil or AddManager.AllPage==nil then
		return;
	end
	AddManager.ShowPage=AddManager.ShowPage+1;
	if AddManager.ShowPage>AddManager.AllPage then
		AddManager.ShowPage=AddManager.AllPage;
		return;
	end
	local page=AddManager.ShowPage-1;
	
	AddManager.listtypes=0;
	local localKey=nil;
	local localValue=nil;
	local def,icon;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">AddManager_Tips30").."("..tostring(AddManager.ShowPage).."/"..tostring(AddManager.AllPage)..")";
	for localKey, localValue in pairs(QFWDlib.AllThingItemsTrue) do
		num=num+1;
		if num>page*200 then
			if num <= (page+1)*200 then
				def=ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, localValue);
				if def~=nil then
					icon = def.TexPath;
				end
				if QFWDlib.AllThingItemsTrueDisplayName[localKey]~=nil then
					AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.AllThingItemsTrueDisplayName[localKey]),icon);
				else
					AddManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.AllThingItemsTrue[localKey]),icon);
				end
			else
				break;
			end
		end
	end
end

function AddManager:ChooseThingNum(num)
	AddManager.ChooseThingNum = num;
end
function AddManager:ChooseThingNumAndGetAttribute(num)
	AddManager.AttributeFlag = 0;
	AddManager.ChooseThingNum = num;
	AddManager.ChooseThingNumName = nil;
	if QFWDlib.AllThingItemsTrueDisplayName[num]~=nil then
		AddManager.ChooseThingNumName = QFWDlib.AllThingItemsTrueDisplayName[num];
	else
		AddManager.ChooseThingNumName = QFWDlib.AllThingItemsTrue[num];
	end
	--AddManager:GetChooseThingAttribute(AddManager.MapThings[AddManager.ChooseThingNum]);
end

function AddManager:AddThing()
	local maps = World.map;
	local thingName = QFWDlib.AllThingItemsTrue[AddManager.ChooseThingNum];
	if tonumber(AddManager.inputid1.m_title.text)== nil and AddManager.inputid1.m_title.text ~= nil then
		thingName = AddManager.inputid1.m_title.text;
	end
	local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, thingName);
	local mapKey = AddManager:GetKey(tonumber(AddManager.input111.m_title.text),tonumber(AddManager.input211.m_title.text))
	if AddManager:CheckKey(mapKey,3)==false then
		return false;
	end
	local thingCount = tonumber(AddManager.inputid2.m_title.text);
	if thingCount == nil then
		thingCount=1;
		AddManager.inputid2.m_title.text = "1";
	end
	local thingItem = ThingMgr:AddItemThing(mapKey, thingName, maps,thingCount, false);
	
	local num = tonumber(AddManager.input5.m_title.text);
	if num ~= 0 and AddManager.input5.m_title.text ~= nil then
		if num ~= nil then
			if num < 0 then
				local rnum=-1*num;
				local rg=PracticeMgr.RGongMgr;
				local info=CS.XiaWorld.RandomRuleInfo();
				info.lv=rnum;
				local rname=rg:Random(nil,info,false);
				if rname==nil or rname.Name==nil then
					return false;
				end
				thingItem:InitGong(rname.Name);
			else
				thingItem:InitGong(QFWDlib.ThingItemGongTrue[num]);
			end
		else
			thingItem:InitGong(AddManager.input5.m_title.text);
		end
	end
	num = tonumber(AddManager.input6.m_title.text);
	if num ~= 0 and AddManager.input6.m_title.text ~= nil then
		local Esoterica= nil;
		if num ~= nil then
			Esoterica= EsotericaMgr:GetSysEsoterica(QFWDlib.ThingItemEsotericaTrue[num],false);
			thingItem:InitEsoterica(Esoterica,false);
		else
			Esoterica= EsotericaMgr:GetSysEsoterica(AddManager.input6.m_title.text,false);
			thingItem:InitEsoterica(Esoterica,false);
		end
	end
	num = tonumber(AddManager.input7.m_title.text);
	if num ~= 0 and AddManager.input7.m_title.text ~= nil then
		local Spell= nil;
		if num ~= nil then
			Spell= CS.XiaWorld.PracticeMgr.Instance:GetSpellDef(QFWDlib.ThingItemSpellTrue[num]);
			--thingItem:InitEsoterica(Spell,false);
			
		else
			Spell= CS.XiaWorld.PracticeMgr.Instance:GetSpellDef(AddManager.input7.m_title.text);
			if Spell~=nil and Spell.Name~=nil and Spell.Name~="Spell_SYSLOST" then
			--thingItem:InitEsoterica(Spell,false);
			else
				AddManager.input7.m_title.text="0";
			end
			Spell=nil;
		end
		if Spell~=nil then
			local qulity=tonumber(AddManager.inputFB3.m_title.text);
			if qulity==nil then
				qulity=1;
				AddManager.inputFB3.m_title.text="1";
			end
			local localKey=nil;
			local localValue=nil;
			if Spell.Effects~=nil then
				for localKey, localValue in pairs(Spell.Effects) do 
					if localValue~=nil then
						thingItem:AddEquiptData(localValue.Name, localValue.AddV * qulity, localValue.AddP * qulity, localValue.BAddV * qulity, localValue.BAddP * qulity, CS.XiaWorld.g_emNpcSpecailFlag.None, nil, false);
					end
				end
			end
			if Spell.SkillEffects~=nil then
				for localKey, localValue in pairs(Spell.SkillEffects) do 
					if localValue~=nil then
						local level2 = localValue.Level *qulity;
						local levelover = localValue.LevelOver * qulity;
						thingItem:AddEquiptSkillData(localValue.Name, level2, levelover);
						--thingItem:AddEquiptData(localValue.Name, localValue.AddV * qulity, localValue.AddP * qulity, localValue.BAddV * qulity, localValue.BAddP * qulity, CS.XiaWorld.g_emNpcSpecailFlag.None, nil, false);
					end
				end
			end
			if Spell.BaseFive~=nil then
				local bf={};
				local str=Spell.BaseFive;
				--print(str)
				local tnum,ttnum=0,0,0;
				--ttnum,_= string.find(str, ",");
				if ttnum~=nil then
					while true do
						ttnum,_= string.find(str, ",");
						if ttnum==nil then
							ttnum=-1;
						end
						bf[tnum]=tonumber(string.sub(str,1, ttnum-1));
						str=string.sub(str,ttnum+1, -1);
						if bf[tnum]~=nil then
							bf[tnum]=bf[tnum]*qulity;
						end
						--print(tostring(str))
						--ttnum=cnum+1;
						if tnum>4 then
							break;
						end
						tnum=tnum+1;
					end
					local data=CS.XiaWorld.ItemEquptData();
					data.Type=2;
					data.basefive = bf;
					thingItem:AddEquiptData(data);
				end
			end
			
			thingItem:SetQuality(qulity);
			local desc=tostring(thingItem:GetDesc());
			--print(desc)
			if desc==nil or desc=="nil" then
				desc="\n"..QFLanguage.GetText(">AddManager_Tips31")..":"..tostring(Spell.DisplayName).."\n"..tostring(Spell.Desc);
			else
				desc=desc.."\n------[color=#B0B000]"..tostring(Spell.DisplayName).."[/color]------\n"..tostring(Spell.Desc);
			end
			thingItem.m_sDesc=desc;
		end
	end
	--ThingMgr:AddFaBao(thingItem,CS.XiaWorld.g_emItemLable.Dan , 1,0,1,false);
	--local thingItem2 = ThingMgr:AddItemThing(mapKey+1, thingName, maps,thingCount, false);

	--thingItem=ThingMgr:AddFaBao(thingItem, CS.XiaWorld.g_emItemLable.Wood)
	--thingItem:InitFabao(thingItem2, CS.XiaWorld.g_emItemLable.FightFabao, 1, 0, 1,false, false)
	--ThingMgr:AddFaBao(thingItem, CS.XiaWorld.g_emItemLable.FightFabao)
	if AddManager.CheckBoxfb1.selected then
		local numBe=tonumber(AddManager.inputFB5.m_title.text);
		local fbQualityadd=tonumber(AddManager.inputFB3.m_title.text);
		local fbRate=tonumber(AddManager.inputFB2.m_title.text);
		local PDDD=1;
		local numnum=tonumber(AddManager.inputFB4.m_title.text);
		local pd2=QFWDlib.FBTypes[numnum];
		local pd3=AddManager.CheckBoxfb3.selected;
		local pd4=AddManager.CheckBoxfb4.selected;
		local StuffDefName=nil;
		local oldthingDef=thingDef.Item.Lable;
		local thingItem2 =nil;
		if numnum==15 then
			thingItem2 = ThingMgr:AddItemThing(AddManager:AutoKey(mapKey), "FightFaBao", maps,1, false);
		-- elseif numnum==16 then
			-- thingItem2 = ThingMgr:AddItemThing(AddManager:AutoKey(mapKey), "MiBaoBase", maps,1, false);
		elseif numnum==16 then
			thingItem2 = ThingMgr:AddItemThing(AddManager:AutoKey(mapKey), "TreasureFabao", maps,1, false);
		else
			local thingName2 = QFWDlib.AllThingItemsTrue[tonumber(AddManager.inputFB0.m_title.text)];
			thingItem2 = ThingMgr:AddItemThing(AddManager:AutoKey(mapKey), thingName2, maps,1, false);
		end
		--thingDef.Item.Lable=pd2;
		if thingItem2.StuffDef~= nil then
			if thingItem2.StuffDef.Name~=nil then
				StuffDefName=thingItem2.StuffDef.Name;
			end
		end
		thingItem,thingItem2=thingItem2,thingItem;
		--StuffDefName=ThingMgr:RandomStuffItemDefname(pd2, fbRate, fbRate);
		--thingItem:ChangeDef(thingDef);
		if numnum==15 or numnum==16 then
			thingItem:InitFabao(fbRate, thingItem2.def, StuffDefName, thingItem2:GetName(), pd2, fbQualityadd, nil, thingItem2.ElementKind, pd3, pd4);
			--thingDef.Item.Lable = oldthingDef;
			thingItem:SetMod(thingItem2:GetModPath());
			thingItem.Fabao.OName = thingItem2:GetName();
			ThingMgr:RemoveThing(thingItem2, true, true);
			thingItem:SetName(AddManager.inputFB1.m_title.text);
			if numnum==15 then
				thingItem:ActiveFabaoEmbryo();
			end
		else
			thingItem:InheritDataFromMade(thingItem2.def, 1, 0);
			thingItem:SetMod(thingItem2:GetModPath());
			ThingMgr:RemoveThing(thingItem2, true, true);
			thingItem:SetName(AddManager.inputFB1.m_title.text);
		end
		thingItem:ChangeBeauty(numBe);
	-- else
		-- local numnum=tonumber(AddManager.inputFB4.m_title.text)
		-- local pd2=QFWDlib.FBTypes[numnum];
		-- thingDef.Item.Lable=pd2;
		-- thingItem:ChangeDef(thingDef);
	end
			--thingItema=thingItem:DropRandomItem("FightFabao", 1, 9);
		--thingItema:SetPostion(22)
	
	--print(tostring(thingItem.def:GetParam("Desc")))
	
	--thingItem:SetPostion(mapKey,false, true, true);
	
	
	if AddManager.CheckBox2.selected then
		thingItem.FSItemState=1;
		thingItem:MakeFengshuiItemData();
		thingItem.FengshuiActiveState=1;
		thingItem.FSItemState=3;
	end
	if AddManager.CheckBox1.selected then
		thingItem.Rate=24;
		thingItem:SetQuality(88);
	else
		local fbQualityadd=tonumber(AddManager.inputFB3.m_title.text);
		
		thingItem:SetQuality(fbQualityadd);
		
	end
	if AddManager.CheckBox.selected then
		thingItem:FoundMe();
	end
	
	--thingItem:Selected(true);
	--thingItem:Split(1);
	
	--thingItem.FSItemState=3;
	
	--CS.Wnd_GameMain.Instance:ShowThingInfo(thingItem, nil);
	thingItem:OnClearDraw();
	thingItem:OnDraw(true);
	return true;
	--AddManager:AddAPuppet(12,10000,12,"无");
end


function AddManager:AddAPuppet(PuppetName,rate,PuppetHP,PuppetMoveSpeed)
	if rate == nil then
		rate = 12;
	end
	if PuppetHP == nil then
		PuppetHP = 20000;
	end
	if PuppetMoveSpeed == nil then
		PuppetMoveSpeed = 30;
	end
	if PuppetName==nil then
		PuppetName = "清风牌傀儡"
	end
	local npc = ThingMgr:AddNpc("Puppet", 0, World.map, CS.XiaWorld.Fight.g_emFightCamp.Player);
	local mapKey = AddManager:GetKey(tonumber(AddManager.input111.m_title.text),tonumber(AddManager.input211.m_title.text))
	npc.Rate = rate;
	npc.PropertyMgr:SetPropertyOverwrite("MaxHp",PuppetHP);
	npc.PropertyMgr:ModifierProperty("MoveSpeed", PuppetMoveSpeed, 0, 0, 0);
	npc:SetLight(false, nil);
	npc:RestHp();
	npc:SetPostion(mapKey, false, true, true);
	npc:SetName(PuppetName);
	npc.BodyPuppet=false;
	--npc.FightBody:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player, true);
	--npc.AutoWear=true;
	--NpcMgr:GetRaceDef("Puppet").RaceType=CS.XiaWorld.g_emNpcRaceType.Wisdom;
	CS.Wnd_GameMain.Instance:ShowThingInfo(npc, nil);
	npc.view.needUpdateMod = true;
end










function AddManager:SearchDisplayName(name)
	local findList=QFWDlib.AllThingItemsTrueDisplayName;
	local findNum=nil;
	AddManager.findArrey={};
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(findList) do 
		
		local info=localValue;
		--QFWDlib.AllThingItemsTrue[localKey];
		if AddManager.CheckBox3.selected then
			local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, tostring(QFWDlib.AllThingItemsTrue[localKey]));
			if thingDef~=nil then
				info=info.."  "..tostring(thingDef.Name);
				info=info.."  "..tostring(thingDef.Desc);
			end
		end
		findNum,_=string.find(info, name);
		if findNum ~= nil and findNum ~= 0 then
			AddManager.findArrey[num]=localKey;
			num=num+1;
		end
	end
	if AddManager.findArrey=={} then
		return false;
	end
	local obj=AddManager.ThingListCOP;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">AddManager_Tips32");
	for localKey, localValue in pairs(AddManager.findArrey) do 
		local icon = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, QFWDlib.AllThingItemsTrue[localValue]).TexPath;
		if QFWDlib.AllThingItemsTrueDisplayName[localValue]~=nil then
			AddManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..tostring(QFWDlib.AllThingItemsTrueDisplayName[localValue]),icon);
		else
			AddManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..tostring(QFWDlib.AllThingItemsTrue[localValue]),icon);
		end
		
	end
	return true;
end
function AddManager:SearchDisplayName2(name)
	local k,v=nil,nil;
	local findList={};
	if AddManager.listtypes2==1 then
		findList=QFWDlib.ThingItemEsotericaTrueDisplayName;
	elseif AddManager.listtypes2==0 then
		findList=QFWDlib.ThingItemGongTrueDisplayName;
	else
		findList=QFWDlib.ThingItemSpellTrueDisplayName;
	end
	local findNum=nil;
	AddManager.findArrey={};
	local num=1;
	for k, v in pairs(findList) do 
		findNum,_=string.find(v, name);
		if findNum ~= nil and findNum ~= 0 then
			AddManager.findArrey[num]=k;
			num=num+1;
		end
	end
	if AddManager.findArrey=={} then
		return false;
	end
	local obj=AddManager.ThingAttributeListCOP;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">AddManager_Tips33");
	for k, v in pairs(AddManager.findArrey) do 
		if findList[v]~=nil then
			AddManager:AddChildToList(obj,tostring(v),tostring(v)..": "..tostring(findList[v]));
		end
	end
	return true;
end
function AddManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function AddManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function AddManager:AddChildToList(tobj,name,value,icon)
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
function AddManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(AddManager.ListChildOnClick);
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
function AddManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(AddManager.ListChildOnClick2);
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
function AddManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	AddManager.TheClickBnt = tonumber(Eventss.data.name);
	AddManager:SetSetting();
	
end
function AddManager:SetSetting(types)
	local obj=nil;
	if types==nil then
		obj=AddManager.inputid1;
	else
		obj=AddManager.inputid1;
	end
	obj.m_title.text=tostring(AddManager.TheClickBnt);
	AddManager:ChooseThingNumAndGetAttribute(AddManager.TheClickBnt);
	if not AddManager.CheckBoxfb1.selected then
		AddManager.inputFB0.m_title.text = tostring(AddManager.TheClickBnt);
	end
	AddManager.ShowLableThing.text = QFLanguage.GetText(">AddManager_Tips34")..": "..tostring(AddManager.ChooseThingNumName);
	AddManager.input5.m_title.text="0";
	AddManager.input6.m_title.text="0";
	AddManager.input7.m_title.text="0";
end
function AddManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	AddManager.TheClickBnt = tonumber(Eventss.data.name);
	AddManager:SetSetting2();
	
end
function AddManager:SetSetting2()
	local obj=nil;
	local types=AddManager.listtypes2;
	if types==nil or types==0 then
		obj=AddManager.input5;
	elseif types==1 then
		obj=AddManager.input6;
	else
		obj=AddManager.input7;
	end
	obj.m_title.text=tostring(AddManager.TheClickBnt);
	--AddManager:ChooseThingNumAndGetAttribute(AddManager.TheClickBnt);
end