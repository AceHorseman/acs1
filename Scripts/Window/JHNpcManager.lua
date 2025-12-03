local JHNpcManager = CS.Wnd_Simple.CreateWindow("JHNpcManager");
ModifierMain:AddWindow("JHNpcManager",JHNpcManager);
function JHNpcManager:OnInit()
	self.NpcManager = ModifierMain:FindWindow("NpcManager");
	--self.listType=1;
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">JHNpcManager_Title"));
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);

	QFWDModifierMainUI:AddLable2(self,"lable3111",QFLanguage.GetText(">JHNpcManager_lable3111"),self.sx/10,self.sy/10*2,self.sx/10,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*1.8,self.sy/10*2.1);
	self.inputid1:SetSize(50, 20, false);
	self.inputid1.m_title.restrict = "[0-9]";
	self.inputid1.m_title.maxLength = 4;
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc",QFLanguage.GetText(">EventSet_Tips1")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*1.5,300,35);
	QFWDModifierMainUI:AddButton2(self,"bntChooseNpc",QFLanguage.GetText(">EventSet_bntChooseNpc"),self.sx/10*4.3,self.sy/10*2.1):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntCopyNpcList",QFLanguage.GetText(">JHNpcManager_bntCopyNpcList"),self.sx/10*8,self.sy/10*1):SetSize(self.sx/10*1.2, 25, false);

	JHNpcManager.listtypes=0;
	JHNpcManager.listType=1;
	self.AttributeListCOP = self:AddCOP("AttributeList",self.sx/10*9.85,self.sy/10*0.7,1);
	self.NpcListCOP = self:AddCOP2("NpcList",-self.sx/10*4.15,self.sy/10*0.7,2);


	self.AttributeTypeNum=0;
	self.chooseNpcNum = 0;
	self.chooseDNNpcNum = 0;
	
	QFWDModifierMainUI:AddButton2(self,"bntShowJHNPCBase",QFLanguage.GetText(">JHNpcManager_bntShowJHNPCBase"),self.sx/10*10.2,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowJHNPCHateItems",QFLanguage.GetText(">JHNpcManager_bntShowJHNPCHateItems"),self.sx/10*11,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowJHNPCLikeItems",QFLanguage.GetText(">JHNpcManager_bntShowJHNPCLikeItems"),self.sx/10*11.8,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntUpdate",QFLanguage.GetText(">JHNpcManager_bntUpdate"),self.sx/10*6.3,self.sy/10*2.1):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntUpdateAllJHNPC",QFLanguage.GetText(">JHNpcManager_bntUpdateAllJHNPC"),self.sx/10*7.3,self.sy/10*2.1):SetSize(self.sx/10*1, 20, false);
	local sy=3.5;
	
	QFWDModifierMainUI:AddLable2(self,"lable12",QFLanguage.GetText(">JHNpcManager_lable12"),self.sx/10,self.sy/10*sy,self.sx/10*1.8,35);
	QFWDModifierMainUI:AddLable2(self,"lable1XS1",QFLanguage.GetText(">JHNpcManager_lable1XS1"),self.sx/10*7,self.sy/10*sy,self.sx/10,35)
	self.inputXS = QFWDModifierMainUI:AddInput2(self,"inputXS","1",self.sx/10*7.3,self.sy/10*(sy+0.1));
	self.inputXS:SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable1XS2",QFLanguage.GetText(">JHNpcManager_lable1XS2"),self.sx/10*1,self.sy/10*sy,self.sx/10,35)
	self.inputXS2 = QFWDModifierMainUI:AddInput2(self,"inputXSA","清风",self.sx/10*1.8,self.sy/10*(sy+0.1));
	self.inputXS2:SetSize(self.sx/10*2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddXSNPC",QFLanguage.GetText(">JHNpcManager_bntAddXSNPC"),self.sx/10*4.3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowXSNPC",QFLanguage.GetText(">JHNpcManager_bntShowXSNPC"),self.sx/10*5.3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntChangeList",QFLanguage.GetText(">JHNpcManager_bntChangeList"),self.sx/10*6.3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesList",QFLanguage.GetText(">JHNpcManager_bntYesList"),self.sx/10*7.3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable5",QFLanguage.GetText(">JHNpcManager_lable5"),self.sx/10,self.sy/10*sy,self.sx/10*1.8,35);
--	QFWDModifierMainUI:AddLable2(self,"lable6","NPC召回:",self.sx/10,self.sy/10*6.5,self.sx/10,35);
--	QFWDModifierMainUI:AddButton2(self,"bntJHNPCComming","执行!",self.sx/10*1.8,self.sy/10*6.5):SetSize(self.sx/10*1, 25, false);
--	QFWDModifierMainUI:AddLable2(self,"lable7","NPC送走:",self.sx/10*3,self.sy/10*6.5,self.sx/10,35);
--	QFWDModifierMainUI:AddButton2(self,"bntJHNPCLeaving","执行!",self.sx/10*3.8,self.sy/10*6.5):SetSize(self.sx/10*1, 25, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable121",QFLanguage.GetText(">JHNpcManager_lable121"),self.sx/10*1,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntDownHGJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lable11",QFLanguage.GetText(">JHNpcManager_lable11"),self.sx/10*4,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntUPHGJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lable9",QFLanguage.GetText(">JHNpcManager_lable9"),self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntKnowJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable13",QFLanguage.GetText(">JHNpcManager_lable13"),self.sx/10,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntOpenHlockJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lable14",QFLanguage.GetText(">JHNpcManager_lable14"),self.sx/10*4,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntCloseHlockJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lable15",QFLanguage.GetText(">JHNpcManager_lable15"),self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntCloseVigilanceJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable8",QFLanguage.GetText(">JHNpcManager_lable8"),self.sx/10,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntJHNPCDie",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lable16",QFLanguage.GetText(">JHNpcManager_lable16"),self.sx/10*4,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntJHNPCRelive",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddLable2(self,"lable20",QFLanguage.GetText(">JHNpcManager_lable20"),self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntComeJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	if ModifierMain.lib~=nil then
		sy=sy+0.5;
		QFWDModifierMainUI:AddLable2(self,"lable18",QFLanguage.GetText(">JHNpcManager_lable18"),self.sx/10*1,self.sy/10*sy,self.sx/10*1.5,35);
		QFWDModifierMainUI:AddButton2(self,"bntUnlockClues",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*2,self.sy/10*(sy+0.1),nil,nil,QFLanguage.GetText(">JHNpcManager_Tips45")):SetSize(self.sx/10*1, 20, false);
	
		QFWDModifierMainUI:AddLable2(self,"lable19",QFLanguage.GetText(">JHNpcManager_lable19"),self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35);
		QFWDModifierMainUI:AddButton2(self,"bntUnlockSecrets",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*8,self.sy/10*(sy+0.1),nil,nil,QFLanguage.GetText(">JHNpcManager_Tips46")):SetSize(self.sx/10*1, 20, false);
	end
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable21",QFLanguage.GetText(">JHNpcManager_lable21"),self.sx/10*1,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntAddJHNPCToKnowList",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*2,self.sy/10*(sy+0.1),nil,nil,QFLanguage.GetText(">JHNpcManager_Tips47")):SetSize(self.sx/10*1, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"lable17",QFLanguage.GetText(">JHNpcManager_lable17"),self.sx/10*4,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntRemoveDeadJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*5,self.sy/10*(sy+0.1),nil,nil,QFLanguage.GetText(">JHNpcManager_Tips48")):SetSize(self.sx/10*1, 20, false);
	
	QFWDModifierMainUI:AddLable2(self,"lable10",QFLanguage.GetText(">JHNpcManager_lable10"),self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35);
	QFWDModifierMainUI:AddButton2(self,"bntClearDeadJHNPC",QFLanguage.GetText(">JHNpcManager_bntDownHGJHNPC"),self.sx/10*8,self.sy/10*(sy+0.1),nil,nil,QFLanguage.GetText(">JHNpcManager_Tips49")):SetSize(self.sx/10*1, 20, false);
	
	
	-- QFWDModifierMainUI:AddButton2(self,"bntResXSNPC","击杀数目",self.sx/10*6.8,self.sy/10*8.5):SetSize(self.sx/10*1, 25, false);

	--QFWDModifierMainUI:AddButton2(self,"bntComeTJHNPC","执行!",self.sx/10*5.8,self.sy/10*8.5):SetSize(self.sx/10*1, 25, false);

	-- QFWDModifierMainUI:AddLable2(self,"labledn1","Npc编号:",self.sx/10,self.sy/10*4,200,35);
	-- self.inputid2 = QFWDModifierMainUI:AddInput2(self,"inputdn1","1",self.sx/10*2,self.sy/10*4);
	-- self.inputid2:SetSize(50, 25, false);
	-- self.inputid2.m_title.restrict = "[0-9]";
	-- self.inputid2.m_title.maxLength = 4;
	-- self.ShowLableDNNpc = QFWDModifierMainUI:AddLable2(self,"ShowLablednNpc","当前选择的Npc: 无",self.sx/10,self.sy/10*4,300,35);
	-- QFWDModifierMainUI:AddButton2(self,"bntChoosednNpc","选择",self.sx/10*1.5,self.sy/10*4.5):SetSize(self.sx/10*0.8, 25, false);
	--QFWDModifierMainUI:AddButton2(self,"bntUpdateDN","NPC大能",-self.sx/10*2,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	-- JHNpcManager.invateMod=false;
	JHNpcManager.JianghuNPCAttributeName=
	{
		"名:","姓:","称号:","称号(副):",
		--"秘籍名:",
		"门派ID:",
		
		"CNOnly:","名声:",
		
		"性别:(1.None 2.Male 3.Female)","功法等级:(1-6)","性格:"
	};
	JHNpcManager:ShowNpcListIn();
	self.window:Center();
end

function JHNpcManager:OnShowUpdate()
	
end

function JHNpcManager:OnShown()
	JHNpcManager.isShowing = true
	ModifierMain.showWindow=15;
end
--------------------------------------

function JHNpcManager:OnUpdate()
	
end

function JHNpcManager:OnHide()
	JHNpcManager.isShowing = false;
	ModifierMain.showWindow=0;
end

function JHNpcManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		local num = 0;
		--if obj.name == "bntChoosednNpc" then
		--		JHNpcManager.chooseDNNpcNum = tonumber(JHNpcManager.inputid2.m_title.text);
		--		if JHNpcManager.chooseNpcNum == nil then
		--			JHNpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6")..QFLanguage.GetText(">EventSet_Tips7");
		--			JHNpcManager.ShowLableDNNpc.text = QFLanguage.GetText(">EventSet_Tips1")..QFLanguage.GetText(">AddManager_Tips3");
		--			return;
		--		elseif JHNpcManager.chooseNpcNum ==0 then
		--			JHNpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6")..QFLanguage.GetText(">EventSet_Tips8");
		--			JHNpcManager.ShowLableDNNpc.text = QFLanguage.GetText(">EventSet_Tips1")..QFLanguage.GetText(">AddManager_Tips3");
		--			return;
		--		elseif JHNpcManager.chooseNpcNum > #JHNpcManager.NpcList then
		--			JHNpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6")..QFLanguage.GetText(">EventSet_Tips8");
		--			JHNpcManager.ShowLableDNNpc.text = QFLanguage.GetText(">EventSet_Tips1")..QFLanguage.GetText(">AddManager_Tips3");
		--			return;
		--		else
		--			JHNpcManager:ShowDNNpcListIn();
		--			JHNpcManager.ShowLableDNNpc.text = QFLanguage.GetText(">EventSet_Tips1").." "..JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum];
		--			JHNpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6");
		--			--JHNpcManager:UpdataNpcBuffList();
		--			--JHNpcManager.AttributeTypeNum=0;
		--		end
		--		return;
		--end
		if obj.name == "bntChooseNpc" then
				JHNpcManager.chooseNpcNum = tonumber(JHNpcManager.inputid1.m_title.text);
				if JHNpcManager.chooseNpcNum == nil then
					JHNpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6")..QFLanguage.GetText(">EventSet_Tips7");
					JHNpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..QFLanguage.GetText(">AddManager_Tips3");
					return;
				elseif JHNpcManager.chooseNpcNum ==0 then
					JHNpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6")..QFLanguage.GetText(">EventSet_Tips8");
					JHNpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..QFLanguage.GetText(">AddManager_Tips3");
					return;
				elseif JHNpcManager.chooseNpcNum > #JHNpcManager.NpcList then
					JHNpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips6")..QFLanguage.GetText(">EventSet_Tips8");
					JHNpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..QFLanguage.GetText(">AddManager_Tips3");
					return;
				else
					JHNpcManager:ShowNpcAttribute();
					JHNpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1").." "..JHNpcManager.NpcList[JHNpcManager.chooseNpcNum];
					JHNpcManager.ShowLable.text = QFLanguage.GetText(">EventSet_Tips9");
					--JHNpcManager:UpdataNpcBuffList();
					JHNpcManager.AttributeTypeNum=0;
				end
				return;
		end
		if obj.name == "bntAddJHNPCToKnowList" then
			JHNpcManager.AttributeTypeNum=0;
			if JHNpcManager:AddJHNPCToKnowList() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips50");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips51");
			end
			return;
		end
		if obj.name == "bntShowJHNPCBase" then
			JHNpcManager.AttributeTypeNum=0;
			JHNpcManager:ShowNpcAttribute();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips1");
			return;
		end
		if obj.name == "bntShowJHNPCHateItems" then
			JHNpcManager.AttributeTypeNum=1;
			JHNpcManager:ShowNpcAttribute();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips2");
			return;
		end
		if obj.name == "bntShowJHNPCLikeItems" then
			JHNpcManager.AttributeTypeNum=2;
			JHNpcManager:ShowNpcAttribute();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips3");
			return;
		end
		if obj.name == "bntUpdate" then
			JHNpcManager.listType=1;
			JHNpcManager:ShowNpcListIn();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips4");
			return;
		end
		
		if obj.name == "bntUpdateAllJHNPC" then
			JHNpcManager.listType=0;
			JHNpcManager:ShowNpcListIn();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips5");
			return;
		end
		if obj.name == "bntComeJHNPC" then
			if JHNpcManager:JHNPCComming() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips6");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips7");
			end
			return;
		end
		if obj.name == "bntJHNPCLeaving" then
			if JHNpcManager:JHNPCLeaving() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips8");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips9");
			end
			return;
		end
		if obj.name == "bntJHNPCDie" then
			if JHNpcManager:JHNPCDie() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips10");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips11");
			end
			return;
		end
		if obj.name == "bntJHNPCRelive" then
			if JHNpcManager:JHNPCRelive() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips12");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips45");
			end
			return;
		end
		if obj.name == "bntKnowJHNPC" then
			JHNpcManager:KnowJHNPC();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips13");
			return;
		end
		if obj.name == "bntRemoveDeadJHNPC" then
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips14");
			JHNpcManager:RemoveDeadJHNPC(1);
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips15");
			
			return;
		end
		if obj.name == "bntClearDeadJHNPC" then
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips16");
			JHNpcManager:RemoveDeadJHNPC();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips17");
			
			return;
		end
		-- if obj.name == "bntClearDeadJHNPC" then
			-- JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips16");
			-- JHNpcManager:RemoveDeadJHNPC();
			-- JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips17");
			
			-- return;
		-- end
		if obj.name == "bntUnlockSecrets" then
			--JHNpcManager.ShowLable.text = "尝试移除死亡的江湖NPC，移除隐藏的NPC!";
			local b,n=JHNpcManager:UnlockSecrets();
			if b then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips18")..tostring(n);
			else
				if n==1 then
					JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips19");
				else
					JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips20");
				end
			end
			return;
		end
		if obj.name == "bntUnlockClues" then
			--JHNpcManager.ShowLable.text = "尝试移除死亡的江湖NPC，移除隐藏的NPC!";
			local b,n=JHNpcManager:UnlockClues();
			if b then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips21")..tostring(n);
			else
				if n==1 then
					JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips22");
				else
					JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips23");
				end
			end
			return;
		end
		if obj.name == "bntUPHGJHNPC" then
			if JHNpcManager:UPHGJHNPC() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips24");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips44");
			end
			return;
		end
		if obj.name == "bntDownHGJHNPC" then
			if JHNpcManager:DownHGJHNPC() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips25");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips44");
			end
			return;
		end
		if obj.name == "bntOpenHlockJHNPC" then
			
			if JHNpcManager:HlockJHNPC(1) then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips26");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips44");
			end
			return;
		end
		if obj.name == "bntCloseHlockJHNPC" then
			if JHNpcManager:HlockJHNPC(0) then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips27");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips44");
			end
			return;
		end
		if obj.name == "bntCloseVigilanceJHNPC" then
			if JHNpcManager:VigilanceJHNPC(0) then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips28");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips44");
			end
			return;
		end
		if obj.name == "bntUpdateDN" then
			JHNpcManager:ShowDNNpcListIn(1);
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips29");
			return;
		end
		if obj.name == "bntAddXSNPC" then
			if JHNpcManager:AddXSNPC() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips30");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips45");
			end
			return;
		end
		if obj.name == "bntShowXSNPC" then
			JHNpcManager:ShowXSNPC();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips31");
			return;
		end
		if obj.name == "bntChangeList" then
			if JHNpcManager:SetXSNPC() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips32");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips33");
			end
			return;
		end
		if obj.name == "bntYesList" then
			if JHNpcManager:YesXSNPC() then
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips34");
			else
				JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips35");
			end
			return;
		end
		if obj.name == "bntCopyNpcList" then
			JHNpcManager:CopyDateList();
			JHNpcManager.ShowLable.text = QFLanguage.GetText(">JHNpcManager_Tips36");
			JHNpcManager:Hide();
			self.NpcManager:Show();
			return;
		end

	end
end
function JHNpcManager:ShowNpcListIn()
	if JHNpcManager.listType==0 then
		--JHNpcManager.ShowLable.text = "刷新人物列表成功!";
		JHNpcManager:UpdateChildNpc(JHNpcManager.NpcListCOP,0);
	elseif JHNpcManager.listType==1 then
		--JHNpcManager.ShowLable.text = "刷新NPC列表成功!";
		JHNpcManager:UpdateChildNpc(JHNpcManager.NpcListCOP,1);
	end
	
	JHNpcManager.chooseNpcNum = tonumber(JHNpcManager.inputid1.m_title.text);
	if JHNpcManager.chooseNpcNum == nil then
		return;
	elseif JHNpcManager.chooseNpcNum ==0 then
		return;
	elseif JHNpcManager.chooseNpcNum > #JHNpcManager.NpcList then
		return;
	else
		--JHNpcManager:ShowNpcAttribute(JHNpcManager.NpcList[JHNpcManager.chooseNpcNum]);
		JHNpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..": "..JHNpcManager.NpcList[JHNpcManager.chooseNpcNum];
		JHNpcManager.AttributeFlag =0;
	end
	JHNpcManager:ShowNpcAttribute();
end
function JHNpcManager:UnlockClues()
	if ModifierMain.lib==nil then
		return false,1;
	end
	local func=ModifierMain.lib:GetMethod("GetClues");
	local Clues=func:Invoke();
	if Clues==nil then
		return false,2;
	end
	local k,v;
	local nofind;
	local num=0;
	for k, v in pairs(Clues) do
		if v~=nil and k~=nil then
			if tonumber(v.Id)~=nil then
				
				if JianghuMgr.UnLockClues~=nil then
					nofind=not JianghuMgr.UnLockClues:Contains(tonumber(v.Id));
					if nofind then
						num=num+1;
						JianghuMgr:UnLockClue(tonumber(v.Id), false);
					end
				else
					num=num+1;
					JianghuMgr:UnLockClue(tonumber(v.Id), false);
				end
			end
		end
	end
	return true,num;
end
function JHNpcManager:UnlockSecrets()
	if ModifierMain.lib==nil then
		return false,1;
	end
	local func=ModifierMain.lib:GetMethod("GetSecrets");
	local Secrets=func:Invoke();
	if Secrets==nil then
		return false,2;
	end
	local k,v,k1,v1;
	local nofind;
	local num=0;
	for k, v in pairs(Secrets) do
		if v~=nil and k~=nil then
			if tonumber(v.Id)~=nil then
				
				if JianghuMgr.UnLockSecrets~=nil then
					nofind=true;
					for k1, v1 in pairs(JianghuMgr.UnLockSecrets) do
						if v1~=nil and k1~=nil then
							if v1.id==v.Id then
								nofind=false;
								break;
							end
						end
					end
					if nofind then
						num=num+1;
						JianghuMgr:UnlockSecrect(tonumber(v.Id), false);
					end
				else
					num=num+1;
					JianghuMgr:UnlockSecrect(tonumber(v.Id), false);
				end
			end
		end
	end
	return true,num;
end
function JHNpcManager:SetXSNPC()
	local num=tonumber(JHNpcManager.inputXS.m_title.text);
	local num2=tostring(JHNpcManager.inputXS2.m_title.text);
	if num==nil or num2==nil then
		return false;
	end
	JHNpcManager.newinfo[num]=num2;
	JHNpcManager:UpShowXSNPC();
	return true;
end
function JHNpcManager:ShowXSNPC(obj)
	if obj==nil then
		obj=JHNpcManager.AttributeListCOP;
	end
	JHNpcManager.types=1;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text =QFLanguage.GetText(">JHNpcManager_Tips37");
	if CS.XiaWorld.TradeMgr~=nil and CS.XiaWorld.TradeMgr.Instance~=nil and CS.XiaWorld.TradeMgr.Instance.WalkTrader~=nil then
		local XSData=CS.XiaWorld.TradeMgr.Instance.WalkTrader;
		local listName=
		{
		"访问间隔:ComeInterval","初次来访:FirstComeDay","击杀数:KillTrader",
		"下次访问最大时间:NextComeDay_Max","下次访问最小时间:NextComeDay_Min","行商停留:WalkTradeStaySec"
		};
		local list=
		{
			XSData.ComeInterval,XSData.FirstComeDay,XSData.KillTrader,
			XSData.NextComeDay_Max,XSData.NextComeDay_Min,XSData.WalkTradeStaySec
		};
		JHNpcManager.newinfo={};
		JHNpcManager.oldinfo={};
		local k,v,n=nil,nil,0;
		for k, v in pairs(listName) do
			n=n+1;
			JHNpcManager:AddChildToList(obj,tostring(n),tostring(n)..": "..tostring(v));
			JHNpcManager:AddChildToList(obj,"0"..tostring(n)," "..tostring(list[k]));
			JHNpcManager.newinfo[n]=tostring(list[k]);
			JHNpcManager.oldinfo[n]=JHNpcManager.newinfo[n];
		end
	end
end
function JHNpcManager:UpShowXSNPC(obj)
	if obj==nil then
		obj=JHNpcManager.AttributeListCOP;
	end
	JHNpcManager.types=1;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text =QFLanguage.GetText(">JHNpcManager_Tips37");
	if CS.XiaWorld.TradeMgr~=nil and CS.XiaWorld.TradeMgr.Instance~=nil and CS.XiaWorld.TradeMgr.Instance.WalkTrader~=nil then
		local XSData=CS.XiaWorld.TradeMgr.Instance.WalkTrader;
		local listName=
		{
		"访问间隔:ComeInterval","初次来访:FirstComeDay","击杀数:KillTrader",
		"下次访问最大时间:NextComeDay_Max","下次访问最小时间:NextComeDay_Min","行商停留:WalkTradeStaySec"
		};
		local k,v,n=nil,nil,0;
		for k, v in pairs(listName) do
			n=n+1;
			JHNpcManager:AddChildToList(obj,tostring(n),tostring(n)..": "..tostring(v));
			JHNpcManager:AddChildToList(obj,"0"..tostring(n)," "..tostring(JHNpcManager.newinfo[n]));
		end
	end
end
function JHNpcManager:YesXSNPC()
	local num=0;
	if CS.XiaWorld.TradeMgr~=nil and CS.XiaWorld.TradeMgr.Instance~=nil and CS.XiaWorld.TradeMgr.Instance.WalkTrader~=nil then
		local XSData=CS.XiaWorld.TradeMgr.Instance.WalkTrader;
		num=num+1;
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num]);
			if numnum==nil then
				numnum=0;
			end
			XSData.ComeInterval=numnum;
		end
		num=num+1;
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num]);
			if numnum==nil then
				numnum=0;
			end
			XSData.FirstComeDay=numnum;
		end
		num=num+1;
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num]);
			if numnum==nil then
				numnum=0;
			end
			XSData.KillTrader=numnum;
		end
		num=num+1;
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num]);
			if numnum==nil then
				numnum=0;
			end
			XSData.NextComeDay_Max=numnum;
		end
		num=num+1;
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num]);
			if numnum==nil then
				numnum=0;
			end
			XSData.NextComeDay_Min=numnum;
		end
		num=num+1;
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num]);
			if numnum==nil then
				numnum=0;
			end
			XSData.WalkTradeStaySec=numnum;
		end
	else
		return false;
	end
	JHNpcManager:ShowXSNPC();
	return true;
end
function JHNpcManager:AddXSNPC()
	local name=tostring(JHNpcManager.inputXS2.m_title.text);
	if name==nil then
		name="清风";
		JHNpcManager.inputXS2.m_title.text="清风";
	end
	if CS.XiaWorld.TradeMgr~=nil and CS.XiaWorld.TradeMgr.Instance~=nil and CS.XiaWorld.TradeMgr.Instance.WalkTrader~=nil then
		local XSData=CS.XiaWorld.TradeMgr.Instance.WalkTrader;
		XSData:AddTraderNpc(name);
	else
		return false;
	end
	return true;
end
function JHNpcManager:VigilanceJHNPC(num)
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	local JHData = JianghuMgr:GetKnowNpcData(seed);
	if JHData==nil then
		return false;
	end
	JHData.Vigilance=num;
	return true;
end
function JHNpcManager:HlockJHNPC(num)
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	local JHData = JianghuMgr:GetKnowNpcData(seed);
	--JHData.Vigilance=1;
	--JHData.favour=0;
	if JHData==nil then
		return false;
	end
	JHData.hlock=num;
	return true;
	--JianghuMgr:KnowNpcAllData(seed,false);
end
-- local aaa=GameMain:GetMod("JianghuMgr");
-- local bbb=aaa:GetTalkAction("System_Invite");
-- function bbb:CheckEnable(player,target)
	-- local JHSeed = target.JiangHuSeed;
	-- local knowdata = JianghuMgr:GetKnowNpcData(JHSeed);
	-- if not JHNpcManager.invateMod then
		-- knowdata.Vigilance=0;
		-- knowdata.favour=100;
		-- knowdata.hlock=1;
	-- end
	-- if (knowdata == nil or knowdata.favour < 60) then
		-- return false;
	-- end
	-- return true;
-- end
function JHNpcManager:DownHGJHNPC()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	local JHData = JianghuMgr:GetKnowNpcData(seed);
	--JHData.Vigilance=0;
	if JHData==nil then
		return false;
	end
	JHData.favour=0;
	JHData.hlock=0;
	return true;
	--JianghuMgr:KnowNpcAllData(seed,false);
end
function JHNpcManager:UPHGJHNPC()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	local JHData = JianghuMgr:GetKnowNpcData(seed);
	if JHData==nil then
		return false;
	end
	JHData.Vigilance=0;
	JHData.favour=100;
	JHData.hlock=1;
	return true;
	--JianghuMgr:KnowNpcAllData(seed,false);
end
function JHNpcManager:AddJHNPCToKnowList()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	local JHData = JianghuMgr:GetKnowNpcData(seed);
	if JHData==nil then
		JianghuMgr:AddKnowNpcData(seed);
		JHData=JianghuMgr:GetKnowNpcData(seed);
		if JHData==nil then
			return false;
		else
			return true;
		end
	else
		return true;
	end
end


function JHNpcManager:RemoveDeadJHNPC(tnum)
	local Seedkey=nil;
	local Seedvalue=nil;
	local GSchool=CS.XiaWorld.SchoolGlobleMgr.Instance;
	local removeList={};
	local num=0;
	for Seedkey, Seedvalue in pairs(GSchool.JianghuNpcs) do
		--die=GSchool:IsJianghuNpcDie(Seedkey);
		--local JianghuNPCDef = JianghuMgr:GetJHNpcDataByRandomSeed(Seedkey);
		if Seedkey~=nil and Seedvalue~=nil then
			if GSchool:IsJianghuNpcDie(Seedkey) then
				--if JianghuNPCDef~=nil then
					if JianghuMgr.KnowNpcData:ContainsKey(Seedkey) then
						JianghuMgr.KnowNpcData:Remove(Seedkey);
					end
					--CS.XiaWorld.SchoolGlobleMgr.Instance:RemoveJianghuNpcDie(Seedkey);
					num=num+1;
					removeList[num]=Seedkey;
					--GSchool.JianghuNpcs:Remove(Seedkey);
					
				--end
			end
		end
	end
	if num>0 then
		for Seedkey, Seedvalue in pairs(removeList) do
			GSchool.JianghuNpcs:Remove(Seedvalue);
		end
	end
	if tnum==nil then
		local npcList= ThingMgr:GetThingList(QFWDlib.ThingTypes[2]);
		if npcList~=nil then
			for Seedkey, Seedvalue in pairs(npcList) do
				if Seedvalue~=nil and ((Seedvalue.Hide and (not Seedvalue.IsPlayerThing)) or (Seedvalue.IsDeath)) then
					ThingMgr:RemoveThing(Seedvalue,true,true);
				end
			end
		end
	end
	JHNpcManager:ShowNpcListIn();

	
end
function JHNpcManager:KnowJHNPC()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	JianghuMgr:KnowNpcAllData(seed,false);
	return true;
end
function JHNpcManager:JHNPCDie()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(seed) then
		return false;
	else
		CS.XiaWorld.SchoolGlobleMgr.Instance:SaveJianghuNpcDie(seed,true);
		return true;
	end
	
end
function JHNpcManager:JHNPCComming()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	Map:AddWalker(seed, "", 1,0, nil);
	return true;

end

function JHNpcManager:JHNPCLeaving()
	local seed=JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(seed) then
		return false;
	end
	if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcLeave(seed) then
		return false;
	else
		CS.XiaWorld.SchoolGlobleMgr.Instance:AddJianghuNpcLeave(seed);
		return true;
	end
end
function JHNpcManager:JHNPCRelive()
	local seed=JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum];
	local def=JianghuMgr:GetJHNpcDataByRandomSeed(seed);
	if def==nil then
		return false;
	end
	return true;
end
--function JHNpcManager:ShowDNNpcListIn(types)
--	if types==1 then
--		JHNpcManager:UpdateChildDNNpc(JHNpcManager.NpcListCOP);
--	end
--	JHNpcManager.chooseDNNpcNum = tonumber(JHNpcManager.inputid2.m_title.text);
--	if JHNpcManager.chooseDNNpcNum == nil then
--		return;
--	elseif JHNpcManager.chooseDNNpcNum ==0 then
--		return;
--	elseif JHNpcManager.chooseDNNpcNum > #JHNpcManager.NpcDNInfoList then
--		return;
--	else
--		if JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum].Name~=nil then
--			JHNpcManager.ShowLableDNNpc.text = QFLanguage.GetText(">EventSet_Tips1")..": "..JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum].Name;
--		else
--			JHNpcManager.ShowLableDNNpc.text = QFLanguage.GetText(">EventSet_Tips1")..": "..JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum].NpcID;
--		end
--	end
--	--JHNpcManager:ShowNpcAttribute();
--end
--function JHNpcManager:UpdateChildDNNpc(obj)
--	if obj==nil then
--		obj=JHNpcManager.NpcListCOP;
--	end
--	obj.m_list:RemoveChildrenToPool();
--	local NpcLists={};
--	obj.m_title.text = "大能列表";
--	JHNpcManager.types=2;
--	if CS.XiaWorld.SpNpcMgr==nil and CS.XiaWorld.SpNpcMgr.Instance.m_SpNpcInfo==nil then
--		print("MOD版修改器:no DN")
--		return false;
--	end
--	NpcLists = CS.XiaWorld.SpNpcMgr.Instance.m_SpNpcInfo;
--	if NpcLists=={} or NpcLists==nil then
--		print("MOD版修改器:none")
--		return;
--	else
--		print("MOD版修改器:have")
--	end
--	local num=1;
--	JHNpcManager.NpcDNInfoList={};
--	local Seedkey=nil;
--	local Seedvalue=nil;
--	for Seedkey, Seedvalue in pairs(NpcLists) do
--		if Seedvalue.NpcID~=nil then
--			JHNpcManager.NpcDNInfoList[num] = Seedvalue;
--			if Seedvalue.Name~=nil then
--				JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(Seedvalue.Name));
--			else
--				JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(Seedvalue.NpcID));
--			end
--			num=num+1;
--		end
--	end
--	return obj;
--end
--function JHNpcManager:ShowDNNpcAttribute(obj)
--	if obj==nil then
--		obj=JHNpcManager.AttributeListCOP;
--	end
--	obj.m_list:RemoveChildrenToPool();
--	obj.m_title.text = "大能列表";
--	JHNpcManager.types=2;
--	local DNNpcInfo=JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum];
--	JHNpcManager.JianghuDNNPCAttribute={};
--	JHNpcManager.JianghuDNNPCAttribute=
--	{
--		DNNpcInfo.Name,DNNpcInfo.NpcID,DNNpcInfo.Title,DNNpcInfo.Sex
--	};
--	local sexStr=nil;
--	local z,k,v=nil,nil,nil;
--	for z=1,#QFWDlib.NPCSexType  do
--		if JHNpcManager.JianghuDNNPCAttribute[4] == QFWDlib.NPCSexType[z] then
--			sexStr=tostring(z);
--			return;
--		end
--	end
--	local num = 1;
--	for k, v in pairs(JHNpcManager.JianghuDNNPCAttribute) do 
--		JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(QFWDlib.JianghuDNNPCAttributeName[num]));
--		JHNpcManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(JHNpcManager.JianghuDNNPCAttribute[num]));
--		
--		num=num+1;
--	end
--end
function JHNpcManager:CopyDateList()
	JHNpcManager.NpcListData={};
	local Seedkey=nil;
	local Seedvalue=nil;
	local num=0;
	for Seedkey, Seedvalue in pairs(JHNpcManager.NpcListSeed) do
		if Seedkey~=nil and Seedvalue~=nil then
			num=num+1;
			JHNpcManager.NpcListData[num] = JianghuMgr:GetNpc(Seedkey);
		end
	end
	NpcListSS = JHNpcManager.NpcListData;
end

function JHNpcManager:UpdateChildNpc(obj,types)
	obj.m_list:RemoveChildrenToPool();
	local NpcLists={};
	local GSchool=CS.XiaWorld.SchoolGlobleMgr.Instance;
	obj.m_title.text = QFLanguage.GetText(">JHNpcManager_Tips38");
	if types==nil or types==0 then
		NpcLists = GSchool.JianghuNpcs;
	else
		NpcLists = JianghuMgr.KnowNpcData;
	end
	local num=1;
	JHNpcManager.NpcList={};
	JHNpcManager.NpcListSeed={};
	JHNpcManager.NpcListDef={};
	local Seedkey=nil;
	local Seedvalue=nil;
	local JianghuNPCDef,JianghuNPCDefName,die;
	if types==nil or types==0 then
		for Seedkey, Seedvalue in pairs(NpcLists) do
			if Seedkey~=nil then
				--die=GSchool:IsJianghuNpcDie(Seedkey);
				JianghuNPCDef = JianghuMgr:GetJHNpcDataByRandomSeed(Seedkey);
				--if die and JianghuNPCDef~=nil then
				--	GSchool:SaveJianghuNpcDie(Seedkey,true);
				--end
				JianghuNPCDefName= JianghuNPCDef.LastName..JianghuNPCDef.FristName ;
				if JianghuNPCDefName ~= nil then
					JHNpcManager.NpcList[num] = JianghuNPCDefName;
					JHNpcManager.NpcListSeed[num] = Seedkey;
					JHNpcManager.NpcListDef[num] = JianghuNPCDef;
					if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(Seedkey) then
						JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  死亡");
					else
						if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcLeave(Seedkey) then
							JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  离开");
						else
							JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  未走");
						end
					end
					num=num+1;
				end
			end
		end
	else
		for Seedkey, Seedvalue in pairs(NpcLists) do
			if Seedkey~=nil then
				--die=GSchool:IsJianghuNpcDie(Seedkey);
				JianghuNPCDef = JianghuMgr:GetJHNpcDataByRandomSeed(Seedkey);
				--if die and JianghuNPCDef~=nil then
				--	GSchool:SaveJianghuNpcDie(Seedkey,true);
				--end
				JianghuNPCDefName= JianghuNPCDef.LastName..JianghuNPCDef.FristName ;
				if not CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(Seedkey) then
					if JianghuNPCDefName ~= nil then
					JHNpcManager.NpcList[num] = JianghuNPCDefName;
					JHNpcManager.NpcListSeed[num] = Seedkey;
					JHNpcManager.NpcListDef[num] = JianghuNPCDef;
					if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(Seedkey) then
						JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  死亡");
					else
						JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  存活");
					end
					num=num+1;
					end
				end
			end
		end
	end
	return obj;
end
function JHNpcManager:ShowNpcAttribute()
	local jhnpc = JianghuMgr:GetJHNpcDataByRandomSeed(JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]);
	JHNpcManager.JianghuNPCAttribute={};
	local k,v,y=nil,nil,nil;
	
	JHNpcManager.JianghuNPCAttribute=
	{
		jhnpc.FristName,jhnpc.LastName,jhnpc.Title,jhnpc.Titles,
		--jhnpc.Esoterica.Name,
		jhnpc.School,
		
		jhnpc.CNOnly,jhnpc.Fame,
--		jhnpc.LikeItems[0],jhnpc.LikeItems[1],jhnpc.LikeItems[2],jhnpc.LikeItems[3],
--		jhnpc.LikeItems[4],jhnpc.LikeItems[5],jhnpc.LikeItems[6],jhnpc.LikeItems[7],
		
--		jhnpc.HateItems[0],jhnpc.HateItems[1],jhnpc.HateItems[2],jhnpc.HateItems[3],
--		jhnpc.HateItems[4],jhnpc.HateItems[5],jhnpc.HateItems[6],jhnpc.HateItems[7],
		
		jhnpc.Sex,jhnpc.GongLevel,jhnpc.Feature
	};
	JHNpcManager.JianghuNPCLikeItems={};
	JHNpcManager.JianghuNPCHateItems={};
	JHNpcManager.JianghuNPCAttributeStr={};
	local num = 1;
	local list= jhnpc.LikeItems;
	for k, v in pairs(list) do 
		if v~=nil then
			JHNpcManager.JianghuNPCLikeItems[num] = v;
		--print(v)
			num=num+1;
		end
	end
	num = 1;
	list = jhnpc.HateItems;
	for k, v in pairs(list) do 
		if v~=nil then
			JHNpcManager.JianghuNPCHateItems[num] = v;
		--print(v)
			num=num+1;
		end
	end
	
	
	num = 1;
	for y=1,#JHNpcManager.JianghuNPCAttributeName-3 do
		JHNpcManager.JianghuNPCAttributeStr[num] = tostring(JHNpcManager.JianghuNPCAttribute[num]);
		--print(JHNpcManager.JianghuNPCAttribute[num])
		num=num+1;
	end
	local types = 3;
	for y=1,#QFWDlib.NPCSexType do
		if JHNpcManager.JianghuNPCAttribute[num] == QFWDlib.NPCSexType[y] then
			types = y;
			break;
		end
	end
	if tostring(types)~="nil" then
		JHNpcManager.JianghuNPCAttributeStr[num] = tostring(types);
	end
	num=num+1;
	
	for y=1,#QFWDlib.JHNPCGongLevel do
		if JHNpcManager.JianghuNPCAttribute[num] == QFWDlib.JHNPCGongLevel[y] then
			types = y;
			break;
		end
	end
	if tostring(types)~="nil" then
		JHNpcManager.JianghuNPCAttributeStr[num] = tostring(types);
	end
	num=num+1;
	
	for y=1,#QFWDlib.JHNPCFeature do
		if JHNpcManager.JianghuNPCAttribute[num] == QFWDlib.JHNPCFeature[y] then
			types = y;
			break;
		end
	end
	if tostring(types)~="nil" then
		JHNpcManager.JianghuNPCAttributeStr[num] = tostring(types);
	end
	
	num=num+1;
	if JHNpcManager.AttributeTypeNum == 1 then
		JHNpcManager:UpdateChildAttributeHate(JHNpcManager.AttributeListCOP);
	elseif JHNpcManager.AttributeTypeNum == 2 then
		JHNpcManager:UpdateChildAttributeLike(JHNpcManager.AttributeListCOP);
	else
		JHNpcManager:UpdateChildAttribute(JHNpcManager.AttributeListCOP);
	end

end
function JHNpcManager:UpdateChildAttribute(obj)
	--print(#JHNpcManager.JianghuNPCAttributeName)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">JHNpcManager_Tips39");
	JHNpcManager.types=0;
	for k, v in pairs(JHNpcManager.JianghuNPCAttributeName) do
		JHNpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..v);
		JHNpcManager:AddChildToList(obj,"0"..tostring(k),"    "..JHNpcManager.JianghuNPCAttributeStr[k]);
	end
	
	return obj;
end
function JHNpcManager:UpdateChildAttributeLike(obj)
	--print(#JHNpcManager.JianghuNPCAttributeName)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">JHNpcManager_Tips40");
	JHNpcManager.types=0;
	local thingDef,name,icon;
	local lw=QFLanguage.GetText(">JHNpcManager_Tips42");
	for k, v in pairs(JHNpcManager.JianghuNPCLikeItems) do
		JHNpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..lw..tostring(k));
		thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, tostring(v));
		if thingDef~=nil and thingDef.ThingName~=nil then
			name=thingDef.ThingName;
			icon = thingDef.TexPath;
		else
			name=v;
		end
		JHNpcManager:AddChildToList(obj,"0"..tostring(k),"    "..tostring(name),icon);
	end
	
	return obj;
end
function JHNpcManager:UpdateChildAttributeHate(obj)
	--print(#JHNpcManager.JianghuNPCAttributeName)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">JHNpcManager_Tips41");
	JHNpcManager.types=0;
	local thingDef,name,icon;
	local lw=QFLanguage.GetText(">JHNpcManager_Tips43");
	for k, v in pairs(JHNpcManager.JianghuNPCHateItems) do
		JHNpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..lw..tostring(k));
		thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, tostring(v));
		if thingDef~=nil and thingDef.ThingName~=nil then
			name=thingDef.ThingName;
			icon = thingDef.TexPath;
		else
			name=v;
		end
		JHNpcManager:AddChildToList(obj,"0"..tostring(k),"    "..tostring(name),icon);
	end
	
	return obj;
end
function JHNpcManager:SetJHNpcAttributeList(num,value)
	if JHNpcManager.AttributeTypeNum==1 then
		JHNpcManager.JianghuNPCHateItems[num]=value;
	elseif JHNpcManager.AttributeTypeNum==2 then
		JHNpcManager.JianghuNPCLikeItems[num]=value;
	else
		JHNpcManager.JianghuNPCAttributeStr[num]=value;
	end
	JHNpcManager:UpdataJHNpcAttributeListUseHadData();
end
function JHNpcManager:UpdataJHNpcAttributeListUseHadData()
	if JHNpcManager.AttributeTypeNum == 1 then
		JHNpcManager:UpdateChildAttributeHate(JHNpcManager.AttributeListCOP);
	elseif JHNpcManager.AttributeTypeNum == 2 then
		JHNpcManager:UpdateChildAttributeLike(JHNpcManager.AttributeListCOP);
	else
		JHNpcManager:UpdateChildAttribute(JHNpcManager.AttributeListCOP);
	end
end
function JHNpcManager:SetJHNpcAttribute()
	local num=1;
	local jhnpc = JianghuMgr:GetJHNpcDataByRandomSeed(JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]);
	local k,v;
	if JHNpcManager.AttributeTypeNum==1 then
		num = 1;
		local list= jhnpc.HateItems;
		for k, v in pairs(list) do 
			jhnpc.HateItems[k] = JHNpcManager.JianghuNPCHateItems[num];
			num = num+1;
		end
	elseif JHNpcManager.AttributeTypeNum==2 then
		num = 1;
		local list= jhnpc.LikeItems;
		for k, v in pairs(list) do 
			jhnpc.LikeItems[k] = JHNpcManager.JianghuNPCLikeItems[num];
			num = num+1;
		end
	else
		num=1;
		jhnpc.FristName=JHNpcManager.JianghuNPCAttributeStr[num];
		num=num+1;
		jhnpc.LastName=JHNpcManager.JianghuNPCAttributeStr[num];
		num=num+1;
		jhnpc.Title=JHNpcManager.JianghuNPCAttributeStr[num];
		num=num+1;
		jhnpc.Titles=JHNpcManager.JianghuNPCAttributeStr[num];
		num=num+1;
		jhnpc.School=tonumber(JHNpcManager.JianghuNPCAttributeStr[num]);
		num=num+1;
		jhnpc.CNOnly=tonumber(JHNpcManager.JianghuNPCAttributeStr[num]);
		num=num+1;
		jhnpc.Fame=tonumber(JHNpcManager.JianghuNPCAttributeStr[num]);
		num=num+1;
		
		jhnpc.Sex=QFWDlib.NPCSexType[tonumber(JHNpcManager.JianghuNPCAttributeStr[num])];
		num=num+1;
		jhnpc.GongLevel=QFWDlib.JHNPCGongLevel[tonumber(JHNpcManager.JianghuNPCAttributeStr[num])];
		num=num+1;
		jhnpc.Feature=QFWDlib.JHNPCFeature[tonumber(JHNpcManager.JianghuNPCAttributeStr[num])];
		num=num+1;
	end
	JHNpcManager:ShowNpcListIn();
end








function JHNpcManager:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y);
	obj.text = value;
	obj.name = names;
	obj.tooltips = texts;
	return obj;
end
function JHNpcManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1d",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function JHNpcManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function JHNpcManager:AddChildToList(tobj,name,value,icon)
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
function JHNpcManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(JHNpcManager.ListChildOnClick);
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
function JHNpcManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(JHNpcManager.ListChildOnClick2);
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
function JHNpcManager.ListChildOnClick(Eventss)
	JHNpcManager.TheClickBnt = tonumber(Eventss.data.name);
	JHNpcManager:SetSetting();
	
end
function JHNpcManager:SetSetting()
	local obj=nil;
	types=JHNpcManager.types;
	if types==1 then
		obj=JHNpcManager.inputXS;
		obj.m_title.text=tostring(JHNpcManager.TheClickBnt);
		obj=JHNpcManager.inputXS2;
		obj.m_title.text=tostring(JHNpcManager.newinfo[JHNpcManager.TheClickBnt]);
	end
end
function JHNpcManager.ListChildOnClick2(Eventss)
	JHNpcManager.TheClickBnt = tonumber(Eventss.data.name);
	JHNpcManager:SetSetting2();
	
end
function JHNpcManager:SetSetting2()
	local obj=nil;
	local types=JHNpcManager.listtypes;
	if types==nil or types==0 then
		obj=JHNpcManager.inputid1;
	else
		obj=JHNpcManager.input8;
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(JHNpcManager.TheClickBnt);
		--JHNpcManager:ChooseThingNumAndGetAttribute(JHNpcManager.TheClickBnt);
		JHNpcManager.chooseNpcNum = tonumber(JHNpcManager.TheClickBnt);
		JHNpcManager.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..": "..JHNpcManager.NpcList[JHNpcManager.chooseNpcNum];
		JHNpcManager:ShowNpcAttribute();
	else
		obj.m_title.text=tostring(JHNpcManager.TheClickBnt);
	end
		--JHNpcManager:ChooseThingNumAndGetAttribute(JHNpcManager.TheClickBnt);
end