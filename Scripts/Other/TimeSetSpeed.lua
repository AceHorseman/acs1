TimeSetSpeed = GameMain:GetMod("TimeSetSpeed");
----Setting(设置)------
TimeSetSpeed.Icon="res/Sprs/object/object_tianlin01";---可设置为自己喜欢的图标
TimeSetSpeed.speedLength = 5;---倍速按钮的速度间隔
TimeSetSpeed.MaxSpeedUp=true;---急速按钮点亮期间,按E是否自动切换为暂停
TimeSetSpeed.MaxSpeedDown=false;---急速按钮点亮期间,按Q是否自动切换为暂停
-----------------------
function TimeSetSpeed.SpeedInte()
	if TimeSetSpeed.HadInt == true then
		return ;
	end
	local UIInfo = CS.Wnd_GameMain.Instance.UIInfo
	if UIInfo == nil then
		return
	end
	TimeSetSpeed.UIInfo=CS.Wnd_GameMain.Instance.UIInfo;
	TimeSetSpeed.SpeedList = TimeSetSpeed.UIInfo.m_gameplay;
	
	local SpeedList = TimeSetSpeed.SpeedList;
	--print(SpeedList:GetFromPool())
	if SpeedList == nil then
		return
	end
	local pd = TimeSetSpeed.UIInfo.m_ElementShow;
	TimeSetSpeed.HadInt = true
	local ElementBtn = TimeSetSpeed.UIInfo.m_ShowElement;
	TimeSetSpeed.Savex = ElementBtn.x;
	TimeSetSpeed.SaveBtn=ElementBtn;
	if SpeedList.numChildren > 5 then
		print("游戏速度按钮组已经被修改!");
		TimeSetSpeed.SpeedBtn=SpeedList:GetChildAt(4);
		return false;
	end
	TimeSetSpeed.SpeedBarLength=SpeedList.width;
	TimeSetSpeed.SpeedBarIconCount=SpeedList.numChildren;
	--SpeedList.onClickItem:Add(TimeSetSpeed.OnSpeedListMenuClick);
	--SpeedList.width=SpeedList.width-3;
	--ElementBtn.y = SpeedList.y;
	--Spr\Object\object_test.png
	--print(SpeedBtn.m_icon.icon)
	--SpeedBtn.m_icon.icon = "ui://0xrxw6g7iqu5ovob";
	if CS.XiaWorld.GlobleDataMgr~=nil and CS.XiaWorld.GlobleDataMgr.Instance~=nil then
		TimeSetSpeed.GlobleDataMgr=CS.XiaWorld.GlobleDataMgr.Instance;
		TimeSetSpeed.MaxSpeed2=TimeSetSpeed.GlobleDataMgr:GetInt("MaxSpeed", 2);
		TimeSetSpeed.MaxSpeed = TimeSetSpeed.MaxSpeed2 + 3;
		
	else
		return false;
	end
	if CS.XiaWorld.MainManager~=nil and CS.XiaWorld.MainManager.Instance~=nil then
		TimeSetSpeed.MainManager=CS.XiaWorld.MainManager.Instance;
	else
		return false;
	end
	if CS.XiaWorld.Wnd_GameMain~=nil and CS.XiaWorld.Wnd_GameMain.Instance~=nil then
		TimeSetSpeed.Wnd_GameMain=CS.XiaWorld.Wnd_GameMain.Instance;
	else
		return false;
	end
	if TimeSetSpeed.MaxSpeed<0 or TimeSetSpeed.MaxSpeed > 40 then
		return false;
	end
	TimeSetSpeed.SetBtn(true);
	
	
	TimeSetSpeed.speed = 1;
	TimeSetSpeed.CanRun = true;
	return true;
end
function TimeSetSpeed.SetBtn(IsOn)
	
	if IsOn then
		if TimeSetSpeed.HadInt then
			local SpeedList = TimeSetSpeed.SpeedList;
			local ElementBtn = TimeSetSpeed.SaveBtn;
			SpeedList.width=TimeSetSpeed.SpeedBarLength/TimeSetSpeed.SpeedBarIconCount*(TimeSetSpeed.SpeedBarIconCount+1);
			ElementBtn.x = SpeedList.x + (SpeedList.width*0.9);
			local MyPool = SpeedList:GetFromPool(nil);
			TimeSetSpeed.SpeedBtn=SpeedList:AddChildAt(MyPool, 4);
			TimeSetSpeed.SpeedBtn.name = "fast3"
			TimeSetSpeed.SpeedBtn.tooltips = XT(tostring(TimeSetSpeed.MaxSpeed + TimeSetSpeed.speedLength)..QFLanguage.GetText(">TimeSetSpeed_Tips1").."\n"..QFLanguage.GetText(">TimeSetSpeed_Tips2").."\n"..QFLanguage.GetText(">TimeSetSpeed_Tips3"));
			SpeedList.onClickItem:Add(TimeSetSpeed.OnSpeedListMenuClick);
				TimeSetSpeed.SpeedBtn.m_icon.icon = TimeSetSpeed.Icon;
			TimeSetSpeed.SpeedBtn.m_icon.fill=CS.FairyGUI.FillType.Scale;
			GameMain:GetMod("_Event"):RegisterEvent(g_emEvent.GameSpeedChange, TimeSetSpeed.OnGameSpeedChange, "TimeSetSpeed");
		else
			if TimeSetSpeed.SpeedInte~=nil then
				TimeSetSpeed.SpeedInte();
			end
		end
		TimeSetSpeed.CanRun=true;
	else
		if TimeSetSpeed.SpeedBtn~=nil then
			--print("zheh")
			local SpeedList = TimeSetSpeed.SpeedList;
			local ElementBtn = TimeSetSpeed.SaveBtn;
			SpeedList.width=TimeSetSpeed.SpeedBarLength;
			ElementBtn.x = TimeSetSpeed.Savex;
			SpeedList:RemoveChildToPool(TimeSetSpeed.SpeedBtn);
			GameMain:GetMod("_Event"):UnRegisterEvent(g_emEvent.GameSpeedChange, "TimeSetSpeed");
			SpeedList.onClickItem:Remove(TimeSetSpeed.OnSpeedListMenuClick);
		end
		TimeSetSpeed.CanRun=false;
	end
	
end
function TimeSetSpeed:OnGameSpeedChange(_, ParamArray)
	if TimeSetSpeed.TopBtnClick==true then
		return;
	end
	local fGameSpeed = ParamArray[0];
	local maxSpeed = TimeSetSpeed.MaxSpeed;
	if fGameSpeed >= (TimeSetSpeed.MaxSpeed + TimeSetSpeed.speedLength) then
		TimeSetSpeed.UIInfo.m_gameplay.selectedIndex = 4;
		TimeSetSpeed.SpeedBtn.tooltips = XT(tostring(math.modf(fGameSpeed))..QFLanguage.GetText(">TimeSetSpeed_Tips1").."\n"..QFLanguage.GetText(">TimeSetSpeed_Tips2").."\n"..QFLanguage.GetText(">TimeSetSpeed_Tips3"));
	else
		TimeSetSpeed.SpeedBtn.tooltips = XT(tostring(TimeSetSpeed.MaxSpeed + TimeSetSpeed.speedLength)..QFLanguage.GetText(">TimeSetSpeed_Tips1").."\n"..QFLanguage.GetText(">TimeSetSpeed_Tips2").."\n"..QFLanguage.GetText(">TimeSetSpeed_Tips3"));
	end
	--if fGameSpeed == 1 and TimeSetSpeed.speed>10 then
	--	TimeSetSpeed.speed = 1;
	--elseif fGameSpeed == 2 and TimeSetSpeed.speed>10 then
	--	TimeSetSpeed.speed = 2;
	--elseif (fGameSpeed > 2 and fGameSpeed < TimeSetSpeed.MaxSpeed + TimeSetSpeed.speedLength) and TimeSetSpeed.speed>(TimeSetSpeed.MaxSpeed + 5) then
	--	TimeSetSpeed.speed = maxSpeed;
	--end
end
function TimeSetSpeed.OnSpeedListMenuClick(Event)
	if not TimeSetSpeed.CanRun then
		return;
	end
	local PlayBtn = Event.data;
	--TimeSetSpeed.MaxSpeed=TimeSetSpeed.GlobleDataMgr:GetInt("MaxSpeed", 2) + 3;
	TimeSetSpeed.MaxSpeed2=TimeSetSpeed.GlobleDataMgr:GetInt("MaxSpeed", 2);
	TimeSetSpeed.MaxSpeed = TimeSetSpeed.MaxSpeed2 + 3;
		
	local maxSpeed = TimeSetSpeed.MaxSpeed;
	if InputMgr:GetInputKeyDown("SpeedN") then
		if TimeSetSpeed.MaxSpeedUp then
			if TimeSetSpeed.TopBtnClick==true then
				TimeSetSpeed.MainManager:Pause(false);
				TimeSetSpeed.speed=TimeSetSpeed.MaxSpeed + TimeSetSpeed.speedLength;
				TimeSetSpeed.TopBtnClick=false;
				return;
			end
		end
		TimeSetSpeed.TopBtnClick=false;
		if TimeSetSpeed.TheLastClickBtn == "fast2" then
			TimeSetSpeed.TheLastClickBtn = "fast3";
			TimeSetSpeed.speed=TimeSetSpeed.MaxSpeed + TimeSetSpeed.speedLength;
			TimeSetSpeed.MainManager:Play(TimeSetSpeed.speed, false);
			return;
		elseif TimeSetSpeed.TheLastClickBtn == "fast3" or TimeSetSpeed.TheLastClickBtn == "fast4" then
			TimeSetSpeed.TheLastClickBtn = "fast4";
			TimeSetSpeed.speed=TimeSetSpeed.speed + TimeSetSpeed.speedLength;
			if TimeSetSpeed.speed > 60 then
				TimeSetSpeed.speed = 60;
			end
			TimeSetSpeed.MainManager:Play(TimeSetSpeed.speed, false);
			return;
		end
		
	elseif InputMgr:GetInputKeyDown("SpeedP") then
		if TimeSetSpeed.MaxSpeedDown then
			if TimeSetSpeed.TopBtnClick==true then
				TimeSetSpeed.MainManager:Pause(false);
				TimeSetSpeed.speed=TimeSetSpeed.MaxSpeed + TimeSetSpeed.speedLength;
				TimeSetSpeed.TopBtnClick=false;
				return;
			end
		end
		TimeSetSpeed.TopBtnClick=false;
		if TimeSetSpeed.TheLastClickBtn == "fast4" then
			TimeSetSpeed.TheLastClickBtn = "fast3";
			TimeSetSpeed.speed=maxSpeed;
			TimeSetSpeed.MainManager:Play(maxSpeed, false);
			return;
		end
		
	end
	TimeSetSpeed.TheLastClickBtn = PlayBtn.name
	if PlayBtn.name == "fast3" then
		TimeSetSpeed.MainManager:Play(TimeSetSpeed.MaxSpeed + 5, false);
		TimeSetSpeed.speed=TimeSetSpeed.MaxSpeed + 5;
		TimeSetSpeed.TopBtnClick=false;
	elseif PlayBtn.name =="top" then
		TimeSetSpeed.TopBtnClick=true;
		TimeSetSpeed.UIInfo.m_gameplay.selectedIndex = 5;
	else
		TimeSetSpeed.speed=TimeSetSpeed.MainManager.gamespeed;
		TimeSetSpeed.TopBtnClick=false;
	end
	return;
end
function TimeSetSpeed.SetRule(num)
	if num==nil then
		num=5;
	elseif num<1 then
		num=1;
	elseif num>20 then
		num=20;
	end
	TimeSetSpeed.speedLength=num;
end