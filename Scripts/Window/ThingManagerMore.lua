ThingManagerMore = CS.Wnd_Simple.CreateWindow("ThingManagerMore");
ModifierMain:AddWindow("ThingManagerMore",ThingManagerMore);
function ThingManagerMore:OnInit()
	self.ThingManager = ModifierMain:FindWindow("ThingManager");
	self.NpcManager = ModifierMain:FindWindow("NpcManager");
	self.listType=0;
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">ThingManagerMore_Title"));
	self:SetSize(self.sx,self.sy);
	
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">ThingManagerMore_Tips58"),self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);
	local sy=1.7;
	
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetMod3",QFLanguage.GetText(">ThingManagerMore_ShowLableThingSetMod3"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLable4",QFLanguage.GetText(">ThingManagerMore_ShowLable4"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej1 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej1","1",self.sx/10*1.7,self.sy/10*sy);
	self.inputEquipAttributej1:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable5",QFLanguage.GetText(">ThingManagerMore_ShowLable5"),self.sx/10*2.5,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej2 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej2","1",self.sx/10*3.2,self.sy/10*sy);
	self.inputEquipAttributej2:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable6",QFLanguage.GetText(">ThingManagerMore_ShowLable6"),self.sx/10*4,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej3 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej3","1",self.sx/10*4.7,self.sy/10*sy);
	self.inputEquipAttributej3:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddJN",QFLanguage.GetText(">ThingManagerMore_bntAddJN"),self.sx/10*7.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips70")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAllJN",QFLanguage.GetText(">ThingManagerMore_bntAllJN"),self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetMod2",QFLanguage.GetText(">ThingManagerMore_ShowLableThingSetMod2"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLable7",QFLanguage.GetText(">ThingManagerMore_ShowLable7"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej4 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej4","ComfyTMax",self.sx/10*1.7,self.sy/10*sy);
	self.inputEquipAttributej4:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable8",QFLanguage.GetText(">ThingManagerMore_ShowLable8"),self.sx/10*2.5,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej5 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej5","0",self.sx/10*3.2,self.sy/10*sy);
	self.inputEquipAttributej5:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable9",QFLanguage.GetText(">ThingManagerMore_ShowLable9"),self.sx/10*4,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej6 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej6","0",self.sx/10*4.7,self.sy/10*sy);
	self.inputEquipAttributej6:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddCT",QFLanguage.GetText(">ThingManagerMore_bntAddJN"),self.sx/10*8.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips71")):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLable10",QFLanguage.GetText(">ThingManagerMore_ShowLable10"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej7 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej7","1",self.sx/10*1.7,self.sy/10*sy);
	self.inputEquipAttributej7:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable11",QFLanguage.GetText(">ThingManagerMore_ShowLable11"),self.sx/10*2.5,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej8 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej8","1",self.sx/10*3.2,self.sy/10*sy);
	self.inputEquipAttributej8:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable12",QFLanguage.GetText(">ThingManagerMore_ShowLable12"),self.sx/10*4,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej9 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej9","0",self.sx/10*4.7,self.sy/10*sy);
	self.inputEquipAttributej9:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable13",QFLanguage.GetText(">ThingManagerMore_ShowLable13"),self.sx/10*5.5,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej10 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej10","0",self.sx/10*6.2,self.sy/10*sy);
	self.inputEquipAttributej10:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAllCT",QFLanguage.GetText(">ThingManagerMore_bntAllCT"),self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAllBZ",QFLanguage.GetText(">ThingManagerMore_bntAllBZ"),self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetMod",QFLanguage.GetText(">ThingManagerMore_ShowLableThingSetMod4"),self.sx/10*1,self.sy/10*(sy-0.1),self.sx/10*1.2,self.sy/10*0.5);
	sy=sy+0.5;
	self.ShowLableThing=QFWDModifierMainUI:AddLable2(self,"ShowLableThing",QFLanguage.GetText(">ThingManagerMore_ShowLableThing"),self.sx/10*1,self.sy/10*(sy-0.1),self.sx/10*3,self.sy/10*0.5);
	--self.ShowLableThing:SetSize(self.sx/10*4,self.sy/10*1);
	--sy=sy+0.5;
	self.inputEquip = QFWDModifierMainUI:AddInput2(self,"inputEquip","1",self.sx/10*4.7,self.sy/10*sy);
	self.inputEquip:SetSize(self.sx/10*0.5, 20, false);
	self.inputEquip.m_title.restrict = "[0-9]";
	QFWDModifierMainUI:AddButton2(self,"bntUpdate",QFLanguage.GetText(">ThingManagerMore_bntUpdate"),self.sx/10*8.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips68")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntRemove",QFLanguage.GetText(">ThingManagerMore_bntRemove"),self.sx/10*7.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips69")):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLable2",QFLanguage.GetText(">ThingManagerMore_ShowLable2"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributeID = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributeID","1",self.sx/10*1.3,self.sy/10*sy);
	self.inputEquipAttributeID:SetSize(self.sx/10*0.5, 20, false);
	self.inputEquipAttributeID.m_title.restrict = "[0-9]";
	QFWDModifierMainUI:AddLable2(self,"ShowLable3",QFLanguage.GetText(">ThingManagerMore_ShowLable3"),self.sx/10*2,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttribute = QFWDModifierMainUI:AddInput2(self,"inputEquipAttribute","1",self.sx/10*2.3,self.sy/10*sy);
	self.inputEquipAttribute:SetSize(self.sx/10*2.9, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntSet",QFLanguage.GetText(">ThingManagerMore_bntSet"),self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntYes",QFLanguage.GetText(">ThingManagerMore_bntYes"),self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	
	
	sy=sy+0.7;
	
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetMod",QFLanguage.GetText(">ThingManagerMore_ShowLableThingSetMod"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLable14",QFLanguage.GetText(">ThingManagerMore_ShowLable2"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej14 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej14","1",self.sx/10*1.7,self.sy/10*sy);
	self.inputEquipAttributej14:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable15",QFLanguage.GetText(">ThingManagerMore_ShowLable3"),self.sx/10*2.5,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej15 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej15","1",self.sx/10*3.2,self.sy/10*sy);
	self.inputEquipAttributej15:SetSize(self.sx/10*2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddListFS",QFLanguage.GetText(">ThingManagerMore_bntAddJN"),self.sx/10*5.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips64")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntUpdListFS",QFLanguage.GetText(">ThingManagerMore_bntUpdate"),self.sx/10*6.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips65")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntSetListFS",QFLanguage.GetText(">ThingManagerMore_bntSet"),self.sx/10*7.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips66")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesListFS",QFLanguage.GetText(">ThingManagerMore_bntYes"),self.sx/10*8.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips67")):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	--QFWDModifierMainUI:AddLable2(self,"ShowLable16",QFLanguage.GetText(">ThingManagerMore_ShowLable16"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	--self.inputEquipAttributej16 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej16","1",self.sx/10*1.7,self.sy/10*sy);
	--self.inputEquipAttributej16:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable17",QFLanguage.GetText(">ThingManagerMore_ShowLable17"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej17 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej17","1",self.sx/10*1.7,self.sy/10*sy);
	self.inputEquipAttributej17:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable18",QFLanguage.GetText(">ThingManagerMore_ShowLable18"),self.sx/10*2.5,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej18 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej18","1",self.sx/10*3.2,self.sy/10*sy);
	self.inputEquipAttributej18:SetSize(self.sx/10*0.5, 20, false);
	--sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntClearSpecialFSCT",QFLanguage.GetText(">ThingManagerMore_bntClearSpecialFSCT"),self.sx/10*4.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips59")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntRemListFSCT",QFLanguage.GetText(">ThingManagerMore_bntRemListFSCT"),self.sx/10*5.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips60")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntUpdListFSCT",QFLanguage.GetText(">ThingManagerMore_bntUpdate"),self.sx/10*6.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips61")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddListFSCT",QFLanguage.GetText(">ThingManagerMore_bntAddListFSCT"),self.sx/10*7.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips62")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAllCTFSCT",QFLanguage.GetText(">ThingManagerMore_bntAllCT"),self.sx/10*8.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips63")):SetSize(self.sx/10*1, 20, false);
	
	
	
	sy=sy+0.7;
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetModFB2",QFLanguage.GetText(">ThingManagerMore_ShowLableThingSetModFB2"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLable19",QFLanguage.GetText(">ThingManagerMore_ShowLable4"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej19 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej19","2",self.sx/10*1.7,self.sy/10*sy);
	self.inputEquipAttributej19:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable20",QFLanguage.GetText(">ThingManagerMore_ShowLable20"),self.sx/10*2.3,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej20 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej20","",self.sx/10*3.2,self.sy/10*sy);
	self.inputEquipAttributej20:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable21",QFLanguage.GetText(">ThingManagerMore_ShowLable21"),self.sx/10*3.8,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej21 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej21","",self.sx/10*4.7,self.sy/10*sy);
	self.inputEquipAttributej21:SetSize(self.sx/10*0.5, 20, false);
	--QFWDModifierMainUI:AddButton2(self,"bntAllBZ","所有标志",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLable22",QFLanguage.GetText(">ThingManagerMore_ShowLable22"),self.sx/10*0.8,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej22 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej22","",self.sx/10*1.7,self.sy/10*sy);
	self.inputEquipAttributej22:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable23",QFLanguage.GetText(">ThingManagerMore_ShowLable23"),self.sx/10*2.3,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej23 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej23","",self.sx/10*3.2,self.sy/10*sy);
	self.inputEquipAttributej23:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable124",QFLanguage.GetText(">ThingManagerMore_ShowLable124"),self.sx/10*3.8,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej24 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej24","",self.sx/10*4.7,self.sy/10*sy);
	self.inputEquipAttributej24:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable125",QFLanguage.GetText(">ThingManagerMore_ShowLable125"),self.sx/10*5.3,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej25 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej25","",self.sx/10*6.2,self.sy/10*sy);
	self.inputEquipAttributej25:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAllModFBLX",QFLanguage.GetText(">ThingManagerMore_bntAllJN"),self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddModFB",QFLanguage.GetText(">ThingManagerMore_bntAddJN"),self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	self.showMBlable = QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetModFB",QFLanguage.GetText(">ThingManagerMore_ShowLableThingSetModFB"),self.sx/10*1,self.sy/10*(sy-0.1),self.sx/10*7,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"ShowLable26",QFLanguage.GetText(">ThingManagerMore_ShowLable2"),self.sx/10*1,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej26 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej26","1",self.sx/10*1.7,self.sy/10*sy);
	self.inputEquipAttributej26:SetSize(self.sx/10*0.5, 20, false);
	QFWDModifierMainUI:AddLable2(self,"ShowLable27",QFLanguage.GetText(">ThingManagerMore_ShowLable3"),self.sx/10*2.5,self.sy/10*(sy-0.1),300,35);
	self.inputEquipAttributej27 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej27","1",self.sx/10*3.2,self.sy/10*sy);
	self.inputEquipAttributej27:SetSize(self.sx/10*2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntRremoveModFB",QFLanguage.GetText(">ThingManagerMore_bntRremoveModFB"),self.sx/10*5.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips72")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntUpdListFB",QFLanguage.GetText(">ThingManagerMore_bntUpdate"),self.sx/10*6.5,self.sy/10*sy,nil,nil,QFLanguage.GetText(">ThingManagerMore_Tips73")):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntSetListFB",QFLanguage.GetText(">ThingManagerMore_bntSet"),self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesListFB",QFLanguage.GetText(">ThingManagerMore_bntYes"),self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false);
	
	
	
	self.thing=nil;
	self.ThingListCOP = self:AddCOP("NpcList",-self.sx/10*4.15,self.sy/10*0.7,2);
	self.ThingAttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*9.85,self.sy/10*0.7,1);
	
	ThingManagerMore:UpdateModifierList();
	self.window:Center();
end

function ThingManagerMore:OnShowUpdate()
	
end

function ThingManagerMore:OnShown()
	ThingManagerMore.isShowing = true
	ModifierMain.showWindow=27;
end

function ThingManagerMore:OnUpdate()
	
end

function ThingManagerMore:OnHide()
	self.ThingManager:Show();
	ThingManagerMore.isShowing = false;
	ModifierMain.showWindow=0;
end

function ThingManagerMore:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntSet" then
			ThingManagerMore:SetAttribute(ThingManagerMore.inputEquipAttributeID.m_title.text,ThingManagerMore.inputEquipAttribute.m_title.text,0);
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips1");
			return;
		end
		if obj.name == "bntYes" then
			ThingManagerMore:YesAttribute();
			ThingManagerMore:ToChooseData(ThingManagerMore.inputEquip.m_title.text);
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips2");
			return;
		end
		if obj.name == "bntUpdate" then
			if ThingManagerMore:ThingShowEquipt() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips3");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips4");
			end
			return;
		end
		if obj.name == "bntRemove" then
			if ThingManagerMore:ThingRemoveEquipt(ThingManagerMore.inputEquip.m_title.text) then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips5");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips6");
			end
			return;
		end
		if obj.name == "bntAddJN" then
			if ThingManagerMore:AddJN() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips7");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips8");
			end
			return;
		end
		if obj.name == "bntAllJN" then
			ThingManagerMore:AllJN();
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips9");
			return;
		end
		if obj.name == "bntAllCT" then
			ThingManagerMore:AllCT();
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips10");
			return;
		end
		if obj.name == "bntAllBZ" then
			ThingManagerMore:AllBZ();
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips11");
			return;
		end
		if obj.name == "bntAddCT" then
			ThingManagerMore:AddCT();
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips12");
			return;
		end
		
		-------------------------------------
		if obj.name == "bntClearSpecialFSCT" then
			if ThingManagerMore:ClearSpecialFSCT() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips56");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips57");
			end
			return;
		end
		if obj.name == "bntAddListFS" then
			if ThingManagerMore:AddListFS() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips13");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips14");
			end
			return;
		end
		if obj.name == "bntUpdListFS" then
			if ThingManagerMore:UpdListFS() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips15");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips16");
			end
			return;
		end
		if obj.name == "bntSetListFS" then
			ThingManagerMore:SetAttribute(ThingManagerMore.inputEquipAttributej14.m_title.text,ThingManagerMore.inputEquipAttributej15.m_title.text,1);
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips1");
			return;
		end
		if obj.name == "bntYesListFS" then
			ThingManagerMore:YesListFS();
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips2");
			return;
		end
		if obj.name == "bntRemListFSCT" then
			if ThingManagerMore:RemListFSCT() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips17");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips18");
			end
			return;
		end
		if obj.name == "bntAllCTFSCT" then
			ThingManagerMore:AllCT(1);
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips19");
			return;
		end
		if obj.name == "bntUpdListFSCT" then
			if ThingManagerMore:ShowAllCTR() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips20");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips21");
			end
			return;
		end
		if obj.name == "bntAddListFSCT" then
			if ThingManagerMore:AddListFSCT() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips22");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips23");
			end
			return;
		end
--------------------------------------------------------------------
		if obj.name == "bntUpdListFB" then
			if ThingManagerMore:ThingShowFBMB() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips24");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips25");
			end
			return;
		end
		if obj.name == "bntSetListFB" then
			ThingManagerMore:SetAttribute(ThingManagerMore.inputEquipAttributej26.m_title.text,ThingManagerMore.inputEquipAttributej27.m_title.text,2);
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips1");
			return;
		end
		if obj.name == "bntYesListFB" then
			ThingManagerMore:YesListFBMB();
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips2");
			return;
		end
		if obj.name == "bntRremoveModFB" then
			if ThingManagerMore:RremoveModFB() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips26");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips27");
			end
			return;
		end
		if obj.name == "bntAddModFB" then
			if ThingManagerMore:AddFBMB() then
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips28");
			else
				ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips29");
			end
			return;
		end
		if obj.name == "bntAllModFBLX" then
			ThingManagerMore:AllRYS(4);
			ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips30");
			return;
		end
	end
end
function ThingManagerMore:AddFBMB()
	local thing = ThingManagerMore.thing;
	local FBDataAll=thing.Fabao;
	if FBDataAll == nil then
		return false;
	end
	local newAb=nil;
	if CS.XiaWorld.FabaoSpecialAbility~=nil then
		newAb=CS.XiaWorld.FabaoSpecialAbility();
	else
		return false;
	end
	local num1s=tonumber(ThingManagerMore.inputEquipAttributej19.m_title.text);
	local num2s=tonumber(ThingManagerMore.inputEquipAttributej20.m_title.text);
	local num3s=tonumber(ThingManagerMore.inputEquipAttributej21.m_title.text);
	local num4s=tonumber(ThingManagerMore.inputEquipAttributej22.m_title.text);
	local num5s=tonumber(ThingManagerMore.inputEquipAttributej23.m_title.text);
	local num6s=ThingManagerMore.inputEquipAttributej24.m_title.text;
	local num7s=ThingManagerMore.inputEquipAttributej25.m_title.text;
	local num1=nil;
	if num1s==nil then
		num1=QFWDlib.FabaoSpecialAbility[2];
		ThingManagerMore.inputEquipAttributej5.m_title.text="2";
	else
		num1=QFWDlib.FabaoSpecialAbility[num1s];
	end
	local nParam1=num2s;
	local nParam2=num3s;
	local fParam1=num4s;
	local fParam2=num5s;
	local sParam1=num6s;
	local sParam2=num7s;
	
	--FBDataAll:AddEquiptData(num1s, num5s, num4s, num7s, num6s, num2,num3,false);
	local Desc=nil;
	if num1s == 2 then
		--nParam1 = WorldLua:RandomInt(10,21)	--需求攻击次数
		if nParam1==nil then
			nParam1 = 1			--攻击部位
		end
		if sParam1==nil or sParam1=="0" then
			sParam1 = "TheWholeBody"			--攻击部位
		end
		if sParam2==nil or sParam2=="0" then
			sParam2 = "FivePoison"				--伤害代码
		end
		Desc = "每"..nParam1.."次攻击修行者"..sParam1.."，会穿透护盾造成额外伤害。"
	elseif num1s == 3 then
		if fParam1==nil then	--增加伤害
			fParam1=0;
		end
		Desc = "法宝每飞行1秒，基础威力就提高"..string.format("%.1f",fParam1*100).."％，返回后清空。"
	elseif num1s == 4 then
		if nParam1==nil then
			nParam1 = 1			--需求攻击次数
		end
		Desc = "每"..nParam1.."次攻击会对发动一次"..sParam1
		-- if Skilldef.Value2 ~= nil and Skilldef.Value2 > 0 then
			-- Desc = Desc.."持续"..string.format("%.1f",Skilldef.Value2).."秒"
		-- end
	elseif num1s == 5 then
		Desc = "环绕周身不会主动进攻，专注防御。"
	elseif num1s == 6 then
		if fParam1==nil then
			fParam1 = 0.6 --几率
		end
		if fParam2==nil then
			fParam2 = 1		--伤害强度
		end
		if nParam1==nil then
			nParam1 = 0		--攻击位置0为所有，1为身体，2为法宝
		end
		if nParam2==nil then
			nParam2 = 0		--特殊伤害，0无，1为目标当前灵气比例，2为目标最大灵气比例
		end
		if sParam1==nil then
			sParam1 = "Jin"	--设置五行
		end
		Desc = "对"..sParam1.."属性目标的"..nParam1.."有"..string.format("%.0f",fParam1*100).."%几率伤害加深"..string.format("%.0f",fParam2*100).."%".." 特殊伤害:"..nParam2;
	elseif num1s == 7 then
		if nParam1==nil then
			nParam1=1;--需求攻击次数
		end
		if nParam2==nil then
			nParam2=1;--效果，0 无 1冻结
		end
		Desc = "每攻击同一个法宝"..nParam1.."次，可使其失效，持续时间与其品阶有关。".."特殊效果:"..nParam2;
	elseif num1s == 8 then
		if nParam1==nil then
			nParam1=1;--需求攻击次数
		end
		if nParam2==nil then
			nParam2=1;--产生数量,需求次数越低，产生数量越少
		end
		if fParam1==nil then
			fParam1=10;----持续时间
		end
		Desc = "每攻击"..nParam1.."次，产生"..nParam2.."道法宝分形，持续"..fParam1.."秒。"
	elseif num1s == 9 then
		if fParam1==nil then
			fParam1=1;----持续时间
		end
		Desc="造成伤害的"..string.format("%.0f",fParam1*100).."%会补充为法宝自身的灵气。"
	elseif num1s == 10 then
		if nParam1==nil then
			nParam1=-1;-- -1代表健康-- 6 Pain 疼痛 7 Consciousness 意识 8 Meridian 经脉 9 Movement 移动 10 Operation 身手 11 Feeling 感知 
		end
		if nParam2==nil then
			nParam2=1;--0正向(越高越多) 1反向(越少越多) 
		end
		if fParam1==nil then
			fParam1=1;--提升数值
		end
		Desc = nParam1.."值每"..nParam2.."向改变1%，法宝威力增加"..string.format("%.1f",fParam1*100).."%。"
	elseif num1s == 11 then
		if nParam1==nil then
			nParam1=1;--需求攻击次数
		end
		if fParam1==nil then
			fParam1=1;--减少CD，秒
		end
		Desc = "每"..nParam1.."次攻击会减少"..fParam1.."秒技能CD。"
	elseif num1s == 12 then
		if nParam1==nil then
			nParam1=1;--最大层数
		end
		if fParam1==nil then
			fParam1=1;--伤害
		end
		Desc = "每击杀一个生灵威力提高"..string.format("%.0f",fParam1*100).."%，最高"..nParam1.."层。如果1日未饮血就会效果清零。"
	elseif num1s == 13 then
		if fParam1==nil then
			fParam1=1;--伤害
		end
		Desc = "每服用过一种丹药，威力提高"..string.format("%.0f",fParam1*100).."%。"
	elseif num1s == 14 then
		if nParam1==nil then
			nParam1=1;
		end
		if sParam1==nil then
			sParam1 = "FLAG_ITEM_RESURRECTION"	--Flag
		end
		thing:AddSpecialFlag(g_emNpcSpecailFlag[sParam1],1)
		Desc = "以破碎为代价，抵挡一次死亡并恢复所有伤害。"
	elseif num1s == 17 then
		if fParam1==nil then
			fParam1=1;--伤害倍数
		end
		if fParam2==nil then
			fParam2=1;--需求寿命比例
		end
		Desc = "当使用者寿命到达总寿元的"..string.format("%.0f",fParam2*100).."%后，寿命越接近极限法宝威力越大"
	elseif num1s == 18 then
		if fParam1==nil then
			fParam1=1;--伤害倍数
		end
		Desc = "秘宝的第一次攻击威力增加"..string.format("%.1f",fParam1*100).."倍，法宝补充灵气时重置。"
	elseif num1s == 19 then
		if nParam1==nil then
			nParam1=1;
		end
		if fParam1==nil then
			fParam1=1;
		end
		if fParam2==nil then
			fParam2=1;
		end
		Desc="每消耗"..string.format("%.0f",nParam1).."点灵气，伤害提高"..string.format("%.0f",fParam1*100).."%，最高提高"..string.format("%.0f",fParam2*100).."%。法宝补充灵气时重置。"
	end
	newAb.Kind=num1;
	newAb.nParam1=nParam1;
	newAb.nParam2=nParam2;
	newAb.fParam1=fParam1;
	newAb.fParam2=fParam2;
	newAb.sParam1=sParam1;
	newAb.sParam2=sParam2;
	newAb.Desc=Desc;
	newAb.Flag="";
	ThingManagerMore.inputEquipAttributej19.m_title.text=tostring(num1s);
	if tostring(nParam1)~=nil then
		ThingManagerMore.inputEquipAttributej20.m_title.text=tostring(nParam1);
	else
		ThingManagerMore.inputEquipAttributej20.m_title.text="";
	end
	--ThingManagerMore.inputEquipAttributej21.m_title.text=tostring(nParam2);
	if tostring(nParam2)~=nil then
		ThingManagerMore.inputEquipAttributej21.m_title.text=tostring(nParam2);
	else
		ThingManagerMore.inputEquipAttributej21.m_title.text="";
	end
	--ThingManagerMore.inputEquipAttributej22.m_title.text=tostring(fParam1);
	if tostring(fParam1)~=nil then
		ThingManagerMore.inputEquipAttributej22.m_title.text=tostring(fParam1);
	else
		ThingManagerMore.inputEquipAttributej22.m_title.text="";
	end
	--ThingManagerMore.inputEquipAttributej23.m_title.text=tostring(fParam2);
	if tostring(fParam2)~=nil then
		ThingManagerMore.inputEquipAttributej23.m_title.text=tostring(fParam2);
	else
		ThingManagerMore.inputEquipAttributej23.m_title.text="";
	end
	--ThingManagerMore.inputEquipAttributej24.m_title.text=tostring(sParam1);
	if tostring(sParam1)~=nil then
		ThingManagerMore.inputEquipAttributej24.m_title.text=tostring(sParam1);
	else
		ThingManagerMore.inputEquipAttributej24.m_title.text="";
	end
	--ThingManagerMore.inputEquipAttributej25.m_title.text=tostring(sParam2);
	if tostring(sParam2)~=nil then
		ThingManagerMore.inputEquipAttributej25.m_title.text=tostring(sParam2);
	else
		ThingManagerMore.inputEquipAttributej25.m_title.text="";
	end
	FBDataAll:AddAbilityData(newAb);
	return true;
end
function ThingManagerMore:RremoveModFB()
	local ReFBData=ThingManagerMore.ChooseData;
	if ReFBData==nil then
		return false;
	end
	local thing = ThingManagerMore.thing;
	local FBDataAll=thing.Fabao;
	if FBDataAll == nil then
		return false;
	end
	local FBData=FBDataAll.AbilityDatas;
	if FBData == nil or FBData=={} then
		return false;
	end
	if FBData:Remove(ReFBData) then
		return true;
	else
		return false;
	end
end
function ThingManagerMore:YesListFBMB()
	local FBData=ThingManagerMore.ChooseData;
	local num=1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num]);
		if numnum==nil or numnum<1 then
			numnum=1;
		end
		FSData.Kind=QFWDlib.FabaoSpecialAbility[numnum];
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.nParam1=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.nParam2=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.fParam1=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.fParam2=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.sParam1=tostring(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.sParam2=tostring(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.Desc=tostring(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.Flag=tostring(ThingManagerMore.infoNewstr[num]);
	end
	ThingManagerMore:ThingShowFBMB();
end
function ThingManagerMore:ThingShowFBMB(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP;
		ThingManagerMore.showTypes=7;
	end
	local thing = ThingManagerMore.thing;
	local FBDataAll=thing.Fabao;
	if FBDataAll == nil then
		return false;
	end
	local FBData=FBDataAll.AbilityDatas;
	if FBData == nil or FBData=={} then
		return false;
	end
	ThingManagerMore.infos={};
	local num=0;
	local localKey=nil;
	local localValue=nil;
	local localKey,localValue=nil,nil;
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips31");
	obj.m_list:RemoveChildrenToPool();
	for localKey,localValue  in pairs(FBData) do
		if localValue~=nil then
			num=num+1;
			ThingManagerMore.infos[num]=localValue;
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.Kind),"");
		end
	end
	if ThingManagerMore:ToChooseDataFBMB(1) then
		return true;
	else
		return false;
	end
end
function ThingManagerMore:ToChooseDataFBMB(nums)
	num=tonumber(nums);
	ThingManagerMore.ChooseData=ThingManagerMore.infos[num];
	if ThingManagerMore.ChooseData~=nil then
		ThingManagerMore.ShowLableThing.text =  QFLanguage.GetText(">ThingManagerMore_ShowLableThing").." "..tostring(ThingManagerMore.ChooseData.Kind);
		ThingManagerMore.showMBlable.text =  QFLanguage.GetText(">ThingManagerMore_ShowLableThingSetModFB").." "..tostring(ThingManagerMore.ChooseData.Kind);
		ThingManagerMore:ShowAttributeFBMB();
		return true;
	else
		print(QFLanguage.GetText(">MODName")..":ChooseData false")
		return false
	end
end
function ThingManagerMore:ShowAttributeFBMB(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP;
		ThingManagerMore.showTypes2=3;
	end
	local FBData=ThingManagerMore.ChooseData;
	if FBData==nil then
		return false;
	end
	local IntText=QFLanguage.GetText(">ThingManagerMore_Tips42");
	local FloatText=QFLanguage.GetText(">ThingManagerMore_Tips43");
	local StringText=QFLanguage.GetText(">ThingManagerMore_Tips44");
	
	local infoName=
	{
		"词条类型:Kind","n参数1["..IntText.."]:nParam1","n参数2["..IntText.."]:nParam2","f参数1["..FloatText.."]:fParam1",
		"f参数2["..FloatText.."]:fParam2","s参数1["..StringText.."]:sParam1","s参数2["..StringText.."]:sParam2","词条描述["..StringText.."]:Desc",
		"特殊标志["..StringText.."]:Flag"
		};
	ThingManagerMore.info = 
	{
	FBData.Kind,FBData.nParam1,FBData.nParam2,FBData.fParam1,
	FBData.fParam2,FBData.sParam1,FBData.sParam2,FBData.Desc,
	FBData.Flag
	};
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips32");
	obj.m_list:RemoveChildrenToPool();
	ThingManagerMore.infoOldstr={};
	ThingManagerMore.infoNewstr={};
	jcnum=1;
	for jcnum=1,#infoName do
		self.ThingManager:AddChildToList(obj,tostring(jcnum),tostring(jcnum)..": "..tostring(infoName[jcnum]),"");
		self.ThingManager:AddChildToList(obj,"0"..tostring(jcnum)," "..tostring(ThingManagerMore.info[jcnum]),"");
		ThingManagerMore.infoOldstr[jcnum]=tostring(ThingManagerMore.info[jcnum]);
		ThingManagerMore.infoNewstr[jcnum]=tostring(ThingManagerMore.info[jcnum]);
	end
	return true;
end


-------------------------------------------
function ThingManagerMore:ClearSpecialFSCT()
	local thing = ThingManagerMore.thing;
	local FSData=thing.FengshuiItem;
	if FSData == nil or FSData.Specials==nil then
		return false;
	end
	FSData.Specials:Clear();
	return true;
end
function ThingManagerMore:AddListFSCT()
	local str1=ThingManagerMore.inputEquipAttributej17.m_title.text;
	local num =tonumber(ThingManagerMore.inputEquipAttributej17.m_title.text);
	if num ~=nil then
		str1=QFWDlib.ModifierListTrue[num];
	end
	local numnum=tonumber(ThingManagerMore.inputEquipAttributej18.m_title.text);
	local thing = ThingManagerMore.thing;
	local FSData=thing.FengshuiItem;
	if FSData == nil then
		return false;
	end
	local list=FSData.Modifiers;
	local list2=FSData.ModifierScale;
	if list==nil or list2==nil or str1==nil then
		return false;
	end
	if numnum==nil then
		numnum=1;
	end
	list:Add(str1);
	list2:Add(numnum);
	ThingManagerMore:ShowAllCTR();
	return true;
end
function ThingManagerMore:RemListFSCT()
	local num=tonumber(ThingManagerMore.inputEquipAttributej14.m_title.text);
	if num==nil then
		return false;
	end
	local key=ThingManagerMore.ModifiersListKey[num];
	if key==nil then
		return false;
	end
	local thing = ThingManagerMore.thing;
	local FSData=thing.FengshuiItem;
	if FSData == nil then
		return false;
	end
	local list=FSData.Modifiers;
	local list2=FSData.ModifierScale;
	if list==nil or list2==nil then
		return false;
	end
	list:RemoveAt(key);
	list2:RemoveAt(key);
	ThingManagerMore:ShowAllCTR();
	return true;
end
function ThingManagerMore:YesListFS()
	local thing = ThingManagerMore.thing;
	local FSData=thing.FengshuiItem;
	if FSData == nil then
		return false;
	end
	local num=1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FSData.AddV=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FSData.RoomLevel=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FSData.ElementPower=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num]);
		if numnum==nil or numnum<1 then
			numnum=1;
		end
		FSData.ElementKind=QFWDlib.ItemsElementTypes[numnum];
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num]);
		if numnum==nil or numnum<1 then
			numnum=1;
		end
		FSData.Localtion=QFWDlib.FengshuiItemLocal[numnum];
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num]);
		if numnum==nil or numnum<1 then
			numnum=1;
		end
		FSData.RoomFengshui=QFWDlib.FengshuiRank[numnum];
	end
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num]);
		if numnum==nil or numnum<1 then
			numnum=1;
		end
		FSData.RoomKind=QFWDlib.RoomKind[numnum];
	end
	ThingManagerMore:UpdListFS();
end
function ThingManagerMore:AddListFS()
	local thing = ThingManagerMore.thing;
	local FSData=thing.FengshuiItem;
	if FSData == nil then
		thing.FSItemState=1;
		thing:MakeFengshuiItemData()
		thing.FengshuiActiveState=1;
		thing.FSItemState=3;
		return true;
	end
	return false;
end
function ThingManagerMore:UpdListFS(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP;
		ThingManagerMore.showTypes2=1;
	end
	local thing = ThingManagerMore.thing;
	--print(thing:GetFengshuiItemDesc())
	if not thing.FengshuiActiveState then
		thing.FengshuiActiveState=true;
	end
	local FSData=thing.FengshuiItem;
	if FSData == nil then
		return false;
	end
	local IntText=QFLanguage.GetText(">ThingManagerMore_Tips42");
	local FloatText=QFLanguage.GetText(">ThingManagerMore_Tips43");
	local StringText=QFLanguage.GetText(">ThingManagerMore_Tips44");
	
	local infoName=
	{
			"附加值V["..IntText.."]:AddV","房间等级["..IntText.."]:RoomLevel","元素强度["..IntText.."]:ElementPower","元素类型["..IntText.."]:ElementKind",
			"位置["..IntText.."]:Localtion","房间风水["..IntText.."]:RoomFengshui","房间种类["..IntText.."]:RoomKind"
		};
	ThingManagerMore.info = 
	{
	FSData.AddV,FSData.RoomLevel,FSData.ElementPower,FSData.ElementKind,
	FSData.Localtion,FSData.RoomFengshui,FSData.RoomKind
	};
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips33");
	obj.m_list:RemoveChildrenToPool();
	ThingManagerMore.infoOldstr={};
	ThingManagerMore.infoNewstr={};
	jcnum=1;
	for jcnum=1,#infoName do
		self.ThingManager:AddChildToList(obj,tostring(jcnum),tostring(jcnum)..": "..tostring(infoName[jcnum]),"");
		self.ThingManager:AddChildToList(obj,"0"..tostring(jcnum)," "..tostring(ThingManagerMore.info[jcnum]),"");
		ThingManagerMore.infoOldstr[jcnum]=tostring(ThingManagerMore.info[jcnum]);
		ThingManagerMore.infoNewstr[jcnum]=tostring(ThingManagerMore.info[jcnum]);
	end
	return true;
end
function ThingManagerMore:AddCT()
	local thing = ThingManagerMore.thing;
	local num1s=ThingManagerMore.inputEquipAttributej4.m_title.text;
	local num2s=tonumber(ThingManagerMore.inputEquipAttributej5.m_title.text);
	local num3s=tonumber(ThingManagerMore.inputEquipAttributej6.m_title.text);
	local num4s=tonumber(ThingManagerMore.inputEquipAttributej7.m_title.text);
	local num5s=tonumber(ThingManagerMore.inputEquipAttributej8.m_title.text);
	local num6s=tonumber(ThingManagerMore.inputEquipAttributej9.m_title.text);
	local num7s=tonumber(ThingManagerMore.inputEquipAttributej10.m_title.text);
	local num2=nil;
	local num3=nil;
	if num2s==nil or num2s<1 then
		num2=QFWDlib.NpcSpecailFlag[1];
		ThingManagerMore.inputEquipAttributej5.m_title.text="1";
	else
		num2=QFWDlib.NpcSpecailFlag[num2s];
	end
	if num3s==nil then
		num3=ThingManagerMore.inputEquipAttributej6.m_title.text;
	else
		num3=QFWDlib.ModifierListTrue[num3s];
	end
	if num4s==nil then
		num4s=0;
	end
	if num5s==nil then
		num5s=0;
	end
	thing:AddEquiptData(num1s, num5s, num4s, num7s, num6s, num2,num3,false);
	
end
function ThingManagerMore:UpdateModifierList()
	local num=1;
	local localKey=nil;
	local localValue=nil;
	local def =nil;
	local ld=QFLanguage.GetText(">ThingManagerMore_Tips34");
	for localKey, localValue in pairs(QFWDlib.ModifierList) do
		--print(localValue.Name);
		def = CS.XiaWorld.ModifierMgr.Instance:GetDef(QFWDlib.ModifierList[localKey]);
		if def ~= nil then
			if def.DisplayName ~= nil then
				QFWDlib.ModifierListDisplayName[num]=def.DisplayName;
			else
				QFWDlib.ModifierListDisplayName[num]=ld;
			end
			QFWDlib.ModifierListTrue[num]=localValue;
			num=num+1;
		end
	end
	-- local idnum=0;
	-- num=1;
	-- for idnum=0, 100 do
		-- def = CS.XiaWorld.ThingMgr.Instance:GetFengshuiItemSpecial(idnum);
		-- if def ~= nil then
			-- if def.RoomKind ~= nil then
				-- QFWDlib.FengshuiItemSpecial[num]=def;
				-- print(def.RoomKind)
				-- num=num+1;
			-- end
		-- end
	-- end
end
function ThingManagerMore:AllCT(types,obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP;
	end
	if types==nil then
		ThingManagerMore.showTypes=3;
	else
		ThingManagerMore.showTypes=5;
	end
	local localKey=nil;
	local localValue=nil;
	local num=0;
	local localKey,localValue=nil,nil;
	obj.m_list:RemoveChildrenToPool();
	local ld=QFLanguage.GetText(">ThingManagerMore_Tips34");
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips50");
	for _, localValue in pairs(QFWDlib.ModifierListTrue) do
		num=num+1;
		if QFWDlib.ModifierListDisplayName[num] == ld then
			ThingManagerMore:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue));
		else
			ThingManagerMore:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.ModifierListDisplayName[num].."--"..tostring(localValue));
		end
		
	end
end
function ThingManagerMore:AllBZ(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP;
		ThingManagerMore.showTypes=2;
	end
	local localKey=nil;
	local localValue=nil;
	local num=0;
	local localKey,localValue=nil,nil;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips51");
	for localKey,localValue  in pairs(QFWDlib.NpcSpecailFlag) do
		if localValue~=nil then
			num=num+1;
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue),"");
		end
	end
end
function ThingManagerMore:AllJN(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP;
		ThingManagerMore.showTypes=1;
	end
	local localKey=nil;
	local localValue=nil;
	local num=0;
	local localKey,localValue=nil,nil;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips52");
	for localKey,localValue  in pairs(QFWDlib.NpcSkillType) do
		if localValue~=nil then
			num=num+1;
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue),"");
		end
	end
end
function ThingManagerMore:AddJN()
	local thing = ThingManagerMore.thing;
	local num1=tonumber(ThingManagerMore.inputEquipAttributej1.m_title.text);
	local num2=tonumber(ThingManagerMore.inputEquipAttributej2.m_title.text);
	local num3=tonumber(ThingManagerMore.inputEquipAttributej3.m_title.text);
	if num1 == nil or num1<0 then
		return false;
	end
	local type1=QFWDlib.NpcSkillType[num1];
	if num2==nil then
		num2=0;
		ThingManagerMore.inputEquipAttributej2.m_title.text="0";
	end
	if num3==nil then
		ThingManagerMore.inputEquipAttributej3.m_title.text="0";
		num3=0;
	end
	thing:AddEquiptSkillData(type1, num2,num3);
	return true;
end
function ThingManagerMore:ThingRemoveEquipt(nums)
	local num = tonumber(nums);
	local thing = ThingManagerMore.thing;
	local bool = thing.EquptData:Remove(ThingManagerMore.infos[num]);
	if bool then
		return true;
	else
		return false;
	end
end
function ThingManagerMore:YesAttribute()
	local num=1;
	local infodata=ThingManagerMore.ChooseData;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		if ThingManagerMore.infoNewstr[num]=="nil" then
			infodata.name=nil;
		else
			infodata.name=ThingManagerMore.infoNewstr[num];
		end
	end
	
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		if ThingManagerMore.infoNewstr[num]=="nil" then
			infodata.modifier=nil;
		else
			infodata.modifier=ThingManagerMore.infoNewstr[num];
		end
	end
	
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.Type=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.flag=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.addv=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.addp=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.baddv=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.baddp=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	
	num=num+1;
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.hide=tonumber(ThingManagerMore.infoNewstr[num]);
	end
	local length=#ThingManagerMore.infoOldstr;
	local jcnum=1;
	num=0;
	for jcnum=length-4,length do
		if ThingManagerMore.infoOldstr[jcnum]~=ThingManagerMore.infoNewstr[jcnum] then
			if infodata.basefive~=nil then
				infodata.basefive[num] = tonumber(ThingManagerMore.infoNewstr[jcnum]);
			-- else
				-- local list={0,0,0,0,0};
				-- infodata.basefive=list;
				-- print(#infodata.basefive)
				-- infodata.basefive[num] = tonumber(ThingManagerMore.infoNewstr[jcnum]);
			end
		end
	end
	ThingManagerMore:ThingShowEquipt();
end
function ThingManagerMore:SetAttribute(num,value,types)
	local tnum=tonumber(num);
	if tnum==nil or tnum<1 then
		tnum=1;
	end
	ThingManagerMore.infoNewstr[tnum]=value;
	if ThingManagerMore:UpdateThingShowEquiptList(types) then
		return true;
	else
		return false;
	end
	
end

function ThingManagerMore:UpdateThingShowEquiptList(types,obj)
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP;
		--ThingManagerMore.showTypes2=0;
	end
	ThingManagerMore.showTypes2=types;
	local infoName={};
	local IntText=QFLanguage.GetText(">ThingManagerMore_Tips42");
	local FloatText=QFLanguage.GetText(">ThingManagerMore_Tips43");
	local StringText=QFLanguage.GetText(">ThingManagerMore_Tips44");
	
	if types==nil or types==0 then
		infoName=
		{
			"名字:name","词条:modifier","类型:Type","标志:flag",
			"附加值V:addv","附加值P:addp","基础值V:baddv","基础值P:baddp",
			"隐藏属性:hide",
			"神识","根骨","魅力","悟性","机缘"
		};
		obj.m_title.text = "模块属性";
	elseif types==1 then
		infoName=
		{
			"附加值V["..IntText.."]:AddV","房间等级["..IntText.."]:RoomLevel","元素强度["..IntText.."]:ElementPower","元素类型["..IntText.."]:ElementKind",
			"位置["..IntText.."]:Localtion","房间风水["..IntText.."]:RoomFengshui","房间种类["..IntText.."]:RoomKind"
		};
		obj.m_title.text = "风水属性";
	elseif types==2 then
		infoName=
		{
		"词条类型:Kind","n参数1["..IntText.."]:nParam1","n参数2["..IntText.."]:nParam2","f参数1["..FloatText.."]:fParam1",
		"f参数2["..FloatText.."]:fParam2","s参数1["..StringText.."]:sParam1","s参数2["..StringText.."]:sParam2","词条描述["..StringText.."]:Desc",
		"特殊标志["..StringText.."]:Flag"
		};
		obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips32");
		--print("MOD版修改器:true")
	end
	obj.m_list:RemoveChildrenToPool();
	local num = 1;
	local jcnum=1;
	for jcnum=1,#infoName do
		self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(infoName[num]),"");
		self.ThingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(ThingManagerMore.infoNewstr[num]),"");
		--print(infoName[num])
		num = num + 1;
	end
	return true;
end
function ThingManagerMore:ThingShowEquipt(obj)
	local thing=ThingManagerMore.thing;
	if thing.EquptData==nil then
		print(QFLanguage.GetText(">MODName")..":No equipdata")
		return false;
	end
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP;
		ThingManagerMore.showTypes=0;
	end
	
	ThingManagerMore.infos={};
	local num=0;
	local localKey=nil;
	local localValue=nil;
	local localKey,localValue=nil,nil;
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips35");
	obj.m_list:RemoveChildrenToPool();
	for localKey,localValue  in pairs(thing.EquptData) do
		if localValue~=nil then
			num=num+1;
			ThingManagerMore.infos[num]=localValue;
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.name),"");
		end
	end
	if ThingManagerMore:ToChooseData(1) then
		return true;
	else
		return false;
	end
end
function ThingManagerMore:ToChooseData(nums)
	num=tonumber(nums);
	ThingManagerMore.ChooseData=ThingManagerMore.infos[num];
	if ThingManagerMore.ChooseData~=nil then
		ThingManagerMore.ShowLableThing.text = QFLanguage.GetText(">ThingManagerMore_ShowLableThing").." "..tostring(ThingManagerMore.ChooseData.name);
		ThingManagerMore:ThingShowEquiptList();
		return true;
	else
		print(QFLanguage.GetText(">MODName")..":ChooseData false")
		return false
	end
end
function ThingManagerMore:ThingShowEquiptList(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP;
	end
	ThingManagerMore.showTypes2=0;
	local infodata=ThingManagerMore.ChooseData;
	local infoName=
	{
		"名字:name","词条:modifier","类型:Type","标志:flag",
		"附加值V:addv","附加值P:addp","基础值V:baddv","基础值P:baddp",
		"隐藏属性:hide",
		"神识","根骨","魅力","悟性","机缘"
	};
	ThingManagerMore.info=
	{
		infodata.name,infodata.modifier,infodata.Type,infodata.flag,
		infodata.addv,infodata.addp,infodata.baddv,infodata.baddp,
		infodata.hide
		
	};
	local num=#infoName-4;
	local jcnum=0;
	if infodata.basefive~=nil then
		for num=#infoName-4,#infoName do
			ThingManagerMore.info[num]=infodata.basefive[jcnum];
			jcnum=jcnum+1;
		end
	else
		for num=#infoName-4,#infoName do
			ThingManagerMore.info[num]=nil;
			jcnum=jcnum+1;
		end
	end
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips36");
	obj.m_list:RemoveChildrenToPool();
	num = 1;
	jcnum=1;
	ThingManagerMore.infoOldstr={};
	ThingManagerMore.infoNewstr={};
	for jcnum=1,#infoName do
		self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(infoName[num]),"");
		self.ThingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(ThingManagerMore.info[num]),"");
		ThingManagerMore.infoOldstr[jcnum]=tostring(ThingManagerMore.info[num]);
		ThingManagerMore.infoNewstr[jcnum]=tostring(ThingManagerMore.info[num]);
		num = num + 1;
	end
end
function ThingManagerMore:ThingManagerMoreIn(thing)
	--ThingManagerMore:OnInit();
	ThingManagerMore.thing=thing;
	ThingManagerMore.ShowLable.text = QFLanguage.GetText(">ThingManagerMore_Tips37")..": "..tostring(thing:GetName());
	ThingManagerMore:SetTitle(thing:GetName());
	ThingManagerMore:ThingShowEquipt();
end
function ThingManagerMore:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function ThingManagerMore:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function ThingManagerMore:AddChildToList(tobj,name,value,icon)
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
function ThingManagerMore:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(ThingManagerMore.ListChildOnClick);
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips35");
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
function ThingManagerMore:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(ThingManagerMore.ListChildOnClick2);
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips36");
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
function ThingManagerMore.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	ThingManagerMore.TheClickBnt = tonumber(Eventss.data.name);
	ThingManagerMore:SetSetting();
	
end
function ThingManagerMore:SetSetting2()
	local obj=nil;
	local types=ThingManagerMore.showTypes2;
	if types==nil or types==0 then
		--print("Here!!!")
		obj=ThingManagerMore.inputEquipAttributeID;
	elseif types==1 then
		--print("Here2!!!")
		obj=ThingManagerMore.inputEquipAttributej14;
	elseif types==2 then
		obj=ThingManagerMore.inputEquipAttributej14;
	elseif types==3 then
		obj=ThingManagerMore.inputEquipAttributej26;
	end
	if types==nil or types==0 then
		
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
		ThingManagerMore.inputEquipAttribute.m_title.text=tostring(ThingManagerMore.infoNewstr[ThingManagerMore.TheClickBnt]);
		if ThingManagerMore.TheClickBnt==1 then
			ThingManagerMore:AllCTName();
		end
	elseif types==1 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
		ThingManagerMore.inputEquipAttributej15.m_title.text=tostring(ThingManagerMore.infoNewstr[ThingManagerMore.TheClickBnt]);
		if ThingManagerMore.TheClickBnt==4 then
			ThingManagerMore:AllRYS(0);
		elseif ThingManagerMore.TheClickBnt==5 then
			ThingManagerMore:AllRYS(1);
		elseif ThingManagerMore.TheClickBnt==6 then
			ThingManagerMore:AllRYS(2);
		elseif ThingManagerMore.TheClickBnt==7 then
			ThingManagerMore:AllRYS(3);
		elseif ThingManagerMore.TheClickBnt==8 then
			
		end
	elseif types==2 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
		--ThingManagerMore.inputEquipAttribute.m_title.text=tostring(ThingManagerMore.infoNewstr[ThingManagerMore.TheClickBnt]);
	elseif types==3 then
		if ThingManagerMore.TheClickBnt==1 then
			ThingManagerMore:AllRYS(4);
		end
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
		ThingManagerMore.inputEquipAttributej27.m_title.text=tostring(ThingManagerMore.infoNewstr[ThingManagerMore.TheClickBnt]);
	
	end
end

-- function ThingManagerMore:SetCTRFore()
	-- local num= tonumber(ThingManagerMore.inputEquipAttributej16.m_title.text);
	-- if num==nil or num<1 then
		-- return false;
	-- end
	-- local str1=ThingManagerMore.inputEquipAttributej17.m_title.text;
	-- local str2=ThingManagerMore.inputEquipAttributej18.m_title.text;
	-- ThingManagerMore:SetCTR(num,str1,0);
	-- ThingManagerMore:SetCTR(num,str2,1);
	-- ThingManagerMore:UpdateShowAllCTR();
	-- return true;
-- end
-- function ThingManagerMore:SetCTR(nums,value,types)
	-- num=tonumber(nums);
	-- if num==nil or value==nil then
		-- return false;
	-- end
	-- if types==nil or types==0 then
		-- ThingManagerMore.ModifiersListNewName[num]=value;
	-- else
		-- ThingManagerMore.ModifiersListNewScale[num]=value;
	-- end
	-- return true;
-- end
function ThingManagerMore:ShowAllCTR(obj)
	local thing = ThingManagerMore.thing;
	local FSData=thing.FengshuiItem;
	if FSData == nil then
		return false;
	end
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP;
		ThingManagerMore.showTypes2=2;
	end
	local localKey=nil;
	local localValue=nil;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	local list={};
	local list2={};
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips38");
	ThingManagerMore.ModifiersListKey={};
	list=FSData.Modifiers;
	list2=FSData.ModifierScale;
	local ld1,ld2=QFLanguage.GetText(">ThingManagerMore_Tips39"),QFLanguage.GetText(">ThingManagerMore_Tips40");
	for localKey,localValue in pairs(list) do
		if localValue~=nil and list2[localKey]~=nil then
			num=num+1;
			self.ThingManager:AddChildToList(obj,"000"..tostring(num),tostring(num)..": "..tostring(ld1),"");
			self.ThingManager:AddChildToList(obj,"00"..tostring(num)," "..tostring(localValue),"");
			self.ThingManager:AddChildToList(obj,"0"..tostring(num),tostring(ld2),"");
			self.ThingManager:AddChildToList(obj,tostring(num)," "..tostring(list2[localKey]),"");
			ThingManagerMore.ModifiersListKey[num]=localKey;
		end
	end
	return true;
end
-- function ThingManagerMore:UpdateShowAllCTR(obj)
	-- if obj==nil then
		-- obj=ThingManagerMore.ThingAttributeListCOP;
		-- ThingManagerMore.showTypes=5;
	-- end
	-- local num=0;
	-- local localKey,localValue=nil,nil;
	-- obj.m_list:RemoveChildrenToPool();
	-- for localKey,localValue in pairs(ThingManagerMore.ModifiersListNewName) do
		-- num=num+1;
		-- self.ThingManager:AddChildToList(obj,"000"..tostring(num),tostring(num)..": "..tostring("词条名:ModifierName"),"");
		-- self.ThingManager:AddChildToList(obj,"00"..tostring(num)," "..tostring(localValue),"");
		-- self.ThingManager:AddChildToList(obj,"0"..tostring(num),tostring("词条效果:ModifierScale"),"");
		-- self.ThingManager:AddChildToList(obj,tostring(num)," "..tostring(ThingManagerMore.ModifiersListNewScale[localKey]),"");
	-- end
-- end
function ThingManagerMore:AllCTName(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP;
		ThingManagerMore.showTypes=6;
	end
	self.NpcManager.AttributesName={};
	self.NpcManager.AttributesDisPName={};
	local name=nil;
	local name2=nil;
	local name3=nil;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips41");
	ThingManagerMore.CTdisplayName={};
	local uselist=CS.XiaWorld.PropertyMgr.Instance.m_mapProperties;
	for localKey, localValue in pairs(uselist) do
		if localValue~=nil and localValue.Name~=nil then
			num = num + 1;
			name2 = tostring(localValue.Name);
			name3 = tostring(localValue.DisplayName);
			if name3 == nil and name3 == "nil" then
				name=name2;
			else
				name=name3..":"..name2;
			end
			ThingManagerMore.CTdisplayName[num] = name2;
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,"");
		end
	end
end
function ThingManagerMore:AllRYS(types,obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP;
		ThingManagerMore.showTypes=4;
	end
	local localKey=nil;
	local localValue=nil;
	local num=0;
	obj.m_list:RemoveChildrenToPool();
	local list={};
	if types==nil or types==0 then
		obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips45");
		list=QFWDlib.ItemsElementTypes;
	elseif types==1 then
		obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips46");
		list=QFWDlib.FengshuiItemLocal;
	elseif types==2 then
		obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips47");
		list=QFWDlib.FengshuiRank;
	elseif types==3 then
		obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips48");
		list=QFWDlib.RoomKind;
	elseif types==4 then
		obj.m_title.text = QFLanguage.GetText(">ThingManagerMore_Tips49");
		list=QFWDlib.FabaoSpecialAbility;
		ThingManagerMore.showTypes=8;
	end
	for localKey,localValue in pairs(list) do
		if localValue~=nil then
			num=num+1;
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue),"");
		end
	end
end
function ThingManagerMore.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	ThingManagerMore.TheClickBnt = tonumber(Eventss.data.name);
	ThingManagerMore:SetSetting2();
	
end
function ThingManagerMore:SetSetting()
	local obj=nil;
	local types=ThingManagerMore.showTypes;
	--print(types)
	if types==nil or types==0 then
		obj=ThingManagerMore.inputEquip;
	elseif types==1 then
		obj=ThingManagerMore.inputEquipAttributej1;
	elseif types==2 then
		obj=ThingManagerMore.inputEquipAttributej5;
	elseif types==3 then
		obj=ThingManagerMore.inputEquipAttributej6;
	elseif types==4 then
		obj=ThingManagerMore.inputEquipAttributej15;
	elseif types==5 then
		obj=ThingManagerMore.inputEquipAttributej17;
	elseif types==6 then
		obj=ThingManagerMore.inputEquipAttribute;
	elseif types==7 then
		--obj=ThingManagerMore.inputEquipAttribute;
	elseif types==8 then
		obj=ThingManagerMore.inputEquipAttributej27;
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
		ThingManagerMore:ToChooseData(ThingManagerMore.TheClickBnt);
	elseif types==1 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
	elseif types==2 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
		-- local str1=tostring(ThingManagerMore.TheClickBnt);
		-- local num1=string.find(str1," ");
		-- if num1~=nil then
			-- local str2=string.sub(str1,num1+1,-1);
			-- print(str2)
			-- if str2==nil or str2=="" then
				-- obj.m_title.text="0";
			-- else
				-- obj.m_title.text=str2;
			-- end
		-- else
			-- obj.m_title.text="0";
		-- end
	elseif types==3 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
	elseif types==4 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
	elseif types==5 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
	elseif types==6 then
		obj.m_title.text=tostring(ThingManagerMore.CTdisplayName[ThingManagerMore.TheClickBnt]);
		ThingManagerMore.inputEquipAttributej4.m_title.text=tostring(ThingManagerMore.CTdisplayName[ThingManagerMore.TheClickBnt]);
	elseif types==7 then
		ThingManagerMore:ToChooseDataFBMB(ThingManagerMore.TheClickBnt);
	elseif types==8 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt);
		ThingManagerMore.inputEquipAttributej19.m_title.text=tostring(ThingManagerMore.TheClickBnt);
	end
		--ThingManagerMore:ChooseThingNumAndGetAttribute(ThingManagerMore.TheClickBnt);
end
