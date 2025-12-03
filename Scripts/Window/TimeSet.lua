local TimeSet = CS.Wnd_Simple.CreateWindow("TimeSet");
ModifierMain:AddWindow("TimeSet",TimeSet);
function TimeSet:OnInit()
	-- QFWDModifierMainUI:Hide();
			-- print("MOD版修改器:快捷键启动隐藏成功！");
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">TimeSet_Title"));
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">TimeSet_ShowLable"),self.sx/10*1,self.sy/10,self.sx/10*8,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);
	-- QFWDModifierMainUI:AddLable2(self,"lable1","季节修改",self.sy/10*4,self.sy/10,200,35);
	-- QFWDModifierMainUI:AddButton2(self,"bntSetSeasonal1","春季",self.sx/10,self.sy/10*2);
	-- QFWDModifierMainUI:AddButton2(self,"bntSetSeasonal2","夏季",self.sx/10*3,self.sy/10*2);
	-- QFWDModifierMainUI:AddButton2(self,"bntSetSeasonal3","秋季",self.sx/10*5,self.sy/10*2);
	-- QFWDModifierMainUI:AddButton2(self,"bntSetSeasonal4","冬季",self.sx/10*7,self.sy/10*2);
	
	
	QFWDModifierMainUI:AddLable2(self,"lable2",QFLanguage.GetText(">TimeSet_Title"),self.sx/10*4,self.sy/10*1.5,self.sx/10*2,35);
	
	QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">TimeSet_lable3"),self.sx/10,self.sy/10*2,self.sx/10*2,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*2);
	self.input1:SetSize(self.sx/10*1, 25, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 5;
	QFWDModifierMainUI:AddButton2(self,"bntSetDay",QFLanguage.GetText(">TimeSet_bntSetDay"),self.sx/10*3,self.sy/10*2):SetSize(self.sx/10*1, 25, false);
	
	QFWDModifierMainUI:AddLable2(self,"lable4",QFLanguage.GetText(">TimeSet_lable4"),self.sx/10*5.5,self.sy/10*2,self.sx/10*2,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","1",self.sx/10*6.5,self.sy/10*2);
	self.input2:SetSize(self.sx/10*1, 25, false);
	self.input2.m_title.restrict = "[0-9]";
	self.input2.m_title.maxLength = 2;
	QFWDModifierMainUI:AddButton2(self,"bntSetHour",QFLanguage.GetText(">TimeSet_bntSetDay"),self.sx/10*7.5,self.sy/10*2):SetSize(self.sx/10*1, 25, false);
	local sy=3;
	QFWDModifierMainUI:AddLable2(self,"lable7",QFLanguage.GetText(">TimeSet_lable7"),self.sx/10*1,self.sy/10*sy,self.sx/10*2,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable8",QFLanguage.GetText(">TimeSet_lable3"),self.sx/10*1,self.sy/10*sy,self.sx/10*1,35);
	self.input4 = QFWDModifierMainUI:AddInput2(self,"input4","1",self.sx/10*2,self.sy/10*sy);
	self.input4:SetSize(self.sx/10*1.5, 25, false);
	self.input4.m_title.restrict = "[0-9]";
	self.input4.m_title.maxLength = 2;
	QFWDModifierMainUI:AddButton2(self,"bntSetSeason1",QFLanguage.GetText(">TimeSet_bntSetSeason1"),self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSetSeason2",QFLanguage.GetText(">TimeSet_bntSetSeason2"),self.sx/10*5.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSetSeason3",QFLanguage.GetText(">TimeSet_bntSetSeason3"),self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSetSeason4",QFLanguage.GetText(">TimeSet_bntSetSeason4"),self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false);
	
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable5",QFLanguage.GetText(">TimeSet_lable5"),self.sx/10*1,self.sy/10*sy,self.sx/10*2,35);
	-- QFWDModifierMainUI:AddLable2(self,"lable3","速度倍数:",self.sx/10,self.sy/10*3.5,200,35);
	-- self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*2,self.sy/10*3.5);
	-- self.input3:SetSize(30, 25, false);
	-- self.input3.m_title.restrict = "[0-9]";
	-- self.input3.m_title.maxLength = 2;
	-- QFWDModifierMainUI:AddLable2(self,"lable3","变速尺长:",self.sx/10*4,self.sy/10*3.5,200,35);
	-- self.input4 = QFWDModifierMainUI:AddInput2(self,"input4","5",self.sx/10*5,self.sy/10*3.5);
	-- self.input4:SetSize(30, 25, false);
	-- self.input4.m_title.restrict = "[0-9]";
	-- self.input4.m_title.maxLength = 2;
	-- QFWDModifierMainUI:AddButton2(self,"bntSetSpeed","修改",self.sx/10*7,self.sy/10*3.5):SetSize(self.sx/10*1.2, 25, false);
	self.TimeSpeed = QFWDModifierMainUI:AddLable2(self,"lable6",QFLanguage.GetText(">TimeSet_lable6"),self.sx/10*2,self.sy/10*sy,self.sx/10*3,35);
	self.flag=0;
	--self.speed = 5;
	self.needSetTimescale = 0;
	-- QFWDModifierMainUI:AddLable2(self,"lable4","按钮位置:",self.sx/10,self.sy/10*4,200,35);
		-- QFWDModifierMainUI:AddLable2(self,"lable5","X:",self.sx/10,self.sy/10*4,200,35);
		-- QFWDModifierMainUI:AddLable2(self,"lable6","Y:",self.sx/10,self.sy/10*4,200,35);
	
	-- self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*1.5,self.sy/10*3);
	-- self.input3:SetSize(40, 25, false);
	-- self.input3.m_title.restrict = "[0-9]";
	-- self.input3.m_title.maxLength = 2;
	-- QFWDModifierMainUI:AddButton2(self,"bntSetSpeedShow","显示",self.sx/10*3,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false)
	
	
	-- QFWDModifierMainUI:AddLable2(self,"WorldFlagSetLable","WorldFlag:",self.sx/10,self.sy/10*2,200,35);
	-- self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*2);
	-- self.input1:SetSize(100, 30, false);
	-- self.input1.m_title.restrict = "[0-9]";
	-- self.input1.m_title.maxLength = 6;
	-- QFWDModifierMainUI:AddButton2(self,"bntWorldFlagSet","修改",self.sx/10*4,self.sy/10*2.5);
	-- QFWDModifierMainUI:AddLable2(self,"WorldFlagSetLable","Value:",self.sx/10,self.sy/10*2.5,200,35);
	-- self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","0",self.sx/10*2,self.sy/10*2.5);
	-- self.input2:SetSize(100, 30, false);
	-- self.input2.m_title.restrict = "[0-9]";
	-- self.input2.m_title.maxLength = 6;
	
	-- QFWDModifierMainUI:AddLable2(self,"RandomSeedSet","随机种子修改:",self.sx/10,self.sy/10*3,200,35);
	-- self.showWorldFlagLable = QFWDModifierMainUI:AddLable2(self,"RandomSeedSetShow","请输入随机种子值后点击修改按钮",self.sy/10*3,self.sy/10*3,300,35);
	-- QFWDModifierMainUI:AddButton2(self,"bntRandomSeedSet","修改",self.sx/10*4,self.sy/10*3.5);
	-- QFWDModifierMainUI:AddLable2(self,"RandomSeedSetLable","RandomSeed:",self.sx/10,self.sy/10*3.5,200,35);
	-- self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*2,self.sy/10*3.5);
	-- self.input3:SetSize(100, 30, false);
	-- self.input3.m_title.restrict = "[0-9]";
	-- self.input3.m_title.maxLength = 9;
	

	-- QFWDModifierMainUI:AddButton2(self,"bntSetAll","全部修改",280,75);
	-- QFWDModifierMainUI:AddButton2(self,"bntUpdateAll","刷新数据",560,75);
	-- QFWDModifierMainUI:AddLable2(self,"text3","全部符咒",310,120,200,25);
	self.window:Center();
end

function TimeSet:OnShowUpdate()
	
end

function TimeSet:OnShown()
	TimeSet.isShowing = true
end

function TimeSet:OnUpdate()
	local timeScale = CS.UnityEngine.Time.timeScale;
	-- if CS.UnityEngine.Input.GetKeyDown(CS.UnityEngine.KeyCode.Q) then
		-- TimeSet.needSetTimescale = 0;
		-- TimeSet.speed = 0;
		-- TimeSet.flag = 0;
		-- return;
	-- end
	-- if CS.UnityEngine.Input.GetKeyDown(CS.UnityEngine.KeyCode.E) then
		-- print("MOD版修改器:ture")
		-- if TimeSet.input4.m_title.text == nil then
			-- TimeSet.input4.m_title.text = "2";
		-- end
		-- if timeScale == 5 then
			-- if TimeSet.flag == 0 then
				-- TimeSet.flag=1;
				-- TimeSet.speed=5;
			-- else
				-- TimeSet:UpSpeed(tonumber(TimeSet.input4.m_title.text));
				-- print(TimeSet.speed)
				-- TimeSet.flag=1;
			-- end
		-- elseif timeScale > 5 then
				-- TimeSet:UpSpeed(tonumber(TimeSet.input4.m_title.text));
				
				-- print(TimeSet.speed)
				-- TimeSet.flag=1;
		-- end
		
	-- end
	-- if TimeSet.needSetTimescale == 1 then
		-- if timeScale == TimeSet.speed then
			-- TimeSet.needSetTimescale = 1;
		-- else
			-- TimeSet:SetSpeed(TimeSet.speed);
		-- end
	-- end
	if TimeSet.isShowing then
			TimeSet.TimeSpeed.text = QFLanguage.GetText(">TimeSet_Tips1")..tostring(timeScale);
	end
end
-- function TimeSet:SetSpeed(a)
	-- CS.UnityEngine.Time.timeScale = a;
-- end
-- function TimeSet:UpSpeed(a)
	-- TimeSet.needSetTimescale = 1;
	-- if TimeSet.speed + tonumber(TimeSet.input4.m_title.text) >=60 then
		-- TimeSet:SetSpeed(60);
		-- TimeSet.speed=60;
		-- TimeSet.ShowLable.text ="速度已到60！";
	-- else
		-- CS.UnityEngine.Time.timeScale = CS.UnityEngine.Time.timeScale + a;
		-- TimeSet.speed = TimeSet.speed + tonumber(TimeSet.input4.m_title.text);
		-- TimeSet.ShowLable.text ="正在增加速度到:"..tostring(TimeSet.speed).."！";
	-- end
	

-- end
-- function TimeSet:DownSpeed(a)
	-- if CS.UnityEngine.Time.timeScale - a<=5 then
		-- TimeSet:SetSpeed(5);
		-- --TimeSet.ShowLable.text ="速度不超过5！";
		-- return;
	-- end
	-- --TimeSet.ShowLable.text ="正在减少速度！";
	-- CS.UnityEngine.Time.timeScale = CS.UnityEngine.Time.timeScale - a;
-- end


function TimeSet:OnHide()
	TimeSet.isShowing = false;
	ModifierMain.showWindow=0;
end

function TimeSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntSetDay" then
			TimeSet:ChangeDay(tonumber(self.input1.m_title.text)-1);
			TimeSet.ShowLable.text = QFLanguage.GetText(">TimeSet_Tips2")..self.input1.m_title.text;
			return;
		end
		if obj.name == "bntSetHour" then
			if tonumber(self.input2.m_title.text)>24 then
				self.input2.m_title.text = "24";
			end
			TimeSet:ChangeTime(tonumber(self.input2.m_title.text));
			TimeSet.ShowLable.text = QFLanguage.GetText(">TimeSet_Tips3")..self.input2.m_title.text..":00";
			return;
		end
		if obj.name == "bntSetSeason1" then
			local num=tonumber(self.input4.m_title.text)-1;
			if num==nil then
				num=0;
			else
				num = num%(World.Weather.YearLength/4);
			end
			num = math.floor(num);
			TimeSet:ChangeSeason(1,num);
			TimeSet.ShowLable.text = QFLanguage.GetText(">TimeSet_Tips4")..tostring(num);
			return;
		end
		if obj.name == "bntSetSeason2" then
			local num=tonumber(self.input4.m_title.text)-1;
			if num==nil then
				num=0;
			else
				num = num%(World.Weather.YearLength/4);
			end
			num = math.floor(num);
			TimeSet:ChangeSeason(2,num);
			TimeSet.ShowLable.text = QFLanguage.GetText(">TimeSet_Tips5")..tostring(num);
			return;
		end
		if obj.name == "bntSetSeason3" then
			local num=tonumber(self.input4.m_title.text)-1;
			if num==nil then
				num=0;
			else
				num = num%(World.Weather.YearLength/4);
			end
			num = math.floor(num);
			TimeSet:ChangeSeason(3,num);
			TimeSet.ShowLable.text = QFLanguage.GetText(">TimeSet_Tips6")..tostring(num);
			return;
		end
		if obj.name == "bntSetSeason4" then
			local num=tonumber(self.input4.m_title.text)-1;
			if num==nil then
				num=0;
			else
				num = num%(World.Weather.YearLength/4);
			end
			num = math.floor(num);
			TimeSet:ChangeSeason(4,num);
			TimeSet.ShowLable.text = QFLanguage.GetText(">TimeSet_Tips7")..tostring(num);
			return;
		end
		-- if obj.name == "bntSetSpeed" then
			-- --TimeSet:SetSpeed(tonumber(self.input3.m_title.text));
			-- local num=tonumber(self.input4.m_title.text);
			-- if num==nil then
				-- self.input4.m_title.text="5";
				-- TimeSet.ShowLable.text = "修改尺长为: 5  成功！";
			-- elseif num==0 then
				-- self.input4.m_title.text="5";
				-- TimeSet.ShowLable.text = "修改尺长为: 5  成功！";
			-- else
				-- TimeSet.ShowLable.text = "修改尺长为: "..self.input4.m_title.text.."  成功！";
			-- end
				-- TimeSet:SetRule(num);
			-- return;
		-- end
	end
end
function TimeSet:SetRule(a)
	TimeSetSpeed.speedLength = a;
end
function TimeSet:ChangeDay(d)
	local hour = World.DayHour;
	local daycount = World.DayCount;
	World:SetDay(d, hour, d);
end
function TimeSet:ChangeTime(h)
	local day = World.YearDayCount;
	local hour = h;
	local daycount = World.DayCount;
	World:SetDay(day, hour, daycount);
end
function TimeSet:ChangeSeason(s,num)--1-4,春到冬
	local tnum=tonumber(num);
	if tnum==nil then
		tnum=0;
	end
	local h=World.DaySecond*24/600;
	World:SetDay(((s-1)/4*World.Weather.YearLength) + tnum,h, -1);
end
function TimeSet:ChangeWeather(name)  
	World.Weather:BeginWeather(name, true, 0, true);
end
function TimeSet:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y);
	obj.text = value;
	obj.name = names;
	obj.tooltips = texts;
	return obj;
end
function TimeSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function TimeSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end