local NpcManager = CS.Wnd_Simple.CreateWindow("NpcManager");
ModifierMain:AddWindow("NpcManager",NpcManager);
function NpcManager.WndOnHotKey()
	if QFForeInte~=nil and QFForeInte.GetKeyDownKeyStr~=nil then
		if QFForeInte.GetKeyForeverDownStr("mouse 0") and QFForeInte.GetKeyDownKeyStr("1") then
			--NpcManager:Show();
			if NpcManager.isShowing then
				NpcManager:Hide();
			else
				local EasyUse=ModifierMain:FindWindow("EasyUse");
				if EasyUse~=nil then
					EasyUse.NpcSetting();
				else
					NpcManager:Show();
				end
			end
			--print("a")
		--else
		--	print(tostring(QFForeInte.CheckValue(704)))
		end
	end
end
function NpcManager:OnInit()
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">NpcManager_Title"));
	self:SetSize(self.sx,self.sy);
	
	self.aNPCAllBuffList={};
	self.aNPCAllFeatureList={};
	self.aNPCAllExperienceList={};
	self.aNPCAllMoodList={};
	self.Attributes={};
	self.ListAttribute = {};
	self.AttributesName={};
	self.AttributesDisPName={};
	self.LogicBool={false,true};
	self.Attribute={};
	self.Attributeold={};
	self.NpcList={};
	self.AttributeFlag=0;
	self.typeszold=1;
	local w1=QFLanguage.GetText(">NpcManager_Tips159");
	local w2=QFLanguage.GetText(">NpcManager_Tips160");
	local w3=QFLanguage.GetText(">NpcManager_Tips161");
	local w4=QFLanguage.GetText(">NpcManager_Tips162");
	self.typesShow={w1,w2,w3,w4};
	self.chooseNpcNum = 0;
	self.listType=0;
	self.FuncNum = 0;
	self.FuncNumOld = 1;
	
	
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);
	QFWDModifierMainUI:AddLable2(self,"lable3111",QFLanguage.GetText(">NpcManager_lable3111"),self.sx/10,self.sy/10*2,200,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2.1);
	self.inputid1:SetSize(self.sx/10*1.2, 20, false);
	self.inputid1.m_title.restrict = "[0-9]";
	self.inputid1.m_title.maxLength = 3;
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc",QFLanguage.GetText(">NpcManager_Tips151")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*1.5,300,35);
	QFWDModifierMainUI:AddButton2(self,"btnChooseNpc",QFLanguage.GetText(">NpcManager_btnChooseNpc"),self.sx/10*1,self.sy/10*2.6,nil,nil,QFLanguage.GetText(">NpcManager_Tips172")):SetSize(self.sx/10*0.8, 20, false);
	--QFWDModifierMainUI:AddButton2(self,"btnShowChoose","选择",self.sx/10*1.5,self.sy/10*2.5):SetSize(self.sx/10*0.8, 20, false);
	self.CheckBox1 = self:AddCheckBox("btnShowChoose",QFLanguage.GetText(">NpcManager_btnShowChoose"),self.sx/10*2,self.sy/10*2.6);
	self.CheckBox1.selected = true;
	
	QFWDModifierMainUI:AddButton2(self,"btnPutNpcList",QFLanguage.GetText(">NpcManager_btnPutNpcList"),self.sx/10*8,self.sy/10*1.1,nil,nil,QFLanguage.GetText(">NpcManager_Tips173")):SetSize(self.sx/10*1.2, 20, false);
	
	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute",QFLanguage.GetText(">ThingManager_ShowLableAttribute")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10*4,self.sy/10*1.5,300,35);
	self.ShowLableAttribute:SetSize(self.sx/10*5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">ThingManager_lable3"),self.sx/10*4,self.sy/10*2,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*4.8,self.sy/10*2.1);
	self.input1:SetSize(50, 20, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 3;
	QFWDModifierMainUI:AddLable2(self,"lable4",QFLanguage.GetText(">SchoolManager_lable4"),self.sx/10*4,self.sy/10*2.5,200,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","清",self.sx/10*4.8,self.sy/10*2.6);
	self.input2:SetSize(self.sx/10*3, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"lablettt1",QFLanguage.GetText(">MapSet_lableA2"),self.sx/10*5.8,self.sy/10*2,200,35);
	self.inputtt1 = QFWDModifierMainUI:AddInput2(self,"inputtt1","1",self.sx/10*6.4,self.sy/10*2.1);
	self.inputtt1:SetSize(30, 20, false);
	self.inputtt1.m_title.restrict = "[0-9]";
	self.inputtt1.m_title.maxLength = 1;
	self.lablettty1= QFWDModifierMainUI:AddLable2(self,"lablettty1",QFLanguage.GetText(">NpcManager_Tips160"),self.sx/10*7,self.sy/10*2,200,35);
	
	QFWDModifierMainUI:AddButton2(self,"btnSet",QFLanguage.GetText(">SchoolManager_bntSetList"),self.sx/10*8,self.sy/10*2.1,nil,nil,QFLanguage.GetText(">BuildingManager_Tips34")):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"btnYesSetNpc",QFLanguage.GetText(">SchoolManager_bntYesSetList"),self.sx/10*8,self.sy/10*2.6,nil,nil,QFLanguage.GetText(">BuildingManager_Tips35")):SetSize(self.sx/10*1.2, 20, false);
	
	
	local xsy=3.5;
	self.SLab0=QFWDModifierMainUI:AddLable2(self,"lableShowName0",QFLanguage.GetText(">NpcManager_Tips130")..": "..QFLanguage.GetText(">NpcManager_Tips144"),self.sx/10,self.sy/10*xsy,self.sx/10*5,35);
	xsy=xsy+0.5;
	self.SLab1=QFWDModifierMainUI:AddLable2(self,"lableShowName",QFLanguage.GetText(">NpcManager_Tips131"),self.sx/10,self.sy/10*xsy,self.sx/10*2,35);
	self.SInput1 = QFWDModifierMainUI:AddInput2(self,"inputID","1",self.sx/10*2,self.sy/10*(xsy+0.1));
	self.SInput1:SetSize(self.sx/10*3.2, 20, false);
	xsy=xsy+0.5;
	self.SBtn1=QFWDModifierMainUI:AddButton2(self,"btnListAdd",QFLanguage.GetText(">NpcManager_Tips132"),self.sx/10*1,self.sy/10*(xsy+0.1));
	self.SBtn1:SetSize(self.sx/10*1.2, 20, false);
	self.SBtn2=QFWDModifierMainUI:AddButton2(self,"btnListRemove",QFLanguage.GetText(">NpcManager_Tips133"),self.sx/10*2.5,self.sy/10*(xsy+0.1));
	self.SBtn2:SetSize(self.sx/10*1.2, 20, false);
	self.SBtn3=QFWDModifierMainUI:AddButton2(self,"btnListUpdata",QFLanguage.GetText(">NpcManager_Tips143"),self.sx/10*4,self.sy/10*(xsy+0.1));
	self.SBtn3:SetSize(self.sx/10*1.2, 20, false);
	xsy=xsy+1;
	QFWDModifierMainUI:AddLable2(self,"lable15",QFLanguage.GetText(">NpcManager_lable15"),self.sx/10*1,self.sy/10*xsy,200,35);
	
	xsy=xsy+0.5;
	QFWDModifierMainUI:AddButton2(self,"btnNpcInteriorNPC",QFLanguage.GetText(">NpcManager_btnNpcInteriorNPC"),self.sx/10*1,self.sy/10*(xsy+0.1),nil,nil,QFLanguage.GetText(">NpcManager_Tips169")):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnNpcMoreNPC",QFLanguage.GetText(">NpcManager_btnNpcMoreNPC"),self.sx/10*2.5,self.sy/10*(xsy+0.1),nil,nil,QFLanguage.GetText(">NpcManager_Tips170")):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnNpcManagerOtherPractice",QFLanguage.GetText(">NpcManager_btnNpcManagerOtherPractice"),self.sx/10*4,self.sy/10*(xsy+0.1),nil,nil,QFLanguage.GetText(">NpcManager_Tips171")):SetSize(self.sx/10*1.2, 25, false);
	xsy=xsy+1.5;
	QFWDModifierMainUI:AddLable2(self,"lableGloble",QFLanguage.GetText(">NpcManager_lableGloble"),self.sx/10*1,self.sy/10*xsy,200,35);
	xsy=xsy+0.5;
	QFWDModifierMainUI:AddButton2(self,"btnNpcInteSave",QFLanguage.GetText(">NpcManager_btnNpcInteSave"),self.sx/10*1,self.sy/10*(xsy+0.1),nil,nil,QFLanguage.GetText(">NpcManager_Tips215")):SetSize(self.sx/10*1.2, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"btnNpcMoreNPC",QFLanguage.GetText(">NpcManager_btnNpcMoreNPC"),self.sx/10*2.5,self.sy/10*(xsy+0.1),nil,nil,QFLanguage.GetText(">NpcManager_Tips170")):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnNpcInteSaveP",QFLanguage.GetText(">NpcManager_btnNpcInteSaveP"),self.sx/10*4,self.sy/10*(xsy+0.1),nil,nil,QFLanguage.GetText(">NpcManager_Tips220")):SetSize(self.sx/10*1.2, 25, false);
	xsy = 3.5;
	QFWDModifierMainUI:AddLable2(self,"lable13",QFLanguage.GetText(">BuildingManager_lable5"),self.sx/10*6.5,self.sy/10*xsy,200,35);
	xsy=xsy+0.5;
	self.NpcListCOP = self:AddCOP2("NpcList",-self.sx/10*4.15,self.sy/10*0.7,2);
	
	QFWDModifierMainUI:AddButton2(self,"btnUpdataNpcList",QFLanguage.GetText(">NpcManager_btnUpdataNpcList"),-self.sx/10*2.08,self.sy/10*9,nil,nil,QFLanguage.GetText(">NpcManager_Tips163")):SetSize(self.sx/10*0.6, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnUpdataAllNpcList",QFLanguage.GetText(">NpcManager_btnUpdataAllNpcList"),-self.sx/10*2.68,self.sy/10*9,nil,nil,QFLanguage.GetText(">NpcManager_Tips164")):SetSize(self.sx/10*0.6, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnListBuff",QFLanguage.GetText(">NpcManager_btnListBuff"),-self.sx/10*4,self.sy/10*9,nil,nil,QFLanguage.GetText(">NpcManager_Tips165")):SetSize(self.sx/10*0.6, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnListFeature",QFLanguage.GetText(">NpcManager_btnListFeature"),-self.sx/10*3.4,self.sy/10*9,nil,nil,QFLanguage.GetText(">NpcManager_Tips166")):SetSize(self.sx/10*0.6, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnListExperience",QFLanguage.GetText(">NpcManager_btnListExperience"),-self.sx/10*0.75,self.sy/10*9,nil,nil,QFLanguage.GetText(">NpcManager_Tips167")):SetSize(self.sx/10*0.6, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnListMood",QFLanguage.GetText(">NpcManager_btnListMood"),-self.sx/10*1.35,self.sy/10*9,nil,nil,QFLanguage.GetText(">NpcManager_Tips168")):SetSize(self.sx/10*0.6, 25, false);
	
	self.FuncListCOP=self:AddCOP3("NpcList2",self.sx/10*6.5,self.sy/10*xsy);
	
	self.AttributeListCOP = self:AddCOP("AttributeList",self.sx/10*9.85,self.sy/10*0.7,1);
	QFWDModifierMainUI:AddButton2(self,"btnAllThing",QFLanguage.GetText(">AddManager_bntAllThing"),self.sx/10*13.05,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"btnSearchThing",QFLanguage.GetText(">AddManager_bntSearchThing"),self.sx/10*12.1,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch",QFLanguage.GetText(">AddManager_inputSearch"),self.sx/10*10,self.sy/10*9);
	self.inputSearch:SetSize(self.sx/10*2, 25, false);
	if CS.NpcRolepaintUI~=nil then
		self.picture=self:AddPicture("NPCPic",self.sx/10*1,self.sy/10*(-0.5),3,3);
	--QFWDModifierMainUI:AddButton2(self,"btnQFF","RUN",self.sx/10*7,self.sy/10*9.7):SetSize(self.sx/10*0.8, 25, false);
	end
	
	NpcManager:ForeInte();

	self.window:Center();
	
end

function NpcManager:OnShowUpdate()
	
end

function NpcManager:OnShown()
	NpcManager.isShowing = true
end

function NpcManager:OnUpdate()
	if NpcManager.isShowing == true then
		local typesz=tonumber(NpcManager.inputtt1.m_title.text);
		if NpcManager.typeszold~= typesz then
			if typesz==nil or typesz<=0 then
				typesz=1;
			elseif typesz>4 then
				typesz=4;
			end
			NpcManager.lablettty1.text=NpcManager.typesShow[typesz];
			NpcManager.typeszold=typesz;
			NpcManager.inputtt1.m_title.text=tostring(typesz);
			local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
			if npc~=nil then
				NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum]);
				
				print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">NpcManager_Tips156"))
			end
		end
	end
end

function NpcManager:OnHide()
	NpcManager.isShowing = false;
	ModifierMain.showWindow=0;
end

function NpcManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		local num = 0;
		if obj.name == "btnSet" then
			num = tonumber(NpcManager.input1.m_title.text);
			if num == nil then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips157");
			elseif num > #NpcManager.AttributeDisPlayName then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips158");
			else
				NpcManager.Attributenew[num]=NpcManager.input2.m_title.text;
				NpcManager:UpdateChildAttribute();
			end
			return;
		end
		if obj.name == "btnYesSetNpc" then
			NpcManager:SetTheNpc(NpcManager.NpcList[NpcManager.chooseNpcNum]);
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips174");
			return;
		end
		if obj.name == "btnAllThing" then
			NpcManager:ShowNpcAttribute();
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips175");
			return;
		end
		if obj.name == "btnSearchThing" then
			local name=NpcManager.inputSearch.m_title.text;
			if NpcManager:SearchDisplayName(name) then
				NpcManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips20");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">AddManager_Tips21");
			end
			return;
		end
		if obj.name == "btnPutNpcList" then
			if NpcListSS ~= nil and NpcListSS~={} then
				NpcManager:UpdateChildNpcByNpcListSS(NpcManager.NpcListCOP);
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips176");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips177");
			end
			return;
		end
		if obj.name == "btnUpdataNpcList" then
			NpcManager.listType=0;
			NpcManager:ShowNpcListIn();
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips178");
			return;
		end
		if obj.name == "btnUpdataAllNpcList" then
			NpcManager.listType=1;
			NpcManager:ShowNpcListIn();
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips179");
			return;
		end
		if obj.name == "btnNpcMoreNPC" then
			local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
			if npc~=nil then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips180");
				NpcManagerTitle:Show();
				NpcManagerTitle:IntNpc(npc);
				ModifierMain.showWindow=22;
				NpcManager:Hide();
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips181");
			end
			return;
		end
		if obj.name == "btnNpcInteriorNPC" then
			local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
			if npc~=nil and npc.PropertyMgr~=nil then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips182");
				NpcManagerInterior:Show();
				NpcManagerInterior:IntNpc(npc);
				ModifierMain.showWindow=23;
				NpcManager:Hide();
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips181");
			end
			return;
		end
		if obj.name == "btnNpcManagerOtherPractice" then
			local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
			if npc~=nil and npc.PropertyMgr~=nil then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips183");
				NpcManagerOtherPractice:Show();
				NpcManagerOtherPractice:IntNpc(npc);
				ModifierMain.showWindow=23;
				NpcManager:Hide();
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips181");
			end
			return;
		end
		if obj.name == "btnChooseNpc" then
				
				NpcManager.chooseNpcNum = tonumber(NpcManager.inputid1.m_title.text);
				if NpcManager.chooseNpcNum == nil then
					NpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6").." "..QFLanguage.GetText(">EventSet_Tips7");
					NpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..":"..QFLanguage.GetText(">AddManager_Tips3");
					return;
				elseif NpcManager.chooseNpcNum ==0 then
					NpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6").." "..QFLanguage.GetText(">EventSet_Tips8");
					NpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..":"..QFLanguage.GetText(">AddManager_Tips3");
					return;
				
				elseif NpcManager.chooseNpcNum > #NpcManager.NpcList then
					NpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6").." "..QFLanguage.GetText(">EventSet_Tips8");
					NpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..":"..QFLanguage.GetText(">AddManager_Tips3");
					return;
				else
					NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum]);
					NpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..": "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName();
					NpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips9");
					NpcManager.AttributeFlag =0;
				end
				
			return;
		end
		if obj.name == "btnListAll" then
			if NpcManager.FuncNum==1 then
				NpcManager:ShowNpcAllBuffList(NpcManager.NpcListCOP);
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips145");
			elseif NpcManager.FuncNum==2 then
				NpcManager:ShowNpcAllFeature(NpcManager.NpcListCOP);
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips146");
			elseif NpcManager.FuncNum==3 then
				NpcManager:ShowNpcAllExperience(NpcManager.NpcListCOP);
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips147");
			elseif NpcManager.FuncNum==4 then
				NpcManager:ShowNpcAllMood(NpcManager.NpcListCOP);
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips148");
			
			end
			return;
		end
		if obj.name == "btnListAdd" then
			if NpcManager.FuncNum<=1 then
				NpcManager:AddNpcBuffList();
			elseif NpcManager.FuncNum==2 then
				NpcManager:ListAddFeature();
			elseif NpcManager.FuncNum==3 then
				NpcManager:ListAddExperience();
			elseif NpcManager.FuncNum==4 then
				NpcManager:ListAddMood();
			end
			return;
		end
		if obj.name == "btnListRemove" then
			if NpcManager.FuncNum<=1 then
				NpcManager:ListRemoveBuff();
			elseif NpcManager.FuncNum==2 then
				NpcManager:ListRemoveFeature();
			elseif NpcManager.FuncNum==3 then
				NpcManager:ListRemoveExperience();
			elseif NpcManager.FuncNum==4 then
				NpcManager:ListRemoveMood();
			end
			return;
		end
		if obj.name == "btnListUpdata" then
			if NpcManager.FuncNum==1 then
				NpcManager:UpdataNpcBuffList();
				NpcManager.ShowLable.text = NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()..QFLanguage.GetText(">NpcManager_Tips152");
			
			elseif NpcManager.FuncNum==2 then
				NpcManager:UpdataNpcFeatureList();
				NpcManager.ShowLable.text = NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()..QFLanguage.GetText(">NpcManager_Tips153");
			
			elseif NpcManager.FuncNum==3 then
				NpcManager:UpdataNpcExperienceList();
				NpcManager.ShowLable.text = NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()..QFLanguage.GetText(">NpcManager_Tips154");
			
			elseif NpcManager.FuncNum==4 then
				NpcManager:UpdataNpcMoodList();
				NpcManager.ShowLable.text = NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()..QFLanguage.GetText(">NpcManager_Tips155");
			else
				NpcManager:ChosseFunc(NpcManager.FuncNumOld);
			end
			return;
		end
		if obj.name == "btnListBuff" then
			NpcManager:ChosseFunc(1);
			return;
		end
		if obj.name == "btnListFeature" then
			NpcManager:ChosseFunc(2);
			return;
		end
		if obj.name == "btnListExperience" then
			NpcManager:ChosseFunc(3);
			return;
		end
		if obj.name == "btnListMood" then
			NpcManager:ChosseFunc(4);
			return;
		end
		if obj.name == "btnNpcInteSave" then
			local lbool,npcName=NpcManager:NpcInteSave();
			if lbool then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips218");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips219");
			end
			return;
		end
		if obj.name == "btnNpcInteSaveP" then
			local lbool,npcName=NpcManager:NpcInteSaveP();
			if lbool then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips218");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips219");
			end
			return;
		end
		--if obj.name == "btnListRemoveTimeMood" then
		--	NpcManager.listType=3;
		--	NpcManager:ListRemoveMood(1);
		--	--NpcManager.ShowLable.text = "移除所有的时效Mood. ";
		--	return;
		--end
		--if obj.name == "btnListRemoveAllMood" then
		--	NpcManager.listType=3;
		--	NpcManager:ListRemoveMood(2);
		--	--NpcManager.ShowLable.text = "移除所有的Mood. ";
		--	return;
		--end
	end
end
function NpcManager:ForeInte()
	NpcManager:LoadLang();--载入文本
	NpcManager:LoadNPCMgr();--初始化
	
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
		func=ModifierMain.lib:GetMethod("NPCGetJobToil");
		if func~=nil then
			NpcManager.NPCGetJobToil=func;
		end
		func=ModifierMain.lib:GetMethod("NPCGetAndSetFishing2");
		if func~=nil then
			NpcManager.NPCGetAndSetFishing=func;
		end
		func=ModifierMain.lib:GetMethod("MakeHorseFromSelf");
		if func~=nil then
			NpcManager.NpcMakeHorse=func;
		end
	end
	return run;
end
function NpcManager:ShowNpcListIn(easyList)
	NpcManager:LoadNPCMgr(easyList);
end
function NpcManager:LoadLang()
	NpcManager.Word1={};
	NpcManager.Word2={};
	local table1=NpcManager.Word1;
	table1[1]=QFLanguage.GetText(">NpcManager_btnNpcBreakNeck");
	table1[2]=QFLanguage.GetText(">NpcManager_btnNpcThunderKill");
	table1[3]=QFLanguage.GetText(">NpcManager_btnNpcKillNoCause");
	table1[4]=QFLanguage.GetText(">NpcManager_btnNpcRemoveNPC");
	table1[5]=QFLanguage.GetText(">NpcManager_btnNpcNoClothes");
	table1[6]=QFLanguage.GetText(">NpcManager_btnNpcHealthyBody");
	table1[7]=QFLanguage.GetText(">NpcManager_btnNpcReborn");
	table1[8]=QFLanguage.GetText(">NpcManager_btnNpcForceReborn");
	table1[9]=QFLanguage.GetText(">NpcManager_btnDeadLive");
	table1[10]=QFLanguage.GetText(">NpcManager_btnNpcKillCloud");
	table1[11]=QFLanguage.GetText(">NpcManager_btnNpcUpgradeStage");
	table1[12]=QFLanguage.GetText(">NpcManager_btnNpcObsessionMindFull");
	table1[13]=QFLanguage.GetText(">NpcManager_btnNpcRemoveObsession");
	table1[14]=QFLanguage.GetText(">NpcManager_btnNpcUpGradeObsessionMind");
	table1[15]=QFLanguage.GetText(">NpcManager_btnNPCGodCoreNpcAdd");
	table1[16]=QFLanguage.GetText(">NpcManager_btnNPCGodCoreNpcUpB");
	table1[17]=QFLanguage.GetText(">NpcManager_btnNPCGodCoreNpcDownB");
	table1[18]=QFLanguage.GetText(">NpcManager_btnNPCGodCoreNpcRemove");
	table1[19]=QFLanguage.GetText(">NpcManager_btnNPCRemoveBuildings");
	table1[20]=QFLanguage.GetText(">NpcManager_btnNPCUnlockBuildings");
	table1[21]=QFLanguage.GetText(">NpcManager_btnNPCFinishWish");
	table1[22]=QFLanguage.GetText(">NpcManager_btnNpcFullFive");
	table1[23]=QFLanguage.GetText(">NpcManager_btnNpcFullNeed");
	table1[24]=QFLanguage.GetText(">NpcManager_btnNpcEmptyNeed");
	table1[25]=QFLanguage.GetText(">NpcManager_btnFullHaoGan");
	table1[26]=QFLanguage.GetText(">NpcManager_btnZeroHaoGan");
	table1[27]=QFLanguage.GetText(">NpcManager_btnEmptyHaoGan");
	table1[28]=QFLanguage.GetText(">NpcManager_btnNoHaoGan");
	table1[29]=QFLanguage.GetText(">NpcManager_btnNpcRemoveResistance");
	table1[30]=QFLanguage.GetText(">NpcManager_btnRemoveMemeries");
	table1[31]=QFLanguage.GetText(">NpcManager_btnNpcToPuppet");
	table1[32]=QFLanguage.GetText(">NpcManager_btnNpcToZombie");
	table1[33]=QFLanguage.GetText(">NpcManager_btnNpcMakeElite");
	table1[34]=QFLanguage.GetText(">NpcManager_btnNpcToLS");
	table1[35]=QFLanguage.GetText(">NpcManager_btnNpcToLS2");
	table1[36]=QFLanguage.GetText(">NpcManager_btnNpcKZ");
	table1[37]=QFLanguage.GetText(">NpcManager_btnNPCBodyToHuman");
	table1[38]=QFLanguage.GetText(">NpcManager_btnNpcCantMove");
	table1[39]=QFLanguage.GetText(">NpcManager_btnNpcCantMove2");
	table1[40]=QFLanguage.GetText(">NpcManager_btnNPCXPCS");
	table1[41]=QFLanguage.GetText(">NpcManager_btnNPCCHDJ");
	table1[42]=QFLanguage.GetText(">NpcManager_btnNPCCHDJ2");
	table1[43]=QFLanguage.GetText(">NpcManager_btnNPCSetPostion");
	table1[44]=QFLanguage.GetText(">NpcManager_btnNpcAutoFishing");
	table1[45]=QFLanguage.GetText(">NpcManager_btnNpcMakeHorse");
	table1[46]=QFLanguage.GetText(">NpcManager_btnRmAllJH");
	table1[47]=QFLanguage.GetText(">NpcManager_btnGetAllJH");
	table1[48]=QFLanguage.GetText(">NpcManager_btnGetNowAllJH");
	table1[49]=QFLanguage.GetText(">NpcManager_btnNpcCloneNPC");
	table1[50]=QFLanguage.GetText(">NpcManager_btnNpcGetSave");
	table1[51]=QFLanguage.GetText(">NpcManager_btnNPCReWish");
	--table1[52]=QFLanguage.GetText(">NpcManager_btnNPCPacking");
	table1[53]=QFLanguage.GetText(">NpcManager_btnNPCGuardsUnlockAll");
	table1[54]=QFLanguage.GetText(">NpcManager_btnNPCGuardsReAll");
	table1[55]=QFLanguage.GetText(">NpcManager_btnNPCGuardsAddAll");

	
	table1=NpcManager.Word2;
	table1[1]=QFLanguage.GetText(">NpcManager_Tips1");
	table1[2]=QFLanguage.GetText(">NpcManager_Tips2");
	table1[3]=QFLanguage.GetText(">NpcManager_Tips3");
	table1[4]=QFLanguage.GetText(">NpcManager_Tips4");
	table1[5]=QFLanguage.GetText(">NpcManager_Tips5");
	table1[6]=QFLanguage.GetText(">NpcManager_Tips6");
	table1[7]=QFLanguage.GetText(">NpcManager_Tips7");
	table1[8]=QFLanguage.GetText(">NpcManager_Tips8");
	table1[9]=QFLanguage.GetText(">NpcManager_Tips9");
	table1[10]=QFLanguage.GetText(">NpcManager_Tips10");
	table1[11]=QFLanguage.GetText(">NpcManager_Tips11");
	table1[12]=QFLanguage.GetText(">NpcManager_Tips12");
	table1[13]=QFLanguage.GetText(">NpcManager_Tips13");
	table1[14]=QFLanguage.GetText(">NpcManager_Tips14");
	table1[15]=QFLanguage.GetText(">NpcManager_Tips15");
	table1[16]=QFLanguage.GetText(">NpcManager_Tips16");
	table1[17]=QFLanguage.GetText(">NpcManager_Tips17");
	table1[18]=QFLanguage.GetText(">NpcManager_Tips18");
	table1[19]=QFLanguage.GetText(">NpcManager_Tips19");
	table1[20]=QFLanguage.GetText(">NpcManager_Tips20");
	table1[21]=QFLanguage.GetText(">NpcManager_Tips21");
	table1[22]=QFLanguage.GetText(">NpcManager_Tips22");
	table1[23]=QFLanguage.GetText(">NpcManager_Tips23");
	table1[24]=QFLanguage.GetText(">NpcManager_Tips24");
	table1[25]=QFLanguage.GetText(">NpcManager_Tips25");
	table1[26]=QFLanguage.GetText(">NpcManager_Tips26");
	table1[27]=QFLanguage.GetText(">NpcManager_Tips27");
	table1[28]=QFLanguage.GetText(">NpcManager_Tips28");
	table1[29]=QFLanguage.GetText(">NpcManager_Tips29");
	table1[30]=QFLanguage.GetText(">NpcManager_Tips30");
	table1[31]=QFLanguage.GetText(">NpcManager_Tips31");
	table1[32]=QFLanguage.GetText(">NpcManager_Tips32");
	table1[33]=QFLanguage.GetText(">NpcManager_Tips33");
	table1[34]=QFLanguage.GetText(">NpcManager_Tips34");
	table1[35]=QFLanguage.GetText(">NpcManager_Tips35");
	table1[36]=QFLanguage.GetText(">NpcManager_Tips36");
	table1[37]=QFLanguage.GetText(">NpcManager_Tips37");
	table1[38]=QFLanguage.GetText(">NpcManager_Tips38");
	table1[39]=QFLanguage.GetText(">NpcManager_Tips39");
	table1[40]=QFLanguage.GetText(">NpcManager_Tips40");
	table1[41]=QFLanguage.GetText(">NpcManager_Tips41");
	table1[42]=QFLanguage.GetText(">NpcManager_Tips42");
	table1[43]=QFLanguage.GetText(">NpcManager_Tips43");
	table1[44]=QFLanguage.GetText(">NpcManager_Tips198");
	table1[45]=QFLanguage.GetText(">NpcManager_Tips201");
	table1[46]=QFLanguage.GetText(">NpcManager_Tips204");
	table1[47]=QFLanguage.GetText(">NpcManager_Tips207");
	table1[48]=QFLanguage.GetText(">NpcManager_Tips210");
	table1[49]=QFLanguage.GetText(">NpcManager_Tips213");
	table1[50]=QFLanguage.GetText(">NpcManager_Tips214");
	table1[51]=QFLanguage.GetText(">NpcManager_Tips221");
	--table1[52]=QFLanguage.GetText(">NpcManager_Tips222");
	table1[53]=QFLanguage.GetText(">NpcManager_Tips223");
	table1[54]=QFLanguage.GetText(">NpcManager_Tips224");
	table1[55]=QFLanguage.GetText(">NpcManager_Tips233");

end
function NpcManager:LoadNPCMgr(easyList)
	--print(easyList[1]:GetName())
	
	if easyList~=nil and easyList~={} then
		NpcManager:UpdateChildNpc(NpcManager.NpcListCOP,4,easyList);
	else
		NpcManager:GetAllAttributes();
		if NpcManager.listType==0 then
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips149");
			NpcManager:UpdateChildNpc(NpcManager.NpcListCOP,0);
		elseif NpcManager.listType==1 then
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips150");
			NpcManager:UpdateChildNpc(NpcManager.NpcListCOP,1);
		end
	end
	
	NpcManager.chooseNpcNum = tonumber(NpcManager.inputid1.m_title.text);
	if NpcManager.chooseNpcNum == nil then
		return;
	elseif NpcManager.chooseNpcNum ==0 then
		return;
	elseif NpcManager.chooseNpcNum > #NpcManager.NpcList then
		return;
	else
		NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum]);
		NpcManager.ShowLableNpc.text = QFLanguage.GetText(">NpcManager_Tips151")..": "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName();
		NpcManager.AttributeFlag =0;
	end
end
function NpcManager:ChosseFunc(num)
	NpcManager.FuncNum=tonumber(num);
	if NpcManager.FuncNum==nil then
		NpcManager.FuncNum=0;
	end
	if NpcManager.FuncNum>0 then
		NpcManager.FuncNumOld=NpcManager.FuncNum;
	end
	if NpcManager.FuncNum==1 then
		NpcManager:ShowNpcAllBuffList(NpcManager.NpcListCOP);
		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips145");
	elseif NpcManager.FuncNum==2 then
		NpcManager:ShowNpcAllFeature(NpcManager.NpcListCOP);
		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips146");
	elseif NpcManager.FuncNum==3 then
		NpcManager:ShowNpcAllExperience(NpcManager.NpcListCOP);
		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips147");
	elseif NpcManager.FuncNum==4 then
		NpcManager:ShowNpcAllMood(NpcManager.NpcListCOP);
		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips148");
	
	end
	NpcManager:ShowObjsName(NpcManager.FuncNum);
end
function NpcManager:ShowObjsName(num)
	NpcManager.FuncNum=tonumber(num);
	if NpcManager.FuncNum==nil then
		NpcManager.FuncNum=0;
	end
	if NpcManager.FuncNum==1 then
		NpcManager.SLab0.text=QFLanguage.GetText(">NpcManager_Tips130")..": Modifier(Buff)";
		NpcManager.SLab1.text=QFLanguage.GetText(">NpcManager_Tips131");
		NpcManager.SBtn1.text=QFLanguage.GetText(">NpcManager_Tips132");
		NpcManager.SBtn2.text=QFLanguage.GetText(">NpcManager_Tips133");
		NpcManager.SBtn3.text=QFLanguage.GetText(">NpcManager_Tips143");
	elseif NpcManager.FuncNum==2 then
		NpcManager.SLab0.text=QFLanguage.GetText(">NpcManager_Tips130")..": Feature(特性)";
		NpcManager.SLab1.text=QFLanguage.GetText(">NpcManager_Tips134");
		NpcManager.SBtn1.text=QFLanguage.GetText(">NpcManager_Tips135");
		NpcManager.SBtn2.text=QFLanguage.GetText(">NpcManager_Tips136");
		NpcManager.SBtn3.text=QFLanguage.GetText(">NpcManager_Tips143");
	elseif NpcManager.FuncNum==3 then
		NpcManager.SLab0.text=QFLanguage.GetText(">NpcManager_Tips130")..": Experience(经历)";
		NpcManager.SLab1.text=QFLanguage.GetText(">NpcManager_Tips137");
		NpcManager.SBtn1.text=QFLanguage.GetText(">NpcManager_Tips138");
		NpcManager.SBtn2.text=QFLanguage.GetText(">NpcManager_Tips139");
		NpcManager.SBtn3.text=QFLanguage.GetText(">NpcManager_Tips143");
	elseif NpcManager.FuncNum==4 then
		NpcManager.SLab0.text=QFLanguage.GetText(">NpcManager_Tips130")..": Mood(心情)";
		NpcManager.SLab1.text=QFLanguage.GetText(">NpcManager_Tips140");
		NpcManager.SBtn1.text=QFLanguage.GetText(">NpcManager_Tips141");
		NpcManager.SBtn2.text=QFLanguage.GetText(">NpcManager_Tips142");
		NpcManager.SBtn3.text=QFLanguage.GetText(">NpcManager_Tips143");
	else
		NpcManager.SLab0.text=QFLanguage.GetText(">NpcManager_Tips130")..": "..QFLanguage.GetText(">NpcManager_Tips144");
	end
end
function NpcManager:NPCToHorse()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if NpcManager.NpcMakeHorse~=nil then
		QFObj=npc;
		QFStr="2";
		QFStr2="1";
		local item=NpcManager.NpcMakeHorse:Invoke();
		if item~=nil then
			return true,item;
		end
	end
	return false;
end
function NpcManager:NPCIsFishing()
	--print("true1")
	if NpcManager.NPCGetAndSetFishing==nil then
		return false;
	end
	--print("true2")
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.JobEngine==nil or npc.JobEngine.CurJob==nil or npc.JobEngine.CurJob.jobdef==nil then
		return false;
	else
		QFObj=npc;
		--print(tostring(npc.JobEngine.CurJob.jobdef.Name))
		if npc.JobEngine.CurJob.jobdef.Name=="JobGoFishing" then
			return true;
		end
	end
	return false;
end
function NpcManager:NPCAutoFishing()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or (not NpcManager:NPCIsFishing()) then
		return false;
	end
	QFObj=npc;
	return NpcManager.NPCGetAndSetFishing:Invoke();
end
function NpcManager:NPCFinishWish(ntype)
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		local k,v;
		local list=NgodP.mapGodWishes;
		if list==nil then
			return false;
		end
		if ntype==nil then
			local list2={};
			local num=1;
			for k, v in pairs(list) do
				if v~= nil and v[0]~=nil then
					list2[num]=v[0];
					num=num+1;
				end
			end
			for k, v in pairs(list2) do
				if v~= nil then
					NgodP:FinishWish(v);
				end
			end
		else
			list:Clear();
		end
		return true;
	end
	return false;
end
function NpcManager:GetAKeyAroundMouse()
	local key,bool=NpcManager:GetMouseKey();
	local lkey;
	if bool and key>1 then
		lkey,bool=NpcManager:GetAFreeKey(key);
	end
	if bool then
		return lkey,true;
	else
		return 2,false;
	end
end
function NpcManager:GetMouseKey()
	if CS.UI_WorldLayer==nil or CS.UI_WorldLayer.Instance==nil then
		return 2,false;
	end
	-- local Cam = CS.MapCamera.Instance;
	-- --local world=CS.XiaWorld.WorldMgr.Instance.curWorld.Key2Position(key);
	-- local world=CS.XiaWorld.WorldMgr.Instance.curWorld;
	-- if Cam==nil or world==nil then
		-- return 2,false;
	-- end
	-- local pos=Cam.transform.position;
	-- if pos==nil then
		-- return 2,false;
	-- end
	-- --local x=math.floor(pos.x);
	-- --local y=math.floor(pos.y);
	local key=CS.UI_WorldLayer.Instance.MouseGridKey;
	--print(key)--x," ",y," ",
	return key,true;
end
function NpcManager:GetAFreeKey(key)
	if CS.XiaWorld.World==nil or CS.XiaWorld.World.Instance==nil or CS.XiaWorld.World.Instance.map==nil then
		return 2,false;
	end
	local MAP=CS.XiaWorld.World.Instance.map;
	local lkey=MAP:GetFreeKey(key, 192,false);
	return lkey,true;
end
function NpcManager:NpcGetSave()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc==nil then
		return false;
	end
	if CS.XiaWorld.RPGMapMgr~=nil then
		local RPGMgr=CS.XiaWorld.RPGMapMgr.Instance;
		local str=RPGMgr:GetNpcPackString(npc);
		QFWDIOLib.stringTableOutFore[1]="QFWDModifiersWrite";
		QFWDIOLib.stringTableOutFore[2]="6";
		local a;
		local Camp=npc.Camp;
		QFWDIOLib.stringTableOutFore[3]="2";
		for a=1,#QFWDlib.FightCamp do
			if Camp==QFWDlib.FightCamp[a] then
				QFWDIOLib.stringTableOutFore[3]=tostring(a);
			end
		end
		QFWDIOLib.stringTableOutFore[4]=tostring(npc:GetName());
		QFWDIOLib.stringTableOut={str};
		QFWDIOLib.outFile=QFWDModifierMainUI:GetPath().."//QFWDModifiersSave//"..tostring("NPCSave")..".txt";;
		if ModifierMain.lib~=nil then
			local func=ModifierMain.lib:GetMethod("SaveStringToFile");
			if func~=nil then
				QFStr=QFWDIOLib:GetWriteFileLineStr();
				QFStr2=QFWDIOLib.outFile;
				if QFStr ~=nil and QFStr2~=nil then
					local num=func:Invoke();
					if num==0 then
						print("Dll output file: "..QFWDIOLib.outFile);
						return true;
					else
						print("Lua output file: "..QFWDIOLib.outFile);
						return QFWDIOLib:writeFileLine();
					end
				else
					return false;
				end
			end
		else
			print("Lua output file: "..QFWDIOLib.outFile);
			return QFWDIOLib:writeFileLine();
		end
	end
	return false;
end
function NpcManager:NpcInteSaveP()
	return NpcManager:NpcInteSave(2);
end
function NpcManager:NpcInteSave(Camp)
	if CS.XiaWorld.RPGMapMgr~=nil then
		local RPGMgr=CS.XiaWorld.RPGMapMgr.Instance;
		
		QFWDIOLib.loadFile=QFWDModifierMainUI:GetPath().."//QFWDModifiersSave//"..tostring("NPCSave")..".txt";;
		local str=nil;
		if ModifierMain.lib~=nil then
			local func=ModifierMain.lib:GetMethod("LoadFileToStringD");
			if func~=nil then
				QFStr=QFWDIOLib.loadFile;
				str=func:Invoke();
				print("Dll load file: "..QFWDIOLib.loadFile);
			end
		end
		if QFWDIOLib:ReadMyFile(str)~=true then
			return false;
		end
		str=QFWDIOLib.stringTableIn[1];
		
		if str~=nil then
			--print(tostring(QFWDIOLib.stringTableOutFore[3]),"\n",tostring(QFWDIOLib.stringTableOutFore[4]));
			if tonumber(Camp)~=nil then
				return NpcManager:NpcMakeByString(str,tonumber(Camp),NpcManager:GetAKeyAroundMouse()),tostring(QFWDIOLib.stringTableOutFore[4]);
			else
				return NpcManager:NpcMakeByString(str,tonumber(QFWDIOLib.stringTableOutFore[3]),NpcManager:GetAKeyAroundMouse()),tostring(QFWDIOLib.stringTableOutFore[4]);
			end
		end
	end
	return false;
end
function NpcManager:NpcCloneNPCS()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc==nil then
		return false;
	end
	if CS.XiaWorld.RPGMapMgr~=nil then
		local RPGMgr=CS.XiaWorld.RPGMapMgr.Instance;
		local str=RPGMgr:GetNpcPackString(npc);
		return NpcManager:NpcMakeByString(str,npc.Camp,npc.Key,1);
	end
	return false;
end
function NpcManager:NpcMakeByString(str,camp,key,types)
	if str==nil then
		return false;
	end
	if tonumber(key)==nil then
		key=2;
	end
	
	if CS.XiaWorld.RPGMapMgr~=nil then
		local RPGMgr=CS.XiaWorld.RPGMapMgr.Instance;
		local nnpc=RPGMgr:ImportNpc(key,str);
		if nnpc==nil then
			return false;
		end
		if types==1 then
			nnpc:SetCamp(camp,true);
		else
			if camp==nil then
				camp=2;
			end
			NpcManager:SetCampPlus(nnpc,camp,1);
		end
		return true;
	else
		return false;
	end
end
function NpcManager:NPCBodyRmAllJH()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.Body then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.BodyPracticeData;
		if NgodP.QuenchingMaterial~=nil then
			NgodP.QuenchingMaterial:Clear();
		end
		return true;
	end
	return false;
end
function NpcManager:GetAllBodyJH()
	local _,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2);
	local num=1;
	local localKey=nil;
	local localValue=nil;
	QFWDlib.AllBodyJH={};
	for localKey, localValue in pairs(MapListDef) do 
		local thingDef = localValue;
		if thingDef ~= nil and thingDef.Name~=nil and thingDef.Parent=="Item_BodyPracticeBase" then
			QFWDlib.AllBodyJH[num] = thingDef.Name;
			-- if thingDef.ThingName ~= nil then
				-- QFWDlib.AllThingItemsTrueDisplayName[num] = thingDef.ThingName;
				-- --print(thingDef.ThingName);
			-- end
			num = num + 1;
		end
	end
	NpcManager.IsGetAllBodyJH=true;
end
function NpcManager:NPCBodyAddAllJH()
	if NpcManager.IsGetAllBodyJH~=true then
		NpcManager:GetAllBodyJH();
	end
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.Body then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.BodyPracticeData;
		if type(QFWDlib.AllBodyJH)=="table" then
			--NpcManager:NPCBodyRmAllJH();
			local k,v;
			if NgodP.QuenchingMaterial~=nil then
				NpcManager:NPCBodyAddNowAllJH();
			end
			for k, v in pairs(QFWDlib.AllBodyJH) do
				if v~= nil then
					if k==1 then
						NgodP:AddQuenchingItem(v,9999);
					else
						if NgodP.QuenchingMaterial~=nil then
							if NgodP.QuenchingMaterial:ContainsKey(v) then
								--NgodP.QuenchingMaterial[v]=9999;
								NgodP.QuenchingMaterial:Remove(v);
								NgodP.QuenchingMaterial:Add(v,9999);
							else
								NgodP.QuenchingMaterial:Add(v,9999);
							end
						else
							NgodP:AddQuenchingItem(v,9999);
						end
					end
				end
			end
			
			return true;
		end
	end
	return false;
end
function NpcManager:NPCBodyAddNowAllJH()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.Body then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.BodyPracticeData;
		if NgodP.QuenchingMaterial~=nil then
			local llist={};
			local num=0;
			local k,v;
			for k,v in pairs(NgodP.QuenchingMaterial) do
				if k~=nil and v~= nil then
					num=num+1;
					llist[num]=tostring(k);
					--NgodP.QuenchingMaterial[k]=9999;
				end
			end
			for k,v in pairs(llist) do
				if v~= nil then
					NgodP.QuenchingMaterial:Remove(v);
					NgodP.QuenchingMaterial:Add(v,9999);
				end
			end
		end
		return true;
	end
	return false;
end
function NpcManager:NPCGodCoreNpcUpB()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		if NgodP.lisCoreBelievers~=nil then
			local k,v;
			for k, v in pairs(NgodP.lisCoreBelievers) do
				if v~= nil and v.belive~=nil then
					v.belive=v.belive+0.1;
				end
			end
		end
		return true;
	end
	return false;
end
function NpcManager:NPCGodCoreNpcDownB()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		if NgodP.lisCoreBelievers~=nil then
			local removeList={};
			local num=0;
			local k,v;
			for k, v in pairs(NgodP.lisCoreBelievers) do
				if v~= nil and v.belive~=nil then
					v.belive=v.belive-0.1;
					if v.belive<=0 then
						num=num+1;
						removeList[num]=v;
					end
				end
			end
			if num>0 then
				for k, v in pairs(removeList) do
					if v~= nil then
						NgodP.lisCoreBelievers:Remove(v);
					end
				end
			end
		end
		return true;
	end
	return false;
end
function NpcManager:NPCGodCoreNpcAdd()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		local namelist={""};
		local k,v;
		local num=0;
		if NgodP.lisCoreBelievers~=nil then
			for k, v in pairs(NgodP.lisCoreBelievers) do
				if v~= nil then
					num=num+1;
					namelist[num]=tostring(v.name);
				end
			end
		end
		local NpcLists=Map.Things:GetActiveNpcs();
		if NpcLists~=nil then
			local name;
			for k, v in pairs(NpcLists) do
				if v~= nil then
					name=tostring(v:GetName());
					if v.IsPlayerThing==false and NpcManager:CheckNoRepeat(name,namelist) then
						NgodP:AddCoreBeliever(v, 1);
					end
				end
			end
		end
		return true;
	end
	return false;
end
function NpcManager:CheckNoRepeat(name,tables)
	if tables==nil or tables=={} then
		return true;
	end
	local k,v;
	for k, v in pairs(tables) do
		if v== name then
			return false;
		end
	end
	return true;
end
function NpcManager:NPCGodCoreNpcRemove()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		if NgodP.lisCoreBelievers~=nil then
			NgodP.lisCoreBelievers:Clear();
			return true;
		end
		
	end
	return false;
end
function NpcManager:NPCRemoveBuildings()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		NgodP:RemoveAllBuilding();
		return true;
	end
	return false;
end
function NpcManager:NPCUnlockBuildings()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	if CS.XiaWorld.PracticeMgr==nil or CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs==nil then
		return false;
	end
	local list=CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs;
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		local k,v;
		for k, v in pairs(list) do
			if v~= nil and k~=nil and k~="" then
				NgodP:UnLockBuilding(k, false);
			end
		end
		
		return true;
	end
	return false;
end
function NpcManager:NPCUseGuards()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	--if CS.XiaWorld.PracticeMgr==nil or CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs==nil then
		--return false;
	--end
	
	--local list=CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs;
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		local list=NgodP.GodGuards;
		if list~=nil then
			local k,v;
			for k, v in pairs(list) do
				if v~= nil and v.used~=nil then
					--NgodP:UnLockBuilding(k, false);
					v.used=1;
				end
			end
			return true;
		end
	end
	return false;
end
function NpcManager:NPCNoUseGuards()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	--if CS.XiaWorld.PracticeMgr==nil or CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs==nil then
		--return false;
	--end
	
	--local list=CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs;
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		local list=NgodP.GodGuards;
		if list~=nil then
			local k,v;
			for k, v in pairs(list) do
				if v~= nil and v.used~=nil then
					--NgodP:UnLockBuilding(k, false);
					v.used=0;
				end
			end
			return true;
		end
	end
	return false;
end
function NpcManager:NPCGuardsReAll()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false;
	end
	--if CS.XiaWorld.PracticeMgr==nil or CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs==nil then
		--return false;
	--end
	
	--local list=CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs;
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		local list=NgodP.GodGuards;
		if list~=nil then
			list:Clear();
			return true;
		end
		
	end
	return false;
end
function NpcManager:NPCGuardsUnlockAll(ntype)
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God or ModifierMain.lib==nil then
		return false;
	end
	if CS.XiaWorld.PracticeMgr==nil or CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs==nil then
		return false;
	end
	
	--local list=CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs;
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData;
		local func=ModifierMain.lib:GetMethod("GetGodGuardDef");
		local list=func:Invoke();
		local list2=NgodP.GodGuards;
		if list~=nil then
			local k,v;
			local num;
			if list2~=nil then
				num=list2.Count;
			end
			if num==nil then
				num=0;
			end
			if ntype==nil then
				for k, v in pairs(list) do
					if v~= nil and k~=nil and k~="GodGuard_SYSLOST" then
						num=num+1;
						NgodP:UnLockGodGuard(k, false, "NO."..tostring(num),true);
					end
				end
			else
				for k, v in pairs(list) do
					if v~= nil and k~=nil and k~="GodGuard_SYSLOST" then
						num=num+1;
						NgodP:UnLockGodGuard(k, false, "NO."..tostring(num),false);
					end
				end
			end
			return true;
		end
	end
	return false;
end
function NpcManager:NPCChangeRace(race)
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or ModifierMain.lib==nil then
		return nil;
	end
	local lsData=npc.AnimalHumanFrom;
	local num=-10;
	local num2=-10;
	if lsData~=nil then
		num=lsData.state;
		num2=lsData.bodyType;
	end
	QFObj=npc;
	local rank=npc.Rank;
	--QFStr=tostring(ThingManager.input18.m_title.text);
	QFStr=tostring(race);
	local func=ModifierMain.lib:GetMethod("NpcChangeRace");
	local npcs=func:Invoke();
	if npcs==nil then
		return npc;
	end
	lsData=npcs.AnimalHumanFrom;
	if lsData~=nil then
		if num~=-10 then
			lsData.state=num;
		end
		if num2~=-10 then
			lsData.bodyType=num2;
		end
	end
	--npc:InitBehaviour();
	
	return npcs;
end
function NpcManager:NPCBodyToHuman()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.Race==nil then
		return 0;
	end
	local lsData=npc.AnimalHumanFrom;
	if lsData~=nil then
		--lsData.bodyType =2;
		if lsData.state~=2 then
			lsData.state=2;
			return 1;
		else
			return -1;
		end
		
	else
		return 0;
	end
end
function NpcManager:NPCSetPostion()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil then
		return false;
	end
	local key=Map:GetRandomGrid(npc.Key, Map.Size, 0, true);
	if key<1 or key>Map.Size*Map.Size then
		return false;
	else
		npc:SetPostion(key, true);
		if NpcManager.CheckBox1.selected then
			local lkey=npc.Key;
			if lkey==nil then
				lkey = 1;
				NpcManager.CheckBox1.selected=false;
			end
			--npc.
			CS.MapCamera.Instance:LookKey(lkey);
		end
	end
	return true;
end
function NpcManager:NPCXPCS()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil then
		return false;
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		npcPractice=npc.PropertyMgr.Practice;
		local name="nilGong";
		npcPractice:ChangeGong(name);
	end
	CS.XiaWorld.NpcMgr.Instance:RebornNpc(npc, true,0);
	return true;
end
function NpcManager:NpcKZ()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.Race==nil or npc.A2H~=nil then
		return false;
	end
	npc:QiZhi(nil);
	return true;
end
function NpcManager:NpcMakeElite()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil or npc.Race==nil or npc.Race.JYRace==nil or npc.Race.JYRace=="" then
		return false;
	end
	npc:MakeEliteEnemyFromSelf();
	return true;
end
function NpcManager:NpcFullFive()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil then
		return false;
	end
	if npc.PropertyMgr.BaseData~=nil then
		local Bdata=npc.PropertyMgr.BaseData;
		local y=1;
		for y=1,5 do
			Bdata:SetBaseValue(QFWDlib.BasePropertyType[y],200);
		end
		return true;
	else
		return false;
	end
end
--function NpcManager:CloneNPC()
--	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
--	if npc == nil then
--		return false;
--	end
--	local npc2=nil;
--	local ReincarnateData=CS.XiaWorld.ReincarnateData();
--	ReincarnateData.Age = npc.Age;
--	ReincarnateData.Beard = npc.Beard;
--	ReincarnateData.BodyColor = npc.BodyColor;
--	ReincarnateData.BodyType = npc.BodyType;
--	ReincarnateData.ClothesStuff = "";
--	ReincarnateData.Desc = "";
--	ReincarnateData.FristName = npc.PropertyMgr.SuffixName;
--	ReincarnateData.Hair = npc.HairID;
--	ReincarnateData.Bahen = npc.BahenID;
--	ReincarnateData.Beard = npc.BeardID;
--	ReincarnateData.Ear = npc.EarID;
--	ReincarnateData.Eyebrows = npc.EyebrowsID;
--	ReincarnateData.Shipin = npc.ShipinID;
--	ReincarnateData.Yinji = npc.YinjiID;
--	ReincarnateData.REyes = npc.REyesID;
--	ReincarnateData.LEyes = npc.LEyesID;
--	ReincarnateData.Mouth = npc.MouthID;
--	ReincarnateData.Nose = npc.NoseID;
--	ReincarnateData.IsHide = 1;
--	ReincarnateData.LastName =  npc.PropertyMgr.PrefixName;
--	ReincarnateData.Sex = npc.Sex;
--	ReincarnateData.Race = npc.Race.Name;
--	local LH=ReincarnateData;
--	if LH==nil then
--		return false;
--	end
--	--print(tostring(LH.Race),LH.LastName,LH.FristName)
--	--local npc = CS.XiaWorld.NpcRandomMechine.MakeReincarnateNpc(num);
--	local vx=CS.UnityEngine.Vector2(0,0);
--	local race=LH.Race;
--	if race==nil then
--		race = "Human";
--	end
--	local npc2 = CS.XiaWorld.NpcRandomMechine.RandomNpc(race, LH.Sex, 0, vx, LH.LastName, LH.FristName, true, 0, LH);
--	CS.XiaWorld.NpcMgr.Instance:AddNpc(npc2,npc.Key,Map,npc.Camp);
--	CS.XiaWorld.ThingMgr.Instance:EquptNpc(npc2, 0, QFWDlib.NpcRichLable[5], false, true, 0, 0, false, false);
--	npc2:ChangeRank(npc.Rank);
--	--npc2 = CS.XiaWorld.NpcRandomMechine.MakeReincarnateNpc(666);
--	--npc2=ThingMgr:AddNpc(npc.Race.Name, npc.Key, Map, npc.Camp);
--	--CS.XiaWorld.NpcMgr.Instance:AddNpc(npc2,npc.Key,Map,npc.Camp);
--	--npc2:ChangeRank(npc.Rank);
--	
--	local save = npc:GetSaveData();
--	CS.XiaWorld.WorldMgr.Instance.IsLoading=true;
--	npc2:LoadSaveData(save);
--	CS.XiaWorld.WorldMgr.Instance.IsLoading=false;
--	local SaveBeCloneNpc = npc.PropertyMgr:GetSaveData();
--	npc2.PropertyMgr:LoadSaveData(SaveBeCloneNpc);
--	npc2.PropertyMgr.Age = npc.PropertyMgr.Age;
--	
--	npc2.MemeriesList = npc.MemeriesList;
--	npc2.PropertyMgr.BanJobMap=npc.PropertyMgr.BanJobMap;
--	npc2.PropertyMgr.BackStory = npc.PropertyMgr.BackStory;
--	npc2.PropertyMgr.FeatureList = npc.PropertyMgr.FeatureList;
--	npc2.PropertyMgr.BaseData=npc.PropertyMgr.BaseData;
--	npc2.PropertyMgr.ExperienceList=npc.PropertyMgr.ExperienceList;
--	npc2.PropertyMgr.BodyData:AfterLoad(SaveBeCloneNpc);
--	npc2.PropertyMgr.MoodData:AfterLoad(SaveBeCloneNpc);
--	npc2:RestHp();
--	npc2.view.needUpdateMod = true;
--	return true;
--end
function NpcManager:NPCCHDJ()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc ~=nil and npc.PropertyMgr~=nil then
		if npc.PropertyMgr:HasModifier("SysPracticeDie") then
			npc:RemoveModifier("SysPracticeDie");
		else
			npc:AddModifier("SysPracticeDie", 1, false, 1, 0, false, -1);
		end
		return true;
	end
	return false;
end
function NpcManager:NpcToLS()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc ~=nil  then
		if npc.IsLingShou==false then
			CS.XiaWorld.LingShouMgr.Instance:BuildTreeToNpc(npc, false, "Tree2");
		else
			npc.LsInfo=nil;
			if npc.JobEngine~=nil then
				npc.JobEngine:ClearJob();
				npc.JobEngine.SearchTree=nil;
			end
			npc:InitBehaviour();
		end
		
		return true;
	end
	return false;
end
function NpcManager:RemoveNPC()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc ~=nil then
		ThingMgr:RemoveThing(npc,true, true);
		return true;
	end
	return false;
end
function NpcManager:NpcCantMove()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.LockMove then
		npc.LockMove=false;
		return false;
	else
		npc.LockMove=true;
		return true;
	end
	
end
function NpcManager:RemoveMemeries()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.MemeriesList~=nil then
		npc.MemeriesList:Clear();
		if npc.MemeryList~=nil then
			npc.MemeryList:Clear();
		end
		return true;
	end
	return false;
end
function NpcManager:RemoveResistance()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.ElixirFesistance~=nil then
		npc.ElixirFesistance:Clear();
		return true;
	end
	return false;
end
function NpcManager:EmptyNeed()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local k,v;
	if npc.Needs~=nil then
		if npc.Needs.m_mapNeeds~=nil then
			local needList=npc.Needs.m_mapNeeds;
			for k, v in pairs(needList) do
				if v~= nil then
					local maxValue = v.MinValue;
					if v.MinValue~=nil then
						v:ChangeValue(v.MinValue,0);
					end
				end
				--print(tostring(maxValue.y))
				--NpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(v));
			end
			npc:AddLing(-npc.LingV, 0);
			return true;
		end
	end
	return false;
end
function NpcManager:NpcFullNeed()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	--npc.view.ViewCamera.orthographic=false;
	local k,v;
	if npc.A2H~=nil and npc.A2H.QiZhiPassTime~=nil then
		if npc.A2H.QiZhiPassTime<1000 then
			npc.A2H.QiZhiPassTime=1000;
		end
	end
	if npc.Needs~=nil then
		if npc.Needs.m_mapNeeds~=nil then
			local needList=npc.Needs.m_mapNeeds;
			local num=1;
			for k, v in pairs(needList) do
				if v~= nil and v.NeedType~=QFWDlib.NeedTypes[9] and v.NeedType~=QFWDlib.NeedTypes[8] and v.NeedType~=QFWDlib.NeedTypes[7] then
					local maxValue = v.MaxValue;
					if v.MaxValue~=nil then
						v:ChangeValue(v.MaxValue,0);
					end
				end
				num=num+1;
				--print(tostring(maxValue.y))
				--NpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(v));
			end
			npc:AddLing(npc.MaxLing-npc.LingV, 0);
			
			return true;
		end
	end
	return false;
end
function NpcManager:NpcBreakNeck()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.PropertyMgr~=nil then
		if npc.PropertyMgr.Practice~=nil then
			local np=npc.PropertyMgr.Practice;
			if np.CurNeck~=nil then
				np:BrokenNeck(false);
				return true;
			else
				if np.NextNeck==nil or np.NextNeck.Location==nil or np.CurStage==nil or np.CurStage.Value==nil or np.StageValue==nil then
					return false;
				end
				local num=tostring(np.NextNeck.Location)*tostring(np.CurStage.Value)-np.StageValue;
				np:AddPractice(num,true);
				if np.CurNeck~=nil then
					np:BrokenNeck(false);
					return true;
				else
					return false;
				end
			end
		end
	end
	return false;
end
function NpcManager:KillCloud()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			if npc.PropertyMgr.Practice:HaveCloud() then
				npc.PropertyMgr.Practice:KillCloud();
				return true;
			end
		end
	end
	return false;
end
function NpcManager:NpcNoClothes()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	npc.Equip:UnEquipAll();
	return true;
end
function NpcManager:NpcReborn()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.PropertyMgr ~= nil then
		-- if npc.ElixirFesistance~=nil then
			-- npc.ElixirFesistance:Clear();
		-- end
		-- if npc.PropertyMgr.Practice~=nil then
			-- npc.PropertyMgr.Practice:Reborn();
		-- end
		if npc.PropertyMgr.BodyData~=nil and npc.PropertyMgr.BodyData.RemovedParts then
			--npc.PropertyMgr.BodyData:BuildBody();
			local localKey=nil;
			local localValue=nil;
			local badBodyPart=npc.PropertyMgr.BodyData.RemovedParts;
			if badBodyPart==nil or badBodyPart=={} then
				return false;
			end
			--npc.PropertyMgr.BodyData:Revive2PuppetBody();
			npc.PropertyMgr.BodyData:BuildBody()
			-- for localKey, localValue in pairs(badBodyPart) do
				-- if localValue~=nil then
					-- -- if localValue.Parent==nil then
						-- npc.PropertyMgr.BodyData:RevivePart(localValue);
					-- -- else
						-- -- -- if localValue.Parent.def~=nil and localValue.Parent.def.Name~=nil then
							-- -- -- local partName=localValue.Parent.def.Name;
							-- -- -- npc.PropertyMgr.BodyData:CutPart(localValue.Parent, false, nil);
						-- -- if localValue.Parent.Parent==nil then
							-- -- npc.PropertyMgr.BodyData:RevivePart(localValue.Parent);
						-- -- else
							-- -- npc.PropertyMgr.BodyData:RevivePart(localValue.Parent.Parent);
							-- -- --print(localValue.Root.def.Name)
							-- -- --badBodyPart:Remove(localValue);
						-- -- --end
						-- -- end
					-- -- end
					-- if localValue.Integrity~=nil and localValue.Integrity<1 then
						-- localValue.Integrity=1;
						-- --npc.PropertyMgr.BodyData.DamageParts:Remove(localValue);
						-- if localValue.Damages~=nil then
							-- localValue.Damages:Clear();
						-- end
					-- end
				-- end
			--end
			badBodyPart:Clear();
			return true;
		end
		return false;
	end
	return false;
end
function NpcManager:NpcUpGradeObsessionMind()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			local num=0;
			for num=0,7 do
				--local value= npc.PropertyMgr.Practice:GetObsessionMindData(num);
				--if value~=nil and value~={} and tonumber(value[2])~=nil then
					npc.PropertyMgr.Practice:AddObsessionMindValue(num,21600);
					npc.PropertyMgr.Practice:UpGradeObsessionMind(num);
					npc.PropertyMgr.Practice:ClearObsessionMind();
				--end
			end
			return true;
		end
	end
	return false;
end
function NpcManager:NpcObsessionMindFull()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			local num=0;
			for num=0,7 do
				--local value= npc.PropertyMgr.Practice:GetObsessionMindData(num);
				
					npc.PropertyMgr.Practice:AddObsessionMindValue(num,21600);
					--npc.PropertyMgr.Practice:UpGradeObsessionMind(num);
				
			end
			return true;
		end
	end
	return false;
end
function NpcManager:NpcRemoveObsession()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			npc.PropertyMgr.Practice:ClearObsessionMind();
			return true;
		end
	end
	return false;
end
function NpcManager:NpcUpgradeStage()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			npc.PropertyMgr.Practice:UpgradeStage(false);
			return true;
		end
	end
	return false;
end
function NpcManager:ThunderKill()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	World.map:StrikePoint(npc.Key, 340282300000000, 0.3);
	npc:AddDamage("TheWholeBody", "Jin_ThunderDamage", 10, false);
	npc:AddMood("ThunderDisaster3",QFLanguage.GetText(">NpcManager_Tips129"));
	--npc:AddModifier("SysPracticeDie", 1, false, 1, 0, false, -1);
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			npc.PropertyMgr.BodyData.WaitDead=true;
			npc.PropertyMgr.BodyData.Dead=true;
			
		-- npc.PropertyMgr.Practice:ThunderKill();
		-- return true;
		end
	end
	return true;
end
function NpcManager:HealthyBody()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	-- local save=npc.GetSaveData();
	-- local txt=CS.Newtonsoft.Json.JsonConvert.SerializeObject(save, CS.GameWatch.JsonSetting);
	-- print(tostring(txt));
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			npc.PropertyMgr.BodyData:RemoveAllDamange();
			npc:RestHp();
			--npc.PropertyMgr.BodyData:BuildBody();
			return true;
		end
	end
	return false;
end
function NpcManager:KillNoCause()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	npc:DoDeath();
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			npc.PropertyMgr.BodyData.WaitDead=true;
			npc.PropertyMgr.BodyData.Dead=true;
		end
	end
	return true;
end
function NpcManager:NpcToPuppet()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	NpcManager:KillNoCause();
	npc:Change2Puppet();
	return true;
end
function NpcManager:NpcToZombie()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	NpcManager:KillNoCause();
	npc:Change2Zombie();
	return true;
end
function NpcManager:FullHaoGan()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local relation={};
	if npc.PropertyMgr~=nil and npc.PropertyMgr.RelationData~=nil and npc.PropertyMgr.RelationData.m_mapRelations~=nil then
		relation=npc.PropertyMgr.RelationData.m_mapRelations;
		if relation=={} then
			return false;
		end
		local localKey=nil;
		local localValue=nil;
		for localKey, localValue in pairs(relation) do
			if localValue~=nil then
				localValue.BaseValue=100;
				localValue.CurValue=100;
			end
		end
	end
	return true;
end
function NpcManager:ZeroHaoGan()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local relation={};
	if npc.PropertyMgr~=nil and npc.PropertyMgr.RelationData~=nil and npc.PropertyMgr.RelationData.m_mapRelations~=nil then
		relation=npc.PropertyMgr.RelationData.m_mapRelations;
		if relation=={} then
			return false;
		end
		local localKey=nil;
		local localValue=nil;
		for localKey, localValue in pairs(relation) do
			if localValue~=nil then
				localValue.BaseValue=0;
				localValue.CurValue=0;
			end
		end
	end
	return true;
end
function NpcManager:NoHaoGan()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local relation={};
	if npc.PropertyMgr~=nil and npc.PropertyMgr.RelationData~=nil and npc.PropertyMgr.RelationData.m_mapRelations~=nil then
		relation=npc.PropertyMgr.RelationData.m_mapRelations;
		if relation=={} then
			return false;
		end
		relation:Clear();
	end
	return true;
end
function NpcManager:EmptyHaoGan()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local relation={};
	if npc.PropertyMgr~=nil and npc.PropertyMgr.RelationData~=nil and npc.PropertyMgr.RelationData.m_mapRelations~=nil then
		relation=npc.PropertyMgr.RelationData.m_mapRelations;
		if relation=={} then
			return false;
		end
		local localKey=nil;
		local localValue=nil;
		for localKey, localValue in pairs(relation) do
			if localValue~=nil then
				localValue.BaseValue=-100;
				localValue.CurValue=-100;
			end
		end
	end
	return true;
end
function NpcManager:NpcRebornML()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			--npc:Reborn(npc, true);
			npc.PropertyMgr:Reborn(npc);
			npc.PropertyMgr.BodyData.Dead=false;
			npc.PropertyMgr.BodyData.WaitDead=false;
			npc:RestHp();
			if npc.view ~= nil and npc.view.needUpdateMod ~=nil then
				npc.view.needUpdateMod = true;
			end
			return true;
		end
	end
	return false;
end
function NpcManager:NpcForceReborn()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	-- if npc.ElixirFesistance~=nil then
		-- npc.ElixirFesistance.Clear();
	-- end
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			local NPB=npc.PropertyMgr.BodyData;
			--npc:Reborn(npc, true);
			npc.BodyZombie=false;
			npc.BodyPuppet=false;
			if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOSOUL) then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOSOUL);
			end
			if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_SeachSoul) then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_SeachSoul);
			end
			--npc.PropertyMgr:Reborn(npc);
			NPB.WaitDead=false;
			NPB.Dead=false;
			NPB:RemoveAllDamange();
			NPB:BuildBody();
			--NPB.Dying = false;
			npc:RestHp();
			npc.PropertyMgr:Reborn(npc);
			if NPB.RemovedParts~=nil then
				NPB.RemovedParts:Clear();
			end
			if npc.view ~= nil and npc.view.needUpdateMod ~=nil then
				npc.view.needUpdateMod = true;
			end
			return true;
		end
	end
	return false;
end
function NpcManager:DeadLive()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc == nil then
		return false;
	end
	--NpcManager:NpcForceReborn();
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			local NPB=npc.PropertyMgr.BodyData;
			npc:Reborn(npc, true);
			npc.BodyZombie=false;
			npc.BodyPuppet=false;
			NPB.WaitDead=false;
			NPB.Dead=false;
			
		end
	end
	--if npc.CorpseTime > 0 then
		--NpcManager:NpcForceReborn();
		local save = npc.PropertyMgr:GetSaveData();
		save.BodyData.Dead = false;
		save.BodyData.Dying = false;
		save.BodyData.HealthValue = npc.MaxHp;
		save.BodyData.DID = 1;
		save.BodyData.Damages:Clear();
		--save.BodyData.RemoveParts:Clear();
		npc.PropertyMgr.BodyData:AfterLoad(save);
		npc.DieCause = nil;
		npc.CorpseTime = 0;
		return NpcManager:NpcForceReborn();
		--npc.PropertyMgr.BodyData:RemoveAllDamange();
		--npc.PropertyMgr.BodyData:BuildBody();
		--return true
	--else
	--	NpcManager:NpcForceReborn();
	--	return true
	--end
	--return false;
end
-------------special
function NpcManager:SetCampPlus(npc,numnum,inn)
	if inn==nil then
		if numnum==nil or numnum<0 then
			numnum=1;
		else
			numnum=numnum+1;
		end
	end
	local types = QFWDlib.FightCamp[tonumber(numnum)];
	local le=1;
	if numnum == 2 then
		--types=CS.XiaWorld.Fight.g_emFightCamp.Player;
		le = 0;
		if npc.IsVistor then
			npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ISVISTOR);
		end
		if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitReceive) then
			npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitReceive);
		end
		if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitDefection) then
			npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitDefection);
		end
		if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitHelping) then
			npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitHelping);
		end
		if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.HelperType) then
			npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.HelperType);
		end
		--npc:ChangeRank(CS.XiaWorld.g_emNpcRank.Disciple, true, false, true);
		--npc:ChangeRank(CS.XiaWorld.g_emNpcRank.Disciple, true, false, true);
	elseif numnum == 3 then
		npc:ChangeRank(CS.XiaWorld.g_emNpcRank.Worker, true, true, true);
	end
	npc.Leave=le;
	--npc.ComeNpc=true;
	npc:SetCamp(types,true);
	if inn~=nil then
		if npc.view~=nil then
			npc.view.needUpdateMod = true;
		end
	end
	return true;
end


-------------
function NpcManager:GetAllAttributes()
	local localKey=nil;
	local localValue=nil;
	local num=1;
	local run=true;
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("GetModifiers");
		local ModifierList=func:Invoke();
		if ModifierList~=nil then
			run=false;
			for localKey, localValue in pairs(ModifierList) do
			--print(localValue.Name);
				if localValue~=nil and localKey~=nil then
				local def = CS.XiaWorld.ModifierMgr.Instance:GetDef(localKey);
					if def ~= nil then
						if def.DisplayName ~= nil then
							QFWDlib.ModifierListDisplayName[num]=def.DisplayName;
						else
							QFWDlib.ModifierListDisplayName[num]="未知";
						end
						QFWDlib.ModifierListTrue[num]=localKey;
						num=num+1;
					end
				end
			end
			print(QFLanguage.GetText(">MODName")..":Get ModifierList true!(from Func)");
		end
	end
	if run then
		for localKey, localValue in pairs(QFWDlib.ModifierList) do
			--print(localValue.Name);
			local def = CS.XiaWorld.ModifierMgr.Instance:GetDef(QFWDlib.ModifierList[localKey]);
			if def ~= nil then
				if def.DisplayName ~= nil then
					QFWDlib.ModifierListDisplayName[num]=def.DisplayName;
				else
					QFWDlib.ModifierListDisplayName[num]="未知";
				end
				QFWDlib.ModifierListTrue[num]=localValue;
				num=num+1;
			end
		end
		print(QFLanguage.GetText(">MODName")..":Get ModifierList true!(from QFlib)");
	end
	
	
	num=1;
	local list = NpcMgr.FeatureMgr:GetMapFeatureDefs();
	for localKey, localValue in pairs(list) do
		--print(localValue.Name);
		def = localValue;--CS.XiaWorld.ModifierMgr.Instance:GetDef(QFWDlib.FeatureList[localKey]);
		if def ~= nil then
			if def.DisplayName ~= nil then
				QFWDlib.FeatureListDisplayName[num]= def.DisplayName;
			else
				QFWDlib.FeatureListDisplayName[num]="未知";
			end
			QFWDlib.FeatureListTrue[num]=localValue.Name;
			num=num+1;
		end
	end
	print(QFLanguage.GetText(">MODName")..":Get FeatureList true!");
	num = 1;
	list = NpcMgr.ExperienceMgr.m_mapcExperienceDefs;
	if list ~= nil then
		for localKey, localValue in pairs(list) do
			--print(localValue.Name);
			if localValue ~= nil then
				if localValue.DisplayName ~= nil then
					QFWDlib.ExperienceListDisplayName[num]= tostring(localValue.DisplayName);
				else
					QFWDlib.ExperienceListDisplayName[num]="未知";
				end
				QFWDlib.ExperienceListTrue[num]=tostring(localValue.Name);
				num=num+1;
			end
		end
		print(QFLanguage.GetText(">MODName")..":Get ExperienceList true!");
	else
		print(QFLanguage.GetText(">MODName")..":Get ExperienceList false!");
	end
	
	num = 1;
	run=true;
	if ModifierMain.lib~=nil then
		local func = ModifierMain.lib:GetMethod("GetMoods");
		list = func:Invoke();
		if list~=nil then
			run=false;
			for localKey, localValue in pairs(list) do
				if localValue~=nil and localKey~=nil then
					local moodDef = NpcMgr:GetMoodDef(localKey);
					if moodDef ~= nil then
						if moodDef.DisplayName ~= nil then
							QFWDlib.MoodListDisplayName[num]= tostring(moodDef.DisplayName);
						else
							QFWDlib.MoodListDisplayName[num]="未知";
						end
						QFWDlib.MoodListTrue[num]=tostring(moodDef.Name);
						num=num+1;
					end
				end
			end
			print(QFLanguage.GetText(">MODName")..":Get MoodList true!(from Func)");
		end
	end
	if run then
		list = QFWDlib.MoodList;
		for localKey, localValue in pairs(list) do
			--print(localValue.Name);
			local moodDef = NpcMgr:GetMoodDef(localValue);
			if moodDef ~= nil then
				if moodDef.DisplayName ~= nil then
					QFWDlib.MoodListDisplayName[num]= tostring(moodDef.DisplayName);
				else
					QFWDlib.MoodListDisplayName[num]="未知";
				end
				QFWDlib.MoodListTrue[num]=tostring(moodDef.Name);
				num=num+1;
			end
		end
		print(QFLanguage.GetText(">MODName")..":Get MoodList true!(from QFlib)");
	end
	
	
end
function NpcManager:SearchDisplayName(name)
	local findList=NpcManager.AttributeDisPlayName;
	name=string.lower(name);
	local findNum=nil;
	NpcManager.findArrey={};
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(findList) do 
		findNum,_=string.find(string.lower(localValue), name);
		if findNum ~= nil and findNum ~= 0 then
			NpcManager.findArrey[num]=localKey;
			num=num+1;
		end
	end
	if NpcManager.findArrey=={} then
		return false;
	end
	local obj=NpcManager.AttributeListCOP;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips184");
	for localKey, localValue in pairs(NpcManager.findArrey) do 
		NpcManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..":"..NpcManager.AttributeDisPlayName[localValue]);
		NpcManager:AddChildToList(obj,"0"..tostring(localValue),NpcManager.Attributenew[localValue]);
	end
	return true;
end
function NpcManager:ShowNpcAttribute(npc)
	if npc==nil then
		npc=NpcManager.NpcList[NpcManager.chooseNpcNum];
	end
	local localKey,localValue=nil,nil;
	local num=0;
	if npc.PropertyMgr==nil then
		return false;
	else
		if NpcManager.CheckBox1.selected then
			local lkey=npc.Key;
			if lkey==nil then
				lkey = 1;
				NpcManager.CheckBox1.selected=false;
			end
			--npc.
			CS.MapCamera.Instance:LookKey(lkey);
		end
	end
	if npc~=nil and npc.IsSmartRace==true then
		if NpcManager.picture~=nil and NpcManager.picture.m_n165~=nil and CS.NpcRolepaintUI~=nil then
			NpcManager.picture.visible=true;
			local npcRolepaintUI = CS.NpcRolepaintUI(NpcManager.picture.m_n165);
			--npcRolepaintUI.SetRoleJson(gcityCoreBeliever.rolep, 0);
			if npcRolepaintUI~=nil then
				npcRolepaintUI:SetNpc(npc);
			end
			if NpcManager.picture.m_n166~=nil then
				NpcManager.picture.m_n166.text=npc:GetName();
			end
			
		elseif NpcManager.picture~=nil then
			NpcManager.picture.visible=false;
		end
	else
		if NpcManager.picture~=nil then
			NpcManager.picture.visible=false;
		end
	end
	NpcManager:AddChild();
	local myPMgr=npc.PropertyMgr;
	NpcManager.AttributeDisPlayName={};
	NpcManager.Attribute={};
	NpcManager.AttributeDisPlayName=
	{
		"姓:SurName","名:FirstName","年龄:Age","性别:Gender[1-2 1,M男 2,W女]",
		"容纳力增值:AccommodateAddv",":Ang","血量:HP","ID","位置:Key",
		"优先度:Priority","品质:Rate","无堆叠标识:NoStackFlag","租用:RentFrom","故事命令:StoryCMD",
		"出生格:BornGrid","攻击模型:AtkMode","成为门徒时间:BecomePlayerDiscipleTime","成为弟子时间:BecomePlayerTime","称号数:CurTitlte",
		"描述模型:DefMode","DOutFire","灰尘:Dust","警戒范围-敌人:EnemyEyeLevel","经历点:ExperiencePoint",
		"灵魂花费:GodSoulCost","防护面积ID:GuardAreaId","杀死NPC数:KillNpc","最后离开年龄等级:LastAgeLevel","离开:Leave",
		"监视灵气:nListenLing","外形:OutsType","轮回者:Reaincarnate","模型大小增值:ScaleAdd","IM增值:ScaleAddIM",
		"门派ID:SchoolID","随机种子:Seed","所属分堂:TangJoined","对象模块:TargetMode","穿戴命令:WearCMD",
		"驻颜:ZhuYan","当前灵气值:LingV","通灵数:TongLingCount",
		
		"RPG-袭击等待时间:RPGAttackWait","RPG-战斗类型:RPGFightType","RPG-防护范围:RPGGuardRange",
		"RPG-Idx:RPGIdx","RPG-IdxC:RPGIdxC","RPG-离开战斗范围:RPGLeaveFightRange",
		
		
		
		
		"疤痕:BahenID","身体架构:BodyBuildingID","肤色:BodyColor","耳朵:EarID","眉毛:EyebrowsID",
		"头发:HairID","头型:HeadID","胡子:HuziID","左眼:LEyesID","嘴巴:MouthID",
		"鼻子:NoseID","父ID:ParentID","右眼:REyesID","饰品:ShipinID","印记:YinjiID",
		--":",":",":",":",":",
		
		"来自MOD:FromMod","作者:Author","描述:Desc","挂载MOD:EqMod","当前模型:MOD",
		"符咒:Spell","瓶颈:Nick","不能改变阵营原因:CannotChangeCampReason","死因:DieCause","种族名:RaceDefName",
		"特殊描述:SpecailDesc","行商名:WalkTraderName","种族(允许数字):Race",--":",":",
		--":",":",":",":",":",
		
		"隐藏HUD:HideHUD[0-1 0,false(假) 1,true(真)]","在坟墓:InTomb[0-1 0,false(假) 1,true(真)]","突破瓶颈:IsBrokenNeck[0-1 0,false(假) 1,true(真)]","移动:IsMoving[0-1 0,false(假) 1,true(真)]","睡觉:IsSleeping[0-1 0,false(假) 1,true(真)]",
		"禁止移动:LockMove[0-1 0,false(假) 1,true(真)]","自动穿戴:AutoWear[0-1 0,false(假) 1,true(真)]","大能:bDaNeng[0-1 0,false(假) 1,true(真)]","傀儡身体:BodyPuppet[0-1 0,false(假) 1,true(真)]","僵尸身体:BodyZombie[0-1 0,false(假) 1,true(真)]",
		"关闭丹药:CloseDanFrist[0-1 0,false(假) 1,true(真)]","关闭自动进食:CloseEatP[0-1 0,false(假) 1,true(真)]","到来NPC:ComeNpc[0-1 0,false(假) 1,true(真)]","难筑基:HardZJ[0-1 0,false(假) 1,true(真)]","是上帝:IsGod[0-1 0,false(假) 1,true(真)]",
		"领导:IsLead[0-1 0,false(假) 1,true(真)]","根:IsRootPart[0-1 0,false(假) 1,true(真)]","锁定状态:LockStep[0-1 0,false(假) 1,true(真)]","真实克隆:OnRealClone[0-1 0,false(假) 1,true(真)]","自我销毁标志:SelfDestroyFlag[0-1 0,false(假) 1,true(真)]",
		--":",":",":",":",":",
		"RPG-模块:RPGMode[0-1 0,false(假) 1,true(真)]","RPG-无战斗返回:RPGNoFightBack[0-1 0,false(假) 1,true(真)]","RPG-冲刺:RPGSprint[0-1 0,false(假) 1,true(真)]",
		
		
		"敌人类型:EnemyType[0-2]","阵营:Camp[0-3 无,玩家,朋友,敌人]","身体类型(体型):BodyType[0-3 无,正常,强壮,胖]","级别(弟子级别):Rank[0-2]","元素类型:m_mElementKind[0-6 无,金-土,chaos]",--":",
		"RPG-AI移动类型:RPGAiMoveType[0-4 无,自由,停止,巡逻,路线]"
		--":",":",":",":",":",
		--":",":",":",":",":",
		
	};
	NpcManager.Attribute=
	{
		tostring(myPMgr.PrefixName),tostring(myPMgr.SuffixName),tostring(myPMgr.Age),tostring(myPMgr.Sex),--4
		npc.AccommodateAddv,npc.Ang,npc.Hp,npc.ID,npc.Key,
		npc.Priority,npc.Rate,npc.NoStackFlag,npc.RentFrom,npc.StoryCMD,
		npc.BornGrid,npc.AtkMode,npc.BecomePlayerDiscipleTime,npc.BecomePlayerTime,npc.CurTitlte,
		npc.DefMode,npc.DOutFire,npc.Dust,npc.EnemyEyeLevel,npc.ExperiencePoint,
		npc.GodSoulCost,npc.GuardAreaId,npc.KillNpc,npc.LastAgeLevel,npc.Leave,
		npc.nListenLing,npc.OutsType,npc.Reaincarnate,npc.ScaleAdd,npc.ScaleAddIM,
		npc.SchoolID,npc.Seed,npc.TangJoined,npc.TargetMode,npc.WearCMD,
		npc.ZhuYan,npc.LingV,npc.TongLingCount,
		npc.RPGAttackWait,npc.RPGFightType,npc.RPGGuardRange,
		npc.RPGIdx,npc.RPGIdxC,npc.RPGLeaveFightRange,
		
		npc.BahenID,npc.BodyBuildingID,npc.BodyColor,npc.EarID,npc.EyebrowsID,
		npc.HairID,npc.HeadID,npc.HuziID,npc.LEyesID,npc.MouthID,
		npc.NoseID,npc.ParentID,npc.REyesID,npc.ShipinID,npc.YinjiID,
		--npc.,npc.,npc.,npc.,
		
		npc.FromMod,npc.Author,npc.m_sDesc,npc.m_sEqMod,npc:GetNpcModPath(),
		npc.m_spell,npc.Nick,npc.CannotChangeCampReason,npc.DieCause,npc.RaceDefName,---
		npc.SpecailDesc,npc.WalkTraderName,myPMgr.Race,--npc.,npc.,
		--npc.,npc.,npc.,npc.,npc.,
		
		npc.HideHUD,npc.InTomb,npc.IsBrokenNeck,npc.IsMoving,npc.IsSleeping,---
		npc.LockMove,npc.AutoWear,npc.bDaNeng,npc.BodyPuppet,npc.BodyZombie,
		npc.CloseDanFrist,npc.CloseEatP,npc.ComeNpc,npc.HardZJ,npc.IsGod,
		npc.IsLead,npc.IsRootPart,npc.LockStep,npc.OnRealClone,npc.SelfDestroyFlag,
		--npc.,npc.,npc.,npc.,npc.,
		npc.RPGMode,npc.RPGNoFightBack,npc.RPGSprint,
		
		
		
		npc.EnemyType,npc.Camp,npc.BodyType,npc.Rank,npc.m_mElementKind,--npc.,---
		npc.RPGAiMoveType--,
		--npc.,npc.,npc.,npc.,npc.,
		--npc.,npc.,npc.,npc.,npc.,
	}
	local num=#NpcManager.AttributeDisPlayName;
	--print(num)
	if npc.PropertyMgr.Practice~=nil then
		local Prt=npc.PropertyMgr.Practice;
		local listName=
		{
		"道行:DaoHeng","分神数:GodSoulCount","上帝数:GodCount","天谴:Penalty","累计灵气:AccumulativeLing",
		"分割数:DivideCount","合练数:HeLianCount","劫云ID:JieCloudID","主人ID:MasterID","瓶颈:NeckIndex",
		"遮挡物ID:ShieldID","故事突破:StoryBroken","金丹灵气:GoldLing",
		"金丹灵气(阴):GoldLingYin",--"金丹级别:GoldLevel","金丹级别(阴):GoldLevelYin",
		"Dift:Dift","突破尝试次数:NeckTryCount","主人等级:MasterRank",
		"道行劫:DaoHengJieCount","秘籍数:EsotercaCount",
		"理解力:UnderstandV","道行(阳):YangDaoHeng","道行(阴):YinDaoHeng",
		
		
		"玄门奥义:XuanDaoHeng","旁门心得:OtherDaoHeng",
		
		"筑基值:ZhuJiValue","参悟值:TreeExp","进入瓶颈时间:TimeEnterNeck","阶段:StageValue","修为:Practice",
		
		--":",":",":",":",":",
		
		--":",":",":",":",":",
		--":",":",":",":",":",
		
		"对象元素:GodElement"--":ageJieElement",":daoHengJieElement",,":",":",
		};
		local list=
		{
		tostring(Prt.DaoHang),tostring(Prt.GodSoulCount),tostring(Prt.GodCount),tostring(Prt.GodPenalty),tostring(Prt.AccumulativeLing),
		tostring(Prt.DivideCount),tostring(Prt.HeLianCount),tostring(Prt.JieCloudID),tostring(Prt.MasterID),tostring(Prt.NeckIndex),
		tostring(Prt.ShieldID),tostring(Prt.StoryBroken),tostring(Prt.GoldLing),
		tostring(Prt.GoldLingYin),--tostring(Prt.GoldLevel),tostring(Prt.GoldLevelYin),
		tostring(Prt.dift),tostring(Prt.NeckTryCount),tostring(Prt.MasterRank),
		tostring(Prt.DaoHangJieCount),tostring(Prt.EsotercaCount),
		tostring(Prt.UnderstandV),tostring(Prt.YangDaoHang),tostring(Prt.YinDaoHang),
		tostring(Prt.XuanDaoHang),tostring(Prt.OtherDaoHang),
		
		
		tostring(Prt.ZhuJiValue),tostring(Prt.TreeExp),tostring(Prt.TimeEnterNeck),tostring(Prt.StageValue),tostring(Prt.StageValue),
		
		-- Prt.,Prt.,Prt.,Prt.,Prt.,
		
		-- Prt.,Prt.,Prt.,Prt.,Prt.,
		-- Prt.,Prt.,Prt.,Prt.,Prt.,
		
		tostring(Prt.GodElement)--,Prt.,Prt.,Prt.ageJieElement,Prt.daoHangJieElement,
		};
		local jcnum=1;
		for jcnum=1,#listName do
			NpcManager.AttributeDisPlayName[num+jcnum]=listName[jcnum];
			NpcManager.Attribute[num+jcnum]=list[jcnum];
		end
		num=num+#listName;
	end
	--print(num)
	NpcManager.AttributesName={};
	NpcManager.AttributesDisPName={};
	local name=nil;
	local data=nil;
	local typesz=tonumber(NpcManager.inputtt1.m_title.text);
	if typesz==nil or typesz<=0 then
		typesz=1;
	elseif typesz>4 then
		typesz=4;
	end
			--local stringsOut="";
	local uselist=CS.XiaWorld.PropertyMgr.Instance.m_mapProperties;
	for localKey, localValue in pairs(uselist) do
		if localValue~=nil and localValue.Name~=nil then
			num = num + 1;
			NpcManager.AttributesName[num] = tostring(localValue.Name);
			NpcManager.AttributesDisPName[num] = tostring(localValue.DisplayName);
			if NpcManager.AttributesDisPName == nil or NpcManager.AttributesDisPName == "nil" then
				name=NpcManager.AttributesName[num];
			else
				name=NpcManager.AttributesDisPName[num]..":"..NpcManager.AttributesName[num];
			end
			NpcManager.AttributeDisPlayName[num]=name;
			data=myPMgr:GetGetPropertyData(NpcManager.AttributesName[num]);
			if data~=nil then
				if typesz==1 then
					NpcManager.Attribute[num]=tostring(data.addv);
				elseif typesz==2 then
					NpcManager.Attribute[num]=tostring(data.addp);
				elseif typesz==3 then
					NpcManager.Attribute[num]=tostring(data.basev);
				else
					NpcManager.Attribute[num]=tostring(data.basep);
				end
			else
				NpcManager.Attribute[num]="nil";
			end
			--stringsOut=stringsOut..NpcManager.AttributesDisPName[num]..":"..NpcManager.AttributesName[num].."\n";
		end
	end
			-- local Me = CS.ModsMgr.Instance:FindMod("QFWDModeifiers", nil, true);
			-- print(Me.Path)
			-- local MePath = Me.Path;
			-- local file,err = io.open(MePath.."//xxx.txt", "w+");
			-- if err~=nil or file == nil then
				-- print("MOD版修改器:File open false!");
				-- return false;
			-- end
			-- file:write(stringsOut);
			-- file:close();
	--print(num)
	if npc.PropertyMgr.SkillData~=nil then
		local list=
		{
			"无-等级:None","无-喜好度:(0-2,“-1”为禁用)","战斗-等级:Fight","战斗-喜好度:(0-2,“-1”为禁用)","气感-等级:Qi","气感-喜好度:(0-2,“-1”为禁用)","处事-等级:SocialContact","处事-喜好度:(0-2,“-1”为禁用)",
			"歧黄-等级:Medicine","歧黄-喜好度:(0-2,“-1”为禁用)","烹饪-等级:Cooking","烹饪-喜好度:(0-2,“-1”为禁用)","版筑-等级:Building","版筑-喜好度:(0-2,“-1”为禁用)","农耕-等级:Farming","农耕-喜好度:(0-2,“-1”为禁用)",
			"金石-等级:Mining","金石-喜好度:(0-2,“-1”为禁用)","雅艺-等级:Art","雅艺-喜好度:(0-2,“-1”为禁用)","制造-等级:Manual","制造-喜好度:(0-2,“-1”为禁用)","斗法-等级:DouFa","斗法-喜好度:(0-2,“-1”为禁用)",
			"丹器-等级:DanQi","丹器-喜好度:(0-2,“-1”为禁用)","御物-等级:Fabao","御物-喜好度:(0-2,“-1”为禁用)","术法-等级:FightSkill","术法-喜好度:(0-2,“-1”为禁用)","护体-等级:Barrier","护体-喜好度:(0-2,“-1”为禁用)",
			"阵法-等级:Zhen","阵法-喜好度:(0-2,“-1”为禁用)"
		}
		local skilldate=npc.PropertyMgr.SkillData;
		local y=1;
		local skillUnit=nil;
		for y=1,#QFWDlib.SkillList-1 do
			skillUnit=skilldate:GetSkill(QFWDlib.SkillList[y]);
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=list[2*y-1];
			if skillUnit~=nil then
				if typesz==1 then
					NpcManager.Attribute[num]=tostring(skillUnit.Addv);
				elseif typesz==2 then
					NpcManager.Attribute[num]=tostring(skillUnit.Addv2);
				else
					NpcManager.Attribute[num]=tostring(skillUnit.BaseLevel);
				end
				num=num+1;
				NpcManager.AttributeDisPlayName[num]=list[2*y];
				if skillUnit.Ban then
					NpcManager.Attribute[num]=tostring("-1");
				else
					NpcManager.Attribute[num]=tostring(skillUnit.Love);
				end
			else
				NpcManager.Attribute[num]=tostring("nil");
				num=num+1;
				NpcManager.AttributeDisPlayName[num]=list[2*y];
				NpcManager.Attribute[num]=tostring("nil");
			end
		end
	end
	--print(num)
	if npc.PropertyMgr.BaseData~=nil then
		local Bdata=npc.PropertyMgr.BaseData;
		local list=
		{
			"神识:Perception","根骨:Physique","魅力:Charisma","悟性:Intelligence","机缘:Luck",
			"痛感:Pain","意识:Consciousness","Meridian","移速:Movement","操作:Operation",
			"感知:Feeling",
		};
		local y=1;
		for y=1,#QFWDlib.BasePropertyType-1 do
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=list[y];
			NpcManager.Attribute[num]=Bdata:GetValue(QFWDlib.BasePropertyType[y]);
		end
	end
	--print(num)
	if npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local godPData=npc.PropertyMgr.Practice.GodPracticeData;
		local list=
		{
		godPData.Faith,godPData.FaithJieCount,godPData.Population,godPData.WillAddCount,godPData.GodCityScore,
		godPData.ListenKeep,godPData.Obsession,godPData.StatueCount,godPData.GodCityArea,"0",
		
		godPData.NeedFeisheng,
		
		
		godPData.MindStateMaxLevel,"nil"
		};
		local listName=
		{
		"信仰值:Faith","信仰劫数:FaithJieCount","神民数:Population","欲增加数:WillAddCount","神国分数:GodCityScore",
		"信徒数:ListenKeep","执念:Obsession","雕像数:StatueCount","神国升级数:GodCityArea","心境欲升级数:",
		
		"需要飞升:NeedFeisheng[0-false(假),1-true(真)]",
		
		"神国最大等级:MindStateMaxLevel","欲踏步阶段-神(float):Step"
		};
		local y=1;
		for y=1,#listName do
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=listName[y];
			NpcManager.Attribute[num]=list[y];
		end
	end
	--print(num)
	if npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local bodyPData=npc.PropertyMgr.Practice.BodyPracticeData;
		local list=
		{
		bodyPData.LTunaKeep,bodyPData.LTunaKey,bodyPData.NextSeed,bodyPData.QiValue,0,
		};
		local listName=
		{
		"最后吐纳保持:LTunaKeep","最后吐纳坐标:LTunaKey","下个种子:NextSeed","真炁:QiValue","欲踏步阶段-体(float):Step",
		
		};
		local y=1;
		for y=1,#listName do
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=listName[y];
			NpcManager.Attribute[num]=list[y];
		end
	end
	--print(num)
	if npc.LsInfo~=nil then
		local lsData=npc.LsInfo;
		local list=
		{
		lsData.GrowPercent,lsData.LingShouShitP,lsData.EatSort,lsData.EatTypeIdx,
		--lsData.
		};
		local listName=
		{
		"成长度-灵兽:LingShouGrowPercent","屎-灵兽:LingShouShitP","食用种类-灵兽:LingShouEatSort","食用类型-灵兽:EatTypeIdx",
		--"胖瘦-灵兽:LingShouFat","健康-灵兽:LingShouStronger",
		};
		local y=1;
		for y=1,#listName do
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=listName[y];
			NpcManager.Attribute[num]=list[y];
		end
	end
	--print(num)
	if npc.LsInfo~=nil and npc.LsInfo.Nurtition~=nil then
		local lsData=npc.LsInfo.Nurtition;
		local list=
		{
		lsData.HuTi,lsData.LingZhi,lsData.NeiDan,lsData.QiGan,lsData.ShuFa,
		};
		local listName=
		{
		"护体-灵兽:HuTi","灵智-灵兽:LingZhi","内丹-灵兽:NeiDan","气感-灵兽:QiGan","术法-灵兽:ShuFa",
		
		};
		local y=1;
		for y=1,#listName do
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=listName[y];
			NpcManager.Attribute[num]=list[y];
		end
	end
	--print(num)
	if npc.ThingToHuman~=nil then
		local lsData=npc.ThingToHuman;
		local list=
		{
		lsData.thingid,lsData.rate,lsData.time,lsData.item,lsData.tname,
		};
		local listName=
		{
		"物品ID-通灵:thingid","品阶-通灵:rate","时间-通灵:time","物品-通灵:item","名字-通灵:tname",
		
		};
		local y=1;
		for y=1,#listName do
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=listName[y];
			NpcManager.Attribute[num]=list[y];
		end
	end
	--print(num)
	if npc.AnimalHumanFrom~=nil then
		local lsData=npc.AnimalHumanFrom;
		local list=
		{
		lsData.AnimalBodyColor,lsData.AnimalHairID,lsData.bodyType,lsData.state,lsData.ThunderComing,
		lsData.ThunderValue,lsData.FromRace,
		};
		local listName=
		{
		"身体颜色-妖兽化形:AnimalBodyColor","头发ID-妖兽化形:AnimalHairID","身体状态-妖兽化形:bodyType","状态-妖兽化形:state","雷劫倒计时-妖兽化形:ThunderComing",
		"雷劫值-妖兽化形:ThunderValue","原形种族-妖兽化形:FromRace",
		};
		local y=1;
		for y=1,#listName do
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=listName[y];
			NpcManager.Attribute[num]=list[y];
		end
	end
	--print(num)
	if npc.A2H~=nil then
		local lsData=npc.A2H;
		local list=
		{
		lsData.BeRobLevel,lsData.CanThinkCount,lsData.QiZhiPassTime,lsData.thinkInterval,
		};
		local listName=
		{
		"被抢夺时等级-妖兽化形:BeRobLevel","可思考数-妖兽化形:CanThinkCount","精元-妖兽化形:QiZhiPassTime","思考间隔-妖兽化形:thinkInterval",
		};
		local y=1;
		for y=1,#listName do
			num=num+1;
			NpcManager.AttributeDisPlayName[num]=listName[y];
			NpcManager.Attribute[num]=list[y];
		end
	end
	print(num)
	NpcManager.Attributeold={};
	NpcManager.Attributenew={};
	for localKey, localValue in pairs(NpcManager.AttributeDisPlayName) do
		NpcManager.Attributenew[localKey]=tostring(NpcManager.Attribute[localKey]);
		NpcManager.Attributeold[localKey]=NpcManager.Attributenew[localKey];
	end
	NpcManager:UpdateChildAttribute();
end
function NpcManager:UpdateChildAttribute(obj)
	if obj==nil then
		obj=NpcManager.AttributeListCOP;
	end
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips185");
	local localKey,localValue=nil,nil;
	for localKey, localValue in pairs(NpcManager.AttributeDisPlayName) do
		NpcManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..":"..localValue);
		NpcManager:AddChildToList(obj,"0"..tostring(localKey),NpcManager.Attributenew[localKey]);
	end
	return obj;
end
function NpcManager:SetTheNpc(npc)
	if npc==nil then
		npc=NpcManager.NpcList[NpcManager.chooseNpcNum];
	end
	if npc.PropertyMgr==nil then
		return false;
	end
	local localKey,localValue=nil,nil;
	local IsNeedInteBehave=false;
	local myPMgr=npc.PropertyMgr;
	local num = 1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		myPMgr.PrefixName = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		myPMgr.SuffixName = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		myPMgr.Age = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum<1 then
			numnum=1;
		else
			numnum=numnum+1;
		end
		--print(numnum)
		myPMgr:SetSex(QFWDlib.NPCSexType[numnum]);
	end
	--4
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.AccommodateAddv = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Ang = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local onum=tonumber(NpcManager.Attributeold[num]);
		if onum==nil then
			onum=0;
		end
		npc:AddHealth(tonumber(NpcManager.Attributenew[num])-onum);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc:SetPostionOnly(tonumber(NpcManager.Attributenew[num]));
	end
	-----
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Priority = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Rate = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.NoStackFlag = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.RentFrom = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.StoryCMD = tonumber(NpcManager.Attributenew[num]);
	end
	-------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BornGrid = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.AtkMode = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BecomePlayerDiscipleTime = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BecomePlayerTime = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.CurTitlte = tonumber(NpcManager.Attributenew[num]);
	end
	----------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.DefMode = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.DOutFire = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Dust = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.EnemyEyeLevel = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ExperiencePoint = tonumber(NpcManager.Attributenew[num]);
	end
	----------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.GodSoulCost = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.GuardAreaId = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.KillNpc = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.LastAgeLevel = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Leave = tonumber(NpcManager.Attributenew[num]);
	end
	---------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.nListenLing = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.OutsType = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Reaincarnate = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ScaleAdd = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ScaleAddIM = tonumber(NpcManager.Attributenew[num]);
	end
	-------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.SchoolID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Seed = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.TangJoined = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.TargetMode = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.WearCMD = tonumber(NpcManager.Attributenew[num]);
	end
	----------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ZhuYan = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local onum=tonumber(NpcManager.Attributeold[num]);
		if onum==nil then
			onum=0;
		end
		npc:AddLing(tonumber(NpcManager.Attributenew[num])-onum);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.TongLingCount = tonumber(NpcManager.Attributenew[num]);
	end
	
	
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		if npc.RPGAttackWait~=nil then
			npc.RPGAttackWait = tonumber(NpcManager.Attributenew[num]);
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		if npc.RPGFightType~=nil then
			npc.RPGFightType = tonumber(NpcManager.Attributenew[num]);
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		if npc.RPGGuardRange~=nil then
			npc.RPGGuardRange = tonumber(NpcManager.Attributenew[num]);
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		if npc.RPGIdx~=nil then
			npc.RPGIdx = tonumber(NpcManager.Attributenew[num]);
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		if npc.RPGIdxC~=nil then
			npc.RPGIdxC = tonumber(NpcManager.Attributenew[num]);
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		if npc.RPGLeaveFightRange~=nil then
			npc.RPGLeaveFightRange = tonumber(NpcManager.Attributenew[num]);
		end
	end
	
	
	
	
	
	
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BahenID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BodyBuildingID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BodyColor = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.EarID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.EyebrowsID = tonumber(NpcManager.Attributenew[num]);
	end
	-------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.HairID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.HeadID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.HuziID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.LEyesID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.MouthID = tonumber(NpcManager.Attributenew[num]);
	end
	--------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.NoseID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ParentID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.REyesID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ShipinID = tonumber(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.YinjiID = tonumber(NpcManager.Attributenew[num]);
	end
-------------------------------------------------------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.FromMod = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Author = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.m_sDesc = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc:AddNpcModPath(tostring(NpcManager.Attributenew[num]),-1);
		--npc.m_sEqMod = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.m_sMod = tostring(NpcManager.Attributenew[num]);
		if npc.NpcMods~=nil then
			npc.NpcMods:Clear();
			npc.NpcMods:Add(tostring(NpcManager.Attributenew[num]));
		end
	end
	------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.m_spell = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Nick = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.CannotChangeCampReason = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.DieCause = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.RaceDefName = tostring(NpcManager.Attributenew[num]);
	end
	------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.SpecailDesc = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.WalkTraderName = tostring(NpcManager.Attributenew[num]);
	end
	num=num+1;
	--print(NpcManager.Attributeold[num],"   ",NpcManager.Attributenew[num])
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		--print("3333")
		local numss=tonumber(NpcManager.Attributenew[num]);
		local raceDef;
		if ModifierMain.lib~=nil then
			if numss~=nil then
				local race=QFWDlib.race[numss];
				if race~=nil then
					raceDef=CS.XiaWorld.NpcMgr.Instance:GetRaceDef(race);
					if raceDef~=nil and npc.PropertyMgr~=nil then
						npc=NpcManager:NPCChangeRace(race);
						IsNeedInteBehave=true;
					end
				end
				--print("1111")
			else
				local race=NpcManager.Attributenew[num];
				if race~=nil then
					raceDef=CS.XiaWorld.NpcMgr.Instance:GetRaceDef(race);
					if raceDef~=nil and npc.PropertyMgr~=nil then
						npc=NpcManager:NPCChangeRace(race);
						IsNeedInteBehave=true;
					end
				end
				--print("2222")
			end
		end
		--npc.WalkTraderName = tostring(NpcManager.Attributenew[num]);
	end
	
	--print(num)
-------------------------------------------------------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.HideHUD=false;
		else
			npc.HideHUD=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0  or NpcManager.Attributenew[num]=="false" then
			npc.InTomb=false;
		else
			npc.InTomb=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsBrokenNeck=false;
		else
			npc.IsBrokenNeck=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsMoving=false;
		else
			npc.IsMoving=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsSleeping=false;
		else
			npc.IsSleeping=true;
		end
	end
	----------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.LockMove=false;
		else
			npc.LockMove=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.AutoWear=false;
		else
			npc.AutoWear=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.bDaNeng=false;
		else
			npc.bDaNeng=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.BodyPuppet=false;
		else
			npc.BodyPuppet=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.BodyZombie=false;
		else
			npc.BodyZombie=true;
		end
	end
	----------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.CloseDanFrist=false;
		else
			npc.CloseDanFrist=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.CloseEatP=false;
		else
			npc.CloseEatP=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.ComeNpc=false;
		else
			npc.ComeNpc=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.HardZJ=false;
		else
			npc.HardZJ=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsGod=false;
		else
			npc.IsGod=true;
		end
	end
	------------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsLead=false;
		else
			npc.IsLead=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsRootPart=false;
		else
			npc.IsRootPart=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.LockStep=false;
		else
			npc.LockStep=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.OnRealClone=false;
		else
			npc.OnRealClone=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.SelfDestroyFlag=false;
		else
			npc.SelfDestroyFlag=true;
		end
	end
	
	
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.RPGMode=false;
		else
			npc.RPGMode=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.RPGNoFightBack=false;
		else
			npc.RPGNoFightBack=true;
		end
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.RPGSprint=false;
		else
			npc.RPGSprint=true;
		end
	end
	
	
	
-------------------------------------------------------------
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum<0 then
			numnum=1;
		else
			numnum=numnum+1;
		end
		npc.EnemyType=QFWDlib.EnemyType[numnum];
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num]);
		NpcManager:SetCampPlus(npc,numnum);
		IsNeedInteBehave=true;
		--npc:SetCamp_WithSaveOriCamp(QFWDlib.FightCamp[numnum]);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum<0 then
			numnum=1;
		else
			numnum=numnum+1;
		end
		npc.BodyType=QFWDlib.NpcBodyType[numnum];
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum<0 then
			numnum=1;
		else
			numnum=numnum+1;
		end
		npc:ChangeRank(QFWDlib.NpcBodyType[numnum], true, true, true);
	end
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num]);
		if numnum==nil or numnum<0 then
			numnum=1;
		else
			numnum=numnum+1;
		end
		npc.m_mElementKind=QFWDlib.ItemsElementTypes[numnum];
	end
	
	num=num+1;
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		if npc.RPGAiMoveType~=nil then
			local numnum=tonumber(NpcManager.Attributenew[num]);
			if numnum==nil or numnum<0 then
				numnum=1;
			else
				numnum=numnum+1;
			end
			npc.RPGAiMoveType=QFWDlib.RPGNpcAIMoveType[numnum];
		end
	end
	
	--print(num)
-------------------------------------------------------------
	if npc.PropertyMgr.Practice~=nil then
		local Prt=npc.PropertyMgr.Practice;
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(Prt.DaoHang);
			if onum==nil then
				onum=0;
			end
			
			Prt:AddDaoHang(tonumber(NpcManager.Attributenew[num])-onum);
			
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.GodSoulCount = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.GodCount = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.GodPenalty = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.AccumulativeLing = tonumber(NpcManager.Attributenew[num]);
		end
		-------------
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.DivideCount = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.HeLianCount = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.JieCloudID = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.MasterID = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.NeckIndex = tonumber(NpcManager.Attributenew[num]);
		end
		------------
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.ShieldID = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.StoryBroken = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if Prt.GoldLing~=nil then
				Prt.GoldLing = tonumber(NpcManager.Attributenew[num]);
			else
				if Prt.GoldLingYin~=nil then
					Prt:MakeGold(tonumber(NpcManager.Attributenew[num]),tonumber(Prt.GoldLingYin));
				else
					Prt:MakeGold(tonumber(NpcManager.Attributenew[num]),0);
				end
			end
			Prt:MakeGold(tonumber(NpcManager.Attributenew[num]),tonumber(NpcManager.Attributenew[num]));
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if Prt.GoldLingYin~=nil then
				if Prt.GoldLing~=nil then
					Prt:MakeGold(tonumber(Prt.GoldLing),tonumber(NpcManager.Attributenew[num]));
				else
					Prt:MakeGold(0,tonumber(NpcManager.Attributenew[num]));
				end
				Prt.GoldLingYin = tonumber(NpcManager.Attributenew[num]);
			end
		end
		--num=num+1;
		--if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		--	if Prt.GoldLevel~=nil then
		--		if ModifierMain.lib~=nil then
		--			local func=ModifierMain.lib:GetMethod("NPCPractice3");
		--			if func~=nil then
		--				QFObj=Prt;
		--				QFStr="2";
		--				QFStr2=tostring(NpcManager.Attributenew[num]);
		--				QFStr3="GoldLevel";
		--				local num=func:Invoke();
		--				--print(tostring(num))
		--			end
		--			
		--		end
		--	end
		--end
		--num=num+1;
		--if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		--	if Prt.GoldLevelYin~=nil then
		--		if ModifierMain.lib~=nil then
		--			local func=ModifierMain.lib:GetMethod("NPCPractice3");
		--			if func~=nil then
		--				QFObj=Prt;
		--				QFStr="2";
		--				QFStr2=tostring(NpcManager.Attributenew[num]);
		--				QFStr3="GoldLevelYin";
		--				local num=func:Invoke();
		--				--print(tostring(num))
		--			end
		--			
		--		end
		--	end
		--end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if Prt.Dift~=nil then
				Prt.Dift = tonumber(NpcManager.Attributenew[num]);
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if Prt.NeckTryCount~=nil then
				if ModifierMain.lib~=nil then
					local func=ModifierMain.lib:GetMethod("NPCPractice3");
					if func~=nil then
						QFObj=Prt;
						QFStr="2";
						QFStr2=tostring(NpcManager.Attributenew[num]);
						QFStr3="NeckTryCount";
						local num=func:Invoke();
						print(tostring(num))
					end
					
				end
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if Prt.MasterRank~=nil then
				if ModifierMain.lib~=nil then
					local func=ModifierMain.lib:GetMethod("NPCPractice3");
					if func~=nil then
						QFObj=Prt;
						QFStr="2";
						QFStr2=tostring(NpcManager.Attributenew[num]);
						QFStr3="MasterRank";
						local num=func:Invoke();
						--print(tostring(num))
					end
					
				end
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if Prt.DaoHangJieCount~=nil then
				if ModifierMain.lib~=nil then
					local func=ModifierMain.lib:GetMethod("NPCPractice3");
					if func~=nil then
						QFObj=Prt;
						QFStr="2";
						QFStr2=tostring(NpcManager.Attributenew[num]);
						QFStr3="DaoHangJieCount";
						local num=func:Invoke();
						--print(tostring(num))
					end
					
				end
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			
			if Prt.EsotercaCount~=nil then
				if ModifierMain.lib~=nil then
					local func=ModifierMain.lib:GetMethod("NPCPractice3");
					if func~=nil then
						QFObj=Prt;
						QFStr="2";
						QFStr2=tostring(NpcManager.Attributenew[num]);
						QFStr3="EsotercaCount";
						local num=func:Invoke();
						--print(tostring(num))
					end
					
				end
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			
			if Prt.UnderstandV~=nil then
				if ModifierMain.lib~=nil then
					local func=ModifierMain.lib:GetMethod("NPCPractice3");
					if func~=nil then
						QFObj=Prt;
						QFStr="2";
						QFStr2=tostring(NpcManager.Attributenew[num]);
						QFStr3="UnderstandV";
						local num=func:Invoke();
						--print(tostring(num))
					end
					
				end
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			
			if Prt.YangDaoHang~=nil then
				if ModifierMain.lib~=nil then
					local func=ModifierMain.lib:GetMethod("NPCPractice3");
					if func~=nil then
						QFObj=Prt;
						QFStr="2";
						QFStr2=tostring(NpcManager.Attributenew[num]);
						QFStr3="YangDaoHang";
						local num=func:Invoke();
						--print(tostring(num))
					end
					Prt:AddDaoHang(0,false,false,0);
				else
					Prt:AddDaoHang(tonumber(NpcManager.Attributenew[num])-onum,false,false,1);
				end
				
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			
			if Prt.YinDaoHang~=nil then
				if ModifierMain.lib~=nil then
					local func=ModifierMain.lib:GetMethod("NPCPractice3");
					if func~=nil then
						QFObj=Prt;
						QFStr="2";
						QFStr2=tostring(NpcManager.Attributenew[num]);
						QFStr3="YinDaoHang";
						local num=func:Invoke();
						--print(tostring(num))
					end
					Prt:AddDaoHang(0,false,false,0);
				else
					Prt:AddDaoHang(tonumber(NpcManager.Attributenew[num])-onum,false,false,-1);
				end
			end
		end
		--num=num+1;
		--if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		--	
		--	if Prt.OtherDaoHang~=nil then
		--		Prt.OtherDaoHang=tonumber(NpcManager.Attributenew[num]);
		--	end
		--end
		
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.XuanDaoHang = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.OtherDaoHang = tonumber(NpcManager.Attributenew[num]);
		end
		--------------
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			if onum==nil then
				onum=0;
			end
			Prt:AddZhuJi(tonumber(NpcManager.Attributenew[num])-onum);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			if onum==nil then
				onum=0;
			end
			--if tonumber(NpcManager.Attributenew[num])-onum>=0 then
				Prt:AddTreeExp(tonumber(NpcManager.Attributenew[num])-onum,true);
			--else
			--	if ModifierMain.lib~=nil then
			--		local func=ModifierMain.lib:GetMethod("NPCPractice2");
			--		if func~=nil then
			--			QFObj=Prt;
			--			QFStr="2";
			--			QFStr2=tostring(NpcManager.Attributenew[num]);
			--			QFStr3="TreeExp";
			--			local num=func:Invoke();
			--			--print(tostring(num))
			--		end
			--		
			--	end
			--end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			if onum==nil then
				onum=0;
			end
			Prt:AddTimeEnterNeck(tonumber(NpcManager.Attributenew[num])-onum);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if tonumber(NpcManager.Attributenew[num])~=nil then
				Prt:SetStageValue(tonumber(NpcManager.Attributenew[num]));
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if tonumber(NpcManager.Attributeold[num])==nil then
				NpcManager.Attributeold[num]=0;
			end
			if tonumber(NpcManager.Attributenew[num])==nil then
				NpcManager.Attributenew[num]=0;
			end
			local localnum=tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]);
			if localnum>0 then
				Prt:AddPractice(tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]),true);
			else
				if ModifierMain.lib~=nil then
					local func=ModifierMain.lib:GetMethod("NPCPractice2");
					if func~=nil then
						QFObj=Prt;
						QFStr="2";
						QFStr3="StageValue";
						QFStr2=tostring(NpcManager.Attributenew[num]);
						local num=func:Invoke();
						--print(tostring(num))
					end
					
				end
			end
		end
		--------------------------------------------------------------------
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum=tonumber(NpcManager.Attributenew[num]);
			if numnum==nil or numnum<1 then
				numnum=1;
			else
				numnum=numnum+1;
			end
			Prt.GodElement=QFWDlib.ItemsElementTypes[numnum];
		end
	end
	--print(num);
	local typesz=tonumber(NpcManager.inputtt1.m_title.text);
	if typesz==nil or typesz<=0 then
		typesz=1;
	elseif typesz>4 then
		typesz=4;
	end
	for localKey, localValue in pairs(NpcManager.AttributesName) do
		num = num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if tonumber(NpcManager.Attributeold[num])~=nil then
				if typesz==1 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]), 0, 0, 0);
				elseif typesz==2 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]), 0, 0);
				elseif typesz==3 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, 0, tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]), 0);
				else
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, 0, 0, tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]));
				end
			else
				if typesz==1 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], tonumber(NpcManager.Attributenew[num]), 0, 0, 0);
				elseif typesz==2 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, tonumber(NpcManager.Attributenew[num]), 0, 0);
				elseif typesz==3 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, 0, tonumber(NpcManager.Attributenew[num]), 0);
				else
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, 0, 0, tonumber(NpcManager.Attributenew[num]));
				end
			end
		end
		
	end
	--print(num);
	if npc.PropertyMgr.SkillData~=nil then;
		local skilldate=npc.PropertyMgr.SkillData;
		local skillUnit=nil;
		local y=1;
		local numnumnum=nil;
		for y=1,#QFWDlib.SkillList-1 do
			if NpcManager.Attributeold[num+1] ~= NpcManager.Attributenew[num+1] or NpcManager.Attributeold[num+2] ~= NpcManager.Attributenew[num+2] then
				skillUnit=skilldate:GetSkill(QFWDlib.SkillList[y]);
				if skillUnit~=nil then
					if typesz==1 then
						skillUnit.Addv=tonumber(NpcManager.Attributenew[num+1]);
					elseif typesz==2 then
						skillUnit.Addv2=tonumber(NpcManager.Attributenew[num+1]);
					else
						skillUnit.BaseLevel=tonumber(NpcManager.Attributenew[num+1]);
					end
					numnumnum=tonumber(NpcManager.Attributenew[num+2]);
					if numnumnum==nil or numnumnum<0 then
						skillUnit.Ban=true;
					else
						skillUnit.Ban=false;
						skillUnit.Love=numnumnum;
					end
				else
					skilldate:CreateSkillUnitIfNotExist(QFWDlib.SkillList[y]);
					skillUnit=skilldate:GetSkill(QFWDlib.SkillList[y]);
					if skillUnit~=nil then
						if typesz==1 then
							skillUnit.Addv=tonumber(NpcManager.Attributenew[num+1]);
						elseif typesz==2 then
							skillUnit.Addv2=tonumber(NpcManager.Attributenew[num+1]);
						else
							skillUnit.BaseLevel=tonumber(NpcManager.Attributenew[num+1]);
						end
						numnumnum=tonumber(NpcManager.Attributenew[num+2]);
						if numnumnum==nil or numnumnum<0 then
							skillUnit.Ban=true;
						else
							skillUnit.Ban=false;
							skillUnit.Love=numnumnum;
						end
					end
				end
			end
			num = num+2;
		end
	end
	--print(num)
	if npc.PropertyMgr.BaseData~=nil then
		local Bdata=npc.PropertyMgr.BaseData;
		local y=1;
		for y=1,#QFWDlib.BasePropertyType-1 do
			num=num+1;
			if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
				local numnumnum=tonumber(NpcManager.Attributeold[num]);
				if numnumnum==nil then
					numnumnum=0;
				end
				local cnum=tonumber(NpcManager.Attributenew[num]);
				if cnum==nil then
					cnum=0;
				end
				--Bdata:AddAddion(QFWDlib.BasePropertyType[y],tonumber(cnum-numnumnum)/2,tonumber(cnum-numnumnum)/2,false);
				-- --print(num,cnum,numnumnum)
				-- -- local nfive=nil;
				-- -- while true do
					-- -- nfive = Bdata:GetValue(QFWDlib.BasePropertyType[y]);
					-- -- Bdata:AddAddion(QFWDlib.BasePropertyType[y],tonumber(cnum-numnumnum),tonumber(cnum-numnumnum),false);
					
				-- -- end
				-- Bdata:CleanOverwrite(QFWDlib.BasePropertyType[y]);
				if  typesz==1 then
					Bdata:AddAddion(QFWDlib.BasePropertyType[y],tonumber(cnum-numnumnum),0, true);
					--print(num,QFWDlib.BasePropertyType[y],cnum);
				elseif typesz==2 then
					
					Bdata:AddAddion(QFWDlib.BasePropertyType[y],0,tonumber(cnum-numnumnum), true);
					--print(num,QFWDlib.BasePropertyType[y],cnum);
				else
					--print("MOD版修改器:base");
					Bdata:SetBaseValue(QFWDlib.BasePropertyType[y], tonumber(cnum));
					--print(num,QFWDlib.BasePropertyType[y],cnum);
					--Bdata:SetBaseValue(QFWDlib.BasePropertyType[y],tonumber(cnum));
				end
			end
		end
	end
	--print(num)
	if npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local godPData=npc.PropertyMgr.Practice.GodPracticeData;
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			godPData.Faith = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			godPData.FaithJieCount = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			godPData.Population = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			godPData.WillAddCount = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			if onum==nil then
				onum=0;
			end
			godPData:AddGodCityScore(tonumber(NpcManager.Attributenew[num])-onum);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			if onum==nil then
				onum=0;
			end
			godPData:AddListenKeep(tonumber(NpcManager.Attributenew[num])-onum);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			if onum==nil then
				onum=0;
			end
			godPData:AddObsession(tonumber(NpcManager.Attributenew[num])-onum);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			if onum==nil then
				onum=0;
			end
			godPData:AddStatueCount(tonumber(NpcManager.Attributenew[num])-onum);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			local nnum=tonumber(NpcManager.Attributenew[num]);
			if onum==nil then
				onum=0;
			end
			if nnum==nil then
				nnum=0;
			end
			local numnum= math.modf(nnum-onum);
			if numnum>=1 then
				for onum=1,numnum do
					godPData:AddCell();
				end
			end
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			local nnum=tonumber(NpcManager.Attributenew[num]);
			if onum==nil then
				onum=0;
			end
			if nnum==nil then
				nnum=0;
			end
			local numnum= math.modf(nnum-onum);
			if numnum>=1 then
				for onum=1,numnum do
					godPData:MindStateLevelLevelUp();
				end
			end
		end
		-------------------------------------------------------
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum = tonumber(NpcManager.Attributenew[num]);
			if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
				godPData.NeedFeisheng=false;
			else
				godPData.NeedFeisheng=true;
			end
		end
		------------------------------------------------------------
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum=tonumber(NpcManager.Attributenew[num]);
			if numnum==nil or numnum<1 then
				numnum=1;
			else
				numnum=numnum+1;
			end
			Prt.GodElement=QFWDlib.MindStateLevel[numnum];
		end
		-------------------------------------------------------------
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum=tonumber(NpcManager.Attributenew[num]);
			if numnum==nil then
				numnum=0;
			end
			godPData:Step(numnum);
		end
		---------------------------------------------------------------
	end
	--print(num)
----------------------------------------------------
	if npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local bodyPData=npc.PropertyMgr.Practice.BodyPracticeData;
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			bodyPData.LTunaKeep = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			bodyPData.LTunaKey = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			bodyPData.NextSeed = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num]);
			if onum==nil then
				onum=0;
			end
			bodyPData:AddZhenQi(tonumber(NpcManager.Attributenew[num])-onum);
		end
		-------------------------------------------------------------
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum=tonumber(NpcManager.Attributenew[num]);
			if numnum==nil then
				numnum=0;
			end
			bodyPData:Step(numnum);
		end
		---------------------------------------------------------------
	end
	--print(num)
----------------------------------------------------
	if npc.LsInfo~=nil then
		local lsData=npc.LsInfo;
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.GrowPercent = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.LingShouShitP = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.EatSort = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.EatTypeIdx = tonumber(NpcManager.Attributenew[num]);
		end
		---------------------------------------------------------------
	end
	--print(num)
	if npc.LsInfo~=nil and npc.LsInfo.Nurtition~=nil then
		local lsData=npc.LsInfo.Nurtition;
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.HuTi = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.LingZhi = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.NeiDan = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.QiGan = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.ShuFa = tonumber(NpcManager.Attributenew[num]);
		end
		---------------------------------------------------------------
	end
	--print(num)
	if npc.ThingToHuman~=nil then
		local lsData=npc.ThingToHuman;
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.thingid = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.rate = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.time = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.item = NpcManager.Attributenew[num];
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.tname = NpcManager.Attributenew[num];
		end
		---------------------------------------------------------------
	end
	--print(num)
	if npc.AnimalHumanFrom~=nil then
		local lsData=npc.AnimalHumanFrom;
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.AnimalBodyColor = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.AnimalHairID = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.bodyType = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.state = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.ThunderComing = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.ThunderValue = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.FromRace = NpcManager.Attributenew[num];
		end
		---------------------------------------------------------------
	end
	--print(num)
	if npc.A2H~=nil then
		local lsData=npc.A2H;
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.BeRobLevel = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.CanThinkCount = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.QiZhiPassTime = tonumber(NpcManager.Attributenew[num]);
		end
		num=num+1;
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.thinkInterval = tonumber(NpcManager.Attributenew[num]);
		end
		---------------------------------------------------------------
	end
	print(num)
	if IsNeedInteBehave then
		npc:InitBehaviour();
	end
	if npc.view ~= nil and npc.view.needUpdateMod ~=nil then
		npc.view.needUpdateMod = true;
	end
	NpcManager:UpdateChildAttribute();
end





function NpcManager:UpdateChildNpcByNpcListSS(obj)
	obj.m_list:RemoveChildrenToPool();
	local NpcLists=NpcListSS;
	local num=1;
	NpcManager.NpcList={};
	local k,v;
	for k, v in pairs(NpcLists) do
		NpcManager.NpcList[num]=NpcLists[k];
		NpcManager:AddChildToList(obj,tostring(k+1),tostring(k+1)..": "..tostring(v));
		num=num+1;
	end
	NpcManager.chooseNpcNum = tonumber(NpcManager.inputid1.m_title.text);
	if NpcManager.chooseNpcNum == nil then
		return;
	elseif NpcManager.chooseNpcNum ==0 then
		return;
	elseif NpcManager.chooseNpcNum > #NpcManager.NpcList then
		return;
	else
		NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum]);
		NpcManager.ShowLableNpc.text = QFLanguage.GetText(">NpcManager_Tips151")..": "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName();
		NpcManager.AttributeFlag =0;
	end
	return obj;
end
function NpcManager:UpdateChildNpc(obj,types,easyList)
	obj.m_list:RemoveChildrenToPool();
	NpcManager:ShowObjsName(0);
	local NpcLists={};
	if types==4 then
		obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips186");
		NpcManager.inputid1.m_title.text="1";
		NpcManager.ChooseThingNum=1;
		NpcLists=easyList;
	else
		if types==0 then
			obj.m_title.text = QFLanguage.GetText(">EventSet_Tips13");
			NpcLists=Map.Things:GetActiveNpcs();
		else
			obj.m_title.text = QFLanguage.GetText(">EventSet_Tips14");
			NpcLists=ThingMgr:GetThingList(QFWDlib.ThingTypes[2]);--:GetActiveNpcs();
		end
	end
	local localKey=nil;
	local localValue=nil;
	local num=1;
	NpcManager.NpcList={};
	if types==4 then
		for localKey, localValue in pairs(NpcLists) do
			NpcManager.NpcList[num]=NpcLists[localKey];
			NpcManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(localValue:GetName()));
			num=num+1;
		end
	else
		for localKey, localValue in pairs(NpcLists) do
			NpcManager.NpcList[num]=NpcLists[localKey];
			NpcManager:AddChildToList(obj,tostring(localKey+1),tostring(localKey+1)..": "..tostring(localValue:GetName()));
			num=num+1;
		end
	end
	return obj;
end
function NpcManager:ShowNpcAllBuffList(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips187");
	local num=1;
	local localValue=nil;
	for _, localValue in pairs(QFWDlib.ModifierListTrue) do
		if QFWDlib.ModifierListDisplayName[num] == "未知" then
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue));
		else
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.ModifierListDisplayName[num].."--"..tostring(localValue));
		end
		num=num+1;
	end
	return obj;
end
function NpcManager:AddNpcBuffList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if  tonumber(NpcManager.SInput1.m_title.text) ~= nil  then
		if tonumber(NpcManager.SInput1.m_title.text) <= #QFWDlib.ModifierListTrue then
			NpcManager.SInput1.m_title.text = QFWDlib.ModifierListTrue[tonumber(NpcManager.SInput1.m_title.text)];
		end
	end
	npc:AddModifier(NpcManager.SInput1.m_title.text , 1, false, 1, 0, false, -1)
	NpcManager:UpdataNpcBuffList();
end
function NpcManager:ListRemoveBuff()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local num=tonumber(NpcManager.SInput1.m_title.text);
	if  num ~= nil  then
		if num <= #NpcManager.aNPCAllBuffList then
			npc.PropertyMgr:RemoveModifier(NpcManager.aNPCAllBuffList[num],false)
			NpcManager.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips18");
		else
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips188");
		end
	end
	
	NpcManager:UpdataNpcBuffList();
end
function NpcManager:UpdataNpcBuffList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local myModifierList = npc.PropertyMgr.m_lisModifiers;
	NpcManager.aNPCAllBuffList={};
	if myModifierList ~= nil then
		local num =1;
		local k,v;
		for k, v in pairs(myModifierList) do
			NpcManager.aNPCAllBuffList[num]=v.def.Name
			num=num+1;
		end
	end
	NpcManager:UpdateChildNpc3(NpcManager.NpcListCOP);
end
function NpcManager:UpdateChildNpc3(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips189")..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName();
	local list = NpcManager.aNPCAllBuffList;--:GetActiveNpcs();
	local num=1;
	local k,v;
	for k, v in pairs(list) do
		NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v));
		num=num+1;
	end
	return obj;
end



function NpcManager:ShowNpcAllFeature(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips190");
	local num=1;
	local k,v;
	for k, v in pairs(QFWDlib.FeatureListTrue) do
		if QFWDlib.FeatureListDisplayName[num] == "未知" then
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v));
		else
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.FeatureListDisplayName[num].."--"..tostring(v));
		end
		num=num+1;
	end
	return obj;
end

function NpcManager:ListAddFeature()
	-- for k, v in pairs(CS.XiaWorld.NpcFeatureMgr:GetMapFeatureDefs()) do
		-- --NpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(v));
	-- end
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if tonumber(NpcManager.SInput1.m_title.text) ~= nil  then
		if tonumber(NpcManager.SInput1.m_title.text) <= #QFWDlib.FeatureListTrue then
			NpcManager.SInput1.m_title.text = QFWDlib.FeatureListTrue[tonumber(NpcManager.SInput1.m_title.text)];
		end
	end
	npc.PropertyMgr:AddFeature(NpcManager.SInput1.m_title.text);
	NpcManager:UpdataNpcFeatureList();
end
function NpcManager:ListRemoveFeature()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local num=tonumber(NpcManager.SInput1.m_title.text);
	if  num ~= nil  then
		if num <= #NpcManager.aNPCAllFeatureList then
			npc.PropertyMgr:RemoveFeature(NpcManager.aNPCAllFeatureList[num]);
			
			NpcManager.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips18");
		else
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips188");
		end
	end
	
	NpcManager:UpdataNpcFeatureList();
end
function NpcManager:UpdataNpcFeatureList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local myModifierList = npc.PropertyMgr.FeatureList;
	NpcManager.aNPCAllFeatureList={};
	if myModifierList ~= nil then
		local num =1;
		local k,v;
		for k, v in pairs(myModifierList) do
			NpcManager.aNPCAllFeatureList[num]=v.Name
			num=num+1;
		end
	end
	NpcManager:UpdateChildNpc4(NpcManager.NpcListCOP);
end
function NpcManager:UpdateChildNpc4(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips191")..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName();
	local list = NpcManager.aNPCAllFeatureList;--:GetActiveNpcs();
	local num=1;
	local k,v;
	for k, v in pairs(list) do
		NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v));
		num=num+1;
	end
	return obj;
end


function NpcManager:ShowNpcAllExperience(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips192");
	local num=1;
	local k,v;
	for k, v in pairs(QFWDlib.ExperienceListTrue) do
		if QFWDlib.ExperienceListDisplayName[num] == "未知" then
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v));
		else
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.ExperienceListDisplayName[num].."--"..tostring(v));
		end
		num=num+1;
	end
	return obj;
end

function NpcManager:ListAddExperience()
	-- for k, v in pairs(CS.XiaWorld.NpcFeatureMgr:GetMapFeatureDefs()) do
		-- --NpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(v));
	-- end
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local data=NpcManager.SInput1.m_title.text;
	if tonumber(data) ~= nil  then
		if tonumber(data) <= #QFWDlib.ExperienceListTrue  then
			NpcManager.SInput1.m_title.text = QFWDlib.ExperienceListTrue[tonumber(data)];
		end
	end
	npc.PropertyMgr:AddExperience(NpcManager.SInput1.m_title.text);
	-- local exdef = NpcMgr.ExperienceMgr:GetDef(NpcManager.input10.m_title.text);
	-- if exdef.Name ~= nil then
			-- NpcMgr.ExperienceMgr:DoExperience(npc,exdef);
			-- print("MOD版修改器:Have do Experience!")
	-- end
	NpcManager:UpdataNpcExperienceList();
end
function NpcManager:ListRemoveExperience()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local num=tonumber(NpcManager.SInput1.m_title.text);
	if  num ~= nil  then
		if num <= #NpcManager.aNPCAllExperienceList then
			npc.PropertyMgr:RemoveExperience(NpcManager.aNPCAllExperienceList[num]);
			
			NpcManager.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips18");
		else
			NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips188");
		end
	end
	
	NpcManager:UpdataNpcExperienceList();
end
function NpcManager:UpdataNpcExperienceList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local myModifierList = npc.PropertyMgr.ExperienceList;
	NpcManager.aNPCAllExperienceList={};
	if myModifierList ~= nil then
		local num =1;
		local k,v;
		for k, v in pairs(myModifierList) do
			NpcManager.aNPCAllExperienceList[num]=v.Name
			num=num+1;
		end
	end
	NpcManager:UpdateChildNpc5(NpcManager.NpcListCOP);
end
function NpcManager:UpdateChildNpc5(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips193")..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName();
	local list = NpcManager.aNPCAllExperienceList;--:GetActiveNpcs();
	local num=1;
	local k,v;
	for k, v in pairs(list) do
		NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v));
		num=num+1;
	end
	return obj;
end



function NpcManager:ShowNpcAllMood(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips194");
	local num=1;
	local k,v;
	for k, v in pairs(QFWDlib.MoodListTrue) do
		if QFWDlib.MoodListDisplayName[num] == "未知" then
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v));
		else
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.MoodListDisplayName[num].."--"..tostring(v));
		end
		num=num+1;
	end
	return obj;
end

function NpcManager:ListAddMood()
	-- for k, v in pairs(CS.XiaWorld.NpcFeatureMgr:GetMapFeatureDefs()) do
		-- --NpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(v));
	-- end
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if tonumber(NpcManager.SInput1.m_title.text) ~= nil  then
		if tonumber(NpcManager.SInput1.m_title.text) <= #QFWDlib.MoodListTrue  then
			NpcManager.SInput1.m_title.text = QFWDlib.MoodListTrue[tonumber(NpcManager.SInput1.m_title.text)];
		end
	end
	npc.PropertyMgr.MoodData:AddMood(NpcManager.SInput1.m_title.text);
	-- local exdef = NpcMgr.MoodMgr:GetDef(NpcManager.input12.m_title.text);
	-- if exdef.Name ~= nil then
			-- NpcMgr.MoodMgr:DoMood(npc,exdef);
			-- print("MOD版修改器:Have do Mood!")
	-- end
	NpcManager:UpdataNpcMoodList();
end
function NpcManager:ListRemoveMood(types)
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local myModifierList = npc.PropertyMgr.MoodData.m_mapId2Mood;
	local num=tonumber(NpcManager.SInput1.m_title.text);
	if types==nil or types==0 then
		if  num ~= nil  then
			if num <= #NpcManager.aNPCAllMoodList then
				local k,v;
				for k, v in pairs(myModifierList) do
					if k~=nil and v~=nil and v.def~=nil and v.def.Name == NpcManager.aNPCAllMoodList[num] then
						npc.PropertyMgr.MoodData:RemoveMood(k);
						break;
					end
				end
				
				--npc.PropertyMgr.MoodData:RemoveAllMood();
				NpcManager.ShowLable.text =  QFLanguage.GetText(">MapAreaSet_Tips18");
			else
				NpcManager.ShowLable.text =  QFLanguage.GetText(">NpcManager_Tips188");
			end
		end
	elseif types==1 then
		npc.PropertyMgr.MoodData:RemoveTimeMood();
		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips195");
	elseif types==2 then
		npc.PropertyMgr.MoodData:RemoveAllMood();
		--npc.PropertyMgr.MoodData.MoodList:Clear();
		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips196");
	end
	
	
	NpcManager:UpdataNpcMoodList();
end
function NpcManager:UpdataNpcMoodList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	local myModifierList = npc.PropertyMgr.MoodData.m_mapId2Mood;
	NpcManager.aNPCAllMoodList={};
	if myModifierList ~= nil then
		local num =1;
		
		-- for k, v in pairs(QFWDlib.MoodListTrue) do
			-- if npc.PropertyMgr.MoodData:CheckMood(v) then
				-- print(v);
			-- end
			-- num=num+1;
		-- end
		local k,v;
		for k, v in pairs(myModifierList) do
			if k~=nil and v~=nil and v.def~=nil then
				NpcManager.aNPCAllMoodList[num]=tostring(v.def.Name);
				num=num+1;
			end
			--print(v.ID)
		end
	end
	NpcManager:UpdateChildNpc6(NpcManager.NpcListCOP);
end
function NpcManager:UpdateChildNpc6(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">NpcManager_Tips197")..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName();
	local list = NpcManager.aNPCAllMoodList;--:GetActiveNpcs();
	local num=1;
	local k,v;
	for k, v in pairs(list) do
		NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(NpcMgr:GetMoodDef(v).DisplayName).."-"..tostring(v));
		num=num+1;
	end
	return obj;
end
function NpcManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(NpcManager.ListChildOnClick);
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
function NpcManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(NpcManager.ListChildOnClick2);
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
function NpcManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	NpcManager.TheClickBnt = tonumber(Eventss.data.name);
	NpcManager:SetSetting();
	
end
function NpcManager:SetSetting(types)
	local obj=nil;
	if types==nil then
		obj=NpcManager.input1;
	else
		obj=NpcManager.input2;
	end
	obj.m_title.text=tostring(NpcManager.TheClickBnt);
	NpcManager.input2.m_title.text=tostring(NpcManager.Attributenew[NpcManager.TheClickBnt]);
	NpcManager.ShowLableAttribute.text=QFLanguage.GetText(">ThingManager_ShowLableAttribute")..": "..tostring(NpcManager.AttributeDisPlayName[NpcManager.TheClickBnt]);

end
function NpcManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	NpcManager.TheClickBnt = tonumber(Eventss.data.name);
	NpcManager:SetSetting2();
	
end
function NpcManager:SetSetting2()
	local obj=nil;
	local types=NpcManager.FuncNum;
	if types==nil or types==0 then
		obj=NpcManager.inputid1;
	else
		obj=NpcManager.SInput1;
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(NpcManager.TheClickBnt);
--		NpcManager:ChooseThingNumAndGetAttribute(NpcManager.TheClickBnt);
		NpcManager.chooseNpcNum = tonumber(NpcManager.TheClickBnt);
		NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum]);
		NpcManager.ShowLableNpc.text = QFLanguage.GetText(">NpcManager_Tips151")..": "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName();
	elseif types<=8 then
		obj.m_title.text=tostring(NpcManager.TheClickBnt);
	end
end
function NpcManager:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y);
	obj.text = value;
	obj.name = names;
	obj.tooltips = texts;
	return obj;
end
function NpcManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function NpcManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function NpcManager:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*5, 20, false);
	obj.m_title.text = value;
	--obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function NpcManager:AddPicture(name,x,y,w,h)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7ua9y2ovth",x,y);
	if obj==nil then
		return nil;
	end
	obj.name = name;
	if obj.m_n166==nil or  obj.m_n167==nil or obj.m_n170==nil or obj.m_n168==nil then
		return nil;
	end
	obj.m_n167.visible=false;
	obj.m_n168.visible=false;
	
	obj.m_n170.visible=false;
	w=tonumber(w);
	h=tonumber(h);
	if w==nil then
		w=3;
	end
	if h==nil then
		h=3;
	end
	--obj.m_n166:SetSize(self.sx/10*w*0.9, self.sy/10*h*0.9, true);
	obj:SetSize(self.sx/10*w, self.sy/10*h, true);
	return obj;
end
function NpcManager:AddCOP3(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl7",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(NpcManager.ListChildOnClick3);
	obj.m_list.columnCount=6;
	obj.m_list:SetSize(self.sx/10*2.6,self.sy/10*3.98);
	obj.m_n0:SetSize(self.sx/10*2.65,self.sy/10*4);
	obj:SetSize(self.sx/10*2.2, self.sy/10*2.6, true);
	return obj;
end
function NpcManager:AddChild(tobj)
	if tobj==nil then
		obj=NpcManager.FuncListCOP;
	else
		obj=tobj;
	end
	obj.m_list:RemoveChildrenToPool();
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum];
	if npc==nil then
		return false;
	end
	-- if npc.NpcMods ~=nil then
		-- local k,v;
		-- for k, v in pairs(npc.NpcMods) do
			-- if v~=nil then
				-- print(v)
			-- end
		-- end
	-- end
	if NpcManager:NPCIsFishing() then
		NpcManager:AddChildToList3(obj,"btnNpcAutoFishing",NpcManager.Word1[44],NpcManager.Word2[44]);
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil then
		NpcManager:AddChildToList3(obj,"btnNpcBreakNeck",NpcManager.Word1[1],NpcManager.Word2[1]);
	end
	NpcManager:AddChildToList3(obj,"btnNpcThunderKill",NpcManager.Word1[2],NpcManager.Word2[2]);
	NpcManager:AddChildToList3(obj,"btnNpcKillNoCause",NpcManager.Word1[3],NpcManager.Word2[3]);
	NpcManager:AddChildToList3(obj,"btnNpcRemoveNPC",NpcManager.Word1[4],NpcManager.Word2[4]);
	NpcManager:AddChildToList3(obj,"btnNpcNoClothes",NpcManager.Word1[5],NpcManager.Word2[5]);
	NpcManager:AddChildToList3(obj,"btnNpcHealthyBody",NpcManager.Word1[6],NpcManager.Word2[6]);
	NpcManager:AddChildToList3(obj,"btnNpcReborn",NpcManager.Word1[7],NpcManager.Word2[7]);
	
	NpcManager:AddChildToList3(obj,"btnNpcForceReborn",NpcManager.Word1[8],NpcManager.Word2[8]);
	NpcManager:AddChildToList3(obj,"btnDeadLive",NpcManager.Word1[9],NpcManager.Word2[9]);
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil then
		NpcManager:AddChildToList3(obj,"btnNpcKillCloud",NpcManager.Word1[10],NpcManager.Word2[10]);
		NpcManager:AddChildToList3(obj,"btnNpcUpgradeStage",NpcManager.Word1[11],NpcManager.Word2[11]);
	end
	if npc.IsSmartRace==true then
		NpcManager:AddChildToList3(obj,"btnNpcObsessionMindFull",NpcManager.Word1[12],NpcManager.Word2[12]);
		NpcManager:AddChildToList3(obj,"btnNpcRemoveObsession",NpcManager.Word1[13],NpcManager.Word2[13]);
		NpcManager:AddChildToList3(obj,"btnNpcUpGradeObsessionMind",NpcManager.Word1[14],NpcManager.Word2[14]);
	end
	if npc.GongKind==CS.XiaWorld.g_emGongKind.God then
		--NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcBFull","提升信仰","该功能仅用于提升神修的核心信徒的信仰10点。");
		NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcAdd",NpcManager.Word1[15],NpcManager.Word2[15]);
		-- NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcUpF","信仰提升","该功能仅用于神修的信徒提升信仰供给度。\n默认信仰供给度提升10点");
		-- NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcDownF","信仰降低","该功能仅用于神修的信徒降低信仰供给度。\n默认信仰供给度降低10点");
		
		NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcUpB",NpcManager.Word1[16],NpcManager.Word2[16]);
		NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcDownB",NpcManager.Word1[17],NpcManager.Word2[17]);
		
		NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcRemove",NpcManager.Word1[18],NpcManager.Word2[18]);
		
		NpcManager:AddChildToList3(obj,"btnNPCRemoveBuildings",NpcManager.Word1[19],NpcManager.Word2[19]);
		
		NpcManager:AddChildToList3(obj,"btnNPCUnlockBuildings",NpcManager.Word1[20],NpcManager.Word2[20]);
		NpcManager:AddChildToList3(obj,"btnNPCFinishWish",NpcManager.Word1[21],NpcManager.Word2[21]);
		NpcManager:AddChildToList3(obj,"btnNPCReWish",NpcManager.Word1[51],NpcManager.Word2[51]);
		--NpcManager:AddChildToList3(obj,"btnNPCNoUseGuards",NpcManager.Word1[52],NpcManager.Word2[52]);
		NpcManager:AddChildToList3(obj,"btnNPCGuardsUnlockAll",NpcManager.Word1[53],NpcManager.Word2[53]);
		NpcManager:AddChildToList3(obj,"btnNPCGuardsAddAll",NpcManager.Word1[55],NpcManager.Word2[55]);
		NpcManager:AddChildToList3(obj,"btnNPCGuardsReAll",NpcManager.Word1[54],NpcManager.Word2[54]);
		
	end
	if npc.GongKind==CS.XiaWorld.g_emGongKind.Body then
		NpcManager:AddChildToList3(obj,"btnRmAllJH",NpcManager.Word1[46],NpcManager.Word2[46]);
		NpcManager:AddChildToList3(obj,"btnGetAllJH",NpcManager.Word1[47],NpcManager.Word2[47]);
		NpcManager:AddChildToList3(obj,"btnGetNowAllJH",NpcManager.Word1[48],NpcManager.Word2[48]);
		
	end
	NpcManager:AddChildToList3(obj,"btnNpcFullFive",NpcManager.Word1[22],NpcManager.Word2[22]);
	NpcManager:AddChildToList3(obj,"btnNpcFullNeed",NpcManager.Word1[23],NpcManager.Word2[23]);
	NpcManager:AddChildToList3(obj,"btnNpcEmptyNeed",NpcManager.Word1[24],NpcManager.Word2[24]);
	
	if npc.IsSmartRace==true then
		NpcManager:AddChildToList3(obj,"btnFullHaoGan",NpcManager.Word1[25],NpcManager.Word2[25]);
		NpcManager:AddChildToList3(obj,"btnZeroHaoGan",NpcManager.Word1[26],NpcManager.Word2[26]);
		NpcManager:AddChildToList3(obj,"btnEmptyHaoGan",NpcManager.Word1[27],NpcManager.Word2[27]);
		NpcManager:AddChildToList3(obj,"btnNoHaoGan",NpcManager.Word1[28],NpcManager.Word2[28]);
	end
	NpcManager:AddChildToList3(obj,"btnNpcRemoveResistance",NpcManager.Word1[29],NpcManager.Word2[29]);
	NpcManager:AddChildToList3(obj,"btnRemoveMemeries",NpcManager.Word1[30],NpcManager.Word2[30]);

	NpcManager:AddChildToList3(obj,"btnNpcToPuppet",NpcManager.Word1[31],NpcManager.Word2[31]);
	NpcManager:AddChildToList3(obj,"btnNpcToZombie",NpcManager.Word1[32],NpcManager.Word2[32]);
	if npc.Race~=nil and npc.Race.JYRace~=nil and npc.Race.JYRace~="" then
		NpcManager:AddChildToList3(obj,"btnNpcMakeElite",NpcManager.Word1[33],NpcManager.Word2[33]);
	end
	if npc.IsLingShou==false then
		NpcManager:AddChildToList3(obj,"btnNpcToLS",NpcManager.Word1[34],NpcManager.Word2[34]);
	else
		NpcManager:AddChildToList3(obj,"btnNpcToLS",NpcManager.Word1[35],NpcManager.Word2[35]);
	end
	if npc.IsSmartRace==false then
		NpcManager:AddChildToList3(obj,"btnNpcKZ",NpcManager.Word1[36],NpcManager.Word2[36]);
	end
	if npc.AnimalHumanFrom~=nil and npc.AnimalHumanFrom.state~=2 then
		NpcManager:AddChildToList3(obj,"btnNPCBodyToHuman",NpcManager.Word1[37],NpcManager.Word2[37]);
	end
	
	if npc.LockMove then
		NpcManager:AddChildToList3(obj,"btnNpcCantMove",NpcManager.Word1[38],NpcManager.Word2[38]);
	else
		NpcManager:AddChildToList3(obj,"btnNpcCantMove",NpcManager.Word1[39],NpcManager.Word2[39]);
	end
	
	NpcManager:AddChildToList3(obj,"btnNPCXPCS",NpcManager.Word1[40],NpcManager.Word2[40]);
	if npc.PropertyMgr~=nil then
		if npc.PropertyMgr:HasModifier("SysPracticeDie") then
			NpcManager:AddChildToList3(obj,"btnNPCCHDJ",NpcManager.Word1[41],NpcManager.Word2[41]);
		else
			NpcManager:AddChildToList3(obj,"btnNPCCHDJ",NpcManager.Word1[42],NpcManager.Word2[42]);
		end
	end
	if npc.Race~=nil and npc.Race.HorseItem~=nil then
		NpcManager:AddChildToList3(obj,"btnNpcMakeHorse",NpcManager.Word1[45],NpcManager.Word2[45]);
	end
	NpcManager:AddChildToList3(obj,"btnNpcCloneNPC",NpcManager.Word1[49],NpcManager.Word2[49]);
	NpcManager:AddChildToList3(obj,"btnNpcGetSave",NpcManager.Word1[50],NpcManager.Word2[50]);
	--NpcManager:AddChildToList3(obj,"btnNpcInteSave",NpcManager.Word1[51],NpcManager.Word2[51]);
	--NpcManager:AddChildToList3(obj,"btnNpcInteSaveP",NpcManager.Word1[52],NpcManager.Word2[52]);
	
	NpcManager:AddChildToList3(obj,"btnNPCSetPostion",NpcManager.Word1[43],NpcManager.Word2[43]);
	
end
function NpcManager:AddChildToList3(tobj,name,value,topText)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g7hdhl18");
	obj.name = name;
	
	obj:SetSize(self.sx/10*2.5, 25, false);
	obj.m_title.text = value;
	if tostring(topText)~=nil and tostring(topText)~="nil" then
		obj.tooltips=topText;
	end
	--obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function NpcManager.ListChildOnClick3(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	local obj = Eventss.data;
		
		if obj.name == "btnNpcMakeHorse" then
			if NpcManager:NPCToHorse() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips202");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips203");
			end
			return;
		end
		if obj.name == "btnNpcAutoFishing" then
			if NpcManager:NPCAutoFishing() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips199");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips200");
			end
			return;
		end
		
		if obj.name == "btnNPCSetPostion" then
			if NpcManager:NPCSetPostion() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips61");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips62");
			end
			return;
		end
		if obj.name == "btnNPCCHDJ" then
			if NpcManager:NPCCHDJ() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips63");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips64");
			end
			return;
		end
		if obj.name == "btnNPCXPCS" then
			if NpcManager:NPCXPCS() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips65");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips66");
			end
			return;
		end
		if obj.name == "btnNpcToLS" then
			if NpcManager:NpcToLS() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips67");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips68");
			end
			return;
		end
		if obj.name == "btnNpcMakeElite" then
			if NpcManager:NpcMakeElite() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips69");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips70");
			end
			return;
		end
		if obj.name == "btnNpcBreakNeck" then
			if NpcManager:NpcBreakNeck() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips71");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips72");
			end
			return;
		end
		if obj.name == "btnNpcUpGradeObsessionMind" then
			if NpcManager:NpcUpGradeObsessionMind() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips73");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips74");
			end
			return;
		end
		if obj.name == "btnNpcObsessionMindFull" then
			if NpcManager:NpcObsessionMindFull() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips75");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips76");
			end
			return;
		end
		if obj.name == "btnNpcFullFive" then
			if NpcManager:NpcFullFive() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips77");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips78");
			end
			return;
		end
		if obj.name == "btnNpcRemoveObsession" then
			if NpcManager:NpcRemoveObsession() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips79");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips80");
			end
			return;
		end
		if obj.name == "btnNpcUpgradeStage" then
			if NpcManager:NpcUpgradeStage() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips81");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips82");
			end
			return;
		end
		if obj.name == "btnNpcNoClothes" then
			if NpcManager:NpcNoClothes() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips83");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips84");
			end
			return;
		end
		if obj.name == "btnFullHaoGan" then
			if NpcManager:FullHaoGan() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips85");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips86");
			end
			return;
		end
		if obj.name == "btnZeroHaoGan" then
			if NpcManager:ZeroHaoGan() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips87");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips88");
			end
			return;
		end
		if obj.name == "btnEmptyHaoGan" then
			if NpcManager:EmptyHaoGan() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips89");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips90");
			end
			return;
		end
		if obj.name == "btnNoHaoGan" then
			if NpcManager:NoHaoGan() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips91");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips92");
			end
			return;
		end
		
		
		if obj.name == "btnNpcToPuppet" then
			if NpcManager:NpcToPuppet() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips93");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips94");
			end
			return;
		end
		if obj.name == "btnNpcToZombie" then
			if NpcManager:NpcToZombie() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips95");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips96");
			end
			return;
		end
		if obj.name == "btnNpcKillCloud" then
			if NpcManager:KillCloud() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips97");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips98");
			end
			return;
		end
		if obj.name == "btnNpcReborn" then
			if NpcManager:NpcReborn() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips99");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips100");
			end
			return;
		end
		if obj.name == "btnNpcThunderKill" then
			if NpcManager:ThunderKill() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips101");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips102");
			end
			return;
		end
		if obj.name == "btnNpcHealthyBody" then
			if NpcManager:HealthyBody() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips103");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips104");
			end
			return;
		end
		if obj.name == "btnNpcKillNoCause" then
			if NpcManager:KillNoCause() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips105");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips106");
			end
			return;
		end
		if obj.name == "btnNpcRebornML" then
			if NpcManager:NpcRebornML() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips107");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips108");
			end
			return;
		end
		if obj.name == "btnNpcForceReborn" then
			if NpcManager:NpcForceReborn() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips109");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips110");
			end
			return;
		end
		if obj.name == "btnNpcFullNeed" then
			if NpcManager:NpcFullNeed() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips111");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips112");
			end
			return;
		end
		if obj.name == "btnNpcEmptyNeed" then
			if NpcManager:EmptyNeed() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips113");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips114");
			end
			return;
		end
		if obj.name == "btnNpcRemoveResistance" then
			if NpcManager:RemoveResistance() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips115");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips116");
			end
			return;
		end
		if obj.name == "btnRemoveMemeries" then
			if NpcManager:RemoveMemeries() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips117");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips118");
			end
			return;
		end
		if obj.name == "btnNpcRemoveNPC" then
			if NpcManager:RemoveNPC() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips119");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips120");
			end
			return;
		end
		if obj.name == "btnNpcCantMove" then
			if NpcManager:NpcCantMove() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips121");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips122");
			end
			return;
		end
		if obj.name == "btnNpcCloneNPC" then
			if NpcManager:NpcCloneNPCS() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips123");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips124");
			end
			return;
		end
		if obj.name == "btnDeadLive" then
			if NpcManager:DeadLive() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips125");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips126");
			end
			return;
		end
		if obj.name == "btnNpcKZ" then
			if NpcManager:NpcKZ() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips127");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips128");
			end
			return;
		end
		if obj.name == "btnRmAllJH" then
			if NpcManager:NPCBodyRmAllJH() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips205");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips206");
			end
			return;
		end
		if obj.name == "btnGetAllJH" then
			if NpcManager:NPCBodyAddAllJH() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips208");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips209");
			end
			return;
		end
		if obj.name == "btnGetNowAllJH" then
			if NpcManager:NPCBodyAddNowAllJH() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips211");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips212");
			end
			return;
		end
		if obj.name == "btnNpcGetSave" then
			if NpcManager:NpcGetSave() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips216");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips217");
			end
			return;
		end
		--if obj.name == "btnNPCUseGuards" then
		--	if NpcManager:NPCUseGuards() then
		--		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips225");
		--	else
		--		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips226");
		--	end
		--	return;
		--end
		--if obj.name == "btnNPCNoUseGuards" then
		--	if NpcManager:NPCNoUseGuards() then
		--		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips227");
		--	else
		--		NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips228");
		--	end
		--	return;
		--end
		if obj.name == "btnNPCGuardsUnlockAll" then
			if NpcManager:NPCGuardsUnlockAll() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips229");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips230");
			end
			return;
		end
		if obj.name == "btnNPCGuardsReAll" then
			if NpcManager:NPCGuardsReAll() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips231");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips232");
			end
			return;
		end
		if obj.name == "btnNPCGuardsAddAll" then
			if NpcManager:NPCGuardsUnlockAll(1) then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips234");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips235");
			end
			return;
		end
		if obj.name == "btnNPCGodCoreNpcUpB" then
			if NpcManager:NPCGodCoreNpcUpB() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips44");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips45");
			end
			return;
		end
		if obj.name == "btnNPCGodCoreNpcDownB" then
			if NpcManager:NPCGodCoreNpcDownB() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips46");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips47");
			end
			return;
		end
		if obj.name == "btnNPCGodCoreNpcAdd" then
			if NpcManager:NPCGodCoreNpcAdd() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips48");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips49");
			end
			return;
		end
		if obj.name == "btnNPCGodCoreNpcRemove" then
			if NpcManager:NPCGodCoreNpcRemove() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips50");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips51");
			end
			return;
		end
		if obj.name == "btnNPCRemoveBuildings" then
			if NpcManager:NPCRemoveBuildings() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips52");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips53");
			end
			return;
		end
		if obj.name == "btnNPCFinishWish" then
			if NpcManager:NPCFinishWish() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips54");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips55");
			end
			return;
		end
		if obj.name == "btnNPCReWish" then
			if NpcManager:NPCFinishWish(1) then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips225");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips226");
			end
			return;
		end
		if obj.name == "btnNPCUnlockBuildings" then
			if NpcManager:NPCUnlockBuildings() then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips56");
			else
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips57");
			end
			return;
		end
		if obj.name == "btnNPCBodyToHuman" then
			local nums=NpcManager:NPCBodyToHuman();
			if nums==1 then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips58");
			elseif nums==-1 then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips59");
			elseif nums==0 then
				NpcManager.ShowLable.text = QFLanguage.GetText(">NpcManager_Tips60");
			end
			return;
		end
	--NpcManager:SetSetting();
	
end