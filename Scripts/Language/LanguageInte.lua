if QFLanguage~=nil and QFLanguage.HaveIn==true then
	return false;
end
QFLanguage = {};
QFLanguage.HaveIn=false;
function QFLanguage.OnInit()
	if QFLanguage.HaveIn then
		return false;
	end
	QFLanguage.Path="";
	QFLanguage.NowLangNum=2;
	QFLanguage.FileNum=1;
	QFLanguage.FileName=
	{
		"Chinese",
		--"English"
	};
	QFLanguage.LangDllCanUse=true;
	QFLanguage.Language={};
	QFLanguage.LangDisplayName={};
	QFLanguage.LangDisplayDesc={};
	QFLanguage.Path=QFWDModifierMainUI:GetPath();
	local IsTrue,ltable=QFLanguage:GetFileName();
	if IsTrue then
		QFLanguage.FileName=ltable;
	end
	local lk,lv;
	for lk, lv in pairs(QFLanguage.FileName) do
		if lv~=nil then
			QFLanguage:GetLanguage(lv);
		end
	end
	local NoErro,Lang = QFLanguage.ReadSetting();
	if NoErro then
		Lang=tostring(Lang);
		for lk, lv in pairs(QFLanguage.FileName) do
			if lv==Lang then
				QFLanguage.NowLangNum=tonumber(lk)+1;
			end
		end
	end
	QFLanguage:GetLangInfo();
	QFLanguage:ClearLangData();--清理多余的语言文件，释放内存
	QFLanguage.HaveIn=true;
end
function QFLanguage:ClearLangData()
	local lk,lv,k,v;
	local num=QFLanguage.NowLangNum;
	if QFLanguage.Language=={} then
		return false;
	end
	for lk, lv in pairs(QFLanguage.Language) do
		if lv~=nil and lv[num]~=nil then
			for k, v in pairs(lv) do
				if k~=1 and k~=num then
					lv[k]=nil;
				end
			end
		end
	end
end
function QFLanguage:GetLangInfo()
	local lk,lv;
	QFLanguage.LangDisplayName={};
	QFLanguage.LangDisplayDesc={};
	for lk, lv in pairs(QFLanguage.FileName) do
		if lv~=nil then
			QFLanguage.LangDisplayName[lk]=QFLanguage.GetText2(">LangDisplayName",tonumber(lk)+1);
			if QFLanguage.LangDisplayName[lk]==nil or QFLanguage.LangDisplayName[lk]=="Unknown" then
				QFLanguage.LangDisplayName[lk]=tostring(lv);
			end
			QFLanguage.LangDisplayDesc[lk]=QFLanguage.GetText2(">LangDisplayDesc",tonumber(lk)+1);
			if QFLanguage.LangDisplayDesc[lk]==nil or QFLanguage.LangDisplayDesc[lk]=="Unknown" then
				QFLanguage.LangDisplayDesc[lk]=tostring(lv);
			end
		end
	end
end
function QFLanguage:GetFileName()
	local ltable={};
	local num=1;
	local MePath=QFLanguage.Path;
	if MePath~=nil and MePath~="" then
		if ModifierMain.lib~=nil and QFLanguage.LangDllCanUse then
			local func=ModifierMain.lib:GetMethod("ReadTextLine");
			local Path=MePath.."//Language//"..tostring("LanguageID")..".txt";
			if func~=nil then
				QFStr=tostring(Path);
				local List=func:Invoke();
				if List~=nil then
					local lk,lv,num;
					num=0;
					for lk, lv in pairs(List) do
						if lv~=nil then
							num=num+1;
							ltable[num]=tostring(lv);
						end
					end
				end
			else
				local file,err = io.open(MePath.."//Language//"..tostring("LanguageID")..".txt", "r+");
				if err~=nil or file == nil then
					print("MOD版修改器:Language File open false!".."---"..tostring("LanguageID.txt"));
					return false;
				end
				local str = file:read();
				while str do
					if str~="" then
						ltable[num]=str;
						num=num+1;
					end
					str = file:read();
				end
				file:close();
			end
			if ltable~={} then
				return true,ltable;
			else
				return false;
			end
		else
			local file,err = io.open(MePath.."//Language//"..tostring("LanguageID")..".txt", "r+");
			if err~=nil or file == nil then
				print("MOD版修改器:Language File open false!".."---"..tostring("LanguageID.txt"));
				return false;
			end
			local str = file:read();
			while str do
				if str~="" then
					ltable[num]=str;
					num=num+1;
				end
				str = file:read();
			end
			file:close();
			if ltable~={} then
				return true,ltable;
			else
				return false;
			end
		end
	end
end
function QFLanguage:GetLanguage(name)
	local noError,str=QFLanguage.ReadFile(name);
	if QFLanguage.NowLangNum<2 then
		QFLanguage.NowLangNum=2;
	end
	if noError then
		if QFLanguage.AddLanguage(str) then
			print("MOD版修改器:Language File get true!".." ---"..tostring(name));
			--print(QFLanguage.GetText(">test"))
			return true;
		else
			print("MOD版修改器:Language File get false! Id 2".." ---"..tostring(name));
			return false;
		end
	else
		print("MOD版修改器:Language File get false! Id 1".." ---"..tostring(name));
		return false;
	end
end
function QFLanguage.ReadFile(name,types)
	local MePath=QFLanguage.Path;
	local Path;
	if types~=nil then
		Path=tostring(name);
	else
		Path=MePath.."//Language//"..tostring(name)..".txt";
	end
	if MePath~=nil and MePath~="" then
		if ModifierMain.lib~=nil and QFLanguage.LangDllCanUse then
			local func=ModifierMain.lib:GetMethod("ReadTextFile");
			if func~=nil then
				QFStr = tostring(Path);
				local List=func:Invoke();
				--print(tostring(List))
				print("MOD版修改器:Language File open success by dll!".."---"..tostring(name)..".txt");
				return true,tostring(List);
			else
				local file,err = io.open(Path, "r+");
				if err~=nil or file == nil then
					print("MOD版修改器:Language File open false!".."---"..tostring(name)..".txt");
					return false;
				end
				local str = file:read("*all");
				file:close();
				return true,str;
			end
		else
			local file,err = io.open(Path, "r+");
			if err~=nil or file == nil then
				print("MOD版修改器:Language File open false!".."---"..tostring(name)..".txt");
				return false;
			end
			local str = file:read("*all");
			file:close();
			return true,str;
		end
	end
end
function QFLanguage.ReadSetting()
	local MePath=QFLanguage.Path;
	
	if MePath~=nil and MePath~="" then
		local Path=MePath.."//Scripts//Language//"..tostring("Setting")..".txt";
		local bool,str = QFLanguage.ReadFile(Path,1);
		if bool then
			return true,str;
		else
			QFLanguage.WriteSetting(tostring(QFLanguage.FileName[QFLanguage.NowLangNum-1]));
		end
	end
end
function QFLanguage.WriteSetting(data)
	local MePath=QFLanguage.Path;
	if MePath~=nil and MePath~="" then
		local Path=MePath.."//Scripts//Language//"..tostring("Setting")..".txt";
		return QFLanguage.WriteFile(Path,data);
	end
end
function QFLanguage.WriteFile(Path,data)
	if Path~=nil then
		Path=tostring(Path);
	end
	
	if ModifierMain.lib~=nil and QFLanguage.LangDllCanUse then
		local func=ModifierMain.lib:GetMethod("WriteText");
		if func~=nil then
			QFStr=tostring(Path);
			QFStr2=tostring(data);
			local erro=func:Invoke();
			return erro;
		else
			local file,err = io.open(Path, "w");
			if err~=nil or file == nil then
				print("MOD版修改器:Language File open false!".."---"..tostring("Setting")..".txt");
				return false;
			end
			file:write(tostring(data));
			file:close();
			return true,str;
		end
	else
		local file,err = io.open(Path, "w");
		if err~=nil or file == nil then
			print("MOD版修改器:Language File open false!".."---"..tostring("Setting")..".txt");
			return false;
		end
		file:write(tostring(data));
		file:close();
		return true,str;
	end
end
function QFLanguage.AddLanguage(data)
	local noError,lData =QFLanguage.ReadLine(data);
	if not noError then
		return false;
	end
	-----
	QFLanguage.FileNum=QFLanguage.FileNum+1;
	if QFLanguage.FileNum<2 then
		QFLanguage.FileNum=2;
	end
	local lk,lv,lname,ldata;
	local lnum;
	local tnum=QFLanguage.FileNum;
	
	for lk, lv in pairs(lData) do
		if lv~=nil then
			lnum=string.find(lv, " ",1,true);
			
			if lnum~=nil and lnum>2 then
				lname=string.sub(lv,1,lnum-1);
				while true do
					if string.sub(lv,-1,-1)=="\n" or string.sub(lv,-1,-1)==" " then
						lv=string.sub(lv,1,-2);
					else
						break;
					end
				end
				ldata=string.sub(lv,lnum+1,-1);
				QFLanguage.AddWord(tnum,lname,ldata);
			end
		end
	end
	return true;
end
function QFLanguage.AddWord(num,name,data)
	if name==nil then
		return false;
	end
	local lk=QFLanguage.FindWord(name);
	local word;
	if lk ~=nil then
		word=QFLanguage.Language[lk];
		word[num]=data;
	else
		local lk,lv;
		local lnum=0;
		for lk, lv in pairs(QFLanguage.Language) do
			if lv==nil then
				lnum=lk-1;
				break;
			end
			lnum=lk;
		end
		lnum=lnum+1;
		local lword={};
		lword[1]=name;
		lword[num]=data;
		QFLanguage.Language[lnum]=lword;
	end
	return true;
end
function QFLanguage.GetText(name,num)
	if name==nil then
		return "Unknown";
	end
	if num==nil then
		num=QFLanguage.NowLangNum;
	end
	local tk,tv=QFLanguage.FindWord(name);
	if tk~=nil and tv~=nil then
		if tv[num]==nil then
			local lk,lv;
			for lk, lv in pairs(tv) do
				if lv~=nil then
					return tostring(lv);
				end
			end
			return "Unknown";
		else
			return tostring(tv[num]);
		end
	else
		print("MOD版修改器:".."False to get text --- "..tostring(name));
		return "Unknown";
	end
end
function QFLanguage.GetText2(name,num)
	if name==nil then
		print("MOD版修改器:".."Text name is Unknown!");
		return "Unknown";
	end
	if num==nil then
		num=QFLanguage.NowLangNum;
	end
	local tk,tv=QFLanguage.FindWord(name);
	if tk~=nil and tv~=nil then
		if tv[num]==nil then
			return "Unknown";
		else
			return tostring(tv[num]);
		end
	else
		print("MOD版修改器:".."False to get text --- "..tostring(name));
		return "Unknown";
	end
end
function QFLanguage.FindWord(name)
	local lk,lv;
	if QFLanguage.Language=={} then
		return nil,nil;
	end
	for lk, lv in pairs(QFLanguage.Language) do
		if lv~=nil and lv[1]==name then
			return lk,lv;
		end
	end
	return nil,nil;
end
function QFLanguage.ReadLine(data)
	local lData={};
	local lNum=0;
	if data==nil then
		return false;
	end
	local num1 = string.find(data, ">",1,true);
	local ld="";
	if num1==nil or num1<1 then
		return false;
	end
	local inLoop=true;
	local num2 = string.find(data, ">",num1+1,true);
	if num2==nil or num2<1 or num2-num1-1<0 then
		inLoop=false;
	end
	--print(tostring(string.sub(data,num2,num2+1)))
	--print(tostring(num1).."  "..tostring(num2))
	while inLoop do
		ld=string.sub(data,num1,num2-1);
		--print(tostring(string.sub(data,num2,num2+1)))
		if num2-num1-1>0 then
			lNum=lNum+1;
			lData[lNum]=ld;
			--print(tostring(lNum).."--"..tostring(ld))
		end
		--data=string.sub(data,num2,-1);
		--print(tostring(data))
		num1=num2;
		num2 = string.find(data, ">",num1+1,true);
		if num2==nil or num2<1 then
			inLoop=false;
		end
	end
	
	lNum=lNum+1;
	ld = string.sub(data,num1,-1);
	lData[lNum]=tostring(ld);
	
	return true,lData;
end

