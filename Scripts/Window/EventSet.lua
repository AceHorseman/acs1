local EventSet = CS.Wnd_Simple.CreateWindow("EventSet");
ModifierMain:AddWindow("EventSet",EventSet);
function EventSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">EventSet_Title"));
	self:SetSize(self.sx,self.sy);

	self.race = 
	{
1,2,3,4,5,6,7,8,9,10,
11,12,13,14,15,16,17,18,19,20,
21,22,23,24,25,26,27,28,29,30,
31,32,33,34,35,36,37,38,39,40,
41,42,43,44,45,46,47,48,49,50,
51,52,53,54,55,56,57,58,59,61,
62,63,64,65,66,67,68,69,70,71,
72,73,74,75,80,81,82,83,84,85,
86,87,88,89,90,91,92,93,94,95,
96,97,98,99,100,101,102,103,104,
1000,1001,1002,
10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,
10010,10011,10012,10013,10014,10015,10016,10017,10019,10020,
10021,10022,10023,10024,10025,10026,10027,10028,10029,10030,
10031,10032,10033,10034,10035,10036,10037,10038,10039,10040,
10041,10042,10043,10044,10045,10046,10047,10048,10049,10050,
10051,10052,10053,10054,10055,10056,10057,10058,10059,10060,
10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,
10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,
10081,10082,10083,10084,
20000,20001,20002,20003,20004,20005,20006,20007,20008,20009,
20010,20011,20012,20013,20014,20015,20016,20017,20018,20019,
20020,20021,20022,20023,20024,20025,20026,20027,20028,20034,
20040,20041,20042,20044,20045,20046,20048,20049,20050,20051,
20052,20053,20054,20055,20056,20057,20058,20059,20060,20061,
20062,20063,20064,20065,20066,20067,20068,20069,20070,20071,
20072,20073,20074,20075,20076,20077,20078,20079,20080,20081,
20082,20083,20084,20085,20086,20087,20088,
29001,29002,29003,29004,29005,29006,29007,29008,29009,29010,
29011,
10132,10133
	}

	--QFWDModifierMainUI:AddButton2(self,"bntRemoveWeather","移除全部",self.sx/10*7.5,self.sy/10*2):SetSize(self.sx/10*1.2, 20, false);

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">AchievementManager_ShowLable"),self.sx/10*2,self.sy/10,300,35);
	
	
	--QFWDModifierMainUI:AddLable2(self,"tlable1","事件设置:",self.sx/10,self.sy/10*1.5,200,35);
	
	QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">EventSet_lable1"),self.sx/10,self.sy/10*3,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*3);
	self.input1:SetSize(self.sx/10*2, 25, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 6;
	QFWDModifierMainUI:AddButton2(self,"AllEvent",QFLanguage.GetText(">EventSet_AllEvent"),self.sx/10*6.5,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntWeatherSet",QFLanguage.GetText(">EventSet_bntWeatherSet"),self.sx/10*4.5,self.sy/10*3):SetSize(self.sx/10*1.2, 25, false);
	
	QFWDModifierMainUI:AddLable2(self,"lable3111",QFLanguage.GetText(">EventSet_lable3111"),self.sx/10,self.sy/10*2,200,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2);
	self.inputid1:SetSize(self.sx/10*2, 25, false);
	self.inputid1.m_title.restrict = "[0-9]";
	self.inputid1.m_title.maxLength = 3;
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc",QFLanguage.GetText(">EventSet_Tips1")..":"..QFLanguage.GetText(">AddManager_Tips3"),self.sx/10,self.sy/10*1.5,300,35);
	QFWDModifierMainUI:AddButton2(self,"bntChooseNpc",QFLanguage.GetText(">EventSet_bntChooseNpc"),self.sx/10*4.5,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false);
	self.NpcListCOP = self:AddCOP("NpcList",-self.sx/10*4.15,self.sy/10*0.7,2);
	self.EventCOP =self:AddCOP("RaceList",self.sx/10*9.85,self.sy/10*0.7,1);
	QFWDModifierMainUI:AddButton2(self,"bntUpdataNpcList",QFLanguage.GetText(">EventSet_bntUpdataNpcList"),-self.sx/10*2.08,self.sy/10*9):SetSize(self.sx/10*0.6, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntUpdataAllNpcList",QFLanguage.GetText(">EventSet_bntUpdataAllNpcList"),-self.sx/10*2.68,self.sy/10*9):SetSize(self.sx/10*0.6, 25, false);
	self.OutShow=self:AddOutputArea("OutShow","",self.sx/10*1,self.sy/10*5,self.sx/10*8,self.sy/10*4);
	-- QFWDModifierMainUI:AddLable2(self,"lable5","快捷操作:",self.sx/10,self.sy/10*6,200,35);
	-- self.input4 = QFWDModifierMainUI:AddInput2(self,"input4","1",self.sx/10*2,self.sy/10*6.5);
	-- self.input4:SetSize(80, 25, false);
	-- self.input4.m_title.restrict = "[0-9]";
	-- self.input4.m_title.maxLength = 2;
	-- QFWDModifierMainUI:AddButton2(self,"bntRollXZ","随机故事",self.sx/10*4,self.sy/10*6.5):SetSize(self.sx/10*1.2, 25, false);
	
	EventSet:ForeInte();
	EventSet.listType=0;
	EventSet:ShowEventList();
	EventSet:ShowNpcListIn();
	self.window:Center();
end
function EventSet:ForeInte()
	local localKey=nil;
	local localValue=nil;
	local num=0;
	local run=false;
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("GetAllEvents");
		local RaceList=func:Invoke();
		if RaceList~=nil then
			run=true;
			EventSet.race={};
			for localKey, localValue in pairs(RaceList) do
				if localValue~=nil and localKey~=nil and localValue.ID~=nil then
					num=num+1;
					EventSet.race[num]=tonumber(localValue.ID);
				end
			end
			print(QFLanguage.GetText(">MODName")..":Get EventList true!(from Func)");
		end
	end
	return run;
end
function EventSet:OnShowUpdate()
	
end

function EventSet:OnShown()
	EventSet.isShowing = true
end

function EventSet:OnUpdate()

end

function EventSet:OnHide()
	EventSet.isShowing = false;
	ModifierMain.showWindow=0;
end
function EventSet:GetKey(x,y)
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
function EventSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntWeatherSet" then
			EventSet:StartEvent(tonumber(EventSet.input1.m_title.text),1);
			EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips2")..":"..EventSet.input1.m_title.text.."！";
			return;
		end
		if obj.name == "bntXZSet" then
			EventSet:StartSecrets(tonumber(EventSet.input2.m_title.text),1);
			EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips2")..":"..EventSet.input1.m_title.text.."！";
			return;
		end
		if obj.name == "bntRollXZ" then
			EventSet:RollSecrets(tonumber(EventSet.input4.m_title.text));
			EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips3");
			return;
		end
		if obj.name == "AllEvent" then
			EventSet:ShowEventList();
			EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips4");
			return;
		end
		if obj.name == "AllXZ" then
			EventSet:ShowSecretsList();
			EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips5");
			return;
		end
		-- if obj.name == "bntRemoveWeather" then
			-- if  tonumber(EventSet.input1.m_title.text) ~= nil  then
				-- EventSet.input1.m_title.text = EventSet.race[tonumber(EventSet.input1.m_title.text)];
			-- end
			-- World.Weather:ClearAllWeather();
			-- EventSet.ShowLable.text = "移除全部天气成功！";
			-- return;
		-- end
		if obj.name == "bntChooseNpc" then
				EventSet.chooseNpcNum = tonumber(EventSet.inputid1.m_title.text);
				if EventSet.chooseNpcNum == nil then
					EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips5").." "..QFLanguage.GetText(">EventSet_Tips7");
					EventSet.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..":"..QFLanguage.GetText(">AddManager_Tips3");
					return;
				elseif EventSet.chooseNpcNum ==0 then
					EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips5").." "..QFLanguage.GetText(">EventSet_Tips8");
					EventSet.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..":"..QFLanguage.GetText(">AddManager_Tips3");
					return;
				
				elseif EventSet.chooseNpcNum > #EventSet.NpcList then
					EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips5").." "..QFLanguage.GetText(">EventSet_Tips8");
					EventSet.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..":"..QFLanguage.GetText(">AddManager_Tips3");
					return;
				else
					EventSet.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..": "..EventSet.NpcList[EventSet.chooseNpcNum]:GetName();
					EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips9");
					EventSet.AttributeFlag =0;
				end
				
		end
		if obj.name == "bntUpdataNpcList" then
			EventSet.listType=0;
			EventSet:ShowNpcListIn();
			EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips10");
		end
		if obj.name == "bntUpdataAllNpcList" then
			EventSet.listType=1;
			EventSet:ShowNpcListIn();
			EventSet.ShowLable.text = QFLanguage.GetText(">EventSet_Tips11");
		end
	end
end
function EventSet:StartEvent(n)
	if n == nil then
		n = 1;
	end
	GameEventMgr:TriggerEvent(n, EventSet.NpcList[EventSet.chooseNpcNum]);
	--GameEventMgr:PopEvent(n, EventSet.NpcList[EventSet.chooseNpcNum], nil);
	--GameEventMgr:AddEvent(n,m);
end
function EventSet:StartSecrets(n)
	if n == nil or n>#EventSet.SecretsList then
		n = 1;
	end
	CS.XiaWorld.MapStoryMgr.Instance:AddSecret(EventSet.SecretsList[n].ID,true);
end
function EventSet:RollSecrets(n)
	if n == nil then
		n = 1;
	end
	CS.XiaWorld.MapStoryMgr.Instance:RandomStory(n);
end

function EventSet.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	EventSet.TheClickBnt = tonumber(Eventss.data.name);
	if EventSet.TheClickBnt==nil then
		return false;
	end
	if EventSet.TheClickBnt<10000000 then
		EventSet.inputid1.m_title.text=tostring(EventSet.TheClickBnt);
		EventSet.chooseNpcNum = tonumber(EventSet.inputid1.m_title.text);
		EventSet.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..": "..EventSet.NpcList[EventSet.chooseNpcNum]:GetName();
		EventSet.AttributeFlag =0;
	else
		local nums=tonumber(EventSet.TheClickBnt-10000000);
		EventSet.input1.m_title.text=tostring(nums);
		EventSet:ShowEventInfo(nums);
	end
	
end
function EventSet:ShowEventInfo(nums)
	local info="\n";
	local data=GameEventMgr:GetEventData(nums);
	if data~=nil then
		if data.ID~=nil and tostring(data.ID)~="" then
			info=info..QFLanguage.GetText(">EventSet_Tips15")..":<font color=\"#DD0000\">"..tostring(data.ID).."</font>\n";
		end
		if data.Name~=nil and tostring(data.Name)~="" then
			info=info..QFLanguage.GetText(">EventSet_Tips16")..":<font color=\"#0000DD\">"..tostring(data.Name).."</font>\n";
		end
		if data.Desc~=nil and tostring(data.Desc)~="" then
			info=info..QFLanguage.GetText(">EventSet_Tips17")..":<font color=\"#EEEEEE\">"..tostring(data.Desc).."</font>\n";
		end
		if data.Kind~=nil and tostring(data.Kind)~="" then
			info=info..QFLanguage.GetText(">EventSet_Tips18")..":"..tostring(data.Kind).."\n";
		end
		if data.UnLockLevel~=nil and tostring(data.UnLockLevel)~="" then
			info=info..QFLanguage.GetText(">EventSet_Tips19")..":"..tostring(data.UnLockLevel).."\n";
		end
		if data.Weight~=nil and tostring(data.Weight)~="" then
			info=info..QFLanguage.GetText(">EventSet_Tips20")..":"..tostring(data.Weight).."\n";
		end
		if data.ClassName~=nil and tostring(data.ClassName)~="" then
			info=info..QFLanguage.GetText(">EventSet_Tips21")..":"..tostring(data.ClassName).."\n";
		end
		
	end
	
	EventSet.OutShow.title=info;
end
function EventSet:ShowEventList()
	local obj = EventSet.EventCOP;
	local localKey=nil;
	local localValue=nil;
	obj.m_list:RemoveChildrenToPool();
	for localKey, localValue in pairs(EventSet.race) do
		local data = GameEventMgr:GetEventData(localValue);
		if data~=nil then
			EventSet:AddChildToList(obj,tostring(10000000+tonumber(localValue)),tostring(localValue)..": "..data.Name.."-"..data.Kind.."-"..data.Desc);
		end
	end
	if tonumber(EventSet.race[1])~=nil then
		EventSet:ShowEventInfo(tonumber(EventSet.race[1]));
	end
end
function EventSet:ShowSecretsList()
	local obj = EventSet.EventCOP;
	local list=CS.XiaWorld.MapStoryMgr.Instance.lisSecrets;
	if list==nil or list=={} then
		print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">EventSet_Tips12"))
		return false;
	end
	local localKey=nil;
	local localValue=nil;
	local num=1;
	EventSet.SecretsList={};
	obj.m_list:RemoveChildrenToPool();
	for localKey, localValue in pairs(list) do
		if localValue~=nil and localValue.ID~=nil then
			EventSet:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.ID).."-"..tostring(localValue.Place).."-"..tostring(localValue.Desc));
			EventSet.SecretsList[num]=localValue;
			num=num+1;
		end
	end
	--EventSet:ShowNpcListIn();
end

function EventSet:ShowNpcListIn()
	--EventSet.ShowLable.text = "刷新NPC列表成功!";
	if EventSet.listType==0 then
		EventSet:UpdateChildNpc(EventSet.NpcListCOP,0);
	elseif EventSet.listType==1 then
		EventSet:UpdateChildNpc(EventSet.NpcListCOP,1);
	end
	EventSet.chooseNpcNum = tonumber(EventSet.inputid1.m_title.text);
	if EventSet.chooseNpcNum == nil then
		return;
	elseif EventSet.chooseNpcNum ==0 then
		return;
	elseif EventSet.chooseNpcNum > #EventSet.NpcList then
		return;
	else
		--EventSet:ShowNpcAttribute(EventSet.NpcList[EventSet.chooseNpcNum]);
		EventSet.ShowLableNpc.text = QFLanguage.GetText(">EventSet_Tips1")..": "..EventSet.NpcList[EventSet.chooseNpcNum]:GetName();
		EventSet.AttributeFlag =0;
	end
end
function EventSet:UpdateChildNpc(obj,types)
	obj.m_list:RemoveChildrenToPool();
	local NpcLists={};
	if types==0 then
		obj.m_title.text = QFLanguage.GetText(">EventSet_Tips13");
		NpcLists=Map.Things:GetActiveNpcs();
	else
		obj.m_title.text = QFLanguage.GetText(">EventSet_Tips14");
		NpcLists=Map.Things.m_lisNpcs;--:GetActiveNpcs();
	end
	local k,v=nil,nil;
	local num=1;
	EventSet.NpcList={};
	for k,v in pairs(NpcLists) do
		EventSet.NpcList[num]=NpcLists[k];
		EventSet:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v));
		num=num+1;
	end
	return obj;
end
function EventSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function EventSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function EventSet:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*8.8, 20, false);
	obj.m_title.text = value;
	obj.onClick:Add(MapSet.ListChildOnClick);
	return obj;
end
function EventSet:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	--obj.m_button.name = name;
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false);
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false);
	obj.m_title.text = "";
	obj.m_list.onClickItem:Add(EventSet.ListChildOnClick2);
	obj.m_dele.text=QFLanguage.GetText(">CallBoss_Tips3");
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="无";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="无";
	obj.m_save:SetSize(0, 0, false);
	return obj;
end
function EventSet:AddOutputArea(name,value,x,y,w,h)
	if w==nil or h==nil then
		w=600;
		h=300;
	end
	if x==nil then
		x=0;
	end
	if y==nil then
		y=0;
	end
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7zc5cnr",x,y);
	obj.m_title.richTextField.htmlText = value;
	obj.m_title.richTextField.textField.autoSize=2;
	obj.name = name;
	obj:SetSize(w, h, false);
	return obj;
end