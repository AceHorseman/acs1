local ModifierMain= ModifierMain or nil;
if ModifierMain~=nil then
	InfoDisplayWindow = CS.Wnd_Simple.CreateWindow("InfoDisplayWindow");
	InfoDisplayWindow.MODIn=1;
	ModifierMain:AddWindow("InfoDisplayWindow",InfoDisplayWindow);
	--InfoDisplayWindow.WndRender=InfoDisplayWindow.Render;
	
else
	InfoDisplayWindow = CS.Wnd_Simple.CreateWindow("InfoDisplayWindow");
	
end
InfoDisplayWindow.tipList=
{
	"格子信息PRO",
	"当前选择项:无",
	"显示设置:",
	"上移",
	"下移",
	--5
	"启用",
	"禁用",
	"格式设置(暂不支持保存):",
	"默认",
	"修改",
	--10
	"文字设置:",
	"大小[1-40]:",
	"对齐[1-3]:",
	"粗体[0-1]:",
	"参数设置:",
	--15
	"X:",
	"Y:",
	"宽:",
	"高:",
	"刷新间隔[0-40]:",
	--20
	"默认颜色:",
	"载入设置",
	"保存设置",
	"启用该功能",
	"全部默认",
	--25
	"当前选择项:",
	"已尝试设置!",
	"已尝试保存设置!",
	"已尝试载入设置!",
	"关闭更多格子信息!",
	--30
	"开启更多格子信息!",
	"",
	"",
	"",
	"",
	--35
	"",
	"",
	"",
	"",
	"",
	--40------------------
	"未知区域",
};
function InfoDisplayWindow.WndGetMainClass(Modifiers)
	ModifierMain=Modifiers;
end
function InfoDisplayWindow.WndOnAfterInte()
	
end
function InfoDisplayWindow.WndOnHotKey()
	if QFForeInte~=nil and QFForeInte.GetKeyDownKeyStr~=nil then
		if QFForeInte.GetKeyForeverDownStr("right shift") and QFForeInte.GetKeyDownKeyStr("x") then
			if InfoDisplayWindow.isShowing then
				InfoDisplayWindow:Hide();
			else
				InfoDisplayWindow:Show();
			end
			--print("a")
		--else
		--	print(tostring(QFForeInte.CheckValue(704)))
		end
	end
end
function InfoDisplayWindow.WndRender()
	if InfoDisplay~=nil then
		InfoDisplay.Render();
		
	end
	
end
function InfoDisplayWindow:OnShown()
	InfoDisplayWindow.isShowing = true;
	
end
function InfoDisplayWindow:OnHide()
	InfoDisplayWindow.isShowing = false;
	if ModifierMain~=nil then
		ModifierMain.showWindow=0;
	end
end
function InfoDisplayWindow:OnInit()
	self.sx = 680;
	self.sy = 600;
	if ModifierMain~=nil then
		local k,v;
		for k, v in pairs(InfoDisplayWindow.tipList) do
			InfoDisplayWindow.tipList[k]=QFLanguage.GetText(">InfoDisplayWindow_Tips"..tostring(k));
		end
	end
	self:SetTitle(self.tipList[1]);
	self:SetSize(self.sx,self.sy);
	InfoDisplayWindow.FuncsList=InfoDisplay.AddCOP("FuncsList",self.sx/10*0.5,self.sy/10*1.5,self);
	local num=0.5;
	if ModifierMain~=nil then
		InfoDisplayWindow.BeginRunBox=InfoDisplayWindow.AddCheckBox("BeginRunBox",self.tipList[24],self.sx/10*8,self.sy/10*0.4);
	end
	InfoDisplayWindow.ShowLable = InfoDisplay.AddLable2(self,"ShowLable",self.tipList[2],self.sx/10*1,self.sy/10*(num+0.2),self.sx/10*8,35);
	--------------------------------------
	num=num+0.8;
	InfoDisplay.AddLable2(self,"TextSortLable",self.tipList[3],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	num=num+0.5;
	----
	InfoDisplayWindow.btnSortUp=InfoDisplay.AddButton2(self,"btnSortUp",self.tipList[4],self.sx/10*1,self.sy/10*9);
	InfoDisplayWindow.btnSortUp:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	InfoDisplayWindow.btnSortDown=InfoDisplay.AddButton2(self,"btnSortDown",self.tipList[5],self.sx/10*1.7,self.sy/10*9);
	InfoDisplayWindow.btnSortDown:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	
	InfoDisplayWindow.btnE=InfoDisplay.AddButton2(self,"btnE",self.tipList[6],self.sx/10*3,self.sy/10*9);
	InfoDisplayWindow.btnE:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	InfoDisplayWindow.btnDE=InfoDisplay.AddButton2(self,"btnDE",self.tipList[7],self.sx/10*3.7,self.sy/10*9);
	InfoDisplayWindow.btnDE:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	---
	InfoDisplay.AddLable2(self,"TextSortLable2",self.tipList[21],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputTextSort = InfoDisplay.AddInput2(self,"TextSort","FFFFFF",self.sx/10*6,self.sy/10*num);
	InfoDisplayWindow.inputTextSort:SetSize(self.sx/10*1.5,self.sy/10*0.4,false);
	InfoDisplayWindow.inputTextSort.m_title.maxLength = 6;
	InfoDisplayWindow.btnTextSortDefault=InfoDisplay.AddButton2(self,"btnTextSortDefault",self.tipList[9],self.sx/10*8,self.sy/10*num);
	InfoDisplayWindow.btnTextSortDefault:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	InfoDisplayWindow.btnTextSort=InfoDisplay.AddButton2(self,"btnTextSort",self.tipList[10],self.sx/10*8.7,self.sy/10*num);
	InfoDisplayWindow.btnTextSort:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	
	--------------------------------------
	num=num+0.8;
	InfoDisplay.AddLable2(self,"FormatLable",self.tipList[8],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	num=num+0.5
	InfoDisplayWindow.inputFormat3_1 = InfoDisplay.AddInput2(self,"Format3_1","[",self.sx/10*5,self.sy/10*num);
	InfoDisplayWindow.inputFormat3_1:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	InfoDisplayWindow.inputFormat3_2 = InfoDisplay.AddInput2(self,"Format3_2","]",self.sx/10*6.5,self.sy/10*num);
	InfoDisplayWindow.inputFormat3_2:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	InfoDisplayWindow.inputFormat3_3 = InfoDisplay.AddInput2(self,"Format3_3","",self.sx/10*8,self.sy/10*num);
	InfoDisplayWindow.inputFormat3_3:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	num=num+0.5;
	InfoDisplayWindow.inputFormat1 = InfoDisplay.AddInput2(self,"Format1",":",self.sx/10*5,self.sy/10*num);
	InfoDisplayWindow.inputFormat1:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	InfoDisplayWindow.inputFormat2 = InfoDisplay.AddInput2(self,"Format2","  ",self.sx/10*6.5,self.sy/10*num);
	InfoDisplayWindow.inputFormat2:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	InfoDisplayWindow.btnFormatDefault=InfoDisplay.AddButton2(self,"btnFormatDefault",self.tipList[9],self.sx/10*8,self.sy/10*num);
	InfoDisplayWindow.btnFormatDefault:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	InfoDisplayWindow.btnFormat=InfoDisplay.AddButton2(self,"btnFormat",self.tipList[10],self.sx/10*8.7,self.sy/10*num);
	InfoDisplayWindow.btnFormat:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	------------------------------
	num=num+0.8;
	InfoDisplay.AddLable2(self,"TextLable",self.tipList[11],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	num=num+0.5;
	InfoDisplay.AddLable2(self,"TextLable1",self.tipList[12],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	--InfoDisplayWindow.inputText1 = InfoDisplay.AddInput2(self,"Format1",":",self.sx/10*5,self.sy/10*num);
	--InfoDisplayWindow.inputText1:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	InfoDisplayWindow.inputText1 = InfoDisplay.AddInput2(self,"inputText1","15",self.sx/10*6,self.sy/10*num);
	InfoDisplayWindow.inputText1:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	InfoDisplayWindow.inputText1.m_title.restrict = "[0-9]";
	InfoDisplayWindow.inputText1.m_title.maxLength = 2;
	--num=num+0.5;
	InfoDisplay.AddLable2(self,"TextLable2",self.tipList[13],self.sx/10*7.3,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputText2 = InfoDisplay.AddInput2(self,"inputText2","1",self.sx/10*8.3,self.sy/10*num);
	InfoDisplayWindow.inputText2:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	InfoDisplayWindow.inputText2.m_title.restrict = "[0-9]";
	InfoDisplayWindow.inputText2.m_title.maxLength = 1;
	num=num+0.5;
	InfoDisplay.AddLable2(self,"TextLable3",self.tipList[14],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputText3 = InfoDisplay.AddInput2(self,"inputText3","0",self.sx/10*6,self.sy/10*num);
	InfoDisplayWindow.inputText3:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	InfoDisplayWindow.inputText3.m_title.restrict = "[0-9]";
	InfoDisplayWindow.inputText3.m_title.maxLength = 1;
	
	InfoDisplayWindow.btnTextDefault=InfoDisplay.AddButton2(self,"btnTextDefault",self.tipList[9],self.sx/10*8,self.sy/10*num);
	InfoDisplayWindow.btnTextDefault:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	InfoDisplayWindow.btnText=InfoDisplay.AddButton2(self,"btnText",self.tipList[10],self.sx/10*8.7,self.sy/10*num);
	InfoDisplayWindow.btnText:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	------------------------------------
	num=num+0.8;
	InfoDisplay.AddLable2(self,"ParmLable",self.tipList[15],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	num=num+0.5;
	InfoDisplay.AddLable2(self,"ParmLable1",self.tipList[16],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputParm1 = InfoDisplay.AddInput2(self,"inputParm1","1",self.sx/10*6,self.sy/10*num);
	InfoDisplayWindow.inputParm1:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	--num=num+0.5;
	InfoDisplay.AddLable2(self,"ParmLable2",self.tipList[17],self.sx/10*7.3,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputParm2 = InfoDisplay.AddInput2(self,"inputParm2","1",self.sx/10*8.3,self.sy/10*num);
	InfoDisplayWindow.inputParm2:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	num=num+0.5;
	InfoDisplay.AddLable2(self,"ParmLable3",self.tipList[18],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputParm3 = InfoDisplay.AddInput2(self,"inputParm3","1",self.sx/10*6,self.sy/10*num);
	InfoDisplayWindow.inputParm3:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	--num=num+0.5;
	InfoDisplay.AddLable2(self,"ParmLable4",self.tipList[19],self.sx/10*7.3,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputParm4 = InfoDisplay.AddInput2(self,"inputParm4","1",self.sx/10*8.3,self.sy/10*num);
	InfoDisplayWindow.inputParm4:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	
	num=num+0.5;
	InfoDisplay.AddLable2(self,"ParmLable5",self.tipList[20],self.sx/10*5,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputParm5 = InfoDisplay.AddInput2(self,"inputParm5","0",self.sx/10*6,self.sy/10*num);
	InfoDisplayWindow.inputParm5:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	InfoDisplayWindow.inputParm5.m_title.restrict = "[0-9]";
	InfoDisplayWindow.inputParm5.m_title.maxLength = 3;
	
	InfoDisplay.AddLable2(self,"ParmLable6",self.tipList[21],self.sx/10*7.3,self.sy/10*num,self.sx/10*3,35);
	InfoDisplayWindow.inputParm6 = InfoDisplay.AddInput2(self,"inputParm6","FFFFFF",self.sx/10*8.3,self.sy/10*num);
	InfoDisplayWindow.inputParm6:SetSize(self.sx/10*1,self.sy/10*0.4,false);
	InfoDisplayWindow.inputParm6.m_title.maxLength = 6;
	num=num+0.5;
	InfoDisplayWindow.btnParmDefault=InfoDisplay.AddButton2(self,"btnParmDefault",self.tipList[9],self.sx/10*8,self.sy/10*num);
	InfoDisplayWindow.btnParmDefault:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	InfoDisplayWindow.btnParm=InfoDisplay.AddButton2(self,"btnParm",self.tipList[10],self.sx/10*8.7,self.sy/10*num);
	InfoDisplayWindow.btnParm:SetSize(self.sx/10*0.6, self.sy/10*0.4, false);
	num=num+0.8;
	InfoDisplayWindow.btnLoad=InfoDisplay.AddButton2(self,"btnLoad",self.tipList[22],self.sx/10*5,self.sy/10*num);
	InfoDisplayWindow.btnLoad:SetSize(self.sx/10*1, self.sy/10*0.5, false);
	InfoDisplayWindow.btnSave=InfoDisplay.AddButton2(self,"btnSave",self.tipList[23],self.sx/10*8.3,self.sy/10*num);
	InfoDisplayWindow.btnSave:SetSize(self.sx/10*1, self.sy/10*0.5, false);
	
	--num=num+0.5
	--InfoDisplayWindow.inputFormat3_1 = InfoDisplay.AddInput2(self,"Format3_1","[",self.sx/10*5,self.sy/10*num);
	--InfoDisplayWindow.inputFormat3_1:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	--InfoDisplayWindow.inputFormat3_2 = InfoDisplay.AddInput2(self,"Format3_2","]",self.sx/10*6.5,self.sy/10*num);
	--InfoDisplayWindow.inputFormat3_2:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	--InfoDisplayWindow.inputFormat3_3 = InfoDisplay.AddInput2(self,"Format3_3","",self.sx/10*8,self.sy/10*num);
	--InfoDisplayWindow.inputFormat3_3:SetSize(self.sx/10*1.3,self.sy/10*0.4,false);
	if InfoDisplay.MustForeInte() and ModifierMain~=nil then
		InfoDisplayWindow.BeginRunBox.selected=InfoDisplay.SaveIsOpen;
	end
	InfoDisplayWindow.UpdateInfo();
	InfoDisplayWindow.UpdateUI_AllInput();
	InfoDisplayWindow.Choose=1;
	InfoDisplayWindow.ChooseFunc(nil);
	InfoDisplayWindow.window:Center();
end
function InfoDisplayWindow.SetColorDefToList()
	local v= tostring(InfoDisplayWindow.inputTextSort.m_title.text);
	if v==nil or v=="" then
		local n= InfoDisplay.FindTrueId(InfoDisplayWindow.Choose);
		if n~=nil then
			InfoDisplay.SetColorDefListNil(n);
		else
			return false;
		end
	else
		local n= InfoDisplay.FindTrueId(InfoDisplayWindow.Choose);
		if n~=nil then
			InfoDisplay.SetColorDefList(n,v);
		else
			return false;
		end
	end
	return true;
end
function InfoDisplayWindow.ChooseFunc(id)
	if id~=nil then
		InfoDisplayWindow.Choose=id;
	end
	InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[26]..tostring(InfoDisplay.SortListNow[InfoDisplayWindow.Choose]);
	local n= InfoDisplay.FindTrueId(InfoDisplayWindow.Choose);
	if n~=nil then
		InfoDisplayWindow.inputTextSort.m_title.text=InfoDisplay.GetColor2(InfoDisplayWindow.Choose);
	end
	--InfoDisplay.FuncUpOrDown(InfoDisplayWindow.FuncsList,id,0);
end
function InfoDisplayWindow.UpdateInfo()
	InfoDisplay.ListAllFuncs(InfoDisplayWindow.FuncsList);
end
function InfoDisplayWindow.UpdateUI_AllInput()
	InfoDisplayWindow.UpdateUI_TextInput();
	InfoDisplayWindow.UpdateUI_FormatInput();
	InfoDisplayWindow.UpdateUI_ParmInput();
end
function InfoDisplayWindow.UpdateUI_TextInput()
	InfoDisplayWindow.inputText1.m_title.text=tostring(InfoDisplay.MyAttr12[7]);
	local num= 1;
	local k,v;
	for k, v in pairs(InfoDisplay.AlignType) do
		if v == InfoDisplay.MyAttrTEXT[1] then
			num=k;
			break;
		end
	end
	--print(tostring(InfoDisplay.MyAttrTEXT[1]),"_",tostring(InfoDisplay.MyAttrTEXT[2]))
	InfoDisplayWindow.inputText2.m_title.text=tostring(num);
	if InfoDisplay.MyAttrTEXT[2]==true then
		InfoDisplayWindow.inputText3.m_title.text=tostring(1);
	else
		InfoDisplayWindow.inputText3.m_title.text=tostring(0);
	end
end
function InfoDisplayWindow.UpdateUI_FormatInput()
	
	InfoDisplayWindow.inputFormat1.m_title.text=tostring(InfoDisplay.Format[1]);
	InfoDisplayWindow.inputFormat2.m_title.text=tostring(InfoDisplay.Format[2]);
	InfoDisplayWindow.inputFormat3_1.m_title.text=tostring(InfoDisplay.Format[3][1]);
	InfoDisplayWindow.inputFormat3_2.m_title.text=tostring(InfoDisplay.Format[3][2]);
	InfoDisplayWindow.inputFormat3_3.m_title.text=tostring(InfoDisplay.Format[3][3]);
	
end
function InfoDisplayWindow.UpdateUI_ParmInput()
	
	InfoDisplayWindow.inputParm1.m_title.text=tostring(InfoDisplay.MyAttr12[1]);
	InfoDisplayWindow.inputParm2.m_title.text=tostring(InfoDisplay.MyAttr12[2]);
	InfoDisplayWindow.inputParm3.m_title.text=tostring(InfoDisplay.MyAttr12[3]);
	InfoDisplayWindow.inputParm4.m_title.text=tostring(InfoDisplay.MyAttr12[4]);
	InfoDisplayWindow.inputParm5.m_title.text=tostring(InfoDisplay.UpdateTimeDelay);
	InfoDisplayWindow.inputParm6.m_title.text=tostring(InfoDisplay.InfosColorDef);
	
	
end
----------------------------------------------------

function InfoDisplayWindow.SetEnable()
	InfoDisplay.SetEListFromSortList(InfoDisplayWindow.Choose,true);
	
end
function InfoDisplayWindow.SetDisable()
	InfoDisplay.SetEListFromSortList(InfoDisplayWindow.Choose,false);
	
end
function InfoDisplayWindow.SetSortUp()
	InfoDisplayWindow.Choose=InfoDisplay.FuncUpOrDown(InfoDisplayWindow.FuncsList,InfoDisplayWindow.Choose,1);
	if tonumber(InfoDisplayWindow.Choose)==nil then
		InfoDisplayWindow.Choose=1;
	end
	--InfoDisplay.Choose=InfoDisplay.Choose-1;
	--if InfoDisplay.Choose<=0 then
	--	InfoDisplay.Choose=1;
	--end
	--InfoDisplay.SetFormat(InfoDisplayWindow.inputFormat1.m_title.text,InfoDisplayWindow.inputFormat2.m_title.text,InfoDisplayWindow.inputFormat3_1.m_title.text,InfoDisplayWindow.inputFormat3_2.m_title.text,InfoDisplayWindow.inputFormat3_3.m_title.text);
	--InfoDisplayWindow.ChooseFunc(nil);
	return true;
end
function InfoDisplayWindow.SetSortDown()
	InfoDisplayWindow.Choose=InfoDisplay.FuncUpOrDown(InfoDisplayWindow.FuncsList,InfoDisplayWindow.Choose,0);
	if tonumber(InfoDisplayWindow.Choose)==nil then
		InfoDisplayWindow.Choose=1;
	end
	--if InfoDisplay.Choose<=0 then
	--	InfoDisplay.Choose=1;
	--end
	--InfoDisplay.SetFormat(InfoDisplayWindow.inputFormat1.m_title.text,InfoDisplayWindow.inputFormat2.m_title.text,InfoDisplayWindow.inputFormat3_1.m_title.text,InfoDisplayWindow.inputFormat3_2.m_title.text,InfoDisplayWindow.inputFormat3_3.m_title.text);
	--InfoDisplayWindow.ChooseFunc(nil);
	return true;
end

function InfoDisplayWindow.Check0_1(v)
	v=tonumber(v);
	if v==nil then
		return nil;
	end
	return v;
end
function InfoDisplayWindow.SetXYWH()
	--InfoDisplay.SetFormat(InfoDisplayWindow.inputFormat1.m_title.text,InfoDisplayWindow.inputFormat2.m_title.text,InfoDisplayWindow.inputFormat3_1.m_title.text,InfoDisplayWindow.inputFormat3_2.m_title.text,InfoDisplayWindow.inputFormat3_3.m_title.text);
	local x=tonumber(InfoDisplayWindow.inputParm1.m_title.text);
	local y=tonumber(InfoDisplayWindow.inputParm2.m_title.text);
	local w=tonumber(InfoDisplayWindow.inputParm3.m_title.text);
	local h=tonumber(InfoDisplayWindow.inputParm4.m_title.text);
	local r=tonumber(InfoDisplayWindow.inputParm5.m_title.text);
	local c=InfoDisplayWindow.inputParm6.m_title.text;
	
	x=InfoDisplayWindow.Check0_1(x);
	y=InfoDisplayWindow.Check0_1(y);
	w=InfoDisplayWindow.Check0_1(w);
	h=InfoDisplayWindow.Check0_1(h);
	r=InfoDisplayWindow.Check0_1(r);
	
	InfoDisplay.SetMyAttr12List(1,x);
	InfoDisplay.SetMyAttr12List(2,y);
	InfoDisplay.SetMyAttr12List(3,w);
	InfoDisplay.SetMyAttr12List(4,h);
	InfoDisplay.UpdateTimeDelay=r;
	InfoDisplay.SetColorDef(c);
	--print(x," ",y," ",w," ",h)
	InfoDisplay.UpdateSetting();
	return true;
end
function InfoDisplayWindow.SetFormat()
	InfoDisplay.SetFormat(InfoDisplayWindow.inputFormat1.m_title.text,InfoDisplayWindow.inputFormat2.m_title.text,InfoDisplayWindow.inputFormat3_1.m_title.text,InfoDisplayWindow.inputFormat3_2.m_title.text,InfoDisplayWindow.inputFormat3_3.m_title.text);
	return true;
end
function InfoDisplayWindow.SetParmDefault()
	InfoDisplayWindow.inputParm1.m_title.text=tostring(InfoDisplay.OldAttr12[1]-120);
	InfoDisplayWindow.inputParm2.m_title.text=tostring(InfoDisplay.OldAttr12[2]-130);
	InfoDisplayWindow.inputParm3.m_title.text=tostring(InfoDisplay.OldAttr12[3]+60);
	InfoDisplayWindow.inputParm4.m_title.text=tostring(InfoDisplay.OldAttr12[4]+80);
	InfoDisplayWindow.inputParm5.m_title.text="5";
	InfoDisplayWindow.inputParm6.m_title.text="FFFFFF";
	return true;
	--InfoDisplay.SetFormat(InfoDisplayWindow.inputFormat1.m_title.text,InfoDisplayWindow.inputFormat2.m_title.text,InfoDisplayWindow.inputFormat3_1.m_title.text,InfoDisplayWindow.inputFormat3_2.m_title.text,InfoDisplayWindow.inputFormat3_3.m_title.text);
end
function InfoDisplayWindow.SetFormatDefault()
	InfoDisplayWindow.inputFormat1.m_title.text=":";
	InfoDisplayWindow.inputFormat2.m_title.text="  ";
	InfoDisplayWindow.inputFormat3_1.m_title.text="[";
	InfoDisplayWindow.inputFormat3_2.m_title.text="]";
	InfoDisplayWindow.inputFormat3_3.m_title.text="";
	return true;
	--InfoDisplay.SetFormat(InfoDisplayWindow.inputFormat1.m_title.text,InfoDisplayWindow.inputFormat2.m_title.text,InfoDisplayWindow.inputFormat3_1.m_title.text,InfoDisplayWindow.inputFormat3_2.m_title.text,InfoDisplayWindow.inputFormat3_3.m_title.text);
end
function InfoDisplayWindow.SetTextDefault()
	InfoDisplayWindow.inputText1.m_title.text=tostring(12);
	InfoDisplayWindow.inputText2.m_title.text=tostring(1);
	InfoDisplayWindow.inputText3.m_title.text=tostring(0);
	return true;
end
function InfoDisplayWindow.SetText1()
	local num=tonumber(InfoDisplayWindow.inputText1.m_title.text);
	if num==nil then
		num=15;
		--InfoDisplayWindow.inputText1.m_title.text=tostring(num);
	end
	InfoDisplay.SetMyAttr12List(7,num);
	--InfoDisplayWindow.UpdateUI_TextInput();
	return true;
end
function InfoDisplayWindow.SetText2()
	local num=tonumber(InfoDisplayWindow.inputText2.m_title.text);
	if num==nil then
		num=1;
		--InfoDisplayWindow.inputText2.m_title.text=tostring(types);
	end
	local types=InfoDisplay.AlignType[num];
	if types==nil then
		return false
	end
	InfoDisplay.SetMyAttrTEXTList(1,types);
	--InfoDisplayWindow.UpdateUI_TextInput();
	return true;
	--InfoDisplay.SetMyAttr12List(6,InfoDisplayWindow.inputText1.m_title.text);
end
function InfoDisplayWindow.SetText3()
	local tof=tonumber(InfoDisplayWindow.inputText3.m_title.text);
	--print(tof)
	if tof==nil or tof==0 then
		tof=0;
		--InfoDisplayWindow.inputText3.m_title.text=tostring(tof);
		InfoDisplay.SetMyAttrTEXTList(2,false);
	else
		tof=1;
		--InfoDisplayWindow.inputText3.m_title.text=tostring(tof);
		InfoDisplay.SetMyAttrTEXTList(2,true);
	end
	--InfoDisplayWindow.UpdateUI_TextInput();
	return true;
	--InfoDisplay.SetMyAttr12List(6,InfoDisplayWindow.inputText1.m_title.text);
end
function InfoDisplayWindow:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "btnFormat" then
			InfoDisplayWindow.SetFormat();
			InfoDisplay.ListAllFuncs(InfoDisplayWindow.FuncsList);
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnFormatDefault" then
			InfoDisplayWindow.SetFormatDefault();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;--return InfoDisplay.ListAllFuncs(InfoDisplayWindow.FuncsList);
		end
		if obj.name == "btnText" then
			InfoDisplayWindow.SetText1();
			InfoDisplayWindow.SetText2();
			InfoDisplayWindow.SetText3();
			
			InfoDisplay.UpdateSetting();
			InfoDisplayWindow.UpdateUI_TextInput();
			InfoDisplay.ListAllFuncs(InfoDisplayWindow.FuncsList);
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;--return InfoDisplayWindow.SetFormatDefault();
			--return InfoDisplay.ListAllFuncs(InfoDisplayWindow.FuncsList);
		end
		if obj.name == "btnTextDefault" then
			InfoDisplayWindow.SetTextDefault();
			--InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnSortUp" then
			InfoDisplayWindow.SetSortUp();
			--InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnSortDown" then
			InfoDisplayWindow.SetSortDown();
			--InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnE" then
			InfoDisplayWindow.SetEnable();
			InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnDE" then
			InfoDisplayWindow.SetDisable();
			InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnParm" then
			InfoDisplayWindow.SetXYWH();
			InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.UpdateUI_ParmInput();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnParmDefault" then
			InfoDisplayWindow.SetParmDefault();
			InfoDisplayWindow.SetXYWH();
			InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.UpdateUI_ParmInput();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnSave" then
			InfoDisplay.Save_SetListSave();
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[28];
			return;
		end
		if obj.name == "btnLoad" then
			InfoDisplay.Save_GetListSave();
			InfoDisplayWindow.UpdateUI_AllInput();
			InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[29];
			return;
		end
		if obj.name == "btnTextSort" then
			--InfoDisplay.Save_GetListSave();
			--InfoDisplayWindow.UpdateUI_AllInput();
			InfoDisplayWindow.SetColorDefToList();
			InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "btnTextSortDefault" then
			--InfoDisplay.Save_GetListSave();
			--InfoDisplayWindow.UpdateUI_AllInput();
			InfoDisplayWindow.inputTextSort.m_title.text="";
			InfoDisplayWindow.SetColorDefToList();
			InfoDisplayWindow.UpdateInfo();
			InfoDisplayWindow.ChooseFunc(nil);
			InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[27];
			
			return;
		end
		if obj.name == "BeginRunBox" then
			local bool=InfoDisplayWindow.BeginRunBox.selected;
			InfoDisplay.Save_SetBeginRun(bool);
			InfoDisplay.SaveIsOpen=bool;--InfoDisplay.Save_GetBeginRun();
			InfoDisplay.ONOrOffInfoDisplay(bool);
			if bool ~=false then
				InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[31];
			else
				InfoDisplayWindow.ShowLable.text=InfoDisplayWindow.tipList[30];
			end
			return;
		end
	end
end
function InfoDisplayWindow.AddCheckBox(name,value,x,y)
	local obj = InfoDisplayWindow:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
