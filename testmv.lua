require "lib.moonloader"
inicfg = require 'inicfg'
local imgui = require 'imgui'
local key = require 'vkeys'
local encoding = require 'encoding' -- загружаем библиотеку
encoding.default = 'CP1251' -- указываем кодировку по умолчанию, она должна совпадать с кодировкой файла. CP1251 - это Windows-1251
u8 = encoding.UTF8 -- и создаём короткий псевдоним для кодировщика UTF-8



local inicfg = require 'inicfg'

local mainIni = inicfg.load({
  settings =
  {
    phone = 'none',
    dol = 'none',
    name = 'none',
	style = 0
  }
}, '..\\config\\MVDLead.ini')


local main_menu = imgui.ImBool(false)
local one_menu = imgui.ImBool(false)
local second_menu = imgui.ImBool(false)
local second_menu_1 = imgui.ImBool(false)
local second_menu_2 = imgui.ImBool(false)
local second_menu_3 = imgui.ImBool(false)
local second_menu_4 = imgui.ImBool(false)
local tree_menu = imgui.ImBool(false)
local tree_menu_1 = imgui.ImBool(false)
local tree_menu_2 = imgui.ImBool(false)
local tree_menu_3 = imgui.ImBool(false)
local fo_menu = imgui.ImBool(false)
local five_menu = imgui.ImBool(false)
local six_menu = imgui.ImBool(false)
local seven_menu = imgui.ImBool(false)
local ten_menu = imgui.ImBool(false)
local ten_menu_one = imgui.ImBool(false)
local save_phone = imgui.ImBuffer(u8''..mainIni.settings.phone,256)
local save_name = imgui.ImBuffer(u8''..mainIni.settings.name,256)
local save_dol = imgui.ImBuffer(u8''..mainIni.settings.dol,256)
local new_id = imgui.ImInt(-1)
local pls = imgui.ImInt(0)
local psf = imgui.ImInt(0)
local plv = imgui.ImInt(0)
local new_frak = imgui.ImInt(0)
local newi = 'none'
local frak = 'none'
local vig_n = imgui.ImBuffer(256)
local vig_p = imgui.ImBuffer(256)
local binder = imgui.ImBuffer(1024)
local posls = 0
local possf = 0
local poslv = 0
local st = 0
local style_set = imgui.ImInt(mainIni.settings.style)
local style = mainIni.settings.style
local save_rpw = imgui.ImBool(false)
local save_su = imgui.ImBool(false)
local save_eject = imgui.ImBool(false)
local save_putpl = imgui.ImBool(false)
local save_arrest = imgui.ImBool(false)
local save_hold = imgui.ImBool(false)
local save_invite = imgui.ImBool(false)
local save_uninvite = imgui.ImBool(false)
local save_rang = imgui.ImBool(false)
local save_changeskin = imgui.ImBool(false)
local save_search = imgui.ImBool(false)
local save_cuff = imgui.ImBool(false)
local save_takelic = imgui.ImBool(false)
local save_ticket = imgui.ImBool(false)
local rpw = -1
local su = -1
local eject = -1
local putpl = -1
local arrest = -1
local hold = -1
local invite = -1
local uninvite = -1
local rang = -1
local changeskin = -1
local search = -1
local cuff = -1
local ticket = -1
local takelic = -1

if mainIni.settings.rpw == 1 then save_rpw = imgui.ImBool(true) end
if mainIni.settings.su == 1 then save_su = imgui.ImBool(true) end
if mainIni.settings.eject == 1 then save_eject = imgui.ImBool(true) end
if mainIni.settings.putpl == 1 then save_putpl = imgui.ImBool(true) end
if mainIni.settings.arrest == 1 then save_arrest = imgui.ImBool(true) end
if mainIni.settings.hold == 1 then save_hold = imgui.ImBool(true) end
if mainIni.settings.invite == 1 then save_invite = imgui.ImBool(true) end
if mainIni.settings.uninvite == 1 then save_uninvite = imgui.ImBool(true) end
if mainIni.settings.rang == 1 then save_rang = imgui.ImBool(true) end
if mainIni.settings.changeskin == 1 then save_changeskin = imgui.ImBool(true) end
if mainIni.settings.search == 1 then save_search = imgui.ImBool(true) end
if mainIni.settings.cuff == 1 then save_cuff = imgui.ImBool(true) end
if mainIni.settings.ticket == 1 then save_ticket = imgui.ImBool(true) end
if mainIni.settings.takelic == 1 then save_takelic = imgui.ImBool(true) end


if style == 0 then 
function apply_custom_style()
		imgui.SwitchContext()
		local style = imgui.GetStyle()
		local colors = style.Colors
		local clr = imgui.Col
		local ImVec4 = imgui.ImVec4

		style.WindowRounding = 2.0
		style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
		style.ChildWindowRounding = 2.0
		style.FrameRounding = 2.0
		style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
		style.ScrollbarSize = 13.0
		style.ScrollbarRounding = 0
		style.GrabMinSize = 8.0
		style.GrabRounding = 1.0
		colors[clr.Text]            		= ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.TextDisabled]        	= ImVec4(0.50, 0.50, 0.50, 1.00)
		colors[clr.WindowBg]           		= ImVec4(0.06, 0.06, 0.06, 0.94)
		colors[clr.ChildWindowBg]       	= ImVec4(1.00, 1.00, 1.00, 0.00)
		colors[clr.PopupBg]            		= ImVec4(0.08, 0.08, 0.08, 0.94)
		colors[clr.ComboBg]           		= colors[clr.PopupBg]
		colors[clr.Border]            		= ImVec4(0.43, 0.43, 0.50, 0.50)
		colors[clr.BorderShadow]        	= ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.FrameBg]            		= ImVec4(0.16, 0.29, 0.48, 0.54)
		colors[clr.FrameBgHovered]      	= ImVec4(0.26, 0.59, 0.98, 0.40)
		colors[clr.FrameBgActive]       	= ImVec4(0.26, 0.59, 0.98, 0.67)
		colors[clr.TitleBg]            		= ImVec4(0.04, 0.04, 0.04, 1.00)
		colors[clr.TitleBgActive]       	= ImVec4(0.16, 0.29, 0.48, 1.00)
		colors[clr.TitleBgCollapsed]   		= ImVec4(0.00, 0.00, 0.00, 0.51)
		colors[clr.MenuBarBg]           	= ImVec4(0.14, 0.14, 0.14, 1.00)
		colors[clr.ScrollbarBg]        		= ImVec4(0.02, 0.02, 0.02, 0.53)
		colors[clr.ScrollbarGrab]       	= ImVec4(0.31, 0.31, 0.31, 1.00)
		colors[clr.ScrollbarGrabHovered]	= ImVec4(0.41, 0.41, 0.41, 1.00)
		colors[clr.ScrollbarGrabActive] 	= ImVec4(0.51, 0.51, 0.51, 1.00)
		colors[clr.CheckMark]           	= ImVec4(0.26, 0.59, 0.98, 1.00)
		colors[clr.SliderGrab]         		= ImVec4(0.24, 0.52, 0.88, 1.00)
		colors[clr.SliderGrabActive]    	= ImVec4(0.26, 0.59, 0.98, 1.00)
		colors[clr.Button]            		= ImVec4(0.26, 0.59, 0.98, 0.40)
		colors[clr.ButtonHovered]       	= ImVec4(0.26, 0.59, 0.98, 1.00)
		colors[clr.ButtonActive]        	= ImVec4(0.06, 0.53, 0.98, 1.00)
		colors[clr.Header]            		= ImVec4(0.26, 0.59, 0.98, 0.31)
		colors[clr.HeaderHovered]       	= ImVec4(0.26, 0.59, 0.98, 0.80)
		colors[clr.HeaderActive]        	= ImVec4(0.26, 0.59, 0.98, 1.00)
		colors[clr.Separator]           	= colors[clr.Border]
		colors[clr.SeparatorHovered]    	= ImVec4(0.26, 0.59, 0.98, 0.78)
		colors[clr.SeparatorActive]     	= ImVec4(0.26, 0.59, 0.98, 1.00)
		colors[clr.ResizeGrip]          	= ImVec4(0.26, 0.59, 0.98, 0.25)
		colors[clr.ResizeGripHovered]   	= ImVec4(0.26, 0.59, 0.98, 0.67)
		colors[clr.ResizeGripActive]    	= ImVec4(0.26, 0.59, 0.98, 0.95)
		colors[clr.CloseButton]        		= ImVec4(0.41, 0.41, 0.41, 0.50)
		colors[clr.CloseButtonHovered]  	= ImVec4(0.98, 0.39, 0.36, 1.00)
		colors[clr.CloseButtonActive]   	= ImVec4(0.98, 0.39, 0.36, 1.00)
		colors[clr.PlotLines]           	= ImVec4(0.61, 0.61, 0.61, 1.00)
		colors[clr.PlotLinesHovered]    	= ImVec4(1.00, 0.43, 0.35, 1.00)
		colors[clr.PlotHistogram]       	= ImVec4(0.90, 0.70, 0.00, 1.00)
		colors[clr.PlotHistogramHovered]	= ImVec4(1.00, 0.60, 0.00, 1.00)
		colors[clr.TextSelectedBg]      	= ImVec4(0.26, 0.59, 0.98, 0.35)
		colors[clr.ModalWindowDarkening]	= ImVec4(0.80, 0.80, 0.80, 0.35)

	end

	apply_custom_style()
end

if style == 1 then 
function apply_custom_style()
		imgui.SwitchContext()
		local style = imgui.GetStyle()
		local colors = style.Colors
		local clr = imgui.Col
		local ImVec4 = imgui.ImVec4

		style.WindowRounding = 2.0
		style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
		style.ChildWindowRounding = 2.0
		style.FrameRounding = 2.0
		style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
		style.ScrollbarSize = 13.0
		style.ScrollbarRounding = 0
		style.GrabMinSize = 8.0
		style.GrabRounding = 1.0
	   colors[clr.Text] 					= ImVec4(1.00, 1.00, 1.00, 1.00)
	   colors[clr.TextDisabled] 			= ImVec4(0.50, 0.50, 0.50, 1.00)
	   colors[clr.WindowBg] 				= imgui.ImColor(0, 0, 0, 227):GetVec4()
	   colors[clr.ChildWindowBg] 			= ImVec4(1.00, 1.00, 1.00, 0.00)
	   colors[clr.PopupBg] 					= ImVec4(0.08, 0.08, 0.08, 0.94)
	   colors[clr.ComboBg] 					= colors[clr.PopupBg]
	   colors[clr.Border] 					= imgui.ImColor(40, 142, 110, 90):GetVec4()
	   colors[clr.BorderShadow] 			= ImVec4(0.00, 0.00, 0.00, 0.00)
	   colors[clr.FrameBg] 					= imgui.ImColor(40, 142, 110, 113):GetVec4()
	   colors[clr.FrameBgHovered] 			= imgui.ImColor(40, 142, 110, 164):GetVec4()
	   colors[clr.FrameBgActive] 			= imgui.ImColor(40, 142, 110, 255):GetVec4()
	   colors[clr.TitleBg] 					= imgui.ImColor(40, 142, 110, 236):GetVec4()
	   colors[clr.TitleBgActive] 			= imgui.ImColor(40, 142, 110, 236):GetVec4()
	   colors[clr.TitleBgCollapsed] 		= ImVec4(0.05, 0.05, 0.05, 0.79)
	   colors[clr.MenuBarBg] 				= ImVec4(0.14, 0.14, 0.14, 1.00)
	   colors[clr.ScrollbarBg] 				= ImVec4(0.02, 0.02, 0.02, 0.53)
	   colors[clr.ScrollbarGrab] 			= imgui.ImColor(40, 142, 110, 236):GetVec4()
	   colors[clr.ScrollbarGrabHovered] 	= ImVec4(0.41, 0.41, 0.41, 1.00)
	   colors[clr.ScrollbarGrabActive] 		= ImVec4(0.51, 0.51, 0.51, 1.00)
	   colors[clr.CheckMark] 				= ImVec4(1.00, 1.00, 1.00, 1.00)
	   colors[clr.SliderGrab] 				= ImVec4(0.28, 0.28, 0.28, 1.00)
	   colors[clr.SliderGrabActive] 		= ImVec4(0.35, 0.35, 0.35, 1.00)
	   colors[clr.Button] 					= imgui.ImColor(40, 142, 110, 255):GetVec4()
	   colors[clr.ButtonHovered] 			= imgui.ImColor(35, 121, 93, 174):GetVec4()
	   colors[clr.ButtonActive] 			= imgui.ImColor(44, 154, 119, 255):GetVec4()
	   colors[clr.Header] 					= imgui.ImColor(40, 142, 110, 255):GetVec4()
	   colors[clr.HeaderHovered] 			= ImVec4(0.34, 0.34, 0.35, 0.89)
	   colors[clr.HeaderActive] 			= ImVec4(0.12, 0.12, 0.12, 0.94)
	   colors[clr.Separator] 				= colors[clr.Border]
	   colors[clr.SeparatorHovered] 		= ImVec4(0.26, 0.59, 0.98, 0.78)
	   colors[clr.SeparatorActive] 			= ImVec4(0.26, 0.59, 0.98, 1.00)
	   colors[clr.ResizeGrip] 				= imgui.ImColor(40, 142, 110, 255):GetVec4()
	   colors[clr.ResizeGripHovered] 		= imgui.ImColor(35, 121, 93, 174):GetVec4()
	   colors[clr.ResizeGripActive] 		= imgui.ImColor(44, 154, 119, 255):GetVec4()
	   colors[clr.CloseButton] 				= ImVec4(0.41, 0.41, 0.41, 0.50)
	   colors[clr.CloseButtonHovered] 		= ImVec4(0.98, 0.39, 0.36, 1.00)
	   colors[clr.CloseButtonActive] 		= ImVec4(0.98, 0.39, 0.36, 1.00)
	   colors[clr.PlotLines] 				= ImVec4(0.61, 0.61, 0.61, 1.00)
	   colors[clr.PlotLinesHovered] 		= ImVec4(1.00, 0.43, 0.35, 1.00)
	   colors[clr.PlotHistogram] 			= ImVec4(0.90, 0.70, 0.00, 1.00)
	   colors[clr.PlotHistogramHovered] 	= ImVec4(1.00, 0.60, 0.00, 1.00)
	   colors[clr.TextSelectedBg] 			= ImVec4(0.26, 0.59, 0.98, 0.35)
	   colors[clr.ModalWindowDarkening] 	= ImVec4(0.10, 0.10, 0.10, 0.35)
	end

apply_custom_style()

end


function imgui.OnDrawFrame()
  if main_menu.v then
  local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	imgui.SetNextWindowSize(imgui.ImVec2(295, 200), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Leader-MVD | v. 1.2 beta', main_menu)
	if imgui.Button(u8'���������',imgui.ImVec2(280, 20)) then
		one_menu.v = not one_menu.v end
	if imgui.Button(u8'���. �������',imgui.ImVec2(280, 20)) then
		second_menu.v = not second_menu.v end
	if imgui.Button(u8'�������� ������ �������������',imgui.ImVec2(280, 20)) then
		tree_menu.v = not tree_menu.v end	
	if imgui.Button(u8'�������� � �����',imgui.ImVec2(280, 20)) then
		fo_menu.v = not fo_menu.v end
	if imgui.Button(u8'��������� ������',imgui.ImVec2(280, 20)) then
		five_menu.v = not five_menu.v end
	if imgui.Button(u8'������� ������',imgui.ImVec2(280, 20)) then
		--six_menu.v = not six_menu.v end
		printStringNow("It's not working", 2000)
		sampAddChatMessage("[Leader-MVD] {FFFFFF} �������� �� ��������.", 0x4b58ebFF)
		end
	if imgui.Button(u8'��� ����������',imgui.ImVec2(280, 20)) then
		seven_menu.v = not seven_menu.v end
	imgui.End()
	end
   if one_menu.v then
   local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, -0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(852, 220), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'���������� | v. 1.2 beta', one_menu)
		imgui.BeginChild('left pane', imgui.ImVec2(150, 0), true)
		if not selected then selected = 1 end
        if imgui.Selectable(u8('���������'), selected == 1) then selected = 1 end
        if imgui.Selectable(u8('�������'), selected == 2) then selected = 2 end
        if imgui.Selectable(u8('����������'), selected == 3) then selected = 3 end
        if imgui.Selectable(u8('����������'), selected == 4) then selected = 4 end
        if imgui.Selectable(u8('����������'), selected == 5) then selected = 5 end
        imgui.EndChild()
        imgui.SameLine()
        imgui.BeginGroup()
        if selected == 1 then 
			imgui.Columns(3)
			imgui.SetColumnWidth(-1, 280)
				if imgui.Combo(u8'����� �������', style_set, {u8'����� 1',u8'����� 2'}) then 
				if style_set.v == '����� 1' then style = 0 end
				if style_set.v == '����� 2' then style = 1 end
				if style_set.v == '����� 3' then style = 2 end
				end
				imgui.InputText(u8'��� (��� "_")', save_name,imgui.ImVec2(200, 30))
				imgui.InputText(u8'������/���������', save_dol,imgui.ImVec2(200, 30))
				imgui.InputText(u8'�����', save_phone,imgui.ImVec2(200, 30))
				imgui.NextColumn()
			if save_rpw.v == true then rpw = 1 else rpw = 0 end
			if save_su.v == true then su = 1 else su = 0 end
			if save_putpl.v == true then putpl = 1 else putpl = 0 end
			if save_eject.v == true then eject = 1 else eject = 0 end
			if save_arrest.v == true then arrest = 1 else arrest = 0 end
			if save_hold.v == true then hold = 1 else hold = 0 end
			if save_invite.v == true then invite = 1 else invite = 0 end
			if save_uninvite.v == true then uninvite = 1 else uninvite = 0 end
			if save_rang.v == true then rang = 1 else rang = 0 end
			if save_changeskin.v == true then changeskin = 1 else changeskin = 0 end
			if save_search.v == true then search = 1 else search = 0 end
			if save_cuff.v == true then cuff = 1 else cuff = 0 end
			if save_ticket.v == true then ticket = 1 else ticket = 0 end
			if save_takelic.v == true then takelic = 1 else takelic = 0 end
			imgui.Checkbox(u8"�������� RP ��������� ������", save_rpw)
			imgui.Checkbox(u8"�� ��������� /su", save_su)
			imgui.Checkbox(u8"�� ��������� /putpl", save_putpl)
			imgui.Checkbox(u8"�� ��������� /eject", save_eject)
			imgui.Checkbox(u8"�� ��������� /arrest", save_arrest)
			imgui.Checkbox(u8"�� ��������� /hold", save_hold)
			imgui.Checkbox(u8"�� ��������� /takelic", save_takelic)
			imgui.NextColumn()
			imgui.SetColumnWidth(-1, 280)
			imgui.Checkbox(u8"�� ��������� /invite", save_invite)
			imgui.Checkbox(u8"�� ��������� /uninvite", save_uninvite)
			imgui.Checkbox(u8"�� ��������� /rang", save_rang)
			imgui.Checkbox(u8"�� ��������� /changeskin", save_changeskin)
			imgui.Checkbox(u8"�� ��������� /search", save_search)
			imgui.Checkbox(u8"�� ��������� /cuff", save_cuff)
			imgui.Checkbox(u8"�� ��������� /ticket", save_ticket)
			imgui.Columns(1)
			if imgui.Button(u8'���������',imgui.ImVec2(685, 20)) then
				mainIni.settings.phone = save_phone.v
				mainIni.settings.name = save_name.v
				mainIni.settings.dol = save_dol.v
				mainIni.settings.style = style_set.v
				mainIni.settings.rpw = rpw
				mainIni.settings.su = su
				mainIni.settings.eject =  eject
				mainIni.settings.putpl = putpl
				mainIni.settings.arrest =  arrest
				mainIni.settings.hold = hold
				mainIni.settings.invite = invite
				mainIni.settings.uninvite = uninvite
				mainIni.settings.rang = rang
				mainIni.settings.changeskin = changeskin
				mainIni.settings.search = search
				mainIni.settings.cuff = cuff
				mainIni.settings.takelic = takelic
				mainIni.settings.ticket = ticket
				inicfg.save(mainIni, '..\\config\\MVDLead.ini')
				thisScript():reload()
			end
		end
		if selected == 2 then 
			imgui.Columns(4)
			imgui.SetColumnWidth(-1, 100)
			imgui.Text(u8'/rn')
			imgui.Text(u8'/fn')
			imgui.Text(u8'/cuff')
			imgui.Text(u8'/arrest')
			imgui.Text(u8'/putpl')
			imgui.Text(u8'/eject')
			imgui.Text(u8'/su')
			imgui.Text(u8'/takelic')
			imgui.Text(u8'/ticket')
			imgui.Text(u8'/invite')
			imgui.NextColumn()
			imgui.SetColumnWidth(-1, 250)
			imgui.Text(u8'- ��� ��� � /r �����')
			imgui.Text(u8'- ��� ��� � /f �����')
			imgui.Text(u8'- ������ ���������')
			imgui.Text(u8'- �������� � ���')
			imgui.Text(u8'- �������� � ���������� ����')
			imgui.Text(u8'- �������� �� ������')
			imgui.Text(u8'- �������� � ������')
			imgui.Text(u8'- ������ ������������ �������������')
			imgui.Text(u8'- �������� �����')
			imgui.Text(u8'- ������� �������� � �����������')
			imgui.NextColumn()
			imgui.SetColumnWidth(-1, 100)
			imgui.Text(u8'/uninvite')
			imgui.Text(u8'/��')
			imgui.Text(u8'/���')
			imgui.NextColumn()
			imgui.Text(u8'- ������� ����������')
			imgui.Text(u8'- �������� �������������')
			imgui.Text(u8'- ���������� ���')
		end
        imgui.EndGroup()
		imgui.End()
	end
	if second_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'���. ������� | v. 1.2 beta', second_menu)
		if imgui.Button(u8'��� ��������',imgui.ImVec2(280, 20)) then
		 second_menu_1.v = not second_menu_1.v end
		 if imgui.Button(u8'��� ����',imgui.ImVec2(280, 20)) then
		  second_menu_2.v = not second_menu_2.v end
		if imgui.Button(u8'��� ����',imgui.ImVec2(280, 20)) then
		 second_menu_3.v = not second_menu_3.v end
		if imgui.Button(u8'��� ����',imgui.ImVec2(280, 20)) then
		 second_menu_4.v = not second_menu_4.v end
	imgui.End()
	end
			if second_menu_1.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 140), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'���. ������� | MVD | v. 1.2 beta', second_menu_1)
				if imgui.Button(u8'����� � PA (3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
					sampSendChat('/gnews Police Academy ���� ������� �������� �����.')
					sampSendChat('/gnews ������ �� ��� ����� ����������� ���� � ���� �������.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'��������� ������ �����! ��������� ��������.\nPolice Academy ���� ������� �������� �����.\n������ �� ��� ����� ����������� ���� � ���� �������.')
				if imgui.Button(u8'�������������� �� /wbook (1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ������� ��������� �� �������������� � ��� �� �������� �����.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'������� ��������� �� �������������� � ��� �� �������� �����.')
				if imgui.Button(u8'������������ ���������(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ��� ��������? ��� ��������? ������� �����? ������� � 02!')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'��� ��������? ��� ��������? ������� �����? ������� � 02!')
				if imgui.Button(u8'������������ ���������(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
					sampSendChat('/gnews ��� ��������? ��� ��������? ������� �����? ������� � 02!')
					sampSendChat('/gnews ������� ������ ����� ������� ���!')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'��������� ������ �����! ��������� ��������.\n��� ��������? ��� ��������? ������� �����? ������� � 02!\n������� ������ ����� ������� ���!')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           �����:'..time)
			imgui.End()
			end
			if second_menu_2.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'���. ������� | LSPD | v. 1.2 beta', second_menu_2)
				if imgui.Button(u8'�������������(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
					sampSendChat('/gnews �������� ����� ��������� � Los-Santos Police Academy.')
					sampSendChat('/gnews ��������: 4 ���� � �����, ��������, �����������������')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'��������� ������ �����! ��������� ��������.\n�������� ����� ��������� � Los-Santos Police Academy.\n ��������: 4 ���� � �����, ��������, �����������������')
				if imgui.Button(u8'����������� � �������������(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ���������, �������� ����� ��������� � Los-Santos Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'���������, �������� ����� ��������� � Los-Santos Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           �����:'..time)
			imgui.End()
			end
			if second_menu_3.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'���. ������� | SFPD | v. 1.2 beta', second_menu_3)
				if imgui.Button(u8'�������������(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
					sampSendChat('/gnews �������� ����� ��������� � San-Fierro Police Academy.')
					sampSendChat('/gnews ��������: 4 ���� � �����, ��������, �����������������')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'��������� ������ �����! ��������� ��������.\n�������� ����� ��������� � San-Fierro Police Academy.\n ��������: 4 ���� � �����, ��������, �����������������')
				if imgui.Button(u8'����������� � �������������(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ���������, �������� ����� ��������� � San-Fierro Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'���������, �������� ����� ��������� � San-Fierro Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           �����:'..time)
			imgui.End()
			end
			if second_menu_4.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'���. ������� | LVPD | v. 1.2 beta', second_menu_4)
				if imgui.Button(u8'�������������(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
					sampSendChat('/gnews �������� ����� ��������� � Las-Venturas Police Academy.')
					sampSendChat('/gnews ��������: 4 ���� � �����, ��������, �����������������')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'��������� ������ �����! ��������� ��������.\n�������� ����� ��������� � Las-Venturas Police Academy.\n ��������: 4 ���� � �����, ��������, �����������������')
				if imgui.Button(u8'����������� � �������������(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews ���������, �������� ����� ��������� � Las-Venturas Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'���������, �������� ����� ��������� � Las-Venturas Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           �����:'..time)
			imgui.End()
			end
	if tree_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(500, 170), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'�������� ������ ������������� | v. 1.2 beta', tree_menu)
	imgui.BeginChild('left pane', imgui.ImVec2(180, 0), true)
		if not selected then selected = 1 end
        if imgui.Selectable(u8('�������� ������ �������   '), selected == 1) then selected = 1 end
        if imgui.Selectable(u8('�������� ������� � �������'), selected == 2) then selected = 2 end
		imgui.EndChild()
        imgui.SameLine()
        imgui.BeginGroup()
		if selected == 1 then
			if imgui.Button(u8'����� Los-Santos',imgui.ImVec2(300, 20)) then
				tree_menu_1.v = not tree_menu_1.v end
			if imgui.Button(u8'����� San-Fierro',imgui.ImVec2(300, 20)) then
				tree_menu_2.v = not tree_menu_2.v end
			if imgui.Button(u8'����� Las-Venturas',imgui.ImVec2(300, 20)) then
				tree_menu_3.v = not tree_menu_3.v end
			if imgui.Button(u8'���� ��������',imgui.ImVec2(148, 20)) then
				sampSendChat(string.format("/f ���� �������� ������: ���-������: %d/3, ���-������: %d/3, ���-��������: %d/3", posls, possf, poslv))
			end
			imgui.SameLine(nil, 4)
			if imgui.Button(u8'�������� �����',imgui.ImVec2(148, 20)) then
				sampAddChatMessage(string.format("[Leader-MVD] {FFFFFF}LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv), 0x4b58ebFF)
				sampAddChatMessage("[Leader-MVD] {FFFFFF}������ ����������", 0x4b58ebFF)
				posls = 0
				possf = 0
				poslv = 0
			end
		end
		if selected == 2 then
			imgui.Columns(2)
			imgui.SetColumnWidth(-1, 320)
			plsv = 1
			psfv = 1
			plvv = 1
			imgui.InputText(u8'���-������', pls,imgui.ImVec2(200, 30))
			--[[if imgui.InputInt(u8'���-������ ', pls, 1, 10) then
			if plsv < pls.v then
				sampSendChat(" /f ��������� ������� � ������ ���-������. ���-�� �������� �� ������ ������: "..pls.v) end
				plsv = plsv + 1
				print(plsv)
				print(pls.v)
			end]]
			imgui.InputInt(u8'���-������ ', psf, 1, 10)
			imgui.InputInt(u8'���-�������� ', plv, 1, 10)
			imgui.Text(u8'���-�� �������� � �������:')
			imgui.Text(u8'���-������: '..pls.v.. " |")
			imgui.SameLine(nil, 4)
			imgui.Text(u8'���-������: '..psf.v.. " |")
			imgui.SameLine(nil, 4)
			imgui.Text(u8'���-��������: '..plv.v)
			if imgui.Button(u8'���� ��������',imgui.ImVec2(300, 20)) then
				sampSendChat(string.format(" /f ���� �������� ��������: ���-������: %s, ���-������: %s, ���-��������: %s", pls.v, psf.v, plv.v))
			end
		end
		imgui.EndGroup()
	imgui.End()
	end
			if tree_menu_1.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(380, 110), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'�������� ������ | Los-Santos | v. 1.2 beta', tree_menu_1)
				imgui.Text(u8'����������� ���-������:')
				imgui.SameLine(nil, 92)
				if imgui.Button(u8'������##but8',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ����������� ���-������. ���������: �����')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but8',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ����������� ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.Text(u8'����� ���-������:')
				imgui.SameLine(nil, 129)
				if imgui.Button(u8'������##but7',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ����� ���-������. ���������: �����')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but7',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ����� ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.Text(u8'�������-�������� ������ ���-������:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'������##but6',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: �������-�������� ������ ���-������. ���������: �����')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but6',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: �������-�������� ������ ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.End()
			end
			--==============--
			if tree_menu_2.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(380, 110), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'�������� ������ | San-Fierro | v. 1.2 beta', tree_menu_2)
				imgui.Text(u8'��������� ���-������:')
				imgui.SameLine(nil, 103)
				if imgui.Button(u8'������##but2',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ��������� ���-������. ���������: �����')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but2',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ��������� ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'����� ���-������:')
				imgui.SameLine(nil, 130)
				if imgui.Button(u8'������##but1',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ����� ���-������. ���������: �����')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but1',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ����� ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'�������-�������� ������ ���-������:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'������##but',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: �������-�������� ������ ���-������. ���������: �����')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: �������-�������� ������ ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.End()
			end
			--=================--
			if tree_menu_3.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(380, 110), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'�������� ������ | Las-Venturas | v. 1.2 beta', tree_menu_3)
				imgui.Text(u8'���������� ���-��������:')
				imgui.SameLine(nil, 96)
				if imgui.Button(u8'������##but5',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ���������� ���-��������. ���������: �����')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but5',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ���������� ���-��������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'����������� �������� ���-��������:')
				imgui.SameLine(nil, 30)
				if imgui.Button(u8'������##but4',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ����������� �������� ���-��������. ���������: �����')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but4',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: ����������� �������� ���-��������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'�������-�������� ������ ���-��������:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'������##but3',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: �������-�������� ������ ���-��������. ���������: �����')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'�����##but3',imgui.ImVec2(60, 20)) then
					sampSendChat('/f ����: �������-�������� ������ ���-��������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.End()
			end
	if fo_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(300, 110), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'�������� � ����� | v. 1.2 beta', fo_menu)
		if imgui.Button(u8'����� ����',imgui.ImVec2(138, 20)) then
			sampSendChat("/f ����� ����� � ������ ����")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8'����� ����',imgui.ImVec2(138, 20)) then
			sampSendChat("/f ����� ����� � ������ ����")
		end
		if imgui.Button(u8'����� ����',imgui.ImVec2(138, 20)) then
			sampSendChat("/f ����� ����� � ������ ����")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8'����� FBI',imgui.ImVec2(138, 20)) then
			sampSendChat("/f ����� ����� � ����� FBI")
		end
		if imgui.Button(u8'�������� (5 ���)',imgui.ImVec2(138, 20)) then
			sampSendChat("/f �������� ���. ���������� ��� ������� ����� 5 �����.")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8"�������� /find'a",imgui.ImVec2(138, 20)) then
			sampSendChat(string.format("/f WSPD, �������� ���-�� ����������� � �����! FBI �� ����� %s", mainIni.settings.phone))
		end
	imgui.End()
	end
	if five_menu.v then
    local sw, sh = getScreenResolution()
    imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
    imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'��������� ������ | v. 1.2 beta', five_menu)
        imgui.InputInt(u8'ID ', new_id, 1, 10)
        if imgui.Combo(u8'�������', new_frak, {u8'����',u8'����',u8'����',u8'FBI'}) then
            if new_frak.v == 0 then name_lid = '������� ���-�������' end
            if new_frak.v == 1 then name_lid = '������� ���-������' end
            if new_frak.v == 2 then name_lid = '������� ��� ���������' end
            if new_frak.v == 3 then name_lid = '���' end
        end
        if sampIsPlayerConnected(new_id.v) then
            local nick = sampGetPlayerNickname(new_id.v)
			imgui.Text(u8(string.format('�� ����������� ��������� %s �� ���� ������ %s',nick, name_lid)))
			else
			imgui.Text(u8'������ �������� ID, ��� ����� �� ���������.')
		end
        if imgui.Button(u8'��������� ������') then
            sampSendChat(string.format(" /newleader %s %s", new_id.v, new_frak.v))
		end
	imgui.End()
	end
	if seven_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(250, 145), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'��������� ������ | v. 1.2 beta', seven_menu)
		imgui.Text(u8'v. 0.1:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8' ..::Release::..')
		imgui.SameLine(nil, 20)
		imgui.Text(u8'v. 1.1 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'-�������� ����� ����� �������\n-��������� ��� � ��������� ������\n-��������� ������� "��������� ������"')
		imgui.Text(u8'v. 0.2:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- ��������� �������: �������������� ������� ������\n- ������ �������� ������: ���� �������� ������.\n- ��������� /gnews ���: ��/��/����.')
		imgui.SameLine(nil, 20)
		imgui.Text(u8'v. 1.2 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- ��������� �� ��������� ������\n-��������� �� ��������� � ����������\n- �������� ��������� �������\n- � ���. �������� ��������� �����\n-�������� ��� (/���)')
		imgui.Text(u8'v. 0.3:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- ��������� �������: ��������� �������� ������.\n - ���������� ��������� ����.\n - ��������� ������ ��� �������������.')
		imgui.Text(u8'v. 0.4:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- ���������� �������� ����.\n - ��������� ��������� ����� ���. �������� ��� ��������.')
		imgui.Text(u8'v. 0.5:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- ���������� ����/������. ')
		imgui.Text(u8'v. 1.0 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- ����� ������\n-������ ��������� �������')
	imgui.End()
	end
	if ten_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(-1.2, -1.0))
	imgui.SetNextWindowSize(imgui.ImVec2(150, 105), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'����� | v. 1.2 beta', ten_menu)
		if imgui.Button(u8"������ �� �����",imgui.ImVec2(135, 20)) then
			sampSendChat("���, �� � ��� ������ �� �����. �� ��������.")
		end
		if imgui.Button(u8"����� ���������",imgui.ImVec2(135, 20)) then
			sampSendChat("/me ����� ������� � ��������")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ������� �������")
			wait(1000)
			sampSendChat("/me ������ �� ������� ����� ��� ����")
			wait(1000)
			sampSendChat("/me ����� ��������� � �����")
		end)
		lua_thread.create(function() wait(4000)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} ����������� ������� /remove [ID] [D] ��� ������� ����������.", 0x4b58ebFF)
		end)
		end
		if imgui.Button(u8"����� �������",imgui.ImVec2(135, 20)) then
			sampSendChat("/me ����� ��������� � ���������")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ������� ���������")
			wait(1000)
			sampSendChat("/me ������ ����� ��� ����")
			wait(1000)
			sampSendChat("/me ����� ��������� � �����")
		end)
		lua_thread.create(function() wait(4000)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} ����������� ������� /remove [ID] [P] ��� ������� ������.", 0x4b58ebFF)
		end)
		end
	imgui.End()
	end
	if ten_menu_one.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	imgui.SetNextWindowSize(imgui.ImVec2(1130, 600), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'������ �������������� ������	| v. 1.2 beta', ten_menu_one)
	imgui.Text(u8[[������ �������������� ������.?
[1] - ������������ ������ ������� �����/���.��������.

1.1 - �� ����� ��������� �� �������� ����/���.��������� � ����������� ������ �������� ����������� ����������� ������������� 2 ������� �������.
1.2 - �� ����� ��������� �� �������� ����/���.��������� ��������� �� ����� ������, ����������� ������������� 4 ������� �������.
1.3 - �� ������ ���������� � ���� �������� ��� ����� ������ ��������, ���������� ������������� 1 ������� �������.
1.4 - �� �������������� �������� ������� ���� ����� � �������, 2-� ������� �������.
1.5 - �� ����������� ����� � ����������� ������ ���������� ����������� ������������� 1 ������� ������ � ����� � ���� 2.000$
1.6 - �� �����������/������� � ����������� �������� ����� ����������� ������������� 1 ������� ������� � ����� � ���� 2.000$
1.7 - �� ��������� � ������������, ����������� ������������� 1-6-�� ������� ������� (������� ����� �� ������� ������� ��� � �����������)
1.8 - �� ���� ��� ������� ����� ������������� �������� ���������� ������������� 1� ������� �������.]])
imgui.Text(u8[[[2] - �������� ������ ������������ ���������� ���.

2.1 - �� ����������� ������ ���������� ������������������ ������� ��� ����������, ����������� ������������� 2-�� ������� �������.
2.2 - �� ������������������ ��������� ���������� ������������������ ������� �� ���������� ����������� ���������� ������������� 2-�� ������� �������.
2.3 - �� ������������ ���������� ������������������ �������, ���� ���� ������� ���������, ����������� ������������� 2-�� ������� �������.
2.4 - �� ������������� �� ���������� ��� ��� ����������� ������������� ��� �����-���� ������� ������ ����������� ������ ������ �� 5 ����� 
�������� ����������, � ��������� ������ 1 ������� �������.
2.5 - �� ������������� � ��������� ���������� ���������� ����� 5 ������ ����� �������� ��� � ����� ������������� 1-� ������� �������.
2.6 - �� ����������� ����� � ����������� ���������� ��� ���������� ������������� 1 ������� ������� � ������������ ����� � ���� 2.000$
2.7 - �� ������ ���������� ��� � ���� �������� ��� ����� ������ ��������, ���������� ������������� 2 ������� �������.
2.8 - �� ��������������� ������������ ����������� ����������� ���, ��������� �������� ���������� � ������������� 5 ������� �������.
2.9 - �� ���� �������� ������ ���������, ������� ����� ������� ��������� � ����� ����������� ������������� 4 ������� �������.]])
imgui.Text(u8[[?[3] - ������������� ��������, ������ � �������� ����������� � �����.
3.1 - �� �������� � ������������ ������������� ������� ��� ������ ������������ ����������� ���������� ������������� 3 ������� ������� � ����������� 
������� �������.
3.2 - �� �������/�������/��������������� ������������� ������� ��� ������ ������������ ����������� ���������� ������������� 3 ������� ������� � 
����������� ������� �������.
3.3 - �� ������ � ������������ ������������� ������� ��� ������ ������������ ����������� ���������� ������������� 1 ������� ������� � ������������ 
����� � ������� 1.500$
3.4 - �� ������� ������ � �������� ����,���� ���� �� ������� ��������, ����������� ������������� 1 ������� ������� � ������� ������.
3.5 - �� ��������/��������������� ����������� � ����� ���������� ����������� ������������� 1 ������� ������� � ����������� �������.
����������: 1-2 ����� �����/��, ���������� ���, ��������������.
3.6 - �� �������/�������/��������������� ������ ��� ����������� ����������� ������������� 2 ������� ������� � ����������� �������.
3.7 - �� ����� ����������� � �������� ������������ ������� ����������� ������������� 1 ������� ������� � ����������� �������.
3.8 - �� ��������������� �������� � ����� ������� �����������(����� � ����) ������, �� ���������� �� ������ � ������������ �������, ����������� 
������������� 4-� ������� �������
O�������� ������������� �������� ����� ���� ����������� ���� �� ������� ��������� ������ ������, �� �� ������ ���������� ���� � ������ ������� ��� ���.]])
imgui.Text(u8[[[4] - ������������ ������ ���������������� ������ ��� ���������.

4.1 - �� ������������, �����������, ��� ��������� � ������������������� �������� ���� ������, ���������� ������������� 2-�� ������� �������.
4.2 - �� ���� ����������� �����������, ������ ���������� ����������� �����������, ���������� ������������� 1-� ������� �������
4.3 - �� �������, �������, ����������� ��������������� ����������, ����������� ������������� 6-�� ������� ������/
4.4 - �� �������� ���������� ��������������� �������� �������������� �������������� ���������� ���������� ���������� ������������� 6-� ������� �������
4.5 - �� ������������ ��� ���������� ��������, ������� ����� ���� ��������� ��� ��������������� ������, ���������� ����������� � 6 ������� �������, 
�������� ���� ��������, �������� � �� ����� ����������� ������ ��������� ��� ����� ������. ������ ����� ���������� �������� � ������ ���������� �����, 
� ��� ����� ��������� � ��������������� �������. 
4.6 - �� ����� ���������������� ���������(�����,�������,������,��������,����� � ��) ����������� ������������� 1 ������� ������� � ������������ ����� � 
������� 2.000$
4.7 - �� ���� ������ �� ����������� �� ��������� �������� ������ ��� ������������� 6 ������� ������� � ����������� ��������� � ������ ������ �����������.
]])
imgui.Text(u8[[[5] - ������ ��������������. ������������ ������ ������������ ��������������.

5.1 - ��� ������ ����������� ��������� ���� ���� ������� ��������� ��� �� ����� ���������� ���������� ������������� 1 ������� ������� � ����� � ������� 1.000$
5.2 - �� ����� ��� ������������� ������ ������ ����������� ������������� 1 ������� �������.
5.3 - �� ������������� ������� ���� ���������� ������������� ����� � ������� 1.500$
5.4 - �� �������������/������� ������������� �������� �����, ������������� ����������� ���������� ������������� 2 ������� �������.
5.5 - �� ���������� ������� ������ �� ����������, ������� ����� ������� �� ����� ������ ���������� ���������� ������������� 1 �.�. 
(���������: ������ ����� ����� ��� �� �����)
5.6 - �� ���������������� � ����� ���� ���������� ������������� 1 ������� �������.
5.7 - �� ���������� ������������ ���� �������, ����������� ������������� 3-�� ������� �������.
5.8 - �� ����������� ��� ������� � ������������, ����������� � ������������ ���� ������� ���������� �� ����, �������� �� ��� ��������������, ����������� 
������������� 5-� ������� �������.
5.9 - �� ������ ����� ���������� ������������� 1 ������� ������� ��� �� ����� � ������� 2000$.
5.10 - �� ����� ������� ��������� ��� ������������� �� ������ ����������(���) ������ ���������� ���������� ������������� 1 ������� �������.
5.11 - ������������� �� ��������� �� ����� �������, ���������� ������������� 1-� ������� ������� (�� ���������� � ����������� ��� � ��, ����������� 
���� �����������]])
	imgui.Text(u8[[[6] - ��������������� ���������� ������������.

6.1 - �� ���������/������� �������� ������ ��� ������ ��� ������������ ������������� 6 ������� �������.
6.2 - �� ������������ ��� ����������� ������� �����������/������ ��� ������������� 6 ������� �������.
6.3 - �� �������/���������������/����� ��������� �����(��������: ����� �� ��� ���) ����������� ��� ������ ��� ������������� 3 ������� �������.
6.4 - �� �������� ����������, �������������, ������� ��������������� �����������, � ����� �� �������, ������� � ���������� � ������ ����� ������������ 
4-�� �������� �������.
6.5 - �� ������ � ����������� ��� ������������ ����� ������������� � ������������ ������� ������������ ������������ �������� ����� ���(5+ ����) ����� ����� 
��������� 4 ������� �������.
6.6 - �� ���� �������� ������ ���������� � ������� ��� ��������� ����������� ������������� 2 ������� �������.]])
	imgui.Text(u8[[[7] - ��������� ������ ��������� ��������.

7.1 - ���� �� ��������� ������. ���������� ������������ ����� � ������� 2.000$, ��������� ������������ ������������� � ������������� 1 ������� �������.
7.2 - ����� �� �������� � ����������� �����-���� �������� ������������. ���������� ������������ ����� � ������� 2.000$, ������������� 2 ������� ������� � ������� ���.��.
7.3 - �������� � ������������ �����. ���������� ������������ ����� � ������� 2.000$ � ��������� ������������ �������������.
7.4 - ������������� �������� (�����) �/��� ���������� �������� (������������ �������) ����������� �����. ���������� ������������ ����� � ������� 2.000$.
7.5 - ���� � ����� ���. ���������� ������������ ����� � ������� 1.000$, ��������� ������������ ������������� � ������������� 1 ������� �������.
7.6 - ���������� �������� ��������� ��������. ���������� ������������ ����� � ������� 2.000$, ��������� ������������ ������������� � ������������� 2 ������� �������.
7.7 - ������ ������ ������������������ ������� �� ������������ �������� ( ���������� , �������� � ������ ��� ���������� � �.� ).� ���������� ��������� ������������ 
������������� � ������������� 2 ������� �������.
7.8 - ���� � ������������ ������ � ������ ����� �����(����� 19:30) ���������� ������������ ����� � ������� 500$
7.9 - �������/����������� ������������������� ������� �����. ����������� ������������ ����� � ������� 2.000$
7.10 - �� �������� ���������� ���������� ��� ���������� ����������� ����� ���������� ������������ ����� � ������� 1.500$ � ��������� ������������� �� ���������� 
��������� �����������.
7.11 - �� ������������� ���������� / ������������� ���������� � ������ �����, ��� �������������� ������. ���������� ������������ ����� � ������� 1000$.]])
	imgui.Text(u8[[[8] - ��������� � ����� ��������� ���������.

8.1 - �� ������������ ���������, � ������: ����� � �.�. ���������� ������������ ����� � ������� 2000$.
8.2 - �� ������������ ����������� ������, ���������� ������������ ����� � ������� 1500$.
8.3 - �� ����������� ���������� ������ ��� ������ �����������, ���������� ������������ ����� � ������� 1500$.]])

	imgui.End()
	end
 end


function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(0)
	end
	local time = getTime(3)
	dat = os.date('%d', time)
	mat = os.date('%m', time)
	yea = os.date('%y', time)
	local _,  playerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	if sampGetPlayerNickname(playerid) == 'Mateo_Penaloza' then
		if dat <= '31' and mat <= '08' and yea <= '2018' then
			sampAddChatMessage("[Leader-MVD] {FFFFFF} ������ �������.{9d00bd} �����: Mateo Penaloza. {4b58eb} | Version: 1.2 beta", 0x4b58ebFF)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} ����������� ������� /lm ��� ������� F2 ��� ������ ����.", 0x4b58ebFF)
			--sampAddChatMessage("[Leader-MVD] {FFFFFF} ������ �������� ������ ��� �������. ��������� ������� {4b58eb}/lm{ffffff} ��� �����������.", 0x4b58ebFF)
			sampRegisterChatCommand("lm", lm) -- +
			sampRegisterChatCommand("cuff", cuff) -- +
			sampRegisterChatCommand("arrest", arrest) -- +
			sampRegisterChatCommand("hold", hold) -- +
			sampRegisterChatCommand("su", su) -- +
			sampRegisterChatCommand("eject", eject) -- +
			sampRegisterChatCommand("takelic", takelic) -- +
			sampRegisterChatCommand("ticket", ticket) -- +
			sampRegisterChatCommand("putpl", putpl) -- +
			sampRegisterChatCommand("invite", invite) -- +
			sampRegisterChatCommand("uninvite", uninvite) -- +
			sampRegisterChatCommand("search", search) -- +
			sampRegisterChatCommand("rang", rang) -- +
			sampRegisterChatCommand("changeskin", changeskin) -- +
			sampRegisterChatCommand("fn", fn) -- +
			sampRegisterChatCommand("rn", rn) -- +
			sampRegisterChatCommand("���", ud) -- +
			sampRegisterChatCommand("��", udos) -- +
			while true do
			wait(0)
			if isKeyJustPressed(key.VK_F2) then 
				main_menu.v = not main_menu.v
			end
			imgui.Process = main_menu.v or ten_menu.v or ten_menu_one.v
			local weapon = getCurrentCharWeapon(PLAYER_PED)
			while weapon == 3 or weapon == 17 or weapon == 23 or weapon == 24 or weapon == 25 or weapon == 29 or weapon == 34 do
			wait(0)
			imgui.Process = main_menu.v  
			if save_rpw.v then
					local weapon = getCurrentCharWeapon(PLAYER_PED)
							if weapon == 3 then -- �������
								sampSendChat("/do ������� ����� �� �����.")
								wait(1000)
								sampSendChat("/me ���� ������� � �����")
								while true and save_rpw.v == true do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 3 then
										sampSendChat("/me ������� ������� �� ����")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 17 then -- ������� �����
								sampSendChat("/do ������� ����� � ����� �� �����.")
								wait(1000)
								sampSendChat("/me ������� ������� �����")
									while true and save_rpw.v do
									wait(0)
									imgui.Process = main_menu.v
									local weapon = getCurrentCharWeapon(PLAYER_PED)
										if weapon ~= 17 then
											break
										end
									end
									---------------------------------
							elseif weapon == 23 then -- ������
								sampSendChat("/do � ������ �������� SD-Pistol")
								wait(1000)
								sampSendChat("/me ������ �������� �� ������")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 23 then
										sampSendChat("/do ������ �� �����.")
										wait(1000)
										sampSendChat("/me ������� �������� � ������")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 24 then -- ����
								sampSendChat("/do � ������ �������� Desert Eagle .")
								wait(1000)
								sampSendChat("/me ������ �������� �� ������")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 24 then
										sampSendChat("/do ������ �� �����.")
										wait(1000)
										sampSendChat("/me ������� �������� � ������")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 25 then -- ������
								sampSendChat("/do �� ����� ����� �������� Shotgun.")
								wait(1000)
								sampSendChat("/me ���� � ����� ��������")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 25 then
										sampSendChat("/me ������� �������� �� �����")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 29 then -- �� 5
								sampSendChat("/do �� ����� ����� ��������-������ MP-5.")
								wait(1000)
								sampSendChat("/me ���� � ����� ��������-������")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 29 then
										sampSendChat("/me ������� ��������-������ �� �����")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 34 then -- ���������
								sampSendChat("/do  �� ����� ����������� ��������.")
								wait(1000)
								sampSendChat("/me ���� �� ����� ����������� ��������")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 34 then
										sampSendChat("/do � ���� ����������� ��������")
										wait(1000)
										sampSendChat("/me ������� ����������� �������� �� �����")
										wait(1000)
										break
									end
								end
							end
						end
					end
				end
			else
				sampAddChatMessage("[Leader-MVD] {FFFFFF} ������ �������.{9d00bd} �����: Mateo Penaloza. {4b58eb} | Version: 1.2 beta", 0x4b58ebFF)
				sampAddChatMessage("[Leader-MVD] {FFFFFF} � ��� ���������� ���� ������������� �������. ���������� � ������: vk.com/si8646222 ��� Skype: danilbw", 0x4b58ebFF)
				thisScript():unload()
			end
		else
			sampAddChatMessage("[Leader-MVD] {FFFFFF} ������ �������.{9d00bd} �����: Mateo Penaloza. {4b58eb} | Version: 1.2 beta", 0x4b58ebFF)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} � ��� ��� ������� � �������. ���������� � ������: vk.com/si8646222 ��� Skype: danilbw", 0x4b58ebFF)
			thisScript():unload()
		end
	end

 

 
--[[function lm()
			lua_thread.create(function()
				sampSendChat('/mn')
				while not sampIsDialogActive() do wait(0) end
				sampSetCurrentDialogListItem(0)
				sampCloseCurrentDialogWithButton(1)
				lua_thread.create(function() wait(100)
					dialogtext = sampGetDialogText()
					--print(dialogtext)
					itog = dialogtext:match('.+������� ������:%s(.+)')
					sampCloseCurrentDialogWithButton(1)
					if itog == '	������� �����' then 
						st = 1
						sampAddChatMessage("[Leader-MVD] {FFFFFF} ����������� ������� F2 ��� ������ ����.", 0x4b58ebFF)
						else sampAddChatMessage("[Leader-MVD] {FFFFFF} �� �� �����. ������ ��� �� ��������.", 0x4b58ebFF) end
					print(itog)
					print(st)
				end)
		end)
end]]

function lm()
	main_menu.v = not main_menu.v 
end

function cuff(param)
		local id = tonumber(param)
			if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /cuff [id].", 0x4b58ebFF) else
				if mainIni.settings.cuff == 1 then
					sampSendChat("/do ��������� �� ������� ���������.")
				lua_thread.create(function() wait(1000)
					sampSendChat("/me ���� ��������� � �������� ���������.")
					wait(1000)
					sampSendChat("/me ������ ��������� �������� ���� ������������.")
					wait(1000)
					sampSendChat("/me ������� ��������� �� ������ ���� ������������.")
					wait(1000)
					sampSendChat("/me ������� ��������� �� ����� ���� ������������.")
					wait(1000)
					sampSendChat("/do �� ����������� ������ ���������.")
					wait(1000)
					sampSendChat("/cuff "..id)
				end)
					else
					sampSendChat("/cuff "..id)
			end
	end
end

function arrest(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /arrest [id].", 0x4b58ebFF) else
		if mainIni.settings.arrest == 1 then
			sampSendChat("/do ����� � ��������.")
		lua_thread.create(function() wait(1000)
			sampSendChat("/do ������ ���������� � ��������.")
			wait(1000)
			sampSendChat("/me ������ �������, ����� ���� ����� � ����� ���������")
			wait(1000)
			sampSendChat("/do ����� ��������� � ����� � �����.")
			wait(1000)
			sampSendChat("/me ��������� � ���������� ������ ���������")
			wait(3000)
			sampSendChat("/me ��������� �������� ��������� ����������")
			wait(3000)
			sampSendChat("/me ��������� �������������� � ����������")
			wait(3000)
			sampSendChat("/me ��������� ������ � ���������")
			wait(3000)
			sampSendChat("/me ��������� ���� � �������")
			wait(2000)
			sampSendChat("/me ������� ����� � ��������")
			wait(2000)
			sampSendChat("/me ������� ����� ������������� ��������� � �������")
			wait(1000)
			sampSendChat("/arrest "..id)
		end)
			else
			sampSendChat("/arrest "..id)
		end
	end
end

function hold(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /hold [id].", 0x4b58ebFF) else
		if mainIni.settings.hold == 1 then
			sampSendChat("/me ���� �� ���� �����������, ����� ���� ��� �� �����")
		lua_thread.create(function() wait(1000)
			sampSendChat("/hold "..id)
		end)
			else
			sampSendChat("/hold "..id)
		end
	end
end

function eject(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /eject [id].", 0x4b58ebFF) else
		if mainIni.settings.eject == 1 then
			sampSendChat("/me ����� �� ����������, ����� ������� �������� ������")
		lua_thread.create(function() wait(1000)
			sampSendChat("/eject "..id)
		end)
			else
			sampSendChat("/eject "..id)
		end
	end
end

function su(params)
if not string.match(params,"(%d+)%s+(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /su [id] [���-�� ����] [�������].", 0x4b58ebFF) else
	local id, zv, re = string.match(params,"(%d+)%s+(%d+)%s+(.*).")
		if mainIni.settings.su == 1 then
			sampSendChat("/me ������ �����, ����� ������� ������ � ����������� ����������")
			sampSendChat("/su "..id.." "..zv.." "..re)
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ������� ����� �� ����")
		end)
			else
			sampSendChat("/su "..id.." "..zv.." "..re)
		end
	end
end

function takelic(params)
if not string.match(params,"(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /takelic [id] [�������].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.takelic == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ������ ���")
			wait(1000)
			sampSendChat("/me ��� �������� ���� ������������� ��������")
			wait(1000)
			sampSendChat('/me ������� �������� ������������� ������������� �� "���������������"')
			sampSendChat("/takelic "..id.." "..re)
			wait(1000)
			sampSendChat("/me �������� ���, ����� ����� ���")
		end)
			else
			sampSendChat("/takelic "..id.." "..re)
		end
	end
end

function putpl(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /putpl [id].", 0x4b58ebFF) else
		if mainIni.settings.putpl == 1 then
			sampSendChat("/me ������ ����� ����������, ����� ������� � ���� �����������")
		lua_thread.create(function() wait(1000)
			sampSendChat("/putpl "..id)
		end)
			else
			sampSendChat("/putpl "..id)
		end
	end
end

function uninvite(params)
if not string.match(params,"(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /uninvite [id] [�������].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.uninvite == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ������ ���")
			wait(1000)
			sampSendChat("/me ��� ����� ������ ����������")
			wait(1000)
			sampSendChat('/me ����� �� ������ "�������"')
			sampSendChat("/uninvite "..id.." "..re)
		end)
			else
			sampSendChat("/uninvite "..id.." "..re)
		end
	end
end

function rang(params)
if not string.match(params,"(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /rang [id] [+/-].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.rang == 1 then
			sampSendChat("/do �� ������ ����� ������")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ���� ������, ������ ���, ���� ����� ������, ����� ������� �� �������� �� ������")
			sampSendChat("/rang "..id.." "..re)
		end)
			else
			sampSendChat("/rang "..id.." "..re)
		end
	end
end

function invite(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /invite [id].", 0x4b58ebFF) else
		if mainIni.settings.invite == 1 then
			sampSendChat("/do �� ������ ����� ������")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ���� ������, ������ ���, ���� �����, ����� � �����")
			wait(1000)
			sampSendChat("/me ������� �����, ����� � ����� �������� �� ������")
			sampSendChat("/invite "..id)
		end)
			else
			sampSendChat("/invite "..id)
		end
	end
end

function changeskin(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /changeskin [id].", 0x4b58ebFF) else
		if mainIni.settings.changeskin == 1 then
			sampSendChat("/do �� ������ ����� ������")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ���� ������, ������ ���, ���� ����� �����")
			wait(1000)
			sampSendChat("/�hangeskin "..id)
			wait(1000)
			sampSendChat("/me ������� ����� ����� �������� �� ������")
		end)
			else
			sampSendChat("/�hangeskin "..id)
		end
	end
end

function search(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /search [id].", 0x4b58ebFF) else
		if mainIni.settings.search == 1 then
			sampSendChat("�������� ����� � �����, ���� �� ������.")
		lua_thread.create(function() wait(1000)
			sampSendChat("/n /anim 33")
			sampSendChat("/me ������ ��������� ��������.")
			wait(1000)
			sampSendChat("/me ���� ��������� ��������.")
			wait(1000)
			sampSendChat("/me ������� ����.")
			wait(1000)
			sampSendChat("/anim 14")
			wait(1000)
			sampSendChat("/me ������� ����.")
			wait(1000)
			sampSendChat("/anim 16")
			wait(1000)
			sampSendChat("/search "..id)
			wait(1000)
			ten_menu.v = not ten_menu.v
		end)
			else
			sampSendChat("/search "..id)
			lua_thread.create(function() wait(1000)
			ten_menu.v = not ten_menu.v
			end)
		end
	end
end

function fn(param)
local text = param
	if text == "" then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /fn [�����].", 0x4b58ebFF) else
		sampSendChat("/f (( "..text.." ))")
	end
end

function rn(param)
local text = param
	if text == "" then sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /rn [�����].", 0x4b58ebFF) else
		sampSendChat("/r (( "..text.." ))")
	end
end

function ticket(params)
if not string.match(params,"(%d+)%s+(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} �� ����� ����������� ��������.{9d00bd} /ticket [id] [�����] [�������].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.ticket == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ������ ���������")
			wait(1000)
			sampSendChat("/me ������ �����")
			wait(1000)
			sampSendChat('/me �������� ���������')
			wait(1000)
			sampSendChat("/me ������� ��������� ����������")
			sampSendChat("/takelic "..id.." "..re)
		end)
			else
			sampSendChat("/takelic "..id.." "..re)
		end
	end
end

function ud()
	ten_menu_one.v = not ten_menu_one.v
end

function udos()
	lua_thread.create(function() wait(0)
		sampSendChat("/do � ������ ������� ���� ����� ������������� ���������� ���.")
		wait(1000)
		sampSendChat("/me �������� ���� � �������, ������ ��������� ���� ������������� � ����")
		wait(2000)
		sampSendChat('/me ������ �������������, ����� �������� ���� � ������� ���')
		wait(1000)
		sampSendChat("/do � �������������: ������: "..u8:decode(mainIni.settings.dol).." | ��� �������: "..u8:decode(mainIni.settings.name).." ... ")
		sampSendChat("/do ... | ����� �������������: "..u8:decode(mainIni.settings.phone).." | MofIA WS")
	end)
end


function imgui.TextQuestion(text)
    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(450)
        imgui.TextUnformatted(text)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

function getTime(timezone)
    local https = require 'ssl.https'
    local time = https.request('http://alat.specihost.com/unix-time/')
    return time and tonumber(time:match('^Current Unix Timestamp: <b>(%d+)</b>')) + (timezone or 0) * 60 * 60
end
