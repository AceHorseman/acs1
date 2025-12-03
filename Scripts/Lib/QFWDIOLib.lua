if QFWDIOLib~=nil then
	return;
end
QFWDIOLib=GameMain:GetMod("QFWDIOLib");
QFWDIOLib.fileListPath=nil;
QFWDIOLib.loadFile=nil;
QFWDIOLib.outFile=nil;
QFWDIOLib.stringsIn=nil;
QFWDIOLib.stringsOut=nil;
QFWDIOLib.stringTableIn={};
QFWDIOLib.stringTableOut={};
QFWDIOLib.stringTableOutFore={"QFWDModifiersWrite","0","0","0","0","0","0","0","0","0"};
--第2项:文件类型1-5，地图助手使用。6，角色。
function QFWDIOLib:GetFileAll()--读取指定文件
	if QFWDIOLib.loadFile==nil then
		print("Input file is nil!")
		return false;
	end
	
	local file,err = io.open(QFWDIOLib.loadFile, "r+");
	if err~=nil or file==nil then
		print("No file:"..tostring(QFWDIOLib.loadFile));
		return false;
	end
	QFWDIOLib.stringsIn=nil;
	--file:write("Hello World!")
	QFWDIOLib.stringsIn = file:read("*all");
	file:close();
	return true;
end
function QFWDIOLib:WriteFileAll()--字符串写入
	if QFWDIOLib.stringsOut==nil then
		print("Out is nil!");
		return false;
	end
	if QFWDIOLib.loadFile==nil then
		print("Out file is nil!");
		return false;
	end
	local file,err = io.open(QFWDIOLib.outFile, "w");
	if err~=nil or file == nil then
		print("File open false!");
		return false;
	end
	QFWDIOLib.stringsOut=nil;
	file:write(stringsOut);
	file:close();
	return true;
end
function QFWDIOLib:ReadMyFile(dic)--读取文件，包括属性与内容分开
	if QFWDIOLib:ReadStrDic(dic) or QFWDIOLib:ReadFileLine() then
		local a,b=1,1;
		local k,v;
		local list1,list2={},{};
		for k, v in pairs(QFWDIOLib.stringTableIn) do
			if k<1 then
				list1[a]=v;
				--print(v)
				a=a+1;
			else
				list2[b]=v;
				b=b+1;
			end
		end
		QFWDIOLib.stringTableOutFore[1]="QFWDModifiersWrite";
		for a=2,#QFWDIOLib.stringTableOutFore do
			QFWDIOLib.stringTableOutFore[a]=list1[a+1];
		end
		
		QFWDIOLib.stringTableIn=list2;
		return true;
	else
		return false;
	end
end
function QFWDIOLib:ReadStrDic(Dic)--逐行读取文件函数
	if Dic==nil then
		return false;
	end
	QFWDIOLib.stringTableIn={};
	local num=-#QFWDIOLib.stringTableOutFore+1;
	local k,v;
	local fileTab = {};--创建一个局部变量表
	for k, v in pairs(Dic) do
		fileTab[num]=v;--在fileTab表末尾插入读取line内容
		num=num+1;
	end
	QFWDIOLib.stringTableIn = fileTab;
	return true--内容读取完毕
end
function QFWDIOLib:ReadFileLine()--逐行读取文件函数
	local file,err=io.open(QFWDIOLib.loadFile, "r+");
	if err~=nil or file==nil then
		print("No file:"..tostring(QFWDIOLib.loadFile));
		return false;
	end
	local fileTab = {};--创建一个局部变量表
	local line = file:read();--读取文件中的单行内容存为另一个变量
	if line~= "QFWDModifiersWrite" then
		print("不支持该文件!");
		file:close();
		return false;
	end
	QFWDIOLib.stringTableIn={};
	local num=-#QFWDIOLib.stringTableOutFore+1;
	while line do--当读取一行内容为真时
		--print("get lin 获取行内容：",line)--打印读取的逐行line的内容
		fileTab[num]=line;--在fileTab表末尾插入读取line内容
		line = file:read();--读取下一行内容
		num=num+1;
		--notifyMessage(string.format("%s",line))
	end
	--print(tostring(fileTab[1]))
	QFWDIOLib.stringTableIn = fileTab;
	file:close();
	return true--内容读取完毕
end
function QFWDIOLib:ReadFileSetting()--逐行读取文件设置
	local file,err=io.open(QFWDIOLib.loadFile, "r+");
	if err~=nil or file==nil then
		print("No file:"..tostring(QFWDIOLib.loadFile));
		return false;
	end
	local fileTab = {};--创建一个局部变量表
	local line = file:read();--读取文件中的单行内容存为另一个变量
	if line~= "QFWDModifiersWrite" then
		print("不支持该文件!");
		return false;
	end
	fileTab[1]=line;
	--print(tostring(line))
	QFWDIOLib.stringTableIn={};
	local num=nil;
	for num=2,#QFWDIOLib.stringTableOutFore do--当读取一行内容为真时
		--print("get lin 获取行内容：",line)--打印读取的逐行line的内容
		line = file:read();--读取下一行内容
		--print(tostring(line))
		fileTab[num]=line;--在fileTab表末尾插入读取line内容
		--notifyMessage(string.format("%s",line))
	end
	--print(tostring(fileTab[1]))
	QFWDIOLib.stringTableIn = fileTab;
	file:close();
	return true--内容读取完毕
end
function QFWDIOLib:WriteFileSetting()--逐行写入文件函数
	local file,err=io.open(QFWDIOLib.loadFile, "w");
	if err~=nil or file==nil then
		print("No file:"..tostring(QFWDIOLib.loadFile));
		return false;
	end
	local localKey=nil;
	local localValue=nil;
	for localKey,localValue in ipairs(QFWDIOLib.stringTableOutFore) do--遍历表中的所有记录
		file:write(tostring(localValue).."\n");--把遍历的内容逐行写入文件中--逐行内容换行打回车
		--file:write("\n");
	end
	file:close();
	return true--内容写入完毕
end
function QFWDIOLib:ReadFileInfo()--逐行读取文件函数
	local file,err=io.open(QFWDIOLib.loadFile, "r");
	if err~=nil or file==nil then
		print("No file:"..tostring(QFWDIOLib.loadFile));
		return false;
	end
	local fileTab = {};--创建一个局部变量表
	local line = file:read();--读取文件中的单行内容存为另一个变量
	if line~= "QFWDModifiersWrite" then
		print("不支持该文件!");
		file:close();
		return false;
	end
	QFWDIOLib.stringTableIn={};
	fileTab[-#QFWDIOLib.stringTableOutFore+1]=line;
	local num=nil;
	for num=-#QFWDIOLib.stringTableOutFore+2, 0 do--当读取一行内容为真时
		--print("get lin 获取行内容：",line)--打印读取的逐行line的内容
		line = file:read();--读取下一行内容
		fileTab[num]=line;--在fileTab表末尾插入读取line内容
		--num=num+1;
		--notifyMessage(string.format("%s",line))
	end
	--print(tostring(fileTab[1]))
	QFWDIOLib.stringTableIn = fileTab;
	file:close();
	return true--内容读取完毕
end
function QFWDIOLib:writeFileLine()--逐行写入文件函数（文件参数，表参数）
	local file,err=io.open(QFWDIOLib.outFile, "w");
	if err~=nil or file==nil then
		print("No file:"..tostring(QFWDIOLib.outFile));
		return false;
	end
	local fileTab=QFWDIOLib.stringTableOut;
	if fileTab==nil or fileTab=={} then
		print("Table is empty!");
		file:close();
		return false;
	end
	local localKey=nil;
	local localValue=nil;
	for localKey,localValue in ipairs(QFWDIOLib.stringTableOutFore) do--遍历表中的所有记录
		file:write(tostring(localValue).."\n");--把遍历的内容逐行写入文件中--逐行内容换行打回车
		--file:write("\n");
	end
	--file:write("QFWDModifiersWrite\n");
	for localKey,localValue in ipairs(fileTab) do--遍历表中的所有记录
		file:write(tostring(localValue).."\n");--把遍历的内容逐行写入文件中--逐行内容换行打回车
		--file:write("\n");
	end
	QFWDIOLib.stringTableOut={};
	file:close();
	return true;
end
function QFWDIOLib:GetWriteFileLineStr()--获取逐行写入文件函数（文件参数，表参数）应写出的字符。
	--local file,err=io.open(QFWDIOLib.outFile, "w");
	--if err~=nil or file==nil then
	--	print("No file:"..tostring(QFWDIOLib.outFile));
	--	return false;
	--end
	local fileTab=QFWDIOLib.stringTableOut;
	if fileTab==nil or fileTab=={} then
		print("Table is empty!");
		return nil;
	end
	local localKey=nil;
	local localValue=nil;
	local OutStr="";
	for localKey,localValue in ipairs(QFWDIOLib.stringTableOutFore) do--遍历表中的所有记录
		OutStr=OutStr..tostring(localValue).."\n";
		--file:write(tostring(localValue).."\n");--把遍历的内容逐行写入文件中--逐行内容换行打回车
		--file:write("\n");
	end
	--file:write("QFWDModifiersWrite\n");
	for localKey,localValue in ipairs(fileTab) do--遍历表中的所有记录
		OutStr=OutStr..tostring(localValue).."\n";
		--file:write(tostring(localValue).."\n");--把遍历的内容逐行写入文件中--逐行内容换行打回车
		--file:write("\n");
	end
	--QFWDIOLib.stringTableOut={};
	--file:close();
	return OutStr;
end
function QFWDIOLib:ReadFileList()--读入文件列表
	local path=nil;
	local num=1;
	local filesTab={};
	local filesTab2={};
	local filesTabNum=1;
	local erroNum=0;
	local jcNum=1;
	while true do
		path=QFWDIOLib.fileListPath.."QFWDModifiersSave"..tostring(num)..".txt";
		local file,err=io.open(path, "r");
		if file==nil then
			erroNum=erroNum+1;
			if erroNum>12 then
				break;
			end
		else
			file:close();
			filesTab[filesTabNum]=path;
			filesTab2[filesTabNum]="QFWDModifiersSave"..tostring(num)..".txt";
			filesTabNum=filesTabNum+1;
		end
		num=num+1;
	end
	return filesTab,filesTab2;
end
function QFWDIOLib:CheckPath(path)--判断文件地址
	local file,err=io.open(path, "a");
	if file==nil then
		return false;
	else
		file:close();
		return true;
	end
end