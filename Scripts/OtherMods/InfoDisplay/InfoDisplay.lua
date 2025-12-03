local ModifierMain= ModifierMain or nil;
if ModifierMain~=nil then
	InfoDisplay = {};
	InfoDisplay.IsInModModifiers=true;
	local InfoDisplayWindow = ModifierMain:FindWindow("InfoDisplayWindow");
else
	InfoDisplay = GameMain:GetMod("InfoDisplay");
	InfoDisplay.IsInModModifiers=false;
	InfoDisplay.DelayF=40;
end
--local PWrdMgr=CS.XiaWorld.World;
--if PWrdMgr~=nil then
--	InfoDisplay.WrdMgr=PWrdMgr.Instance;
--end

InfoDisplay.HadInt=false;
InfoDisplay.Open=false;
InfoDisplay.SaveIsOpen=false;
InfoDisplay.HaveForeInte=false;
----MODSave------
function InfoDisplay.Save_GetListSave()
	if not InfoDisplay.CheckFistIn() then
		InfoDisplay.Save_GetInfosList();
		InfoDisplay.Save_GetInfosSortList();
		InfoDisplay.Save_GetOtherList();
		InfoDisplay.Save_GetColorList();
		InfoDisplay.SaveIsOpen=InfoDisplay.Save_GetBeginRun();
		--print("Get Save!");
	end
end
function InfoDisplay.Save_SetListSave()
	--if InfoDisplay.CheckFistIn() then
		InfoDisplay.Save_SetInfosList();
		InfoDisplay.Save_SetInfosSortList();
		InfoDisplay.Save_SetOtherList();
		InfoDisplay.Save_SetColorList();
		InfoDisplay.Save_SetBeginRun(InfoDisplay.SaveIsOpen);
		--print("Save!");
	--end
end
function InfoDisplay.SetValue(num,value)
	if InfoDisplay.curWorld==nil then
		return false;
	end
	local head=79000
	InfoDisplay.curWorld:SetFlag(head+num, value);
	return true;
end

function InfoDisplay.GetValue(num)
	if InfoDisplay.curWorld==nil then
		return nil;
	end
	local head=79000
	local num=InfoDisplay.curWorld:GetFlag(head+num);
	return num;
end
function InfoDisplay.GetColorStr(num)
	local str= string.format("%#x",num);
	if str~=nil then
		str=string.upper(str);
		local num1,num2=string.find (str,"0X");
		if num1~=nil then
			str = string.sub(str, -(string.len(str)-2));
			num2=string.len(str);
			if num2~=6 then
				for num1=1,6-num2 do
					str="0"..str;
				end
			end
		end
	end
	return str;
end
function InfoDisplay.GetNumber(color)
	--print(tostring(color))
	return tonumber(color,16);
end
function InfoDisplay.CheckBool(num)
	if InfoDisplay.GetValue(num)==1 then
		return true;
	else
		return false;
	end
end
function InfoDisplay.SetBool(num,v)
	if v~=true then
		v=0;
	else
		v=1;
	end
	return InfoDisplay.SetValue(num,v);
end
function InfoDisplay.CheckFistIn()
	if InfoDisplay.CheckBool(1) then
		return false;
	end
	return true;
end
-----
function InfoDisplay.Save_SetBeginRun(lbool)
	if lbool~=true then
		lbool=false;
	end
	--print(lbool)
	local begin=2;
	return InfoDisplay.SetBool(begin,lbool);
	--print(InfoDisplay.Save_GetBeginRun())
	--return true;
end
function InfoDisplay.Save_GetBeginRun()
	local begin=2;
	
	return InfoDisplay.CheckBool(begin);
end
function InfoDisplay.Save_SetColorList()
	--InfoDisplay.SetValue(1,1);
	InfoDisplay.SetBool(1,true);
	local begin=600;
	local num=1;
	local lcolor;
	for num=1,#InfoDisplay.Infos do
		if InfoDisplay.InfosColorDefList[num]~=nil then
			lcolor=InfoDisplay.GetNumber(InfoDisplay.InfosColorDefList[num]);
			if lcolor==nil then
				lcolor=0;
			else
				if lcolor==0 then
					lcolor=-1;
				end
			end
			InfoDisplay.SetValue(begin+num,lcolor);
		end
	end
end
function InfoDisplay.Save_SetOtherList()
	InfoDisplay.SetBool(1,true);
	local begin=500;
	local num=1;
	local k,v;
	for k, v in pairs(InfoDisplay.AlignType) do
		if v == InfoDisplay.MyAttrTEXT[1] then
			num=k;
			break;
		end
	end
	InfoDisplay.SetValue(begin+1,num);
	InfoDisplay.SetBool(begin+2,InfoDisplay.MyAttrTEXT[2]);
	
	InfoDisplay.SetValue(begin+3,InfoDisplay.MyAttr12[1]);
	InfoDisplay.SetValue(begin+4,InfoDisplay.MyAttr12[2]);
	InfoDisplay.SetValue(begin+5,InfoDisplay.MyAttr12[3]);
	InfoDisplay.SetValue(begin+6,InfoDisplay.MyAttr12[4]);
	InfoDisplay.SetValue(begin+7,InfoDisplay.MyAttr12[7]);
	
	InfoDisplay.SetValue(begin+8,InfoDisplay.UpdateTimeDelay);
	if InfoDisplay.InfosColorDef~=nil then
		local num=InfoDisplay.GetNumber(InfoDisplay.InfosColorDef);
		if num~=nil then
			InfoDisplay.SetValue(begin+9,num);
		end
	end
	
end
function InfoDisplay.Save_SetInfosList()
	InfoDisplay.SetBool(1,true);
	local begin=100;
	local num=1;
	for num=1,#InfoDisplay.Infos do
		InfoDisplay.SetValue(begin+num,InfoDisplay.Infos[num]);
	end
end
function InfoDisplay.Save_SetInfosSortList()
	InfoDisplay.SetBool(1,true);
	local begin=400;
	local num=1;
	for num=1,#InfoDisplay.InfosSortList do
		InfoDisplay.SetValue(begin+num,InfoDisplay.InfosSortList[num]);
	end
end
--
function InfoDisplay.Save_GetColorList()
	local begin=600;
	local num=1;
	local scolor,v;
	for num=1,#InfoDisplay.Infos do
		scolor = InfoDisplay.GetValue(begin+num);
		if scolor~=0 then
			if scolor==-1 then
				scolor=0;
			end
			v=InfoDisplay.GetColorStr(scolor);
			if v~=nil then
				InfoDisplay.InfosColorDefList[num]=v;
			end
		end
	end
end
function InfoDisplay.Save_GetOtherList()
	local begin=500;
	local v=InfoDisplay.GetValue(begin+1);
	if v~=0 then
		InfoDisplay.MyAttrTEXT[1]=InfoDisplay.AlignType[v];
	end
	--v=InfoDisplay.GetValue(begin+2);
	InfoDisplay.MyAttrTEXT[2]=InfoDisplay.CheckBool(begin+2);
	
	InfoDisplay.MyAttr12[1]=InfoDisplay.GetValue(begin+3);
	InfoDisplay.MyAttr12[2]=InfoDisplay.GetValue(begin+4);
	InfoDisplay.MyAttr12[3]=InfoDisplay.GetValue(begin+5);
	InfoDisplay.MyAttr12[4]=InfoDisplay.GetValue(begin+6);
	InfoDisplay.MyAttr12[7]=InfoDisplay.GetValue(begin+7);
	
	InfoDisplay.UpdateTimeDelay=InfoDisplay.GetValue(begin+8);
	
	v= InfoDisplay.GetColorStr(InfoDisplay.GetValue(begin+9));
	if v~=nil then
		InfoDisplay.InfosColorDef=v;
	end
end
function InfoDisplay.Save_GetInfosList()
	local begin=100;
	local num=1;
	for num=1,#InfoDisplay.Infos do
		InfoDisplay.Infos[num] = InfoDisplay.GetValue(begin+num);
	end
end
function InfoDisplay.Save_GetInfosSortList()
	local begin=400;
	local num=1;
	for num=1,#InfoDisplay.InfosSortList do
		InfoDisplay.InfosSortList[num] = InfoDisplay.GetValue(begin+num);
	end
end
----MOD------
function InfoDisplay:OnSetHotKey()  --更新了热键方法
	local HotKey = 
	{
		{ID = "InfoDisplayWindow" , Name = "格子信息PRO" , Type = "Mod", InitialKey1 = "LeftControl+F2",InitialKey2 = "LeftShift+B"}--,
	};
	--print("快捷键注册成功！");
	return HotKey;
end
function InfoDisplay:OnHotKey(ID,state)
	--print(ID)
	local logicBool=false;
	logicBool=(ID == "InfoDisplayWindow" and state == "down");
	if logicBool then
		if InfoDisplayWindow.isShowing then
			InfoDisplayWindow:Hide();
		else
			InfoDisplayWindow:Show();
		end
	end
end
function InfoDisplay:OnRender()--独立mod调用
	if InfoDisplay.HadInt ~= true then
		--print("!!!")
		InfoDisplay.DelayF=InfoDisplay.DelayF-1;
		if InfoDisplay.DelayF<0 then
			local num=InfoDisplay.CheckFistIn();
			if InfoDisplay.ONOrOffInfoDisplay(true) then
				if num then
					InfoDisplayWindow:Show();
				end
				--InfoDisplayWindow:Show();
				InfoDisplay.HadInt=true;
				--print("!!!")
			end
		end
		--print("!!!")
	else
		InfoDisplay.OnInfoDisplay(0);
	end
end
function InfoDisplay.Render()--mod版修改器调用
	--
	if InfoDisplay.HaveForeInte~=true then
		if InfoDisplay.MustForeInte() and InfoDisplay.SaveIsOpen then
			InfoDisplay.ONOrOffInfoDisplay(true);
		end
	end
	if InfoDisplay.SaveIsOpen then
		--print("!!!")
		
		InfoDisplay.OnInfoDisplay(0);
	end
end
-----------------------
function InfoDisplay.ForeInte()
	
	InfoDisplay.Rate=100;--精确到X分位
	InfoDisplay.UpdateTimeDelay=5;--刷新间隔
	InfoDisplay.MyAttr12=--基础属性
	{
	InfoDisplay.OldAttr12[1]-120,--x--out
	InfoDisplay.OldAttr12[2]-130,--y--out
	InfoDisplay.OldAttr12[3]+60,--w--out
	InfoDisplay.OldAttr12[4]+80,--h--out
	InfoDisplay.AlignType[1],
	InfoDisplay.VertAlignType[1],
	12,--字体大小--out
	};
	InfoDisplay.MyAttrTEXT=--文字属性
	{
		InfoDisplay.AlignType[1],--文字对齐方式--out
		false,--bold
	};
	InfoDisplay.Format=--格式列表
	{
		":",
		"  ",
		{"[","]",""},
	};
	InfoDisplay.Infos=--使能列表
	{
		1,--1坐标
		0,--2温度
		0,--3温度描述
		1,--4温度+温度描述
		0,--5地形
		0,--6美观度
		0,--7美观描述
		1,--8美观度+美观描述
		0,--9亮度值
		0,--10亮度描述
		1,--11亮度值+亮度描述
		0,--12富饶度
		0,--13富饶描述
		1,--14富饶度+富饶描述
		0,--15室内
		0,--16冰
		1,--17室+冰
		0,--18金
		0,--19木
		0,--20水
		0,--21火
		0,--22土
		0,--23金+木+水+火+土
		0,--24金+木+水+火+土(百分比)
		0,--25金+木+水
		0,--26金+木
		0,--27金+木+水(百分比)
		0,--28金+木(百分比)
		0,--29水+火+土
		0,--30火+土
		0,--31水+火+土(百分比)
		0,--32火+土(百分比)
		0,--33灵气
		0,--34聚灵
		0,--35真实聚灵
		0,--36灵气+聚灵+真实聚灵
		1,--37灵气+聚灵
		0,--38聚灵+真实聚灵
		0,--39年份
		0,--40月份
		0,--41日
		0,--42年+月+日
		0,--43月+日
		0,--44小时
		0,--45分钟
		0,--46秒
		0,--47时+分+秒
		0,--48时+分
		0,--49总帧数
		0,--50帧率
		1,--51地形(上+下)
		0,--52地形(下+上)
		0,--53下层地形
		0,--54顶层地形
		0,--55地形肥力(上+下)
		0,--56地形肥力(下+上)
		0,--57地形肥力下
		0,--58地形肥力上
		0,--59地形聚灵(上+下)
		0,--60地形聚灵(下+上)
		0,--61地形聚灵下
		0,--62地形聚灵上
		0,--63地形衰减(上+下)
		0,--64地形衰减(下+上)
		0,--65地形衰减下
		0,--66地形衰减上
		
	};
	InfoDisplay.InfosColorDef="FFFFFF";--默认颜色
	InfoDisplay.InfosColorDefList={};--保存的默认颜色列表
	
	InfoDisplay.InfosColorList={};--颜色列表
	InfoDisplay.InfosSortList=--排序列表
	{
		1,--1坐标
		3,--2温度
		4,--3温度描述
		5,--4温度+温度描述
		2,--5地形
		6,--6美观度
		7,--7美观描述
		8,--8美观度+美观描述
		9,--9亮度值
		10,--10亮度描述
		11,--11亮度值+亮度描述
		12,--12富饶度
		13,--13富饶描述
		14,--14富饶度+富饶描述
		15,--15室内
		16,--16冰
		17,--17室+冰
		18,--18金
		19,--19木
		20,--20水
		21,--21火
		22,--22土
		23,--23金+木+水+火+土
		24,--24金+木+水+火+土(百分比)
		25,--25金+木+水
		26,--26金+木
		27,--27金+木+水(百分比
		28,--28金+木(百分比)
		29,--29水+火+土
		30,--30火+土
		31,--31水+火+土(百分比)
		32,--32火+土(百分比)
		33,--33灵气
		34,--34聚灵
		35,--35真实聚灵
		36,--36灵气+聚灵+真实聚灵
		37,--37灵气+聚灵
		38,--38聚灵+真实聚灵
		39,--39年份
		40,--40月份
		41,--41日
		42,--42年+月+日
		43,--43月+日
		44,--44小时
		45,--45分钟
		46,--46秒
		47,--47时+分+秒
		48,--48时+分
		49,--49总帧数
		50,--50帧率
		51,--51地形(上+下)
		52,--52地形(下+上)
		53,--53下层地形
		54,--54顶层地形
		55,--55地形肥力(上+下)
		56,--56地形肥力(下+上)
		57,--57地形肥力下
		58,--58地形肥力上
		59,--59地形聚灵(上+下)
		60,--60地形聚灵(下+上)
		61,--61地形聚灵下
		62,--62地形聚灵上
		63,--63地形衰减(上+下)
		64,--64地形衰减(下+上)
		65,--65地形衰减下
		66,--66地形衰减上
		
	};
	InfoDisplay.InfoShowList=--提示列表
	{
		{"X","Y"},--1坐标
		"温度",--2温度
		"温度描述",--3温度描述
		"",--4温度+温度描述
		"地形",--5地形
		"美观",--6美观度
		"美观描述",--7美观描述
		"",--8美观度+美观描述
		"亮度",--9亮度值
		"亮度描述",--10亮度描述
		"",--11亮度值+亮度描述
		"富饶",--12富饶度
		"富饶描述",--13富饶描述
		"",--14富饶度+富饶描述
		"室内",--15室内
		"冰",--16冰
		"",--17室+冰
		{"金","金P"},--18金
		{"木","木P"},--19木
		{"水","水P"},--20水
		{"火","火P"},--21火
		{"土","土P"},--22土
		"",--23金+木+水+火+土
		"",--24金+木+水+火+土(百分比)
		"",--25金+木+水
		"",--26金+木
		"",--27金+木+水(百分比
		"",--28金+木(百分比)
		"",--29水+火+土
		"",--30火+土
		"",--31水+火+土(百分比)
		"",--32火+土(百分比)
		"灵气",--33灵气
		"聚灵",--34聚灵
		"真实聚灵",--35真实聚灵
		"",--36灵气+聚灵+真实聚灵
		"",--37灵气+聚灵
		"",--38聚灵+真实聚灵
		"年",--39年份
		"月",--40月份
		"日",--41日
		"日期",--42年+月+日
		"日期",--43月+日
		"小时",--44小时
		"分钟",--45分钟
		"秒",--46秒
		"时间",--47时+分+秒
		"时间",--48时+分
		"总帧数",--49总帧数
		"游戏帧率",--50帧率
		"地形",--51地形(上+下)
		"地形",--52地形(下+上)
		"下层地形",--53下层地形
		"顶层地形",--54顶层地形
		"肥沃度",--55地形肥力(上+下)
		"肥沃度",--56地形肥力(下+上)
		"下层肥沃度",--57地形肥力下
		"上层肥沃度",--58地形肥力上
		"聚灵",--59地形聚灵(上+下)
		"聚灵",--60地形聚灵(下+上)
		"下层聚灵",--61地形聚灵下
		"上层聚灵",--62地形聚灵上
		"衰减值",--63地形衰减(上+下)
		"衰减值",--64地形衰减(下+上)
		"下层衰减值",--65地形衰减下
		"上层衰减值",--66地形衰减上
		
	};
	if InfoDisplayWindow~=nil and InfoDisplayWindow.tipList~=nil and InfoDisplayWindow.tipList[41]~=nil then
		InfoDisplay.InfoShowList[0]=tostring(InfoDisplayWindow.tipList[41]);--nil;--未定义位置提示
	else
		InfoDisplay.InfoShowList[0]="Unknown";--nil;--未定义位置提示
	end
	
	InfoDisplay.AfterInfoShowListInte();
	
	InfoDisplay.SortListNow={};
	
end
function InfoDisplay.AfterInfoShowListInte()
	InfoDisplay.InfoShowList[4]={InfoDisplay.InfoShowList[2],InfoDisplay.InfoShowList[3]};
	InfoDisplay.InfoShowList[8]={InfoDisplay.InfoShowList[6],InfoDisplay.InfoShowList[7]};
	InfoDisplay.InfoShowList[11]={InfoDisplay.InfoShowList[9],InfoDisplay.InfoShowList[10]};
	InfoDisplay.InfoShowList[14]={InfoDisplay.InfoShowList[12],InfoDisplay.InfoShowList[13]};
	InfoDisplay.InfoShowList[17]={InfoDisplay.InfoShowList[15],InfoDisplay.InfoShowList[16]};
	InfoDisplay.InfoShowList[23]={InfoDisplay.InfoShowList[18][1],InfoDisplay.InfoShowList[19][1],InfoDisplay.InfoShowList[20][1],InfoDisplay.InfoShowList[21][1],InfoDisplay.InfoShowList[22][1]};
	InfoDisplay.InfoShowList[24]={InfoDisplay.InfoShowList[18][2],InfoDisplay.InfoShowList[19][2],InfoDisplay.InfoShowList[20][2],InfoDisplay.InfoShowList[21][2],InfoDisplay.InfoShowList[22][2]};
	InfoDisplay.InfoShowList[25]={InfoDisplay.InfoShowList[18][1],InfoDisplay.InfoShowList[19][1],InfoDisplay.InfoShowList[20][1]};
	InfoDisplay.InfoShowList[26]={InfoDisplay.InfoShowList[18][1],InfoDisplay.InfoShowList[19][1]};
	InfoDisplay.InfoShowList[27]={InfoDisplay.InfoShowList[18][2],InfoDisplay.InfoShowList[19][2],InfoDisplay.InfoShowList[20][2]};
	InfoDisplay.InfoShowList[28]={InfoDisplay.InfoShowList[18][2],InfoDisplay.InfoShowList[19][2]};
	InfoDisplay.InfoShowList[29]={InfoDisplay.InfoShowList[20][1],InfoDisplay.InfoShowList[21][1],InfoDisplay.InfoShowList[22][1]};
	InfoDisplay.InfoShowList[30]={InfoDisplay.InfoShowList[21][1],InfoDisplay.InfoShowList[22][1]};
	InfoDisplay.InfoShowList[31]={InfoDisplay.InfoShowList[20][2],InfoDisplay.InfoShowList[21][2],InfoDisplay.InfoShowList[22][2]};
	InfoDisplay.InfoShowList[32]={InfoDisplay.InfoShowList[21][2],InfoDisplay.InfoShowList[22][2]};
	InfoDisplay.InfoShowList[36]={InfoDisplay.InfoShowList[33],InfoDisplay.InfoShowList[34],InfoDisplay.InfoShowList[35]};
	InfoDisplay.InfoShowList[37]={InfoDisplay.InfoShowList[33],InfoDisplay.InfoShowList[34]};
	InfoDisplay.InfoShowList[38]={InfoDisplay.InfoShowList[34],InfoDisplay.InfoShowList[35]};
	
end
function InfoDisplay.MustForeInte()
	if InfoDisplay.HaveForeInte==true then
		return true;
	end
	if CS.Wnd_GameMain==nil or CS.Wnd_GameMain.Instance==nil or CS.UI_WorldLayer==nil then
		return false;
	end
	local UIInfo = CS.Wnd_GameMain.Instance.UIInfo
	if UIInfo == nil then
		return false;
	end
	local WorldLayer = CS.UI_WorldLayer.Instance;
	if WorldLayer==nil then
		return false;
	end
	--print("!!!")
	InfoDisplay.UIInfo=UIInfo;
	InfoDisplay.WorldLayer = WorldLayer;
	InfoDisplay.TextField=UIInfo.m_n32;
	if InfoDisplay.TextField==nil then
		return false;
	end
	local CSys=CS.System;
	if CSys~=nil then
		InfoDisplay.DateTime=CSys.DateTime;
	end
	if CS.FairyGUI==nil or CS.FairyGUI.GTextField==nil then
		return false;
	end
	--print("!!!")
	InfoDisplay.MyTextField=InfoDisplay.TextField;--CS.FairyGUI.GTextField();
	--InfoDisplay.MyTextField=CS.FairyGUI.GList():GetFromPool("ui://0xrxw6g7zc5cnr");
	if InfoDisplay.MyTextField==nil then
		return false;
	end
	--print("!!!!")
	if CS.FairyGUI.AlignType==nil or CS.FairyGUI.VertAlignType==nil then
		return false;
	end
	if CS.XiaWorld.GridMgr==nil or CS.XiaWorld.GridMgr.Inst==nil then
		return false;
	end
	if CS.XiaWorld.WorldMgr==nil or CS.XiaWorld.WorldMgr.Instance==nil or CS.XiaWorld.WorldMgr.Instance.curWorld==nil or CS.XiaWorld.WorldMgr.Instance.curWorld.map ==nil then
		return false;
	end
	--print("!!!")
	InfoDisplay.curWorld=CS.XiaWorld.WorldMgr.Instance.curWorld;
	InfoDisplay.Map=CS.XiaWorld.WorldMgr.Instance.curWorld.map;
	InfoDisplay.GridMgr=CS.XiaWorld.GridMgr.Inst;
	InfoDisplay.AlignType=
	{
		CS.FairyGUI.AlignType.Left,
		CS.FairyGUI.AlignType.Center,
		CS.FairyGUI.AlignType.Right
	};
	InfoDisplay.VertAlignType=
	{
		CS.FairyGUI.VertAlignType.Top,
		CS.FairyGUI.VertAlignType.Middle,
		CS.FairyGUI.VertAlignType.Bottom
	};
	InfoDisplay.OldAttr12=
	{
	InfoDisplay.TextField.x,
	InfoDisplay.TextField.y,
	InfoDisplay.TextField.width,
	InfoDisplay.TextField.height,
	InfoDisplay.TextField.align,
	InfoDisplay.TextField.verticalAlign,
	InfoDisplay.TextField.fontsize,
	};
	--print(InfoDisplay.TextField.x)
	--print(InfoDisplay.TextField.y)
	--print(InfoDisplay.TextField.width)
	--print(InfoDisplay.TextField.height)
	--print(InfoDisplay.TextField.align)
	--print(InfoDisplay.TextField.verticalAlign)
	--print(InfoDisplay.TextField.fontsize)
	
	InfoDisplay.OldAttrFormat=CS.FairyGUI.TextFormat();
	InfoDisplay.OldAttrFormat:CopyFrom(InfoDisplay.TextField.textFormat);
	InfoDisplay.Timer=0;
	InfoDisplay.LastInfo="";
	InfoDisplay.LastKey=0;
	InfoDisplay.LFrame=0;
	InfoDisplay.LastTime=0;
	InfoDisplay.ForeInte();
	if InfoDisplay.CheckFistIn()==false then
		
		InfoDisplay.Save_GetListSave();
		--print("Isn't first in!");
	end
	InfoDisplay.HaveForeInte=true;
	return true;
end
function InfoDisplay.ONOrOffInfoDisplay(oof)
	if oof==true or oof==nil then
		if InfoDisplay.Open==true then
			return true;
		end
		if InfoDisplay.MustForeInte() then
			--InfoDisplay.SetAttrFromList(InfoDisplay.MyTextField,InfoDisplay.MyAttr12,InfoDisplay.MyAttrTEXT);
			--InfoDisplay.AutoSetHAW();
			InfoDisplay.UpdateSetting();
			InfoDisplay.UpdateSetting();
			
			InfoDisplay.MyTextField.UBBEnabled=true;
			InfoDisplay.MyTextField.visible=true;
			InfoDisplay.SetEvent(true);
			InfoDisplay.Open=true;
			return true;
		else
			return false;
		end
		--print("!!!")
	else
		if InfoDisplay.Open==false or InfoDisplay.Open==nil then
			return true;
		end
		--InfoDisplay.SetEvent(false);
		--InfoDisplay.SetWindowAttr1(InfoDisplay.MyTextField,InfoDisplay.OldAttr12[1],InfoDisplay.OldAttr12[2],InfoDisplay.OldAttr12[3],InfoDisplay.OldAttr12[4]);
		
		--InfoDisplay.UpdateSetting();
		InfoDisplay.MyTextField.textFormat:CopyFrom(InfoDisplay.OldAttrFormat);
		InfoDisplay.SetAttrFromList(InfoDisplay.MyTextField,InfoDisplay.OldAttr12);
		InfoDisplay.SetAttrFromList(InfoDisplay.MyTextField,InfoDisplay.OldAttr12);
		InfoDisplay.MyTextField.UBBEnabled=true;
		InfoDisplay.MyTextField.visible=true;
		InfoDisplay.Open=false;
		return true;
		--print("!!!")
		
	end
end
------------------------------------设置样式
function InfoDisplay.SetWindowAttr1(obj,x,y,w,h)
	if obj==nil then
		return false;
	end
	if x~=nil and y~=nil then
		obj:SetXY(x,y);
	else
		if x==nil then
			x=tonumber(obj.x);
		end
		if y==nil then
			y=tonumber(obj.y);
		end
		if x~=nil and y~=nil then
			obj:SetXY(x,y);
		else
			return false;
		end
	end
	if w~=nil and h~=nil then
		obj:SetSize(w,h,true);
	else
		if w==nil then
			w=tonumber(obj.width);
		end
		if h==nil then
			h=tonumber(obj.height);
		end
		if w~=nil and h~=nil then
			obj:SetSize(w,h,true);
		else
			return false;
		end
	end
	return true;
end
function InfoDisplay.SetWindowAttr2(obj,alignType,vertAlignType,fontSize)
	if obj==nil then
		return false;
	end
	alignType=InfoDisplay.AlignType[alignType];
	if alignType~=nil then
		obj.align=alignType;
	end
	vertAlignType=InfoDisplay.VertAlignType[vertAlignType];
	if vertAlignType~=nil then
		obj.verticalAlign=vertAlignType;
	end
	if fontSize~=nil then
		obj.fontsize=fontSize;
	end
end
function InfoDisplay.SetWindowAttrText(obj,alignType,bold)
	if obj==nil then
		return false;
	end
	obj.align=alignType;
	obj.bold=bold;
end
function InfoDisplay.SetAttrFromList(obj,list,list2)
	if obj==nil then
		return false;
	end
	if list~=nil then
		InfoDisplay.SetWindowAttr1(obj,list[1],list[2],list[3],list[4]);
		InfoDisplay.SetWindowAttr2(obj,list[5],list[6],list[7]);
		--print(list[1]," ",list[2]," ",list[3]," ",list[4])
	end
	if list2~=nil then
		local lobj=obj.textFormat;
		if lobj==nil then
			return false;
		end
		InfoDisplay.SetWindowAttrText(lobj,list2[1],list2[2]);
	end
	return true;
end
---------------------------------------------------------系统信息获取
function InfoDisplay.GetTime(Type)
	if InfoDisplay.DateTime==nil or InfoDisplay.DateTime.Now==nil then
		return nil;
	end
	--print("!!!")
	local Now=InfoDisplay.DateTime.Now;
	if Type==1 then
		local Y=Now.Year;
		local Mo=Now.Month;
		local D=Now.Day;
		return Y,Mo,D;
	elseif Type==0 then
		local H=Now.Hour;
		local M=Now.Minute;
		local S=Now.Second;
		if H<10 then
			H="0"..tostring(H);
		end
		if M<10 then
			M="0"..tostring(M);
		end
		if S<10 then
			S="0"..tostring(S);
		end
		
		return H,M,S;
	else
		return Now.Ticks;
	end
end
function InfoDisplay.GetFrame(Type)
	local Frame=InfoDisplay.curWorld.FrameCount;
	if Frame==nil then
		return nil;
	end
	if Type==1 then
		return Frame;
	else
		local LastFrame=InfoDisplay.LFrame;
		local old=InfoDisplay.LastTime;
		if old==nil or LastFrame==nil then
			return nil;
		end
		local x1=InfoDisplay.GetTime(2);
		if x1==nil then
			return nil;
		end
		x1=math.floor(x1/10000);
		--print(x1)
		--print(x1-old)
		local r=((Frame-LastFrame)/(x1-old))*1000;--InfoDisplay.GetFloat(((Frame-LastFrame)/(x1-old))*1000,InfoDisplay.Rate);
		--print((Frame-LastFrame))
		InfoDisplay.LastTime=x1;
		InfoDisplay.LFrame=Frame;
		return r;
	end
	
end
-------------------------------------------------------------功能表格操作
function InfoDisplay.SetEnableList(id,isEnable)--设置使能列表
	if InfoDisplay.Infos[id]==nil then
		return false;
	end
	--print(isEnable)
	if isEnable~=true then
		isEnable=0;
	else
		isEnable=1;
	end
	
	InfoDisplay.Infos[id]=isEnable;
	return true;
end
function InfoDisplay.SetEListFromSortList(id,isEnable)--设置使能列表
	local k,v;
	local ids=0;
	for k, v in pairs(InfoDisplay.InfosSortList) do
		if v==id then
			ids=k;
			break;
		end
	end
	return InfoDisplay.SetEnableList(ids,isEnable);
end
function InfoDisplay.SetSortList(id,sort)--设置排序列表
	--print("T:",id,"-",sort)
	if id==sort then
		return false;
	end
	--local vv=InfoDisplay.InfosSortList[id];
	local ma,mi,types;
	if id>sort then
		ma=id;
		mi=sort;
		types=1;
	else
		ma=sort;
		mi=id;
		types=0;
	end
	local k,v;
	if types==1 then
		for k, v in pairs(InfoDisplay.InfosSortList) do
			if v==id then
				InfoDisplay.InfosSortList[k]=sort;
			else
				if v >= mi and v<ma then
					InfoDisplay.InfosSortList[k]=v+1;
				end
			end
		end
	else
		for k, v in pairs(InfoDisplay.InfosSortList) do
			if v==id then
				InfoDisplay.InfosSortList[k]=sort;
			else
				if v > mi and v<=ma then
					InfoDisplay.InfosSortList[k]=v-1;
					--print("K:",k,"-",InfoDisplay.InfosSortList[k])
				end
			end
			
		end
	end
	--local k,v;
	--local vv=InfoDisplay.InfosSortList[id];
	--local ma,mi,types;
	--if vv>sort then
	--	ma=vv;
	--	mi=sort;
	--	types=1;
	--else
	--	ma=sort;
	--	mi=vv;
	--	types=0;
	--end
	--if types==1 then
	--	for k, v in pairs(InfoDisplay.InfosSortList) do
	--		if v >= mi and v<ma then
	--			InfoDisplay.InfosSortList[k]=v+1;
	--		end
	--	end
	--else
	--	for k, v in pairs(InfoDisplay.InfosSortList) do
	--		if v > mi and v<=ma then
	--			InfoDisplay.InfosSortList[k]=v-1;
	--			--print(k,"  ",v)
	--		end
	--	end
	--end
	--InfoDisplay.InfosSortList[id]=sort;
	
	--local n=InfoDisplay.InfosSortList[id];
	--InfoDisplay.InfosSortList[id]=sort;
	--InfoDisplay.InfosSortList[sort]=n;
	--for k, v in pairs(InfoDisplay.InfosSortList) do
	--		--InfoDisplay.InfosSortList[k]=v;
	--		print(k,"  ",v)
	--end
	
	return true;
end
function InfoDisplay.SetColorDef(color)--设置默认颜色
	if color==nil then
		return false;
	end
	InfoDisplay.InfosColorDef=color;
	return true;
end
function InfoDisplay.SetColorDefListNil(id)--设置默认颜色列表单项为空
	InfoDisplay.InfosColorDefList[id]=nil;
	return true;
end
function InfoDisplay.SetColorDefList(id,color)--设置默认颜色列表
	if color==nil then
		return false;
	end
	InfoDisplay.InfosColorDefList[id]=color;
	return true;
end
function InfoDisplay.SetColorList(id,color)--设置颜色列表
	if InfoDisplay.InfosColorList[id]==nil then
		return false;
	end
	InfoDisplay.InfosColorList[id]=color;
	return true;
end
function InfoDisplay.CheckShowCount()--检查使能数量
	local k,v;
	local num=0;
	for k, v in pairs(InfoDisplay.Infos) do
		if v == 1 then
			num=num+1;
		end
	end
	return num;
end
function InfoDisplay.FindTrueId(id)--返回真实id
	local k,v;
	for k, v in pairs(InfoDisplay.InfosSortList) do
		if v==id then
			return k;
		end
	end
	return nil;
end
function InfoDisplay.UpdateSetting()--更新设置
	InfoDisplay.SetAttrFromList(InfoDisplay.MyTextField,InfoDisplay.MyAttr12,InfoDisplay.MyAttrTEXT);
	return true;
end
function InfoDisplay.AutoSetHAW()--自动设置高度,宽度--ab
	local num=InfoDisplay.CheckShowCount();
	InfoDisplay.MyAttr12[4]=InfoDisplay.MyTextField.fontsize*num;
	InfoDisplay.MyAttr12[3]=InfoDisplay.MyTextField.fontsize*30;
	InfoDisplay.UpdateSetting();
end
function InfoDisplay.SetMyAttr12List(id,v)--设置基础属性列表
	if InfoDisplay.MyAttr12[id]==nil then
		return false;
	end
	InfoDisplay.MyAttr12[id]=v;
	return true;
end
--function InfoDisplay.SetMyAttr12ListS(id,v)--设置基础属性列表,百分比
--	if InfoDisplay.MyAttr12[id]==nil then
--		return false;
--	end
--	--local lw=CS.UnityEngine.Screen.width;
--	--local lh=CS.UnityEngine.Sreen.height;
--	if id==1 then
--		
--		InfoDisplay.MyAttr12[id]=v;
--	elseif id==2 then
--		
--	elseif id==3 then
--		
--	elseif id==4 then
--		
--	else
--		return false;
--	end
--	return true;
--end
function InfoDisplay.SetMyAttrTEXTList(id,v)--设置文字属性列表
	if InfoDisplay.MyAttrTEXT[id]==nil then
		return false;
	end
	InfoDisplay.MyAttrTEXT[id]=v;
	return true;
end
function InfoDisplay.SetInfoShowList(id,v)--设置提示列表
	if InfoDisplay.InfoShowList[id]==nil then
		return false;
	end
	InfoDisplay.InfoShowList[id]=v;
	InfoDisplay.AfterInfoShowListInte();
	--InfoDisplay.UpdateSetting();
	return true;
end
function InfoDisplay.SetFormat(p1,p2,p3_1,p3_2,p3_3)
	if p1~=nil then
		InfoDisplay.Format[1]=tostring(p1);
	end
	if p2~=nil then
		InfoDisplay.Format[2]=tostring(p2);
	end
	if p3_1~=nil then
		InfoDisplay.Format[3][1]=tostring(p3_1);
	end
	if p3_2~=nil then
		InfoDisplay.Format[3][2]=tostring(p3_2);
	end
	if p3_3~=nil then
		InfoDisplay.Format[3][3]=tostring(p3_3);
	end
	return true;
	
end
-------------------------------------------------------------
function InfoDisplay.SetEvent(IsOn)
	if IsOn then
		GameMain:GetMod("_Event"):UnRegisterEvent(g_emEvent.UpdateFrame, "InfoDisplay_InfoDisplay");
		GameMain:GetMod("_Event"):RegisterEvent(g_emEvent.UpdateFrame, InfoDisplay.OnInfoDisplay, "InfoDisplay_InfoDisplay");
		--GameMain:GetMod("_Event"):UnRegisterEvent(g_emEvent.Render, "InfoDisplay_InfoDisplay2");
		--GameMain:GetMod("_Event"):RegisterEvent(g_emEvent.Render, InfoDisplay.Render, "InfoDisplay_InfoDisplay2");
	
	else
		GameMain:GetMod("_Event"):UnRegisterEvent(g_emEvent.UpdateFrame, "InfoDisplay_InfoDisplay");
		--GameMain:GetMod("_Event"):UnRegisterEvent(g_emEvent.Render, "InfoDisplay_InfoDisplay2");
	
	end
end
function InfoDisplay.OnInfoDisplay(t)
	if InfoDisplay.Open~=true then
		return;
	end
	if t~=0 then
		InfoDisplay.LastInfo=InfoDisplay.SafeGetInfoDisplay();
		InfoDisplay.Timer=0;
	else
		if InfoDisplay.Timer>=InfoDisplay.UpdateTimeDelay then
			InfoDisplay.LastInfo=InfoDisplay.SafeGetInfoDisplay();
			InfoDisplay.Timer=0;
		else
			InfoDisplay.Timer=InfoDisplay.Timer+1;
			InfoDisplay.LastInfo=InfoDisplay.LastInfo;
		end
	end
	
	--if InfoDisplay.GetMouseGridKey()~= InfoDisplay.LastKey then
	--	--local key=InfoDisplay.GetMouseGridKey();
	--	--if InfoDisplay.GridMgr:KeyVaild(key) then
	--		--if InfoDisplay.Infos[49]==1 then
	--		--	InfoDisplay.OnInfoDisplay(1);
	--		--end
	--		--InfoDisplay.GetSortShowListDisplay();
	--	--end
	--	
	--else
	--	if InfoDisplay.Infos[49]==1 then
	--		InfoDisplay.OnInfoDisplay(1);
	--	end
	--end
	if InfoDisplay.LastInfo~=nil then
		InfoDisplay.MyTextField.text=InfoDisplay.LastInfo;
	end
	--print("!!!")
end
function InfoDisplay.GetMouseGridKey()
	return InfoDisplay.WorldLayer.MouseGridKey;
end
function InfoDisplay.GetValueDef(dic,value)
	local k,v;
	for k, v in pairs(dic) do
		if value >= k then
			return v;
		end
	end
	return v;
end
function InfoDisplay.GetColor(id)
	local color=InfoDisplay.InfosColorDefList[id];
	if color==nil then
		color=InfoDisplay.InfosColorList[id];
		if color==nil then
			color=InfoDisplay.InfosColorDef;
		end
	end
	return "#"..color;
end
function InfoDisplay.GetColor2(id)
	color=InfoDisplay.InfosColorDefList[id];
	if color==nil then
		color=InfoDisplay.InfosColorDef;
	end
	return color;
end
function InfoDisplay.GetFloat(v,m)
	return math.floor(v*m)/m;
end
function InfoDisplay.GetInfoForelist(lkey)
	local key;
	if lkey==nil then
		key=tonumber(InfoDisplay.GetMouseGridKey());
	else
		key=lkey;
	end
	--print(tostring(key));
	InfoDisplay.LastKey=key;
	if key==nil or InfoDisplay.GridMgr:KeyVaild(key)==false then
		return nil;
	end
	
	local InfoList={};
	local k,v;
	if InfoDisplay.Infos[1]==1 then
		v=InfoDisplay.GridMgr:Key2P(key);
		if v~=nil then
			InfoList[1]={v[0],v[1]};
		end
	end
	if InfoDisplay.Infos[2]==1 then
		InfoList[2]=InfoDisplay.GetFloat(InfoDisplay.Map:GetTemperature(key),InfoDisplay.Rate);
	end
	local bool=false;
	v=32;
	for k=18,v do
		if InfoDisplay.Infos[k]==1 then
			bool=true;
			break;
		end
	end
	if bool then
		
		local ArrayE=InfoDisplay.Map:GetElement(key);--元素
		local ArrayEP=InfoDisplay.Map:GetElementProportion(key);--元素百分比
		if ArrayE~=nil and ArrayEP~=nil then
			--print("!!")
			if InfoDisplay.Infos[18]==1 then
				InfoList[18]={InfoDisplay.GetFloat(ArrayE[1],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[1],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[19]==1 then
				InfoList[19]={InfoDisplay.GetFloat(ArrayE[2],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[2],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[20]==1 then
				InfoList[20]={InfoDisplay.GetFloat(ArrayE[3],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[3],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[21]==1 then
				InfoList[21]={InfoDisplay.GetFloat(ArrayE[4],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[4],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[22]==1 then
				InfoList[22]={InfoDisplay.GetFloat(ArrayE[5],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[5],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[23]==1 then
				InfoList[23]={InfoDisplay.GetFloat(ArrayE[1],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[2],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[3],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[4],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[5],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[24]==1 then
				InfoList[24]={InfoDisplay.GetFloat(ArrayEP[1],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[2],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[3],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[4],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[5],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[25]==1 then
				InfoList[25]={InfoDisplay.GetFloat(ArrayE[1],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[2],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[3],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[26]==1 then
				InfoList[26]={InfoDisplay.GetFloat(ArrayE[1],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[2],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[27]==1 then
				InfoList[27]={InfoDisplay.GetFloat(ArrayEP[1],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[2],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[3],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[28]==1 then
				InfoList[28]={InfoDisplay.GetFloat(ArrayEP[1],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[2],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[29]==1 then
				InfoList[29]={InfoDisplay.GetFloat(ArrayE[3],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[4],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[5],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[30]==1 then
				InfoList[30]={InfoDisplay.GetFloat(ArrayE[4],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayE[5],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[31]==1 then
				InfoList[31]={InfoDisplay.GetFloat(ArrayEP[3],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[4],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[5],InfoDisplay.Rate)};
			end
			if InfoDisplay.Infos[32]==1 then
				InfoList[32]={InfoDisplay.GetFloat(ArrayEP[4],InfoDisplay.Rate),InfoDisplay.GetFloat(ArrayEP[5],InfoDisplay.Rate)};
			end
			
		end
	end
	if InfoDisplay.Infos[33]==1 then
		InfoList[33]=InfoDisplay.GetFloat(InfoDisplay.Map:GetLing(key),InfoDisplay.Rate);
	end
	local MEffect=InfoDisplay.Map.Effect;
	if MEffect~=nil then
		if InfoDisplay.Infos[34]==1 then
			InfoList[34]=InfoDisplay.GetFloat(MEffect:GetEffect(key, CS.XiaWorld.g_emMapEffectKind.LingAddion),InfoDisplay.Rate);
		end
		if InfoDisplay.Infos[35]==1 then
			InfoList[35]=InfoDisplay.GetFloat(MEffect:GetEffect(key, CS.XiaWorld.g_emMapEffectKind.LingAddion, 0, true),InfoDisplay.Rate);
		end
		if InfoDisplay.Infos[36]==1 then
			InfoList[33]=InfoDisplay.GetFloat(InfoDisplay.Map:GetLing(key),InfoDisplay.Rate);
			InfoList[34]=InfoDisplay.GetFloat(MEffect:GetEffect(key, CS.XiaWorld.g_emMapEffectKind.LingAddion),InfoDisplay.Rate);
			InfoList[35]=InfoDisplay.GetFloat(MEffect:GetEffect(key, CS.XiaWorld.g_emMapEffectKind.LingAddion, 0, true),InfoDisplay.Rate);
			InfoList[36]={InfoList[33],InfoList[34],InfoList[35]};
		end
		if InfoDisplay.Infos[37]==1 then
			InfoList[33]=InfoDisplay.GetFloat(InfoDisplay.Map:GetLing(key),InfoDisplay.Rate);
			InfoList[34]=InfoDisplay.GetFloat(MEffect:GetEffect(key, CS.XiaWorld.g_emMapEffectKind.LingAddion),InfoDisplay.Rate);
			InfoList[37]={InfoList[33],InfoList[34]};
		end
		if InfoDisplay.Infos[38]==1 then
			InfoList[34]=InfoDisplay.GetFloat(MEffect:GetEffect(key, CS.XiaWorld.g_emMapEffectKind.LingAddion),InfoDisplay.Rate);
			InfoList[35]=InfoDisplay.GetFloat(MEffect:GetEffect(key, CS.XiaWorld.g_emMapEffectKind.LingAddion, 0, true),InfoDisplay.Rate);
			InfoList[38]={InfoList[34],InfoList[35]};
		end
	end
	
	--InfoDisplay.GetFloat(,InfoDisplay.Rate);
	local terrain;
	if InfoDisplay.Map.Terrain~=nil then
		bool=false;
		v=62;
		for k=51,v do
			if InfoDisplay.Infos[k]==1 then
				bool=true;
				break;
			end
		end
		if bool then
			local unit=InfoDisplay.Map.Terrain:GetTerrainDataUnit(key);
			--print("!!!")
			if unit~=nil then
				
				local dterrain,tterrain,s1,s2;
				tterrain=unit.Top;
				dterrain=unit.Under;
				if InfoDisplay.Infos[51]==1 or InfoDisplay.Infos[52]==1 or InfoDisplay.Infos[53]==1 or InfoDisplay.Infos[54]==1 then
					InfoList[51]=nil;
					InfoList[52]=nil;
					InfoList[53]=nil;
					InfoList[54]=nil;
					
					if tterrain==nil then
						if dterrain~=nil then
							s2=dterrain.DisplayName;
							if s2~=nil then
								InfoList[51]="("..tostring(s2)..")";
								InfoList[52]=tostring(s2);
								
								InfoList[53]=tostring(s2);
								
							end
						end
					else
						s1=tterrain.DisplayName;
						if s1~=nil then
							if dterrain~=nil then
								s2=dterrain.DisplayName;
								if s2~=nil then
									InfoList[51]=tostring(s1).."("..tostring(s2)..")";
									InfoList[52]=tostring(s2).."("..tostring(s1)..")";
									
									InfoList[53]=tostring(s2);
									InfoList[54]=tostring(s1);
								else
									InfoList[51]=tostring(s1);
									InfoList[52]="("..tostring(s1)..")";
									
									InfoList[54]=tostring(s1);
								end
							else
								InfoList[51]=tostring(s1);
								InfoList[52]="("..tostring(s1)..")";
								
								InfoList[54]=tostring(s1);
							end
							
						else
							if dterrain~=nil then
								s2=dterrain.DisplayName;
								if s2~=nil then
									InfoList[51]="("..tostring(s2)..")";
									InfoList[52]=tostring(s2);
									
									InfoList[53]=tostring(s2);
								
								end
							end
						end
					end
				end
---------------------------
				if InfoDisplay.Infos[55]==1 or InfoDisplay.Infos[56]==1 or InfoDisplay.Infos[57]==1 or InfoDisplay.Infos[58]==1 then
					InfoList[55]=nil;
					InfoList[56]=nil;
					InfoList[57]=nil;
					InfoList[58]=nil;
					
					if tterrain==nil then
						if dterrain~=nil then
							s2=InfoDisplay.GetFloat(dterrain.Fertility,InfoDisplay.Rate);
							if s2~=nil then
								InfoList[55]="("..tostring(s2)..")";
								InfoList[56]=tostring(s2);
								
								InfoList[57]=tostring(s2);
								
							end
						end
					else
						s1=InfoDisplay.GetFloat(tterrain.Fertility,InfoDisplay.Rate);
						if s1~=nil then
							if dterrain~=nil then
								s2=InfoDisplay.GetFloat(dterrain.Fertility,InfoDisplay.Rate);
								if s2~=nil then
									InfoList[55]=tostring(s1).."("..tostring(s2)..")";
									InfoList[56]=tostring(s2).."("..tostring(s1)..")";
									
									InfoList[57]=tostring(s2);
									InfoList[58]=tostring(s1);
								else
									InfoList[55]=tostring(s1);
									InfoList[56]="("..tostring(s1)..")";
									
									InfoList[58]=tostring(s1);
								end
							else
								InfoList[55]=tostring(s1);
								InfoList[56]="("..tostring(s1)..")";
								
								InfoList[58]=tostring(s1);
							end
							
						else
							if dterrain~=nil then
								s2=InfoDisplay.GetFloat(dterrain.Fertility,InfoDisplay.Rate);
								if s2~=nil then
									InfoList[55]="("..tostring(s2)..")";
									InfoList[56]=tostring(s2);
									
									InfoList[57]=tostring(s2);
								
								end
							end
						end
					end
				end
---------------------------
				if InfoDisplay.Infos[59]==1 or InfoDisplay.Infos[60]==1 or InfoDisplay.Infos[61]==1 or InfoDisplay.Infos[62]==1 then
					InfoList[59]=nil;
					InfoList[60]=nil;
					InfoList[61]=nil;
					InfoList[62]=nil;
					
					if tterrain==nil then
						if dterrain~=nil then
							s2=InfoDisplay.GetFloat(dterrain.AddionLing,InfoDisplay.Rate);
							if s2~=nil then
								InfoList[59]="("..tostring(s2)..")";
								InfoList[60]=tostring(s2);
								
								InfoList[61]=tostring(s2);
								
							end
						end
					else
						s1=InfoDisplay.GetFloat(tterrain.AddionLing,InfoDisplay.Rate);
						if s1~=nil then
							if dterrain~=nil then
								s2=InfoDisplay.GetFloat(dterrain.AddionLing,InfoDisplay.Rate);
								if s2~=nil then
									InfoList[59]=tostring(s1).."("..tostring(s2)..")";
									InfoList[60]=tostring(s2).."("..tostring(s1)..")";
									
									InfoList[61]=tostring(s2);
									InfoList[62]=tostring(s1);
								else
									InfoList[59]=tostring(s1);
									InfoList[60]="("..tostring(s1)..")";
									
									InfoList[62]=tostring(s1);
								end
							else
								InfoList[59]=tostring(s1);
								InfoList[60]="("..tostring(s1)..")";
								
								InfoList[62]=tostring(s1);
							end
							
						else
							if dterrain~=nil then
								s2=InfoDisplay.GetFloat(dterrain.AddionLing,InfoDisplay.Rate);
								if s2~=nil then
									InfoList[59]="("..tostring(s2)..")";
									InfoList[60]=tostring(s2);
									
									InfoList[61]=tostring(s2);
								
								end
							end
						end
					end
				end
---------------------------
				if InfoDisplay.Infos[63]==1 or InfoDisplay.Infos[64]==1 or InfoDisplay.Infos[65]==1 or InfoDisplay.Infos[66]==1 then
					InfoList[63]=nil;
					InfoList[64]=nil;
					InfoList[65]=nil;
					InfoList[66]=nil;
					
					if tterrain==nil then
						if dterrain~=nil then
							s2=InfoDisplay.GetFloat(dterrain.Attenuation,InfoDisplay.Rate);
							if s2~=nil then
								InfoList[63]="("..tostring(s2)..")";
								InfoList[64]=tostring(s2);
								
								InfoList[65]=tostring(s2);
								
							end
						end
					else
						s1=InfoDisplay.GetFloat(tterrain.Attenuation,InfoDisplay.Rate);
						if s1~=nil then
							if dterrain~=nil then
								s2=InfoDisplay.GetFloat(dterrain.Attenuation,InfoDisplay.Rate);
								if s2~=nil then
									InfoList[63]=tostring(s1).."("..tostring(s2)..")";
									InfoList[64]=tostring(s2).."("..tostring(s1)..")";
									
									InfoList[65]=tostring(s2);
									InfoList[66]=tostring(s1);
								else
									InfoList[63]=tostring(s1);
									InfoList[64]="("..tostring(s1)..")";
									
									InfoList[66]=tostring(s1);
								end
							else
								InfoList[63]=tostring(s1);
								InfoList[64]="("..tostring(s1)..")";
								
								InfoList[66]=tostring(s1);
							end
							
						else
							if dterrain~=nil then
								s2=InfoDisplay.GetFloat(dterrain.Attenuation,InfoDisplay.Rate);
								if s2~=nil then
									InfoList[63]="("..tostring(s2)..")";
									InfoList[64]=tostring(s2);
									
									InfoList[65]=tostring(s2);
								
								end
							end
						end
					end
				end
				
				
				
				
				
-----------------------------------
			end
		end
		terrain= InfoDisplay.Map.Terrain:GetTerrain(key);
		if terrain~=nil then
			
			InfoDisplay.Map.Terrain:GetTerrainName(key, false);-----
			if InfoDisplay.Infos[5]==1 then
				InfoList[5]=terrain.DisplayName;
			end
			if InfoDisplay.Infos[3]==1 then
				InfoList[2]=InfoDisplay.GetFloat(InfoDisplay.Map:GetTemperature(key),InfoDisplay.Rate);
				InfoList[3]=InfoDisplay.GetValueDef(GameDefine.TemperatureDesc, InfoList[2]);
			end
			if InfoDisplay.Infos[4]==1 then
				InfoList[2]=InfoDisplay.GetFloat(InfoDisplay.Map:GetTemperature(key),InfoDisplay.Rate);
				InfoList[3]=InfoDisplay.GetValueDef(GameDefine.TemperatureDesc, InfoList[2]);
				InfoList[4]={InfoList[2],InfoList[3]};
			end
			if InfoDisplay.Infos[6]==1 then
				InfoList[6]=InfoDisplay.GetFloat(InfoDisplay.Map:GetBeauty(key),InfoDisplay.Rate);
			end
			if InfoDisplay.Infos[7]==1 then
				InfoList[6]=InfoDisplay.GetFloat(InfoDisplay.Map:GetBeauty(key),InfoDisplay.Rate);
				InfoList[7]=InfoDisplay.GetValueDef(GameDefine.BeautyDesc, InfoList[6]);
			end
			if InfoDisplay.Infos[8]==1 then
				InfoList[6]=InfoDisplay.GetFloat(InfoDisplay.Map:GetBeauty(key),InfoDisplay.Rate);
				InfoList[7]=InfoDisplay.GetValueDef(GameDefine.BeautyDesc, InfoList[6]);
				InfoList[8]={InfoList[6],InfoList[7]};
			end
			if InfoDisplay.Infos[9]==1 then
				InfoList[9]=InfoDisplay.GetFloat(InfoDisplay.Map:GetLight(key),InfoDisplay.Rate);
			end
			if InfoDisplay.Infos[10]==1 then
				InfoList[9]=InfoDisplay.GetFloat(InfoDisplay.Map:GetLight(key),InfoDisplay.Rate);
				InfoList[10]=InfoDisplay.GetValueDef(GameDefine.LightDesc, InfoList[9]);
			end
			if InfoDisplay.Infos[11]==1 then
				InfoList[9]=InfoDisplay.GetFloat(InfoDisplay.Map:GetLight(key),InfoDisplay.Rate);
				InfoList[10]=InfoDisplay.GetValueDef(GameDefine.LightDesc, InfoList[9]);
				InfoList[11]={InfoList[9],InfoList[10]};
			end
			if InfoDisplay.Infos[12]==1 then
				InfoList[12]=InfoDisplay.GetFloat(InfoDisplay.Map:GetFertility(key),InfoDisplay.Rate);
			end
			if InfoDisplay.Infos[13]==1 then
				InfoList[12]=InfoDisplay.GetFloat(InfoDisplay.Map:GetFertility(key),InfoDisplay.Rate);
				InfoList[13]=InfoDisplay.GetValueDef(GameDefine.FertilityDesc, InfoList[12]);
			end
			if InfoDisplay.Infos[14]==1 then
				InfoList[12]=InfoDisplay.GetFloat(InfoDisplay.Map:GetFertility(key),InfoDisplay.Rate);
				InfoList[13]=InfoDisplay.GetValueDef(GameDefine.FertilityDesc, InfoList[12]);
				InfoList[14]={InfoList[12],InfoList[13]};
			end
			
		end
		
	end
	if CS.XiaWorld.AreaMgr~=nil and CS.XiaWorld.AreaMgr.Instance~=nil then
		local AreaMgr=CS.XiaWorld.AreaMgr.Instance;
		if InfoDisplay.Infos[17]==1 then
			if AreaMgr:CheckArea(key, "Room") ~= nil then
				InfoList[15] = XT("(室)");
			end
			if terrain~=nil then
				if terrain.IsWater and InfoDisplay.Map.Snow:GetSnow(key) >= 200 then
					InfoList[16] = XT("(冰)");
				end
			end
			if InfoList[15]~=nil or InfoList[16]~=nil then
				InfoList[17] ={InfoList[15],InfoList[16]};
			end
		else
			if InfoDisplay.Infos[15]==1 then
				if AreaMgr:CheckArea(key, "Room") ~= nil then
					InfoList[15] = XT("(室)");
				end
			end
			if InfoDisplay.Infos[16]==1 then
				if terrain~=nil then
					if terrain.IsWater and InfoDisplay.Map.Snow:GetSnow(key) >= 200 then
						InfoList[16] = XT("(冰)");
					end
				end
			end
		end
	end
	bool=false;
	v=48;
	for k=39,v do
		if InfoDisplay.Infos[k]==1 then
			bool=true;
			break;
		end
	end
	if bool then
		if InfoDisplay.Infos[39]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(1);
			InfoList[39]=x1;
		end
		if InfoDisplay.Infos[40]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(1);
			InfoList[40]=x2;
		end
		if InfoDisplay.Infos[41]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(1);
			InfoList[41]=x3;
		end
		if InfoDisplay.Infos[42]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(1);
			InfoList[42]=tostring(x1).."-"..tostring(x2).."-"..tostring(x3);
		end
		if InfoDisplay.Infos[43]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(1);
			InfoList[43]=tostring(x2).."-"..tostring(x3);
		end
		if InfoDisplay.Infos[44]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(0);
			InfoList[44]=x1;
		end
		if InfoDisplay.Infos[45]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(0);
			InfoList[45]=x2;
		end
		if InfoDisplay.Infos[46]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(0);
			InfoList[46]=x3;
		end
		if InfoDisplay.Infos[47]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(0);
			InfoList[47]=tostring(x1)..":"..tostring(x2)..":"..tostring(x3);
		end
		if InfoDisplay.Infos[48]==1 then
			local x1,x2,x3=InfoDisplay.GetTime(0);
			InfoList[48]=tostring(x2)..":"..tostring(x3);
		end
		
	end
	if InfoDisplay.Infos[49]==1 then
		--local x1,x2,x3=InfoDisplay.GetTime(0);
		InfoList[49]=InfoDisplay.GetFrame(1);
	end
	if InfoDisplay.Infos[50]==1 then
		--local x1,x2,x3=InfoDisplay.GetTime(0);
		InfoList[50]=InfoDisplay.GetFloat(InfoDisplay.GetFrame(0),InfoDisplay.Rate);
	end
	return InfoList;
end
function InfoDisplay.GetInfoList(llist)
	local list,rlist;
	if llist==nil then
		list=InfoDisplay.GetInfoForelist();
	else
		list=llist;
	end
	if type(list)~="table" then
		return nil;
	end
	rlist={};
	local num;--=0;
	--num=num+1;
	local localKey,localValue;
	
	for num=1,#InfoDisplay.Infos do
		if InfoDisplay.Infos[num]==1 and list[num]~=nil and InfoDisplay.InfoShowList[num]~=nil then
			if type(list[num])=="table" and InfoDisplay.InfoShowList[num]~=nil then
				rlist[num]="";
				for localKey, localValue in pairs(list[num]) do
					if localValue~=nil and InfoDisplay.InfoShowList[num][localKey] then
						if localKey~=1 then
							rlist[num]=rlist[num]..InfoDisplay.Format[2]..InfoDisplay.Format[3][1]..InfoDisplay.InfoShowList[num][localKey]..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3]..tostring(localValue);
						else
							rlist[num]=rlist[num]..InfoDisplay.Format[3][1]..InfoDisplay.InfoShowList[num][localKey]..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3]..tostring(localValue);
						end
					end
				end
				--rlist[num]=InfoDisplay.Format[3][1]..InfoDisplay.InfoShowList[num][1]..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3]..tostring(list[num][1])..InfoDisplay.Format[2]..InfoDisplay.Format[3][1]..InfoDisplay.InfoShowList[num][2]..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3]..tostring(list[num][2]);
			else
				rlist[num]=InfoDisplay.Format[3][1]..InfoDisplay.InfoShowList[num]..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3]..tostring(list[num]);
			end
			rlist[num]="[color="..InfoDisplay.GetColor(num).."]"..rlist[num].."[/color]";
		end
	end
	return rlist;
end
function InfoDisplay.GetSortShowListDisplay()--得到排序后的提示列表
	if type(InfoDisplay.InfoShowList)~="table" then
		return nil;
	end
	rlist={};
	local num;--=0;
	local colors;
	local localKey,localValue;
	for num=1,#InfoDisplay.InfoShowList do
		if type(InfoDisplay.InfoShowList[num])=="table" then
			rlist[num]="";
			for localKey, localValue in pairs(InfoDisplay.InfoShowList[num]) do
				if localValue~=nil then
					if localKey~=1 then
						rlist[num]=rlist[num]..InfoDisplay.Format[2]..InfoDisplay.Format[3][1]..tostring(localValue)..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3].."XX";
					else
						rlist[num]=rlist[num]..InfoDisplay.Format[3][1]..tostring(localValue)..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3].."XX";
					end
				end
			end
			--rlist[num]=InfoDisplay.Format[3][1]..InfoDisplay.InfoShowList[num][1]..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3]..tostring(list[num][1])..InfoDisplay.Format[2]..InfoDisplay.Format[3][1]..InfoDisplay.InfoShowList[num][2]..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3]..tostring(list[num][2]);
		else
			rlist[num]=InfoDisplay.Format[3][1]..InfoDisplay.InfoShowList[num]..InfoDisplay.Format[3][2]..InfoDisplay.Format[1]..InfoDisplay.Format[3][3].."XX";
		end
			colors=InfoDisplay.GetColor2(num);
			if colors~=nil then
				if InfoDisplay.Infos[num]==1 then
					rlist[num]="[color=#00AA00]T[/color] ".."[color=#"..colors.."]"..rlist[num].."[/color]";
				else
					rlist[num]="[color=#AA0000]F[/color] ".."[color=#"..colors.."]"..rlist[num].."[/color]";
				end
			else
				if InfoDisplay.Infos[num]==1 then
					rlist[num]="[color=#00AA00]T[/color] "..rlist[num];
				else
					rlist[num]="[color=#AA0000]F[/color] "..rlist[num];
				end
			end
			
		--rlist[num]="[color="..InfoDisplay.GetColor(num).."]"..rlist[num].."[/color]";
	end
	rlist=InfoDisplay.GetInfoSortList(rlist,1);
	--local k,v;
	--for k, v in pairs(rlist) do
	--	print(k,"_",tostring(v),"\r\n");
	--end
	return rlist;
end
function InfoDisplay.GetInfoSortList(llist,t)
	local list,rlist;
	if llist==nil then
		list=InfoDisplay.GetInfoList();
	else
		list=llist;
	end
	if type(list)~="table" then
		return nil;
	end
	rlist={};
	local localKey,localValue;
	for localKey, localValue in pairs(InfoDisplay.InfosSortList) do
		if localValue~=nil then
			rlist[localValue]=list[localKey];
			--if t~=nil then
			--	print("H:",localKey,"-",localValue,"  ",list[localKey])
			--end
		end
	end
	return rlist;
end
function InfoDisplay.GetInfoSortListNoNil(llist)
	local list,rlist;
	if llist==nil then
		list=InfoDisplay.GetInfoSortList();
	else
		list=llist;
	end
	if type(list)~="table" then
		return nil;
	end
	rlist={};
	local localKey,localValue;
	local num;
	local num2=0;
	for num=1,#InfoDisplay.Infos do
		if list[num]~=nil then
			num2=num2+1;
			rlist[num2]=list[num];
			--print(list[num])
		end
	end
	--for localKey, localValue in pairs(list) do
	--	if localValue~=nil then
	--		num=num+1;
	--		rlist[num]=localValue;
	--		print(rlist[num])
	--	end
	--end
	return rlist;
end
function InfoDisplay.GetInfoDisplay(llist)
	local list,rlist;
	if llist==nil then
		list=InfoDisplay.GetInfoSortListNoNil();
	else
		list=llist;
	end
	if type(list)~="table" then
		return nil;
	end
	local localKey,localValue;
	local info="";
	for localKey, localValue in pairs(list) do
		if localValue~=nil then
			info=info..localValue.."\r\n";
		end
	end
	--print(info);
	if info=="" then
		return nil;
	end
	return info;
end
function InfoDisplay.SafeGetInfoDisplay(llist)
	local info=InfoDisplay.GetInfoDisplay(llist);
	if info==nil then
		info=InfoDisplay.InfoShowList[0];
	end
	return info;
end

function InfoDisplay.SetBtn(IsOn)
	
	if IsOn then
		if InfoDisplay.HadInt then
			local SpeedList = InfoDisplay.SpeedList;
			local ElementBtn = InfoDisplay.SaveBtn;
			SpeedList.width=InfoDisplay.SpeedBarLength/InfoDisplay.SpeedBarIconCount*(InfoDisplay.SpeedBarIconCount+1);
			ElementBtn.x = SpeedList.x + (SpeedList.width*0.9);
			local MyPool = SpeedList:GetFromPool(nil);
			InfoDisplay.SpeedBtn=SpeedList:AddChildAt(MyPool, 4);
			InfoDisplay.SpeedBtn.name = "fast3"
			InfoDisplay.SpeedBtn.tooltips = XT(tostring(InfoDisplay.MaxSpeed + TimeSetSpeed.speedLength).."倍速\n[keycode]SpeedP[/keycode]  降低速度\n[keycode]SpeedN[/keycode]  提升速度");
			SpeedList.onClickItem:Add(InfoDisplay.OnSpeedListMenuClick);
				InfoDisplay.SpeedBtn.m_icon.icon = InfoDisplay.Icon;
			InfoDisplay.SpeedBtn.m_icon.fill=CS.FairyGUI.FillType.Scale;
			GameMain:GetMod("_Event"):RegisterEvent(g_emEvent.GameSpeedChange, InfoDisplay.OnGameSpeedChange, "InfoDisplay");
		else
			if InfoDisplay.SpeedInte~=nil then
				InfoDisplay.SpeedInte();
			end
		end
		InfoDisplay.CanRun=true;
	else
		if InfoDisplay.SpeedBtn~=nil then
			--print("zheh")
			local SpeedList = InfoDisplay.SpeedList;
			local ElementBtn = InfoDisplay.SaveBtn;
			SpeedList.width=InfoDisplay.SpeedBarLength;
			ElementBtn.x = InfoDisplay.Savex;
			SpeedList:RemoveChildToPool(InfoDisplay.SpeedBtn);
			GameMain:GetMod("_Event"):UnRegisterEvent(g_emEvent.GameSpeedChange, "InfoDisplay");
			SpeedList.onClickItem:Remove(InfoDisplay.OnSpeedListMenuClick);
		end
		InfoDisplay.CanRun=false;
	end
end
-------------------------------UI相关
function InfoDisplay.AddInput2(objs,name,value,x,y,w,h,topText)
	if InfoDisplay.IsInModModifiers then
		return QFWDModifierMainUI:AddInput2(objs,name,value,x,y,w,h,topText);
	end
	local obj = objs:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.m_title.singleLine=true;
	obj.name = name;
	if w~=nil and h~=nil then
		obj:SetSize(w, h);
	end
	if tostring(topText)~=nil and tostring(topText)~="nil" then
		obj.tooltips=topText;
	end
	return obj;
end
function InfoDisplay.AddLable2(objs,name,value,x,y,w,h,topText)
	if InfoDisplay.IsInModModifiers then
		return QFWDModifierMainUI:AddLable2(objs,name,value,x,y,w,h,topText);
	end
	local obj = objs:AddObjectFromUrl("ui://0xrxw6g7snk12s",x,y);
	obj.m_title.text = value;
	obj.m_title.singleLine=true;
	obj.name = name;
	obj.m_icon.visible=false;
	obj.m_icon.width=0;
	obj.m_title.align = CS.FairyGUI.AlignType.Left;
	obj.m_title.x=0;
	if tostring(topText)~=nil and tostring(topText)~="nil" then
		obj.tooltips=topText;
	end
	if w==nil or h==nil then
		w=80;
		h=25;
	end
	obj:SetSize(w, h);
	return obj;
end
function InfoDisplay.AddButton2(objs,name,value,x,y,w,h,topText)
	if InfoDisplay.IsInModModifiers then
		return QFWDModifierMainUI:AddButton2(objs,name,value,x,y,w,h,topText);
	end
	local obj = objs:AddObjectFromUrl("ui://0xrxw6g7hdhl18",x,y);
	if w==nil or h==nil then
		w=60;
		h=25;
	end
	obj:SetSize(w, h);
	obj.m_title.singleLine=true;
	obj.m_title.textFormat.bold=false;
	obj.m_title.textFormat.size=11;
	obj.m_title.autoSize=CS.FairyGUI.AutoSizeType.Both;
	obj.m_title.text = value;
	if tostring(topText)~=nil and tostring(topText)~="nil" then
		obj.tooltips=topText;
	end
	obj.name = name;
	return obj;
end
function InfoDisplay.AddCOP(name,x,y,window,text,Func)
	local obj = window:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	if Func==nil then
		Func=InfoDisplay.ListChildOnClick;
	end
	obj.m_list.onClickItem:Add(Func);
	if text==nil then
		text="功能列表";
	end
	obj.m_title.text = text;
	obj:SetSize(window.sx/10*4.3, window.sy/10*8, false);
	obj.m_list:SetSize(window.sx/10*4, window.sy/10*6.7, false);
	obj.m_dele.text="无";
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="无";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="无";
	obj.m_save:SetSize(0, 0, false);
	return obj;
end
function InfoDisplay.AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(680/10*5,30, false);
	obj.m_title.text = value;
	return obj;
end
function InfoDisplay.ListChildOnClick(Eventss)
	InfoDisplay.TheClickBnt = tonumber(Eventss.data.name);
	--print(tostring(Eventss.data.name))
	--InfoDisplay.ChooseID();
	InfoDisplayWindow.ChooseFunc(InfoDisplay.TheClickBnt);
	--InfoDisplay.FuncSortUpOrDown(obj,sortid,types);
end
-------------------------------
function InfoDisplay.ListAllFuncs(obj)
	local k,v;
	local sortList=InfoDisplay.GetSortShowListDisplay();
	if type(sortList)~="table" then
		return false;
	end
	obj.m_list:RemoveChildrenToPool();
	for num=1,#sortList do
		--if sortList[num]~=nil then
			InfoDisplay.AddChildToList(obj,tostring(num),tostring(sortList[num]));
		--end
	--for k, v in pairs(sortList) do
		--if v~=nil then
			--InfoDisplay.AddChildToList(obj,tostring(k),tostring(v));
		--end
	--end
	end
	InfoDisplay.SortListNow=sortList;
	return true,sortList;
end
function InfoDisplay.FuncUp(obj,id)--功能下移一位
	if id>1 then
		InfoDisplay.SetSortList(id,id-1);
		InfoDisplay.ListAllFuncs(obj);--刷新
		return id-1;
	end
	return false;
end
function InfoDisplay.FuncDown(obj,id)--功能上移一位
	if id >= #InfoDisplay.InfosSortList then
		return false;
	else
		InfoDisplay.SetSortList(id,id+1);--刷新
		InfoDisplay.ListAllFuncs(obj);
		return id+1;
	end
end
function InfoDisplay.FuncUpOrDown(obj,id,types)--功能上或下移一位，types==1上移
	if types==1 or types==nil then
		return InfoDisplay.FuncUp(obj,id);
	else
		return InfoDisplay.FuncDown(obj,id);
	end
end
function InfoDisplay.FuncSortUpOrDown(obj,sortid,types)--功能上或下移一位，types==1上移
	for k, v in pairs(InfoDisplay.InfosSortList) do
		if v==sortid then
			--print(v)
			if types==1 or types==nil then
				return InfoDisplay.FuncUp(obj,k);
			else
				return InfoDisplay.FuncDown(obj,k);
			end
		end
	end
	return false;
end
