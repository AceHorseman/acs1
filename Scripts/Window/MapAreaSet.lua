MapAreaSet = CS.Wnd_Simple.CreateWindow("MapAreaSet");
ModifierMain:AddWindow("MapAreaSet",MapAreaSet);
function MapAreaSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">MapAreaSet_Title"));
	self:SetSize(self.sx,self.sy);
	local sy=2;
	self.MapAreaThingListCOP=self:AddCOP2("MapAreaThingList",self.sx/10*9.85,self.sy/10*0.7);
	self.MapAreaSetListCOP=self:AddCOP("MapAreaSetList",-self.sx/10*4.15,self.sy/10*0.7);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">MapAreaSet_Tips1"),self.sx/10*3,self.sy/10,300,35);
	QFWDModifierMainUI:AddButton2(self,"bntUpdateAllArea",QFLanguage.GetText(">MapAreaSet_bntUpdateAllArea"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);

	QFWDModifierMainUI:AddLable2(self,"lable3111",QFLanguage.GetText(">MapAreaSet_lable3111"),self.sx/10,self.sy/10*sy,200,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*(sy+0.1));
	self.inputid1:SetSize(50, 20, false);
	self.inputid1.m_title.restrict = "[0-9]";
	self.inputid1.m_title.maxLength = 3;
	self.ShowLableArea = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc",QFLanguage.GetText(">MapAreaSet_Tips2")..": 1",self.sx/10,self.sy/10*1.5,300,35);
	QFWDModifierMainUI:AddButton2(self,"bntChooseChoose",QFLanguage.GetText(">MapAreaSet_bntChooseChoose"),self.sx/10*3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	
	self.CheckBox3 = self:AddCheckBox("ShowChooseArea",QFLanguage.GetText(">MapAreaSet_ShowChooseArea"),self.sx/10*4.5,self.sy/10*(sy+0.1));
	self.CheckBox3.selected = false;
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lableTS",QFLanguage.GetText(">MapAreaSet_lableTS"),self.sx/10,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntUpdateAllThingKey",QFLanguage.GetText(">MapAreaSet_bntUpdateAllThingKey"),self.sx/10*4,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntsSearchAreaThingBuyBigData",QFLanguage.GetText(">MapAreaSet_bntsSearchAreaThingBuyBigData"),self.sx/10*5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	
	QFWDModifierMainUI:AddButton2(self,"bntSearchAreaThingNoNeed",QFLanguage.GetText(">MapAreaSet_bntSearchAreaThingNoNeed"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	
	QFWDModifierMainUI:AddButton2(self,"bntCopyData",QFLanguage.GetText(">MapAreaSet_bntCopyData"),self.sx/10*8,self.sy/10*0.5):SetSize(self.sx/10*1, 20, false);
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lableAdd",QFLanguage.GetText(">MapAreaSet_lableAdd"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lableAdd1",QFLanguage.GetText(">MapAreaSet_lableAdd1"),self.sx/10,self.sy/10*sy,200,35);
	self.inputAdd1 = QFWDModifierMainUI:AddInput2(self,"inputAdd1","1",self.sx/10*2,self.sy/10*(sy+0.1));
	self.inputAdd1:SetSize(130, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddPlants",QFLanguage.GetText(">MapAreaSet_bntAddPlants"),self.sx/10*4.5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	--QFWDModifierMainUI:AddButton2(self,"bntsSearchAreaThingBuyBigData","静态查找",self.sx/10*5.2,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntAllPlants",QFLanguage.GetText(">MapAreaSet_bntAllPlants"),self.sx/10*6.5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.0, 20, false);

	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lableAdd2",QFLanguage.GetText(">MapAreaSet_lableAdd2"),self.sx/10,self.sy/10*sy,200,35);
	self.inputAdd2 = QFWDModifierMainUI:AddInput2(self,"inputAdd2","1",self.sx/10*2,self.sy/10*(sy+0.1));
	self.inputAdd2:SetSize(130, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddBuilds",QFLanguage.GetText(">MapAreaSet_bntAddPlants"),self.sx/10*4.5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntUpdateAllBuilding",QFLanguage.GetText(">MapAreaSet_bntUpdateAllBuilding"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAllBuildings",QFLanguage.GetText(">MapAreaSet_bntAllBuildings"),self.sx/10*6.5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.0, 20, false);

	
	sy=sy+0.5;
	--QFWDModifierMainUI:AddButton2(self,"bntsSearchAreaThingBuyBigData","静态查找",self.sx/10*5.2,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lableAdd3",QFLanguage.GetText(">MapAreaSet_lableAdd3"),self.sx/10,self.sy/10*sy,200,35);
	self.inputAdd3 = QFWDModifierMainUI:AddInput2(self,"inputAdd3","1",self.sx/10*2,self.sy/10*(sy+0.1));
	self.inputAdd3:SetSize(130, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntAddTerrains",QFLanguage.GetText(">MapAreaSet_bntAddTerrains"),self.sx/10*4.5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	--QFWDModifierMainUI:AddButton2(self,"bntsSearchAreaThingBuyBigData","静态查找",self.sx/10*5.2,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntAllTerrains",QFLanguage.GetText(">MapAreaSet_bntAllTerrains"),self.sx/10*6.5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.0, 20, false);
	self.CheckBox2 = self:AddCheckBox("RemoveFloor",QFLanguage.GetText(">MapAreaSet_RemoveFloor"),self.sx/10*8,self.sy/10*(sy+0.1));
	self.CheckBox2.selected = false;

	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lableAdd4",QFLanguage.GetText(">MapAreaSet_lableAdd4"),self.sx/10,self.sy/10*sy,200,35);
	self.inputAdd4 = QFWDModifierMainUI:AddInput2(self,"inputAdd4","666",self.sx/10*2,self.sy/10*(sy+0.1));
	self.inputAdd4:SetSize(130, 20, false);
	self.inputAdd4.m_title.restrict = "[0-9]";
	self.inputAdd4.m_title.maxLength = 8;
	QFWDModifierMainUI:AddButton2(self,"bntAddLing",QFLanguage.GetText(">MapAreaSet_bntAddTerrains"),self.sx/10*4.5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	--QFWDModifierMainUI:AddButton2(self,"bntsSearchAreaThingBuyBigData","静态查找",self.sx/10*5.2,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	
	


	QFWDModifierMainUI:AddButton2(self,"bntSearchThing",QFLanguage.GetText(">AddManager_bntSearchThing"),-self.sx/10*0.9,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch",QFLanguage.GetText(">AddManager_inputSearch"),-self.sx/10*4,self.sy/10*9);
	self.inputSearch:SetSize(self.sx/10*3, 25, false);

	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lableAdd5",QFLanguage.GetText(">MapAreaSet_lableAdd5"),self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lableAdd6",QFLanguage.GetText(">MapAreaSet_lableAdd6"),self.sx/10,self.sy/10*sy,200,35);
	self.inputAdd61 = QFWDModifierMainUI:AddInput2(self,"inputAdd61","0",self.sx/10*2,self.sy/10*(sy+0.1));
	self.inputAdd61:SetSize(self.sx/10*0.8, 20, false);
	self.inputAdd61.m_title.restrict = "[0-9]";
	self.inputAdd61.m_title.maxLength = 3;
	self.inputAdd62 = QFWDModifierMainUI:AddInput2(self,"inputAdd62","0",self.sx/10*3.1,self.sy/10*(sy+0.1));
	self.inputAdd62:SetSize(self.sx/10*0.8, 20, false);
	self.inputAdd62.m_title.restrict = "[0-9]";
	self.inputAdd62.m_title.maxLength = 3;
	QFWDModifierMainUI:AddButton2(self,"bntAllArea",QFLanguage.GetText(">MapAreaSet_bntAllArea"),self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lableAdd7",QFLanguage.GetText(">MapAreaSet_lableAdd7"),self.sx/10,self.sy/10*sy,200,35);
	self.inputAdd71 = QFWDModifierMainUI:AddInput2(self,"inputAdd71","191",self.sx/10*2,self.sy/10*(sy+0.1));
	self.inputAdd71:SetSize(self.sx/10*0.8, 20, false);
	self.inputAdd71.m_title.restrict = "[0-9]";
	self.inputAdd71.m_title.maxLength = 3;
	self.inputAdd72 = QFWDModifierMainUI:AddInput2(self,"inputAdd72","191",self.sx/10*3.1,self.sy/10*(sy+0.1));
	self.inputAdd72:SetSize(self.sx/10*0.8, 20, false);
	self.inputAdd72.m_title.restrict = "[0-9]";
	self.inputAdd72.m_title.maxLength = 3;
	self.CheckBox3 = self:AddCheckBox("UseArea",QFLanguage.GetText(">MapAreaSet_UseArea"),self.sx/10*8,self.sy/10*(sy+0.1));
	self.CheckBox3.selected = false;
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lableTS2",QFLanguage.GetText(">MapAreaSet_lableTS2"),self.sx/10,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAllGrid",QFLanguage.GetText(">MapAreaSet_bntRemoveAllGrid"),self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	--QFWDModifierMainUI:AddButton2(self,"bntsSearchAreaThingBuyBigData","静态查找",self.sx/10*5.2,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAllThing",QFLanguage.GetText(">MapAreaSet_bntRemoveAllThing"),self.sx/10*3.5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	--QFWDModifierMainUI:AddButton2(self,"bntsSearchAreaThingBuyBigData","静态查找",self.sx/10*5.2,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAllThingNorNPC",QFLanguage.GetText(">MapAreaSet_bntRemoveAllThingNorNPC"),self.sx/10*5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false);
	--QFWDModifierMainUI:AddButton2(self,"bntsSearchAreaThingBuyBigData","静态查找",self.sx/10*5.2,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	self.CheckBox1 = self:AddCheckBox("RemoveItems",QFLanguage.GetText(">MapAreaSet_RemoveItems"),self.sx/10*8,self.sy/10*(sy+0.1));
	self.CheckBox1.selected = false;
	
	--QFWDModifierMainUI:AddButton2(self,"bntAddArea","添加!",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);

	self.LTypes=0;
	self.RTypes=0;
	self.ChooseNum=0;
	self.ChooseThing=nil;
	MapAreaSet.Keys={};
	MapAreaSet:InMapAreaSet();
	self.window:Center();
end

function MapAreaSet:OnShowUpdate()
	
end

function MapAreaSet:OnShown()
	MapAreaSet.isShowing = true
	ModifierMain.showWindow=17;
end

function MapAreaSet:OnUpdate()

end

function MapAreaSet:OnHide()
	MapAreaSet.isShowing = false;
	ModifierMain.showWindow=0;
end
function MapAreaSet:CopyData()
	if MapAreaSet.ThingInArea==nil or MapAreaSet.ThingInArea=={} then
		return false;
	end
	MapThingList = {};
	MapThingList = MapAreaSet.ThingInArea;
	return true ;
end
function MapAreaSet:ChooseAllGrid()
	MapAreaSet.inputAdd61.m_title.text="-1";
	MapAreaSet.inputAdd62.m_title.text="-1";
	MapAreaSet.inputAdd71.m_title.text="-1";
	MapAreaSet.inputAdd72.m_title.text="-1";
	MapAreaSet.CheckBox3.selected=true;
	return MapAreaSet:GetAllKeyInArea(1);
end
function MapAreaSet:RemoveAllGrid()
	MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum]:RemoveAllGrid();
end
function MapAreaSet:GetAllKeyInArea(types)
	local num = 1;
	if types==nil or types==0 then
		local Area = MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum];
		if Area == nil then
			return false;
		end
		if Area.m_lisGrids == nil then
			return false;
		end
		local localKey=nil;
		local localValue=nil;
		MapAreaSet.Keys={};
		MapAreaSet.CheckBox3.selected=false;
		for localKey, localValue in pairs(Area.m_lisGrids) do
			MapAreaSet.Keys[num] = localValue;
			num = num + 1;
		end
		if MapAreaSet.CheckBox3.selected then
			if MapAreaSet.Keys[1] ==nil then
				--CS.MapCamera.Instance:LookKey(1);
				MapAreaSet.CheckBox3.selected=false;
			else
				CS.MapCamera.Instance:LookKey(MapAreaSet.Keys[1]);
			end
		end
	else
		local x,xd,y,yd;
		local size=tonumber(Map.Size);
		x=tonumber(MapAreaSet.inputAdd61.m_title.text);
		if x==nil or x<0 then
			x=0;
			MapAreaSet.inputAdd61.m_title.text=tostring(x);
		end
		y=tonumber(MapAreaSet.inputAdd62.m_title.text);
		if y==nil or y<0 then
			y=0;
			MapAreaSet.inputAdd62.m_title.text=tostring(y);
		end
		xd=tonumber(MapAreaSet.inputAdd71.m_title.text);
		if xd==nil or xd<0 then
			xd=size-1;
			MapAreaSet.inputAdd71.m_title.text=tostring(xd);
		end
		yd=tonumber(MapAreaSet.inputAdd72.m_title.text);
		if yd==nil or yd<0 then
			yd=size-1;
			MapAreaSet.inputAdd72.m_title.text=tostring(yd);
		end
		local cx,cy;
		MapAreaSet.Keys={};
		if x>xd then
			x,xd=xd,x;
		end
		if y>yd then
			y,yd=yd,y;
		end
		for cx=x,xd do
			for cy=y,yd do
				MapAreaSet.Keys[num] = MapAreaSet:GetKey(cx,cy);
				num = num + 1;
			end
		end
	end
	return true;
	--MapAreaSet:UpdateAllThingInAreaList();
end
function MapAreaSet:GetKey(x,y)
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
function MapAreaSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntAllArea" then
			if MapAreaSet:ChooseAllGrid() then
				MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips3");
			else
				MapAreaSet:GetAllKeyInArea();
				MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips4");
			end
			return;
		end
		if obj.name == "UseArea" then
			if MapAreaSet.CheckBox3.selected then
				MapAreaSet:GetAllKeyInArea(1);
				MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips5");
			else
				MapAreaSet:GetAllKeyInArea();
				MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips6");
			end
			return;
		end
		if obj.name == "bntCopyData" then
			if MapAreaSet:CopyData() then
				MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips7");
				MapAreaSet:Hide();
				MapSet:Show();
			else
				MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips8");
			end
			return;
		end
		if obj.name == "bntSearchThing" then
			local name=tostring(MapAreaSet.inputSearch.m_title.text);
			MapAreaSet:SearchDisplayName(name);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips9");
			return;
		end
		if obj.name == "bntRemoveAllThing" then
			MapAreaSet:ListAllThingInAreaNoNeed();
			MapAreaSet:RemoveThingInArea(-1);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips10");
			MapAreaSet:ListAllThingInAreaNoNeed();
			return;
		end
		if obj.name == "bntRemoveAllThingNorNPC" then
			MapAreaSet:RemoveThingInArea(-2);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips11");
			return;
		end
		if obj.name == "bntAllBuildings" then
			MapAreaSet.RTypes=1;
			MapAreaSet:ShowAllThingBuildsName(MapAreaSet.MapAreaThingListCOP);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips12");
			return;
		end
		if obj.name == "bntAllPlants" then
			MapAreaSet.RTypes=2;
			MapAreaSet:ShowAllThingPlantsName(MapAreaSet.MapAreaThingListCOP);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips13");
			return;
		end
		if obj.name == "bntAllTerrains" then
			MapAreaSet.RTypes=3;
			--MapAreaSet:RemoveThingInArea(-1);
			MapAreaSet:ShowAllThingTerrainsName(MapAreaSet.MapAreaThingListCOP);
			--MapAreaSet:TCAddBuilds(MapAreaSet.inputAdd3.m_title.text);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips14");
			return;
		end

		if obj.name == "bntAddPlants" then
			local num= tonumber(MapAreaSet.inputAdd1.m_title.text);
			if num ~= nil and num ~= 0 and num<=#QFWDlib.AllThingPlantsTrue then
				MapAreaSet.inputAdd1.m_title.text = QFWDlib.AllThingPlantsTrue[num];
			end
			MapAreaSet:RemoveThingInArea(4);
			MapAreaSet:TCAddPlant(MapAreaSet.inputAdd1.m_title.text);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips15");
			return;
		end
		if obj.name == "bntAddBuilds" then
			local num= tonumber(MapAreaSet.inputAdd2.m_title.text);
			if num ~= nil and num ~= 0 and num<=#QFWDlib.AllThingBuildsTrue then
				MapAreaSet.inputAdd2.m_title.text = QFWDlib.AllThingBuildsTrue[num];
			end
			MapAreaSet:RemoveThingInArea(5);
			MapAreaSet:TCAddBuilds(MapAreaSet.inputAdd2.m_title.text);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips15");
			return;
		end
		if obj.name == "bntAddTerrains" then
			local num= tonumber(MapAreaSet.inputAdd3.m_title.text);
			if num ~= nil and num ~= 0 and num<=#QFWDlib.AllThingTerrainsTrue then
				MapAreaSet.inputAdd3.m_title.text = QFWDlib.AllThingTerrainsTrue[num];
			end
			--MapAreaSet:RemoveThingInArea();
			MapAreaSet:TCAddTerrains(MapAreaSet.inputAdd3.m_title.text);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips16");
			return;
		end
		if obj.name == "bntAddLing" then
			local num= tonumber(MapAreaSet.inputAdd4.m_title.text);
			if num == nil then
				num=0;
				MapAreaSet.inputAdd4.m_title.text="0";
			end
			MapAreaSet:AddLing(num);
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips17");
			return;
		end
		if obj.name == "bntRemoveAllGrid" then
			MapAreaSet:RemoveAllGrid();
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips18");
			return;
		end
		if obj.name == "bntUpdateAllArea" then
			MapAreaSet:SearchAllArea();
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips19");
			return;
		end
		if obj.name == "bntUpdateAllBuilding" then
			MapAreaSet:ShowAllThingName();
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips20");
			return;
		end
		if obj.name == "bntChooseChoose" then
			--MapAreaSet:MakeAKeyList();
			if MapAreaSet:SetChooseNum() then
				MapAreaSet:GetAllKeyInArea();
				MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips21");
				local info=nil;
				if MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum].Name~=nil then
					info = QFLanguage.GetText(">MapAreaSet_Tips2")..": "..tostring(MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum].ID).."-"..tostring(MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum].Name);
				else
					info = QFLanguage.GetText(">MapAreaSet_Tips2")..": "..tostring(MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum].ID);
				end
				MapAreaSet.ShowLableArea.text = info;
			else
				MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips22");
			end
			
			return;
		end
		if obj.name == "bntUpdateAllThingKey" then
			MapAreaSet:MakeAKeyList();
			
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips23");
			return;
		end
		if obj.name == "bntsSearchAreaThingBuyBigData" then
			MapAreaSet.RTypes=0;
			MapAreaSet:GetAllKeyInArea();
			MapAreaSet:ListAllThingInAreaNeedTable();
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips24");
			return;
		end
		if obj.name == "bntSearchAreaThingNoNeed" then
			MapAreaSet.RTypes=0;
			MapAreaSet:GetAllKeyInArea();
			MapAreaSet:ListAllThingInAreaNoNeed();
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips25");
			return;
		end
		if obj.name == "ShowChooseArea" then
			if MapAreaSet.CheckBox1.selected then
				MapAreaSet:ShowChooseArea(MapAreaSet.ChooseNum);
			else
				MapAreaSet:HideChooseArea(MapAreaSet.ChooseNum);
			end
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips26");
			return;
		end
	end
end
function MapAreaSet:ShowAllThingName(obj)
	if obj==nil then
		obj=MapAreaSet.MapAreaSetListCOP;
	end
	obj.m_list:RemoveChildrenToPool();
	MapAreaSet.LTypes=1;
	obj.m_title.text = QFLanguage.GetText(">MapAreaSet_bntUpdateAllBuilding");
	MapAreaSet.listtypes2=0;
	local localKey = nil;
	local localValue=nil;
	for localKey, localValue in pairs(QFWDlib.AllThingItemsTrue) do 
		local icon = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, localValue).TexPath;
		if QFWDlib.AllThingItemsTrueDisplayName[localKey]~=nil then
			MapAreaSet:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.AllThingItemsTrueDisplayName[localKey]),icon);
		else
			MapAreaSet:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(QFWDlib.AllThingItemsTrue[localKey]),icon);
		end
		
	end
	
end
function MapAreaSet:AddLing(num)
	local localKey = nil;
	local localValue=nil;
	local lingValue=0;
	for localKey, localValue in pairs(MapAreaSet.Keys) do
		lingValue=Map.Ling:GetLing(localValue);
		if lingValue==nil then
			lingValue=0;
		end
		Map.Ling:AddLing(localValue, num-lingValue);
	end
end
function MapAreaSet:Adde(num)
	local localKey = nil;
	local localValue=nil;
	local lingValue=0;
	for localKey, localValue in pairs(MapAreaSet.Keys) do
		lingValue=Map.Effect:GetEffectBase(localValue, CS.XiaWorld.g_emMapEffectKind.Tempture);
		if lingValue==nil then
			lingValue=0;
		end
		Map.Effect:AddEffectBase(localValue, CS.XiaWorld.g_emMapEffectKind.Tempture, num-lingValue);
	end
end
function MapAreaSet:RemoveThingInArea(Types)
	local num=1;
	local localKey = nil;
	local localValue=nil;
	local theThing=nil;
	for localKey, localValue in pairs(MapAreaSet.Keys) do
		MapAreaSet:RemoveThing(localValue,Types);
	end
end
function MapAreaSet:RemoveThing(key,Types)
	local thing = nil;
	local localKey=nil;
	local localValue=nil;
	if Types >= 0 then
		local typess = QFWDlib.ThingTypes[Types];
		thing = Map.Things:GetThingAtGrid(key,typess);
		if thing ~= nil then
			ThingMgr:RemoveThing(thing, true, true);
		end
	elseif Types==-1 then
		for localKey, localValue in pairs(MapAreaSet.ThingInArea) do
			if MapAreaSet.CheckBox1.selected and localValue.ThingType~=CS.XiaWorld.g_emThingType.Item then
				ThingMgr:RemoveThing(localValue,true,true);
			else
				ThingMgr:RemoveThing(localValue,true,true);
			end
		end
		Map.Terrain:RemoveTerrain(key,true);
	elseif Types==-2 then
		for localKey, localValue in pairs(QFWDlib.ThingTypes) do
			thing = Map.Things:GetThingAtGrid(key,localValue);
			if MapAreaSet.CheckBox1.selected == false then
				if localKey ~= 2 and localKey~=3 then
					ThingMgr:RemoveThing(thing,true,true);
				end
			else
				if localKey ~= 2 then
					ThingMgr:RemoveThing(thing,true,true);
				end
			end
		end
	end
end
function MapAreaSet:TCAddPlant(name)
	local localKey=nil;
	local localValue=nil;
	local num=1;
	local key = 0;
	local theThing=nil;
	for localKey, localValue in pairs(MapAreaSet.Keys) do
		key = MapAreaSet.Keys[num];
		theThing = ThingMgr:AddPlantThing(key,name,World.map);
		theThing:Draw();
		num = num + 1;
	end
end
function MapAreaSet:TCAddBuilds(name)
	local localKey=nil;
	local localValue=nil;
	local num=1;
	local key = 0;
	local theThing=nil;
	if CS.GameMain.Instance.QuickBuild then
		for localKey, localValue in pairs(MapAreaSet.Keys) do
			key = MapAreaSet.Keys[num];
			local thing = Map.Things:GetThingAtGrid(key,CS.XiaWorld.g_emThingType.Building);
			if thing == nil and MapAreaSet.ChooseThing~=nil then
				theThing=ThingMgr:AddBuildingThing(key,name,World.map,MapAreaSet.ChooseThing,QFWDlib.ThingDirs[3],CS.XiaWorld.Fight.g_emFightCamp.Player);
				--theThing:Build(1, 2, 1);
				theThing:Draw();
			end
			num = num + 1;
		end
	else
		CS.GameMain.Instance.QuickBuild=true;
		for localKey, localValue in pairs(MapAreaSet.Keys) do
			key = MapAreaSet.Keys[num];
			local thing = Map.Things:GetThingAtGrid(key,CS.XiaWorld.g_emThingType.Building);
			if thing == nil and MapAreaSet.ChooseThing~=nil then
				theThing=ThingMgr:AddBuildingThing(key,name,World.map,MapAreaSet.ChooseThing,QFWDlib.ThingDirs[3],CS.XiaWorld.Fight.g_emFightCamp.Player);
				--theThing:Build(1, 2, 1);
				theThing:Draw();
			end
			num = num + 1;
		end
		CS.GameMain.Instance.QuickBuild=false;
	end
end
function MapAreaSet:TCAddTerrains(name)
	local localKey=nil;
	local localValue=nil;
	local num=1;
	local key = 0;
	local theThing=nil;
	for localKey, localValue in pairs(MapAreaSet.Keys) do
		key = MapAreaSet.Keys[num];
		if self.CheckBox2.selected == false then
			Map.Terrain:FullTerrain(key, name);
		else
			Map.Terrain:FullTerrain(key, name,false);
		end
		num = num + 1;
	end
end
function MapAreaSet:InMapAreaSet()
	MapAreaSet:SearchAllArea();
	MapAreaSet.ChooseNum=1;
	MapAreaSet:GetAllKeyInArea();
	--MapAreaSet:MakeAKeyList();
	--MapAreaSet:ListAllThingInAreaNeedTable();
	--MapAreaSet:ListAllThingInAreaNoNeed();
	
	local list = QFWDlib.AllThingItems;
	if list==nil then
		print(QFLanguage.GetText(">MODName")..":Loading ThingNames False!")
		return;
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
		--print(localKey,localValue);
		--print(localValue);
	end
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
		--print(localKey,localValue);
		--print(localValue);
	end

	list = QFWDlib.AllThingPlants;
	if list==nil then
		print(QFLanguage.GetText(">MODName")..":Loading AllThingPlants False!")
		return;
	end
	_,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(3);
	num=1;
	localKey=nil;
	localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		local thingDef = localValue;
		if thingDef ~= nil and thingDef.Name~=nil then
			QFWDlib.AllThingPlantsTrue[num] = thingDef.Name;
			if thingDef.ThingName ~= nil then
				QFWDlib.AllThingPlantsTrueDisplayName[num] = thingDef.ThingName;
				--print(thingDef.ThingName);
			end
			num = num + 1;
		end
		--print(localKey,localValue);
		--print(localValue);
	end
	lll=1;
	add=1;
	for localKey, localValue in pairs(list) do 
		local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Plant, localValue);
		if thingDef ~= nil then
			lll=1;
			add=1;
			for lll=1,#QFWDlib.AllThingPlantsTrue do
				if QFWDlib.AllThingPlantsTrue[lll]==localValue then
					add=0;
					break;
				end
			end
			if add==1 then
				QFWDlib.AllThingPlantsTrue[num] = localValue;
				if thingDef.ThingName ~= nil then
					QFWDlib.AllThingPlantsTrueDisplayName[num] = thingDef.ThingName;
				end
				num = num + 1;
			end
		end
	end
	
	
	
	-- for localKey, localValue in pairs(list) do 
		-- thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Plant, localValue);
		-- if thingDef ~= nil then
			-- QFWDlib.AllThingPlantsTrue[num] = localValue;
			-- if thingDef.ThingName ~= nil then
				-- QFWDlib.AllThingPlantsTrueDisplayName[num] = thingDef.ThingName;
				-- --print(thingDef.ThingName)
			-- end
			-- num = num + 1;
		-- end
	-- end
	
	list = QFWDlib.AllThingBuilds;
	if list==nil then
		print(QFLanguage.GetText(">MODName")..":Loading AllThingBuilds False!")
		return;
	end
	-- num=1;
	-- for localKey, localValue in pairs(list) do 
		-- thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, localValue);
		-- if thingDef ~= nil then
			-- QFWDlib.AllThingBuildsTrue[num] = localValue;
			-- if thingDef.ThingName ~= nil then
				-- QFWDlib.AllThingBuildsTrueDisplayName[num] = thingDef.ThingName;
			-- end
			-- num = num + 1;
		-- end
	-- end
	
	_,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(4);
	num=1;
	localKey=nil;
	localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		local thingDef = localValue;
		if thingDef ~= nil and thingDef.Name~=nil then
			QFWDlib.AllThingBuildsTrue[num] = thingDef.Name;
			if thingDef.ThingName ~= nil then
				QFWDlib.AllThingBuildsTrueDisplayName[num] = thingDef.ThingName;
				--print(thingDef.ThingName);
			end
			num = num + 1;
		end
		--print(localKey,localValue);
		--print(localValue);
	end
	lll=1;
	add=1;
	for localKey, localValue in pairs(list) do 
		local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, localValue);
		if thingDef ~= nil then
			lll=1;
			add=1;
			for lll=1,#QFWDlib.AllThingBuildsTrue do
				if QFWDlib.AllThingBuildsTrue[lll]==localValue then
					add=0;
					break;
				end
			end
			if add==1 then
				QFWDlib.AllThingBuildsTrue[num] = localValue;
				if thingDef.ThingName ~= nil then
					QFWDlib.AllThingBuildsTrueDisplayName[num] = thingDef.ThingName;
				end
				num = num + 1;
			end
		end
	end
	
	-- list = QFWDlib.AllTerrains;
	-- if list==nil then
		-- print("MOD版修改器:Loading AllTerrains False!")
		-- return;
	-- end
	-- num=1;
	-- for localKey, localValue in pairs(list) do 
		-- thingDef = CS.XiaWorld.TerrainMgr.Instance:GetTerraniDef(localValue);
		-- if thingDef ~= nil then
			-- QFWDlib.AllThingTerrainsTrue[num] = localValue;
			-- if thingDef.DisplayName ~= nil then
				-- QFWDlib.AllThingTerrainsTrueDisplayName[num] = thingDef.DisplayName;
			-- end
			-- num = num + 1;
		-- end
	-- end
	list = CS.XiaWorld.TerrainMgr.m_mapTerrainDefs;
	if list==nil then
		print(QFLanguage.GetText(">MODName")..":Loading AllTerrains False!")
		return;
	end
	num=1;
	for localKey, localValue in pairs(list) do 
		if localValue ~= nil then
			QFWDlib.AllThingTerrainsTrue[num] = localValue.Name;
			if localValue.DisplayName ~= nil then
				QFWDlib.AllThingTerrainsTrueDisplayName[num] = localValue.DisplayName;
			end
			num = num + 1;
		end
	end
	print(QFLanguage.GetText(">MODName")..":Loading ThingNames True!")
	
	MapAreaSet.RTypes=2;
	MapAreaSet:ShowAllThingPlantsName(MapAreaSet.MapAreaThingListCOP);
	
	--MapAreaSet:ShowAllThingPlantsName(MapAreaSet.MapAreaThingListCOP);
end
function MapAreaSet:ShowAllThingPlantsName(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">MapAreaSet_bntAllPlants");
	local thingDef = nil;
	for k, v in pairs(QFWDlib.AllThingPlantsTrue) do 
		thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Plant, v);
		local plantDef = thingDef.Plant;
		local icon = "";
		if thingDef~=nil then
			icon=thingDef.TexPath;
		else
			if plantDef~=nil then
				icon = plantDef.RipedTexPath;
				if icon==nil or icon=="" then
					icon = plantDef.LeaflessTexPath;
					if icon==nil or icon=="" then
						icon = plantDef.HarvestedTexPath;
					end
				end
			end
		end
		if icon==nil or icon=="" then
			if plantDef~=nil then
				icon = plantDef.RipedTexPath;
				if icon==nil or icon=="" then
					icon = plantDef.LeaflessTexPath;
					if icon==nil or icon=="" then
						icon = plantDef.HarvestedTexPath;
					end
				end
			end
		end
		if QFWDlib.AllThingPlantsTrueDisplayName[k]~=nil then
			MapAreaSet:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(QFWDlib.AllThingPlantsTrueDisplayName[k]),icon);
		else
			MapAreaSet:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(QFWDlib.AllThingPlantsTrue[k]),icon);
		end
	end
end

function MapAreaSet:ShowAllThingBuildsName(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">MapAreaSet_bntAllBuildings");
	local thingDef = nil;
	for k, v in pairs(QFWDlib.AllThingBuildsTrue) do 
		thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, v);
		local buildsDef = thingDef.Building;
		local icon = "";
		if thingDef~=nil then
			icon=thingDef.TexPath;
		else
			if buildsDef~=nil then
				icon = buildsDef.WoodTexPath;
			end
		end
		if icon==nil or icon=="" then
			if buildsDef~=nil then
				icon = buildsDef.WoodTexPath;
			end
		end
		if QFWDlib.AllThingBuildsTrueDisplayName[k]~=nil then
			MapAreaSet:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(QFWDlib.AllThingBuildsTrueDisplayName[k]),icon);
		else
			MapAreaSet:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(QFWDlib.AllThingBuildsTrue[k]),icon);
		end
	end
end
function MapAreaSet:ShowAllThingTerrainsName(obj)
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = QFLanguage.GetText(">MapAreaSet_bntAllTerrains");
	local thingDef = nil;
	for k, v in pairs(QFWDlib.AllThingTerrainsTrue) do 
		thingDef = CS.XiaWorld.TerrainMgr.Instance:GetTerraniDef(v);
		
		if QFWDlib.AllThingTerrainsTrueDisplayName[k]~=nil then
			MapAreaSet:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(QFWDlib.AllThingTerrainsTrueDisplayName[k]),icon);
		else
			MapAreaSet:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(QFWDlib.AllThingTerrainsTrue[k]),icon);
		end
	end
end
function MapAreaSet:SetChooseNum()
	local num = tonumber(MapAreaSet.inputid1.m_title.text);
	if num == nil or num == 0 or num>#MapAreaSet.AreaListTrue then
		return false;
	end
	MapAreaSet.ChooseNum = num;
	return true;
end
function MapAreaSet:SearchAllArea()
	local AreaList = AreaMgr.m_lisAreas;
	local num = 1;
	MapAreaSet.AreaListTrue = {};
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(AreaList) do
		if localValue.ID ~= nil then
			MapAreaSet.AreaListTrue[num] = localValue;
			num = num + 1;
			--print(tostring(localValue.Name))
		end
	end
	MapAreaSet:UpdateAllAreaList();
end
function MapAreaSet:UpdateAllAreaList()
	local num = 1;
	local info = nil;
	local localKey=nil;
	local localValue=nil;
	MapAreaSet.MapAreaSetListDisplayName={};
	MapAreaSet.MapAreaSetListCOP.m_list:RemoveChildrenToPool();
	MapAreaSet.LTypes=0;
	MapAreaSet.MapAreaSetListCOP.m_title.text = QFLanguage.GetText(">MapAreaSet_Tips27");
	for localKey, localValue in pairs(MapAreaSet.AreaListTrue) do
		if localValue.Name~=nil then
			info=tostring(localValue.ID).."-"..tostring(localValue.Name);
			if localValue.def ~= nil then
				if localValue.def.Name~=nil then
					info = info.."-"..tostring(localValue.def.Name);
				end
			end
			info = tostring(num)..": "..info;
			
		else
			info=tostring(localValue.ID);
			if localValue.def ~= nil then
				if localValue.def.AreaType~=nil then
					info = info.."-"..tostring(localValue.def.AreaType);
				end
			end
			info = tostring(num)..": "..info;
		end
		MapAreaSet.MapAreaSetListDisplayName[num]=info;
		MapAreaSet:AddChildToList(MapAreaSet.MapAreaSetListCOP,tostring(num),info);
		num = num + 1;
	end
end
function MapAreaSet:SearchDisplayName(name)
	local findList={};
	if MapAreaSet.LTypes==0 or MapAreaSet.LTypes==nil then
		findList=MapAreaSet.MapAreaSetListDisplayName;
	else
		findList=QFWDlib.AllThingItemsTrueDisplayName;
	end
	if findList=={} or findList==nil then
		return false;
	end
	local findNum=nil;
	MapAreaSet.findArrey={};
	local num=1;
	local localKey=nil;
	local localValue=nil;
	if MapAreaSet.LTypes==0 or MapAreaSet.LTypes==nil then
		for localKey, localValue in pairs(findList) do 
			findNum,_=string.find(localValue, name);
			if findNum ~= nil and findNum ~= 0 then
				MapAreaSet.findArrey[num]=localKey;
				num=num+1;
			end
		end
		if MapAreaSet.findArrey=={} then
			return false;
		end
		local obj=MapAreaSet.MapAreaSetListCOP;
		obj.m_list:RemoveChildrenToPool();
		obj.m_title.text = QFLanguage.GetText(">AddManager_Tips33");
		for localKey, localValue in pairs(MapAreaSet.findArrey) do 
			MapAreaSet:AddChildToList(obj,tostring(localValue),MapAreaSet.MapAreaSetListDisplayName[localValue]);
		end
	else
		for localKey, localValue in pairs(findList) do 
			findNum,_=string.find(localValue, name);
			if findNum ~= nil and findNum ~= 0 then
				MapAreaSet.findArrey[num]=localKey;
				num=num+1;
			end
		end
		if MapAreaSet.findArrey=={} then
			return false;
		end
		local obj=MapAreaSet.MapAreaSetListCOP;
		obj.m_list:RemoveChildrenToPool();
		obj.m_title.text = QFLanguage.GetText(">AddManager_Tips33");
		for localKey, localValue in pairs(MapAreaSet.findArrey) do 
			local icon = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, QFWDlib.AllThingItemsTrue[localValue]).TexPath;
			if QFWDlib.AllThingItemsTrueDisplayName[localValue]~=nil then
				MapAreaSet:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..tostring(QFWDlib.AllThingItemsTrueDisplayName[localValue]),icon);
			else
				MapAreaSet:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..tostring(QFWDlib.AllThingItemsTrue[localValue]),icon);
			end
			
		end
	end
	return true;
end


function MapAreaSet:MakeAKeyList()
	local MapThingList = ThingMgr.m_mapThingbyID;
	if MapThingList==nil or MapThingList=={} then
		return false;
	end
	local num=1;
	local xxx=1;
	local haveFind=0;
	local tableNum = 0;
	local localKey=nil;
	local localValue=nil;
	MapAreaSet.ThingsKeyThings={};
	MapAreaSet.ThingsKey={};
	for localKey, localValue in pairs(MapThingList) do
		haveFind=0;
		for xxx=1,#MapAreaSet.ThingsKey do
			if localValue.Key == MapAreaSet.ThingsKey[xxx] then
				haveFind = xxx;
				break;
			end
		end
		if haveFind~=0 then
			tableNum = #MapAreaSet.ThingsKeyThings[haveFind];
			MapAreaSet.ThingsKeyThings[haveFind][tableNum+1] = localValue;
		else
			MapAreaSet.ThingsKeyThings[num]={};
			MapAreaSet.ThingsKey[num] = localValue.Key;
			MapAreaSet.ThingsKeyThings[num][1] = localValue;
			num = num+1;
		end
	end
end
function MapAreaSet:ListAllThingInAreaNeedTable()
	local xxx = 1;
	local yyy = 1;
	local findNum = 0;
	local num = 1;
	local ThingName=" ";
	local localKey=nil;
	local localValue=nil;
	MapAreaSet.MapAreaThingListCOP.m_list:RemoveChildrenToPool();
	MapAreaSet.MapAreaThingListCOP.m_title.text = QFLanguage.GetText(">MapAreaSet_Tips28");
	
	for localKey, localValue in pairs(MapAreaSet.Keys) do
		findNum = 0;
		for xxx = 1,#MapAreaSet.ThingsKey do
			if localValue == MapAreaSet.ThingsKey[xxx] then
				for yyy = 1,#MapAreaSet.ThingsKeyThings[xxx] do
					MapAreaSet.ThingInArea[num]= MapAreaSet.ThingsKeyThings[xxx][yyy];
					ThingName = MapAreaSet.ThingsKeyThings[xxx][yyy]:GetName();
					if ThingName==nil then
						info = tostring(num)..": "..tostring(MapAreaSet.ThingsKeyThings[xxx][yyy].ID);
					else
						info = tostring(num)..": "..tostring(ThingName);
					end
					MapAreaSet:AddChildToList(MapAreaSet.MapAreaThingListCOP,tostring(num),info);
					num = num + 1;
				end
				break;
			end
		end
	end
end
function MapAreaSet:ListAllThingInAreaNoNeed()
	local MapThingList = ThingMgr.m_mapThingbyID;
	if MapThingList==nil or MapThingList=={} then
		return false;
	end
	local num=1;
	local xxx=1;
	local info=" ";
	local ThingName=" ";
	local localKey=nil;
	local localValue=nil;
	MapAreaSet.ThingInArea={};
	MapAreaSet.MapAreaThingListCOP.m_list:RemoveChildrenToPool();
	MapAreaSet.MapAreaThingListCOP.m_title.text = QFLanguage.GetText(">MapAreaSet_Tips28");
	for localKey, localValue in pairs(MapThingList) do
		for xxx=1,#MapAreaSet.Keys do
			if MapAreaSet.Keys[xxx] == localValue.Key then
				MapAreaSet.ThingInArea[num] = localValue;
				if num <=1200 then
					ThingName = localValue:GetName();
					if ThingName==nil then
						info = tostring(num)..": "..tostring(localValue.ID);
					else
						info = tostring(num)..": "..tostring(ThingName);
					end
					MapAreaSet:AddChildToList(MapAreaSet.MapAreaThingListCOP,tostring(num),info);
				end
				num = num + 1;
				break;
			end
		end
	end
end



function MapAreaSet:ShowChooseArea(numID)
	MapAreaSet.AreaListTrue[numID]:Show(true, true);
	if MapAreaSet.Keys[1] ==nil then
		CS.MapCamera.Instance:LookKey(1);
	else
		CS.MapCamera.Instance:LookKey(MapAreaSet.Keys[1]);
	end
end
function MapAreaSet:HideChooseArea(numID)
	MapAreaSet.AreaListTrue[numID]:Show(false, true);
end


function MapAreaSet:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*3.5, 30, false);
	obj.m_title.text = value;
	if icon ~= nil then
		obj.m_icon.icon = icon;
	else
		obj.m_icon.icon = "";
	end

	--obj.onClick:Add(MapAreaSet.ListChildOnClick);
	return obj;
end
function MapAreaSet:RemoveChildrenToList(tobj)
	--print("MOD版修改器:移除")
	tobj.m_list:RemoveChildrenToPool();
end
function MapAreaSet:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(MapAreaSet.ListChildOnClick);
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
function MapAreaSet:AddCOP2(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(MapAreaSet.ListChildOnClick2);
	obj.m_title.text =  QFLanguage.GetText(">AddManager_Tips35");
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
function MapAreaSet.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	MapAreaSet.TheClickBnt = tonumber(Eventss.data.name);
	print(MapAreaSet.TheClickBnt)
	if MapAreaSet.LTypes==0 or MapAreaSet.LTypes==nil then
		MapAreaSet:SetSetting();
	else
		MapAreaSet:SetSetting(1);
	end
end
function MapAreaSet:SetSetting(types)
	local obj=nil;
	if types==nil then
		--print("MOD版修改器:click")
		obj=MapAreaSet.inputid1;
		obj.m_title.text=tostring(MapAreaSet.TheClickBnt);
		if MapAreaSet:SetChooseNum() then
			MapAreaSet:GetAllKeyInArea();
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips21");
			local info=nil;
			if MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum].Name~=nil then
				info = QFLanguage.GetText(">MapAreaSet_Tips2")..": "..tostring(MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum].ID).."-"..tostring(MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum].Name);
			else
				info = QFLanguage.GetText(">MapAreaSet_Tips2")..": "..tostring(MapAreaSet.AreaListTrue[MapAreaSet.ChooseNum].ID);
			end
			MapAreaSet.ShowLableArea.text = info;
		else
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips22");
		end
	else
		MapAreaSet.ChooseThing=QFWDlib.AllThingItemsTrue[tonumber(MapAreaSet.TheClickBnt)];
		--print(tostring(MapAreaSet.ChooseThing))
		local def = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, MapAreaSet.ChooseThing);
		if def==nil and (def.ThingName~=nil or def.Name~=nil) then
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips29");
		end
		if def.ThingName~=nil then
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips30")..": "..tostring(def.ThingName);
		else
			MapAreaSet.ShowLable.text = QFLanguage.GetText(">MapAreaSet_Tips30")..": "..tostring(def.Name);
		end
	end
	
end
function MapAreaSet.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	MapAreaSet.TheClickBnt = tonumber(Eventss.data.name);
	MapAreaSet:SetSetting2();
	
end
function MapAreaSet:SetSetting2()
	local obj=nil;
	local types=MapAreaSet.RTypes;
	if types==nil or types==0 then
		return;
	elseif types==1 then
		obj=MapAreaSet.inputAdd2;
	elseif types==2 then
		obj=MapAreaSet.inputAdd1;
	elseif types==3 then
		obj=MapAreaSet.inputAdd3;
	
	end
	obj.m_title.text=tostring(MapAreaSet.TheClickBnt);
	--MapAreaSet:ChooseThingNumAndGetAttribute(MapAreaSet.TheClickBnt);
end

function MapAreaSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function MapAreaSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end


