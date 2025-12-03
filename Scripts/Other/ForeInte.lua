QFForeInte = {};
local key,Path=nil,nil;
local MyName="QFWDModeifiers";
local MyAppDomain=nil;
--QFForeInte.curWorld=nil;
QFForeInte.isInte=true;
local ModifierMain=nil;
function QFForeInte.OnInte()--预先载入

-----------------------载入dll-------------------
	World=QFForeInte.curWorld;
	if tonumber(key)==nil then
		print("MOD版修改器:Can not load Dll.");
	else
		--MyName=ModifierMain:GetMyName(key);
		QFForeInte.SetPath(key);
		ModifierMain:GetKeyDownFunc(QFForeInte,key);
		--if MyName=="Key cann't be used!" then
		--	print("MOD版修改器:Can not load Dll.");
		--end
		
		QFForeInte.LoadDll();
	end
	if QFLanguage~=nil then
		QFLanguage.OnInit();
	end
	--local GMod=CS.GameWatch.Instance;
	--if GMod~=nil and GMod ~= CS.XiaWorld.g_emGameMode.Fight then
-----------------------杂项修改-------------------
	QFForeInte.FightMap=false;
	
	--local PWrdMgr=CS.XiaWorld.World;
	--if PWrdMgr~=nil then
		local WrdMgr=QFForeInte.curWorld;
		if WrdMgr~=nil and WrdMgr.GameMode~=nil and WrdMgr.GameMode ~= CS.XiaWorld.g_emGameMode.Fight then
			--print(QFLanguage.GetText(">MODName")..":Isn't Fight Map!")
			if QFForeInte.CheckValue(1) then
				print(QFLanguage.GetText(">MODName")..":真仙模式");
				QFForeInte.ToZhenXian();
			end
			if QFForeInte.CheckValue(2) then
				print(QFLanguage.GetText(">MODName")..":堆叠上限");
				QFForeInte.ToRange9999();
			end
			if QFForeInte.CheckValue(3) then
				print(QFLanguage.GetText(">MODName")..":建筑血量");
				QFForeInte.ChangeBuilding99999();
			end
			if QFForeInte.CheckValue(4) then
				print(QFLanguage.GetText(">MODName")..":物品建筑美观");
				QFForeInte.ChangeBeauty999();
			end
			if QFForeInte.CheckValue(5) then
				print(QFLanguage.GetText(">MODName")..":物品聚灵范围");
				QFForeInte.ChangeAddLing9();
			end
			if QFForeInte.CheckValue(6) then
				print(QFLanguage.GetText(">MODName")..":物品聚灵");
				QFForeInte.ChangeLing999();
			end
		else
			QFForeInte.FightMap=true;
		end
	--end
	print(QFLanguage.GetText(">MODName")..":ModifierMain init");
	

end
function QFForeInte.SetValue(num,value)
	local head=78000;
	QFForeInte.curWorld:SetFlag(head+num, value);
	return true;
end
function QFForeInte.SetBool(num,value)
	if value==true then
		QFForeInte.SetValue(num,1);
	else
		QFForeInte.SetValue(num,0);
	end
	return true;
end
function QFForeInte.CheckValue(num)
	local head=78000;
	local num=QFForeInte.curWorld:GetFlag(head+num);
	if num==1 then
		return true;
	else
		return false;
	end
end
function QFForeInte.GetValue(num)
	local head=78000;
	local num=QFForeInte.curWorld:GetFlag(head+num);
	return num;
end
function QFForeInte.OnEnter()
	print(QFLanguage.GetText(">MODName")..":ModifierMain enter");
	--注册第二快捷键
	if CS.XiaWorld.InputMgr ~= nil and CS.XiaWorld.InputMgr.Instance~=nil then
		CS.XiaWorld.InputMgr.Instance:AddNewInputKeyData("ModifierMains", "MOD-辅助启动", "Mod", "PageUp", "PageDown", "", true)
	end
	--local PWrdMgr=CS.XiaWorld.World;
	--if PWrdMgr~=nil then
		local WrdMgr=QFForeInte.curWorld;
		if WrdMgr~=nil and WrdMgr.GameMode~=nil and WrdMgr.GameMode ~= CS.XiaWorld.g_emGameMode.Fight then
			
			if ModifierMain:FindWindow("OthersSet")~=nil then
				ModifierMain:FindWindow("OthersSet"):GameIn();
				print(QFLanguage.GetText(">MODName")..":OthersSet In!")
			end
			if ModifierMain:FindWindow("NpcManagerOtherPractice")~=nil then
				ModifierMain:FindWindow("NpcManagerOtherPractice"):GameIn();
				print(QFLanguage.GetText(">MODName")..":NpcManagerOtherPractice In!")
			end
		else
			print(QFLanguage.GetText(">MODName")..":Is Fight Map!")
		end
	--end
	
	if ModifierMain:FindWindow("EasyUse")~=nil then
		ModifierMain:FindWindow("EasyUse"):GameIn()
	end
	if QFForeInte.CheckValue(703) then
		ModifierMain.SpeedOpen=true;
	else
		ModifierMain.SpeedOpen=false;
	end
	ModifierMain.InSpeedFunc=false;
	if TimeSetSpeed == nil then
		ModifierMain.SpeedHadInt = true;
	end
end
function QFForeInte.ToZhenXian()
	local MyKey=CS.XiaWorld.GlobleDataMgr.Instance:GetUserKey();
	local OldKey=World.UserID;
	if MyKey~=OldKey then
		World.UserID=CS.XiaWorld.GlobleDataMgr.Instance:GetUserKey();
	end
	World.GameMode = CS.XiaWorld.g_emGameMode.HardCore;
	
end

function QFForeInte.ToRange9999()
	local _,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2);
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		if localValue~=nil and localValue.MaxStack~=nil then
			local bool1 = (localValue.Parent=="DrugBase" or localValue.Parent=="DanBase" or localValue.Parent=="SimpleFoodBase" or localValue.Parent=="Item_SoulCrystalBase" or localValue.Parent=="IngredientBase" or localValue.Parent=="LeftoverMaterialBase" or localValue.Parent=="MeatBase" or localValue.Parent=="MetalBlockBase");
			if bool1 then
				localValue.MaxStack=9999;
			else
				local bool2 = (localValue.Parent=="RockBlockBase" or localValue.Parent=="WoodBlockBase" or localValue.Parent=="LeatherBase" or localValue.Parent=="MetalBase" or localValue.Parent=="RockBase" or localValue.Parent=="WoodBase" or localValue.Parent=="Item_SpellPaper");
				if bool2 then
					localValue.MaxStack=9999;
				end
			end
		end
	end
end
function QFForeInte.ChangeBuilding99999()
	local _,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(4);
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		if localValue~=nil and localValue.MaxHitPoints~=nil then
			localValue.MaxHitPoints=99999;
		end
	end
	local list = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.Building);
	if list == nil then
		print("MOD版修改器:地图无建筑。")
		return
	end
	for localKey, localValue in pairs(list) do
		if localValue ~= nil and localValue.MaxHp~=nil then
			localValue:AddHealth(localValue.MaxHp-localValue.Hp);
			--print(item.Name)
		end
	
	end
end
function QFForeInte.ChangeBeauty999()
	local _,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2);
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		if localValue~=nil and localValue.Beauty~=nil then
			localValue.Beauty=999;
		end
	end
	_,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(3);
	num=1;
	localKey=nil;
	localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		if localValue~=nil and localValue.Beauty~=nil then
			localValue.Beauty=999;
		end
	end
	_,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(4);
	num=1;
	localKey=nil;
	localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		if localValue~=nil and localValue.Beauty~=nil then
			localValue.Beauty=999;
		end
	end
end
function QFForeInte.ChangeAddLing9()
	local _,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2);
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		if localValue~=nil and localValue.Ling~=nil and localValue.Ling.AddionRadius~=nil then
			localValue.Ling.AddionRadius=9;
		end
	end
end
function QFForeInte.ChangeLing999()
	local _,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2);
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(MapListDef) do 
		if localValue~=nil and localValue.Ling~=nil and localValue.Ling.AddionLing~=nil then
			localValue.Ling.AddionLing=999;
		end
	end
end


--------------------------------------------------------
function QFForeInte.SetKey(Key,Modifiers)
	key=Key;
	ModifierMain=Modifiers;
end
function QFForeInte.SetKeyDownKeyStr(Func)
	QFForeInte.GetKeyDownKeyStrS=Func;
end
function QFForeInte.GetKeyDownKeyStr(str)
	if QFForeInte.CheckValue(704) then
		if QFForeInte.GetKeyDownKeyStrS~=nil then
			return QFForeInte.GetKeyDownKeyStrS(str);
		end
	end
	return false;
end
function QFForeInte.SetKeyDownKeyCode(Func)
	QFForeInte.GetKeyDownKeyCodeS=Func;
end
function QFForeInte.GetKeyDownKeyCode(str)
	if QFForeInte.CheckValue(704) then
		if QFForeInte.GetKeyDownKeyCodeS~=nil then
			return QFForeInte.GetKeyDownKeyCodeS(str);
		end
	end
	return false;
end
function QFForeInte.SetKeyForeverDownKeyStr(Func)
	QFForeInte.GetKeyForeverDownStrS=Func;
end
function QFForeInte.GetKeyForeverDownStr(str)
	if QFForeInte.CheckValue(704) then
		if QFForeInte.GetKeyForeverDownStrS~=nil then
			return QFForeInte.GetKeyForeverDownStrS(str);
		end
	end
	return false;
end
function QFForeInte.SetKeyForeverDownKeyCode(Func)
	QFForeInte.GetKeyForeverDownCodeS=Func;
end
function QFForeInte.GetKeyForeverDownCode(str)
	if QFForeInte.CheckValue(704) then
		if QFForeInte.GetKeyForeverDownCodeS~=nil then
			return QFForeInte.GetKeyForeverDownCodeS(str);
		end
	end
	return false;
end
function QFForeInte.SetPath(key)
	Path=ModifierMain:GetMyPath(key);
	if Path=="Key cann't be used!" then
		return false;
	else
		return true;
	end
end
function QFForeInte.LoadDll()
	local dllType=1;
	local Me = CS.ModsMgr.Instance:FindMod(MyName, nil, true);
	--print(Me.Path)
	local MePath,MeDll,MyCInDll,MyDllObj,RAsm;
	if Me==nil or Me=="" then
		if Path==nil then
			dllType=0;
		else
			MePath=Path;
		end
	else
		MePath = Me.Path;
	end
	if dllType<=0 or MePath==nil or MePath=="" then
		QFForeInte.ThrowError(-1);
		return;
	else
		MeDll = MePath.."//Scripts//Lib//QFLib.dll";
	end
	if MeDll==nil or MeDll=="" then
		QFForeInte.ThrowError(-2);
		return;
	else
		RAsm = CS.System.Reflection.Assembly.LoadFrom(MeDll);
	end
	if RAsm==nil or RAsm=="" then
		QFForeInte.ThrowError(-3);
		return;
	else
		ModifierMain.lib = RAsm:GetType("QFLib.QFLib");
	end
	QFForeInte.ThrowError(1);
	--if MeDll==nil or MeDll=="" then
	--	QFForeInte.ThrowError(-2);
	--	return;
	--else
	--	MyAppDomain=CS.System.AppDomain.CreateDomain("MODModifiers");
	--end
	--if MyAppDomain==nil then
	--	QFForeInte.ThrowError(-3);
	--	return;
	--else
	--	MyCInDll=MyAppDomain.CreateInstanceFrom(MeDll,"QFLib.QFLib");
	--	if MyCInDll==nil then
	--		QFForeInte.ThrowError(-4);
	--		return;
	--	else
	--		MyDllObj=MyCInDll.Unwrap();
	--	end
	--end
	--ModifierMain.lib = MyDllObj:GetType();
	--print(tostring(ModifierMain.lib));
	--ModifierMain.lib=nil;
	----MyDllObj.LoadAssembly();
	--RAsm = CS.System.Reflection.Assembly.LoadFrom(MeDll);
	
	--ModifierMain.lib = RAsm:GetType("QFLib.QFLib");
end
function QFForeInte.ThrowError(id)
	if id<=0 then
		ModifierMain.lib = nil;
		print("MOD版修改器:载入动态库失败！","错误编号:",tostring(dllType));
	else
		
		if ModifierMain.lib==nil then
			dllType=-4;
			print("MOD版修改器:载入动态库失败！","错误编号:",tostring(dllType));
		else
			print("MOD版修改器:载入动态库成功！");
		end
	end
end