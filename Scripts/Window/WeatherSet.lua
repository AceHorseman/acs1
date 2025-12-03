local WeatherSet = CS.Wnd_Simple.CreateWindow("WeatherSet");
ModifierMain:AddWindow("WeatherSet",WeatherSet);
function WeatherSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">WeatherSet_Title"));
	self:SetSize(self.sx,self.sy);

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sy/10*6,self.sy/10,300,35);
	
	
	QFWDModifierMainUI:AddLable2(self,"tlable1",QFLanguage.GetText(">WeatherSet_tlable1"),self.sx/10,self.sy/10*1.5,200,35);
	
	QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">WeatherSet_lable1"),self.sx/10,self.sy/10*2,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","ZuShiBiHu",self.sx/10*2,self.sy/10*2.1);
	self.input1:SetSize(240, 20, false);
	self.Truerace = {};
	QFWDModifierMainUI:AddButton2(self,"bntWeatherSet",QFLanguage.GetText(">WeatherSet_bntWeatherSet"),self.sx/10*6,self.sy/10*2.1):SetSize(self.sx/10*1.2, 20, false);
	QFWDModifierMainUI:AddButton2(self,"bntRemoveWeather",QFLanguage.GetText(">WeatherSet_bntRemoveWeather"),self.sx/10*7.5,self.sy/10*2.1):SetSize(self.sx/10*1.2, 20, false);
	self.weatherCOP=self:AddCOP("RaceList",self.sx/10*9.85,self.sy/10*0.7);
	self.window:Center();
	WeatherSet:ShowWeather();
end

function WeatherSet:OnShowUpdate()
	
end

function WeatherSet:OnShown()
	WeatherSet.isShowing = true
end

function WeatherSet:OnUpdate()

end

function WeatherSet:OnHide()
	WeatherSet.isShowing = false;
	ModifierMain.showWindow=0;
end
function WeatherSet:GetKey(x,y)
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
function WeatherSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntWeatherSet" then
			if  tonumber(WeatherSet.input1.m_title.text) ~= nil  then
				WeatherSet.input1.m_title.text = WeatherSet.Truerace[tonumber(WeatherSet.input1.m_title.text)];
			end
			WeatherSet:BeginWeather(WeatherSet.input1.m_title.text);
			WeatherSet.ShowLable.text = QFLanguage.GetText(">WeatherSet_Tips1")..":"..WeatherSet.input1.m_title.text.."成功！";
			return;
		end
		if obj.name == "bntRemoveWeather" then
			if  tonumber(WeatherSet.input1.m_title.text) ~= nil  then
				WeatherSet.input1.m_title.text = WeatherSet.Truerace[tonumber(WeatherSet.input1.m_title.text)];
			end
			World.Weather:ClearAllWeather();
			WeatherSet.ShowLable.text = QFLanguage.GetText(">WeatherSet_Tips2");
			return;
		end
	end
end
function WeatherSet:ShowWeather(obj)
	if obj==nil then
		obj=WeatherSet.weatherCOP
	end
	local race = 
	{
"SunnyDay","Overcast","LightRain","HeavyRain","LightSnow",
"HeavySnow","DenseFog","Melancholy","SpringAir","HarvestAir",
"Ambiguous","Impetuous",--"Hail",
"MouldRains","Drought",
"Rainstorm","Fohn","DustStorm","LingRarefiedWave","LingUpWave",
"LingUpWave_Little","HeatWave","ColdWave","HeatWaveInWinter","ColdWaveInSummer",
"PermanentNight","Miasma","LightningStorm","LightningStormNoLong","FohnNoFeng",
"Rainstorm_Long","LuShu_SunnyDay",
"Fei_HeavyRain","Fei_Overcast","MuYu_LightRain","SpringFestival","ZuShiBiHu",
"LingUpWave_Sp","FireRain","Rainstorm_Teach","Rainstorm_Teach2","LightningStorm_Hack",
"Rainstorm_AllSeason","Fohn_AllSeason","DustStorm_AllSeason","Miasma_AllSeason",
"LightningStorm_AllSeason","JinLingMiMan","MuLingMiMan","ShuiLingMiMan",
"HuoLingMiMan","TuLingMiMan","LingUpWave_Big","LingRarefiedWave_Big",
"Weather_Boss_Drought","Weather_Boss_HighTemp","DimCave","ForestRain",
"SunSet","DustPlace","EverSnow","Weather_Magic_ZhenShuiJieJie",
"Weather_Magic_BeiDouJianJie","Weather_Magic_ZhenHuoJieJie",
"jiaolong_baoyu","xiongfeng_lieyang","xiongfeng_suneye","zhulong_day",
"zhulong_night","zhulong_day_begin","zhulong_night_begin"
	}
	local localKey=nil;
	local localValue=nil;
	local num=1;
	local def=nil;
	local name=nil;
	local wearDEF=CS.XiaWorld.GameEventMgr.Instance;
	for localKey, localValue in pairs(race) do
		def = wearDEF:GeWeatherDef(localValue);
		if def~=nil and def.Name~=nil then
			WeatherSet.Truerace[num]=def.Name;
			WeatherSet:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(def.DisplayName).."-"..tostring(def.Name));
			num = num + 1;
		end
	end
end
function WeatherSet:BeginWeather(a)
	World.Weather:BeginWeather(a, true, 0, true);
	-- for k, v in pairs(NpcMgr:) do
		-- --ThingMgr:GetDef(2,v.Item)
		-- print(k);
		-- --ThingMgr:AddItemThing(2,v.Item);
	-- end

end
function WeatherSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function WeatherSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function WeatherSet:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*3.2, 20, false);
	obj.m_title.text = value;
	--obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function WeatherSet:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	--obj.m_button.name = name;
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false);
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false);
	obj.m_title.text = QFLanguage.GetText(">WeatherSet_Tips3");
	obj.m_dele.text=QFLanguage.GetText(">CallBoss_Tips3");
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="无";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="无";
	obj.m_save:SetSize(0, 0, false);
	--WeatherSet:AddChildToList(obj,"1",WeatherSet.race[1]);
	obj.m_list.onClickItem:Add(WeatherSet.ListChildOnClick);
	
	-- local list = obj.m_list;
	-- list:AddItemFromPool("ui://0xrxw6g7hdhl0");
	return obj;
end
function WeatherSet.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	WeatherSet.TheClickBnt = tonumber(Eventss.data.name);
	WeatherSet:SetSetting();
	
end
function WeatherSet:SetSetting(types)
	local obj=nil;
	if types==nil then
		obj=WeatherSet.input1;
	else
		obj=WeatherSet.input1;
	end
	obj.m_title.text=tostring(WeatherSet.TheClickBnt);
	--WeatherSet:ChooseThingNumAndGetAttribute(WeatherSet.TheClickBnt);
end