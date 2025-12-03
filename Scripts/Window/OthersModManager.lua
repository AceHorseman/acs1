local OthersModManager = CS.Wnd_Simple.CreateWindow("OthersModManager");
ModifierMain:AddWindow("OthersModManager",OthersModManager);
function OthersModManager:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle(QFLanguage.GetText(">OthersModManager_Title"));
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable",QFLanguage.GetText(">OthersModManager_Tips1"),self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);
	self.ModCanUse={};
	self.Labs={};
	local syy=2;
	self.Labs[1]=QFWDModifierMainUI:AddLable2(self,"lable1",QFLanguage.GetText(">OthersModManager_lable1"),self.sx/10*1,self.sy/10*syy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntYesMapHelper",QFLanguage.GetText(">OthersModManager_bntYesMapHelper"),self.sx/10*3,self.sy/10*syy):SetSize(self.sx/10*1.2, 25, false);
	syy=syy+0.5
	self.Labs[2]=QFWDModifierMainUI:AddLable2(self,"lable2",QFLanguage.GetText(">OthersModManager_lable2"),self.sx/10*1,self.sy/10*syy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntYesWebHelper",QFLanguage.GetText(">OthersModManager_bntYesMapHelper"),self.sx/10*3,self.sy/10*syy):SetSize(self.sx/10*1.2, 25, false);
	syy=syy+0.5
	self.Labs[3]=QFWDModifierMainUI:AddLable2(self,"lable3",QFLanguage.GetText(">OthersModManager_lable3"),self.sx/10*1,self.sy/10*syy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntYesInfoDisplay",QFLanguage.GetText(">OthersModManager_bntYesMapHelper"),self.sx/10*3,self.sy/10*syy):SetSize(self.sx/10*1.2, 25, false);
	
	OthersModManager:CheckModCanUse();
	self.window:Center();
end
function OthersModManager:CheckModCanUse()
	if FileWRManager~=nil and FileWRManager.MODIn==1 then
		ModifierMain:AddWindow("FileWRManager",FileWRManager);
		OthersModManager.ModCanUse[1]=true;
	else
		OthersModManager.ModCanUse[1]=false;
	end
	if WebHelper~=nil and WebHelper.MODIn==1 then
		ModifierMain:AddWindow("WebHelper",WebHelper);
		OthersModManager.ModCanUse[2]=true;
	else
		OthersModManager.ModCanUse[2]=false;
	end
	if InfoDisplayWindow~=nil and InfoDisplayWindow.MODIn==1 then
		--ModifierMain:AddWindow("WebHelper",WebHelper);
		OthersModManager.ModCanUse[3]=true;
	else
		OthersModManager.ModCanUse[3]=false;
	end
	local num=1;
	for num=1,#OthersModManager.ModCanUse do
		if OthersModManager.ModCanUse[num] then
			OthersModManager.Labs[num].color=CS.UnityEngine.Color(0,0.8,0.2,1);
		else
			OthersModManager.Labs[num].color=CS.UnityEngine.Color(0.7,0,0,1);
		end
	end
end
function OthersModManager:OnShowUpdate()
	
end

function OthersModManager:OnShown()
	OthersModManager.isShowing = true;
end

function OthersModManager:OnUpdate()

end
function OthersModManager:OnHide()
	OthersModManager.isShowing = false;
	ModifierMain.showWindow=0;
end

function OthersModManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntYesMapHelper" and OthersModManager.ModCanUse[1] then
			ModifierMain:FindWindow("FileWRManager"):Show();
			--ModifierMain.showWindow=25;
			OthersModManager:Hide();
			return;
		end
		if obj.name == "bntYesWebHelper" and OthersModManager.ModCanUse[2] then
			ModifierMain:FindWindow("WebHelper"):Show();
			--ModifierMain.showWindow=26;
			OthersModManager:Hide();
			return;
		end
		if obj.name == "bntYesInfoDisplay" and OthersModManager.ModCanUse[3] then
			ModifierMain:FindWindow("InfoDisplayWindow"):Show();
			--ModifierMain.showWindow=27;
			OthersModManager:Hide();
			return;
		end
	end
end

function OthersModManager:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y);
	obj.text = value;
	obj.name = names;
	obj.tooltips = texts;
	return obj;
end
function OthersModManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function OthersModManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end