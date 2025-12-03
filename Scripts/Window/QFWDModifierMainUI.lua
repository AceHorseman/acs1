QFWDModifierMainUI = CS.Wnd_Simple.CreateWindow("QFWDModifierMainUI");
ModifierMain:AddWindow("QFWDModifierMainUI",QFWDModifierMainUI);
local MeKey=nil;
function QFWDModifierMainUI:OnInit()
	--QFLanguage.OnInit();
	self:SetTitle(QFLanguage.GetText(">MODName"));
	self.sx = 680;
	self.sy = 600;
	self:SetSize(self.sx,self.sy);
	local sx1=0.9;
	local sx2=3.3;
	local sx3=5.9;
	local sx4=8.3;
	local num=0;
	QFWDModifierMainUI.ObjList={};
	self.sys = 2;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"FlagSet",QFLanguage.GetText(">QFWDModifierMainUI_FlagSet"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSetFlag",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"TimeSet",QFLanguage.GetText(">QFWDModifierMainUI_TimeSet"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSetTime",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	self.sys = self.sys + 0.5;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"MapSet",QFLanguage.GetText(">QFWDModifierMainUI_MapSet"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSetMap",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"OthersSet",QFLanguage.GetText(">QFWDModifierMainUI_OthersSet"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSetOthers",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	
	self.sys = self.sys + 1;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"QuickFu",QFLanguage.GetText(">QFWDModifierMainUI_QuickFu"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntQuickFu",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"SchoolManager",QFLanguage.GetText(">QFWDModifierMainUI_SchoolManager"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSchoolManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	self.sys = self.sys + 0.5;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"NpcManager",QFLanguage.GetText(">QFWDModifierMainUI_NpcManager"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntNpcManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"ThingManager",QFLanguage.GetText(">QFWDModifierMainUI_ThingManager"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntThingManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	self.sys = self.sys + 0.5;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"JHNpcManager",QFLanguage.GetText(">QFWDModifierMainUI_JHNpcManager"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntJHNpcManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"PlaceSet",QFLanguage.GetText(">QFWDModifierMainUI_PlaceSet"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntPlaceSet",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	self.sys = self.sys + 0.5;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"BuildingManager",QFLanguage.GetText(">QFWDModifierMainUI_BuildingManager"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntBuildingManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"PlantManager",QFLanguage.GetText(">QFWDModifierMainUI_PlantManager"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntPlantManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	
	
	self.sys = self.sys + 1;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"CallBoss",QFLanguage.GetText(">QFWDModifierMainUI_CallBoss"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntCallBoss",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"JoinnerSet",QFLanguage.GetText(">QFWDModifierMainUI_JoinnerSet"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntJoinnerSet",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	
	self.sys = self.sys + 1;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"AddManager",QFLanguage.GetText(">QFWDModifierMainUI_AddManager"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntAddManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"EventSet",QFLanguage.GetText(">QFWDModifierMainUI_EventSet"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntEventSet",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	self.sys = self.sys + 0.5;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"WeatherSet",QFLanguage.GetText(">QFWDModifierMainUI_WeatherSet"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntWeatherSet",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"AchievementManager",QFLanguage.GetText(">QFWDModifierMainUI_AchievementManager"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntAchievementManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);

	self.sys = self.sys + 1;
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"EasyUse",QFLanguage.GetText(">QFWDModifierMainUI_EasyUse"),self.sx/10*sx1,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntEasyUse",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx2,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"OthersModManager",QFLanguage.GetText(">QFWDModifierMainUI_OthersModManager"),self.sx/10*sx3,self.sy/10*self.sys,50,25);
	num=num+1;
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntOthersModManager",QFLanguage.GetText(">QFWDModifierMainUI_btnIn"),self.sx/10*sx4,self.sy/10*self.sys);
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.9, 25, false);
	
	self.Option=0;
	self.haveMOD=1;
	num=num+1;
	self.CheckBox = self:AddCheckBox("ChooseAutoStart",QFLanguage.GetText(">QFWDModifierMainUI_ChooseAutoStart"),self.sx/10*7,self.sy/10*1.2);
	QFWDModifierMainUI.ObjList[num]=self.CheckBox;
	QFWDModifierMainUI.HelpBtn=QFWDModifierMainUI:AddButton4(self,"bntShowHelp",QFLanguage.GetText(">QFWDModifierMainUI_bntShowHelp"),self.sx/10*9.45,self.sy/10*9.6);
	QFWDModifierMainUI.HelpBtn:SetSize(self.sx/10*0.33, self.sx/10*0.33, false);
	
	QFWDModifierMainUI.OptionBtn=QFWDModifierMainUI:AddButton4(self,"bntShowOption",QFLanguage.GetText(">QFWDModifierMainUI_bntOptionBtn"),self.sx/10*0.1,self.sy/10*9.6);
	QFWDModifierMainUI.OptionBtn:SetSize(self.sx/10*0.33, self.sx/10*0.33, false);
	
	
	
	self.CheckBox.selected = ModifierMain.AutoStart;
	self.window:Center();
	
end
function QFWDModifierMainUI:OptionIn()
	if QFWDModifierMainUI.OptionIsIn then
		return true;
	end
	if QFLanguage~=nil then
		QFWDModifierMainUI.LangLab={};
		local lsy=1;
		QFWDModifierMainUI.LangLab[0]=QFWDModifierMainUI:AddLable2(QFWDModifierMainUI,"LangLab0",QFLanguage.GetText(">QFWDModifierMainUI_Tips13"),QFWDModifierMainUI.sx/10*1,QFWDModifierMainUI.sy/10*lsy,QFWDModifierMainUI.sx/10*8,25);
		QFWDModifierMainUI.LangLab[0].visible=false;
		lsy=lsy+0.5;
		QFWDModifierMainUI.LangLab[1]=QFWDModifierMainUI:AddLable2(QFWDModifierMainUI,"LangLab1",QFLanguage.GetText(">QFWDModifierMainUI_Tips12"),QFWDModifierMainUI.sx/10*1,QFWDModifierMainUI.sy/10*lsy,QFWDModifierMainUI.sx/10*3,25);
		QFWDModifierMainUI.LangLab[1].visible=false;
		lsy=lsy+0.5;
		QFWDModifierMainUI.LangListCOP=QFWDModifierMainUI:AddCOP3("LangListCOP",QFWDModifierMainUI.sx/10*1,QFWDModifierMainUI.sy/10*2);
		QFWDModifierMainUI:AddChild();
		QFWDModifierMainUI.LangListCOP.visible=false;
		QFWDModifierMainUI.OptionIsIn=true;
		print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">QFWDModifierMainUI_Tips18"));
		return true;
	else
		return false;
	end
end
function QFWDModifierMainUI:HelpIn()
	if QFWDModifierMainUI.HelpIsIn then
		return true;
	end
	local bool,Help = QFWDModifierMainUI:LoadHelp();
	if bool then
		QFWDModifierMainUI.OutShow=QFWDModifierMainUI:AddOutputArea("OutShow",QFLanguage.GetText(">QFWDModifierMainUI_OutShow"),QFWDModifierMainUI.sx/10*0.4,QFWDModifierMainUI.sy/10*1,QFWDModifierMainUI.sx/10*9.2,QFWDModifierMainUI.sy/10*8.7);
		QFWDModifierMainUI.OutShow.visible=false;
		local helpList=QFWDModifierMainUI:GetHelp(Help);
		local HelpStr=QFWDModifierMainUI:GetStr(helpList)
		QFWDModifierMainUI.OutShow.title=tostring(HelpStr);
		QFWDModifierMainUI.HelpIsIn=true;
		print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">QFWDModifierMainUI_Tips16"));
	else
		print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">QFWDModifierMainUI_Tips1"));
	end
	return bool;
end
function QFWDModifierMainUI:GetStr(helpList)
	if helpList==nil or helpList=={} or helpList[1]==nil then
		return QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">QFWDModifierMainUI_Tips2");
	end
	local info="";
	local lk,lv,lk2,lv2;
	local total,name,help;
	local num=1;
	info=info.."<font size=\"32\">"..QFLanguage.GetText(">QFWDModifierMainUI_Tips3").."</font>\n"
	for lk, lv in pairs(helpList) do
		if lv~=nil then
			total="[color=#B00000]"..tostring(lv.Name).."[color]-----------[color=#f3772b]"..tostring(num).."[color]\n";
			info=info..tostring(total);
			num=num+1;
		end
	end
	info=info.."\n\n<font size=\"32\">"..QFLanguage.GetText(">QFWDModifierMainUI_Tips4").."</font>\n"
	num=1;
	for lk, lv in pairs(helpList) do
		if lv~=nil then
			total="[color=#f3772b]<font size=\"18\">"..tostring(num).."</font>[color]:[color=#B00000]<font size=\"18\">"..tostring(lv.Name).."</font>[color]\n";
			info=info..tostring(total);
			if lv.NameList~=nil and lv.NameList~={} then
				for lk2, lv2 in pairs(lv.NameList) do
					name="    [color=#0000B0]"..lv2.."[color]  ";
					help=lv.HelpList[lk2];
					info=info..tostring(name)..tostring(help).."\n";
				end
			end
			num=num+1;
		end
	end
	return info;
end
function QFWDModifierMainUI:GetHelp(help)
	local helpList={};
	local helps=help;
	local num1,num2;
	num1 = string.find(helps, "[",1,true);
	if num1==nil then
		return helpList,false;
	end
	num2 = string.find(helps, "[",num1+1,true);
	num3 = string.find(helps, "]",num1+1,true);
	if num2==nil or num3 == nil then
		return helpList,false;
	end
	local num=1;
	local lhelp="";
	while true do
		lhelp = string.sub(helps,num1,num2-1);
		if lhelp~=nil then
			helpList[num] = lhelp;
		end
		num1 = num2;
		num2 = string.find(helps, "[",num1+1,true);
		num3 = string.find(helps, "]",num1+1,true);
		
		while true do
			if num2~=nil and num3~=nil and num3 > num2 then
				num2 = string.find(helps, "[",num2+1,true);
			else
				break;
			end
		end
		num = num + 1;
		if num2==nil then
			num3 = string.find(helps, "]",num1+1,true);
			if num3~=nil then
				lhelp = string.sub(helps,num1,-1);
				if lhelp~=nil then
					helpList[num] = lhelp;
				end
			end
			break;
		end
	end
	local lk,lv;
	local data="";
	local helpslist={};
	num=1;
	for lk, lv in pairs(helpList) do
		num1 = string.find(lv, "[",1,true);
		num2 = string.find(lv, "]",1,true);
		helpslist[num]={};
		if num1~=nil and num2~=nil then
			lhelp = string.sub(lv,num1+1,num2-1);
			if lhelp==nil then
				lhelp="";
			end
			helpslist[num].Name=lhelp;
			data=string.sub(lv,num2+1,-1);
			if data~=nil then
				QFWDModifierMainUI:GetLHelp(data,helpslist[num]);
			end
			num = num+1;
		end
	end
	return helpslist,true;
end
function QFWDModifierMainUI:GetLHelp(data,helplist)
	local helpList={};
	local helpslist={};
	local helpslist2={};
	local helps=data;
	local num1,num2;
	num1 = string.find(helps, "<",1,true);
	helplist.NameList=helpslist;
	helplist.HelpList=helpslist2;
	if num1==nil then
		return false;
	end
	num2 = string.find(helps, "<",num1+1,true);
	num3 = string.find(helps, ">",num1+1,true);
	local inLoop=true;
	if num2==nil then
		helpList[1] = string.sub(helps,num1,-1);
		inLoop=false;
	end
	local num=1;
	local lhelp="";
	while inLoop do
		lhelp = string.sub(helps,num1,num2-1);
		if lhelp~=nil then
			helpList[num] = lhelp;
		end
		num1 = num2;
		num2 = string.find(helps, "<",num1+1,true);
		num3 = string.find(helps, ">",num1+1,true);
		while true do
			if num2~=nil and num3~=nil and num3 > num2 then
				num2 = string.find(helps, "<",num2+1,true);
			else
				break;
			end
		end
		num = num + 1;
		if num2==nil then
			num3 = string.find(helps, ">",num1+1,true);
			if num3~=nil then
				lhelp = string.sub(helps,num1,-1);
				if lhelp~=nil then
					helpList[num] = lhelp;
				end
			end
			break;
		end
	end
	local lk,lv;
	local data="";
	num=1;
	for lk, lv in pairs(helpList) do
		num1 = string.find(lv, "<",1,true);
		num2 = string.find(lv, ">",1,true);
		helpslist[num]={};
		if num1~=nil and num2~=nil then
			lhelp = string.sub(lv,num1+1,num2-1);
			if lhelp==nil then
				lhelp="";
			end
			helpslist[num]=lhelp;
			data=string.sub(lv,num2+1,-1);
			if data==nil then
				data="";
			end
			helpslist2[num]=data;
			num = num+1;
		end
	end
	return true;
end
function QFWDModifierMainUI:SetKey(key)
	MeKey=key;
end
function QFWDModifierMainUI:GetPath()
	local name=ModifierMain.Name;
	if name==nil or name=="" then
		name="QFWDModeifiers";
	end
	local Me = CS.ModsMgr.Instance:FindMod(name, nil, true);
	--print(Me.Path)
	local MePath;
	local key=MeKey;
	if Me~=nil then
		MePath = Me.Path;
	else
		MePath = ModifierMain:GetMyPath(key);
		if MePath=="Key cann't be used!" then
			return "";
		end
	end
	return MePath;
end
function QFWDModifierMainUI:LoadHelp()
	local name=ModifierMain.Name;
	if name==nil or name=="" then
		name="QFWDModeifiers";
	end
	local Me = CS.ModsMgr.Instance:FindMod(name, nil, true);
	--print(Me.Path)
	local MePath;
	local key=MeKey;
	if Me~=nil then
		MePath = Me.Path;
	else
		MePath = ModifierMain:GetMyPath(key);
		if MePath=="Key cann't be used!" then
			return false;
		end
	end
	if MePath~=nil then
		local file,err = io.open(MePath.."//Help.txt", "r+");
		if err~=nil or file == nil then
			print(QFLanguage.GetText(">MODName")..":"..QFLanguage.GetText(">QFWDModifierMainUI_Tips5"));
			return false;
		end
		local str = file:read("*all");
		file:close();
		return true,str;
	end
end
function QFWDModifierMainUI:OnShowUpdate()
	
end

function QFWDModifierMainUI:OnShown()
	QFWDModifierMainUI.isShowing = true
end

function QFWDModifierMainUI:OnUpdate()

end

function QFWDModifierMainUI:OnHide()
	QFWDModifierMainUI.isShowing = false
end

function QFWDModifierMainUI:OnObjectEvent(t,obj,context)
	--print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntShowHelp" then
			if QFWDModifierMainUI:HelpIn() then
				local lk,lv;
				if QFWDModifierMainUI.OutShow.visible then
					QFWDModifierMainUI.OutShow.visible=false;
					for lk, lv in pairs(QFWDModifierMainUI.ObjList) do
						QFWDModifierMainUI.ObjList[lk].visible=true;
						--print(lk)
					end
					if QFWDModifierMainUI.OptionBtn~=nil then
						QFWDModifierMainUI.OptionBtn.visible=true;
					end
					QFWDModifierMainUI:SetTitle(QFLanguage.GetText(">MODName"));
					if QFWDModifierMainUI.HelpBtn~=nil then
						QFWDModifierMainUI.HelpBtn.tooltips=QFLanguage.GetText(">QFWDModifierMainUI_Tips7");
					end
				else
					for lk, lv in pairs(QFWDModifierMainUI.ObjList) do
						QFWDModifierMainUI.ObjList[lk].visible=false;
					end
					if QFWDModifierMainUI.OptionBtn~=nil then
						QFWDModifierMainUI.OptionBtn.visible=false;
					end
					QFWDModifierMainUI.OutShow.visible=true;
					QFWDModifierMainUI:SetTitle(QFLanguage.GetText(">QFWDModifierMainUI_Tips6"));
					if QFWDModifierMainUI.HelpBtn~=nil then
						QFWDModifierMainUI.HelpBtn.tooltips=QFLanguage.GetText(">QFWDModifierMainUI_Tips8");
					end
				end
			else
				QFWDModifierMainUI:SetTitle(QFLanguage.GetText(">QFWDModifierMainUI_Tips1"));
			end
			return;
		end
		if obj.name == "bntShowOption" then
			if QFWDModifierMainUI:OptionIn() then
				local lk,lv;
				if QFWDModifierMainUI.Option~=0 then
					QFWDModifierMainUI.LangListCOP.visible=false;
					for lk, lv in pairs(QFWDModifierMainUI.ObjList) do
						QFWDModifierMainUI.ObjList[lk].visible=true;
						--print(lk)
					end
					for lk, lv in pairs(QFWDModifierMainUI.LangLab) do
						if lv~=nil then
							lv.visible=false;
						end
					end
					if QFWDModifierMainUI.HelpBtn~=nil then
						QFWDModifierMainUI.HelpBtn.visible=true;
					end
					QFWDModifierMainUI:SetTitle(QFLanguage.GetText(">MODName"));
					if QFWDModifierMainUI.OptionBtn~=nil then
						QFWDModifierMainUI.OptionBtn.m_title.text=QFLanguage.GetText(">QFWDModifierMainUI_bntOptionBtn");
						QFWDModifierMainUI.OptionBtn.tooltips=QFLanguage.GetText(">QFWDModifierMainUI_Tips10");
					end
					QFWDModifierMainUI.Option=0;
				else
					for lk, lv in pairs(QFWDModifierMainUI.ObjList) do
						QFWDModifierMainUI.ObjList[lk].visible=false;
					end
					if QFWDModifierMainUI.HelpBtn~=nil then
						QFWDModifierMainUI.HelpBtn.visible=false;
					end
					QFWDModifierMainUI.LangListCOP.visible=true;
					for lk, lv in pairs(QFWDModifierMainUI.LangLab) do
						if lv~=nil then
							lv.visible=true;
						end
					end
					
					QFWDModifierMainUI:SetTitle(QFLanguage.GetText(">QFWDModifierMainUI_Tips9"));
					if QFWDModifierMainUI.OptionBtn~=nil then
						QFWDModifierMainUI.OptionBtn.m_title.text=QFLanguage.GetText(">QFWDModifierMainUI_bntOptionBtn2");
						QFWDModifierMainUI.OptionBtn.tooltips=QFLanguage.GetText(">QFWDModifierMainUI_Tips11");
					end
					QFWDModifierMainUI.Option=1;
				end
			else
				QFWDModifierMainUI:SetTitle(QFLanguage.GetText(">QFWDModifierMainUI_Tips17"));
			end
			return;
		end
		if obj.name == "bntQuickFu" then
			ModifierMain:FindWindow("QuickPainterFuSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("QuickPainterFuSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntSetFlag" then
			ModifierMain:FindWindow("FlagSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("FlagSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntSetTime" then
			ModifierMain:FindWindow("TimeSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("TimeSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntSetMap" then
			ModifierMain:FindWindow("MapSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("MapSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntSetOthers" then
			ModifierMain:FindWindow("OthersSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("OthersSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntCallBoss" then
			ModifierMain:FindWindow("CallBoss"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("CallBoss");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntJoinnerSet" then
			ModifierMain:FindWindow("JoinnerSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("JoinnerSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntWeatherSet" then
			ModifierMain:FindWindow("WeatherSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("WeatherSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntEventSet" then
			ModifierMain:FindWindow("EventSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("EventSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntPlaceSet" then
			ModifierMain:FindWindow("PlaceSet"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("PlaceSet");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntNpcManager" then
			ModifierMain:FindWindow("NpcManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("NpcManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntThingManager" then
			ModifierMain:FindWindow("ThingManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("ThingManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntSchoolManager" then
			ModifierMain:FindWindow("SchoolManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("SchoolManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntAddManager" then
			ModifierMain:FindWindow("AddManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("AddManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntJHNpcManager" then
			ModifierMain:FindWindow("JHNpcManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("JHNpcManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntAchievementManager" then
			ModifierMain:FindWindow("AchievementManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("AchievementManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntBuildingManager" then
			ModifierMain:FindWindow("BuildingManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("BuildingManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntPlantManager" then
			ModifierMain:FindWindow("PlantManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("PlantManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntEasyUse" then
			ModifierMain:FindWindow("EasyUse"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("EasyUse");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "bntOthersModManager" then
			ModifierMain:FindWindow("OthersModManager"):Show();
			ModifierMain.showWindow=ModifierMain:GetKey("OthersModManager");
			QFWDModifierMainUI:Hide();
			return;
		end
		if obj.name == "ChooseAutoStart" then
			ModifierMain.SetAutoStart(QFWDModifierMainUI.CheckBox.selected);
			return;
		end

	end
end
function QFWDModifierMainUI:AddCOP3(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl7",x,y);
	--local obj = self:AddObjectFromUrl("ui://0xrxw6g7iqu5ovoa",x,y)
	
	obj.name = name;
	obj.m_list.onClickItem:Add(QFWDModifierMainUI.ListChildOnClick3);
	--obj.m_list.lineCount=2;
	obj.m_list.columnCount=6;
	obj.m_list:SetSize(self.sx/10*2.6,self.sy/10*2.38);
	obj.m_n0:SetSize(self.sx/10*2.65,self.sy/10*2.4);
	obj:SetSize(self.sx/10*2.2, self.sy/10*2.6, true);

--	NpcManager:AddChildToList3(obj,"btnNpcRebornML","拯救弥留");
	return obj;
end
function QFWDModifierMainUI:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function QFWDModifierMainUI:AddInput2(objs,name,value,x,y,w,h,tops)
	return ModifierMain:AddInput2(objs,name,value,x,y,w,h,tops);
end
function QFWDModifierMainUI:AddLable2(objs,name,value,x,y,w,h,tops)
	return ModifierMain:AddLable2(objs,name,value,x,y,w,h,tops);
end
function QFWDModifierMainUI:AddLable3(objs,name,value,x,y,w,h,tops)
	return ModifierMain:AddLable3(objs,name,value,x,y,w,h,tops);
end
function QFWDModifierMainUI:AddButton2(objs,name,value,x,y,w,h,tops)
	return ModifierMain:AddButton2(objs,name,value,x,y,w,h,tops);
end
function QFWDModifierMainUI:AddButton4(objs,name,value,x,y,w,h)
	local obj = objs:AddObjectFromUrl("ui://0xrxw6g7lsb652ow3n",x,y);--ui://0xrxw6g7qah58x--ui://0xrxw6g7lsb652ow3n
	--obj.m_button.selectedIndex=1;
	if w==nil or h==nil then
		w=60;
		h=25;
	end
	obj:SetSize(w, h);
	obj.m_title.singleLine=true;
	obj.m_title.textFormat.bold=true;
	--obj.m_title.textFormat.color=CS.UnityEngine.Color(7/255,50/255,82/255,0.8);
	obj.m_title.textFormat.size=18;
	--obj.m_title.autoSize=CS.FairyGUI.AutoSizeType.Shrink;--Both--Shrink
	obj.m_title.textFormat.align=CS.FairyGUI.AlignType.Center;
	obj.m_title.y=0;
	obj.m_title.text = value;
	obj.name = name;
	obj.m_n12.visible=false;
	obj.tooltips=QFLanguage.GetText(">QFWDModifierMainUI_Tips7");
	return obj;
end
function QFWDModifierMainUI.Reset(event)
	event.data.selectedIndex=0;
end
function QFWDModifierMainUI:AddOutputArea(name,value,x,y,w,h)
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
function QFWDModifierMainUI:AddChild(tobj)
	if tobj==nil then
		obj=QFWDModifierMainUI.LangListCOP;
	else
		obj=tobj;
	end
	obj.m_list:RemoveChildrenToPool();
	local k,v;
	if QFLanguage==nil or QFLanguage.FileName==nil then
		return false;
	end
	for k, v in pairs(QFLanguage.FileName) do
		if v~=nil and QFLanguage.LangDisplayName~=nil and QFLanguage.LangDisplayDesc~=nil then
			QFWDModifierMainUI:AddChildToList3(obj,tonumber(k),tostring(QFLanguage.LangDisplayName[k]),tostring(QFLanguage.LangDisplayDesc[k]));
		end
	end
	
end
function QFWDModifierMainUI:AddChildToList3(tobj,name,value,topText)
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
function QFWDModifierMainUI.ListChildOnClick3(Eventss)
	local obj = Eventss.data;
	local num=tonumber(obj.name);
	if num~=nil and QFLanguage.NowLangNum~=nil then
		if QFLanguage.NowLangNum== num +1 then
			QFLanguage.WriteSetting(tostring(QFLanguage.FileName[num]));
			QFWDModifierMainUI.LangLab[0].m_title.text=QFLanguage.GetText(">QFWDModifierMainUI_Tips14").."---"..tostring(QFLanguage.LangDisplayName[num]);
		else
			QFLanguage.WriteSetting(tostring(QFLanguage.FileName[num]));
			QFWDModifierMainUI.LangLab[0].m_title.text=QFLanguage.GetText(">QFWDModifierMainUI_Tips15").."---"..tostring(QFLanguage.LangDisplayName[num]);
		end
	end
end