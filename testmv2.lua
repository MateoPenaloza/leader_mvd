script_version("1.2.0")

require "lib.moonloader"
inicfg = require 'inicfg'
local imgui = require 'imgui'
local key = require 'vkeys'
local encoding = require 'encoding' -- Ð·Ð°Ð³Ñ€ÑƒÐ¶Ð°ÐµÐ¼ Ð±Ð¸Ð±Ð»Ð¸Ð¾Ñ‚ÐµÐºÑƒ
encoding.default = 'CP1251' -- ÑƒÐºÐ°Ð·Ñ‹Ð²Ð°ÐµÐ¼ ÐºÐ¾Ð´Ð¸Ñ€Ð¾Ð²ÐºÑƒ Ð¿Ð¾ ÑƒÐ¼Ð¾Ð»Ñ‡Ð°Ð½Ð¸ÑŽ, Ð¾Ð½Ð° Ð´Ð¾Ð»Ð¶Ð½Ð° ÑÐ¾Ð²Ð¿Ð°Ð´Ð°Ñ‚ÑŒ Ñ ÐºÐ¾Ð´Ð¸Ñ€Ð¾Ð²ÐºÐ¾Ð¹ Ñ„Ð°Ð¹Ð»Ð°. CP1251 - ÑÑ‚Ð¾ Windows-1251
u8 = encoding.UTF8 -- Ð¸ ÑÐ¾Ð·Ð´Ð°Ñ‘Ð¼ ÐºÐ¾Ñ€Ð¾Ñ‚ÐºÐ¸Ð¹ Ð¿ÑÐµÐ²Ð´Ð¾Ð½Ð¸Ð¼ Ð´Ð»Ñ ÐºÐ¾Ð´Ð¸Ñ€Ð¾Ð²Ñ‰Ð¸ÐºÐ° UTF-8

local inicfg = require 'inicfg'

local dlstatus = require('moonloader').download_status

local path = getWorkingDirectory().."\\config\\MVDLeadLog.txt"

local mainIni = inicfg.load({
  settings =
  {
    phone = 'none',
    dol = 'none',
    name = 'none',
	style = 0,
	sls = 0,
	ssf = 0,
	slv = 0,
	sfls = 0,
	sfsf = 0,
	sflv = 0,
	kpsls = 0,
	kpssf = 0,
	kpslv = 0,
	ksfls = 0,
	ksfsf = 0,
	ksflv = 0
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
local tree_menu_0 = imgui.ImBool(false)
local tree_menu_1 = imgui.ImBool(false)
local tree_menu_2 = imgui.ImBool(false)
local tree_menu_3 = imgui.ImBool(false)
local fo_menu = imgui.ImBool(false)
local ears_menu = imgui.ImBool(false)
local five_menu = imgui.ImBool(false)
local six_menu = imgui.ImBool(false)
local seven_menu = imgui.ImBool(false)
local ten_menu = imgui.ImBool(false)
local ten_menu_one = imgui.ImBool(false)
local save_phone = imgui.ImBuffer(u8''..mainIni.settings.phone,256)
local save_name = imgui.ImBuffer(u8''..mainIni.settings.name,256)
local save_dol = imgui.ImBuffer(u8''..mainIni.settings.dol,256)
local find = 
{
	[1] = imgui.ImInt(0),
	[2] = imgui.ImInt(0),
	[3] = imgui.ImInt(0),
	[4] = imgui.ImInt(0)
}
local post = 
{
	[1] = imgui.ImInt(0),
	[2] = imgui.ImInt(0),
	[3] = imgui.ImInt(0),
	[4] = 0,
	[5] = 0,
	[6] = 0
}
local new_id = imgui.ImInt(-1)
local new_frak = imgui.ImInt(0)
local newi = 'none'
local frak = 'none'
local vig_n = imgui.ImBuffer(256)
local vig_p = imgui.ImBuffer(256)
local binder = imgui.ImBuffer(1024)
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
    imgui.Begin(u8'Leader-MVD | v. 1.3 beta', main_menu)
	if imgui.Button(u8'Íàñòðîéêè',imgui.ImVec2(280, 20)) then
		one_menu.v = not one_menu.v end
	if imgui.Button(u8'Ãîñ. íîâîñòè',imgui.ImVec2(280, 20)) then
		second_menu.v = not second_menu.v end
	if imgui.Button(u8'Ïðîâåðêà ðàáîòû Äåïàðòàìåíòîâ',imgui.ImVec2(280, 20)) then
		tree_menu.v = not tree_menu.v end	
	if imgui.Button(u8'Ñîîáùèòü â ðàöèþ',imgui.ImVec2(280, 20)) then
		fo_menu.v = not fo_menu.v end
	if imgui.Button(u8'Ïîñòàâèòü ëèäåðà',imgui.ImVec2(280, 20)) then
		five_menu.v = not five_menu.v end
	if imgui.Button(u8'Êðàñíàÿ êíîïêà',imgui.ImVec2(280, 20)) then
		--six_menu.v = not six_menu.v end
		printStringNow("It's not working", 2000)
		sampAddChatMessage("[Leader-MVD] {FFFFFF} Âðåìåííî íå ðàáîòàåò.", 0x4b58ebFF)
		end
	if imgui.Button(u8'Ëîã îáíîâëåíèÿ',imgui.ImVec2(280, 20)) then
		seven_menu.v = not seven_menu.v end
	imgui.End()
	end
   if one_menu.v then
   local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, -0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(852, 220), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Èíôîðìàöèÿ | v. 1.3 beta', one_menu)
		imgui.BeginChild('left pane', imgui.ImVec2(150, 0), true)
		if not selected then selected = 1 end
        if imgui.Selectable(u8('Íàñòðîéêè'), selected == 1) then selected = 1 end
        if imgui.Selectable(u8('Êîìàíäû'), selected == 2) then selected = 2 end
        if imgui.Selectable(u8('Ðàçðàáîòêà'), selected == 3) then selected = 3 end
        if imgui.Selectable(u8('Ðàçðàáîòêà'), selected == 4) then selected = 4 end
        if imgui.Selectable(u8('Ðàçðàáîòêà'), selected == 5) then selected = 5 end
        imgui.EndChild()
        imgui.SameLine()
        imgui.BeginGroup()
        if selected == 1 then 
			imgui.Columns(3)
			imgui.SetColumnWidth(-1, 280)
				if imgui.Combo(u8'Ñòèëü ñêðèïòà', style_set, {u8'Ñòèëü 1',u8'Ñòèëü 2'}) then 
				if style_set.v == 'Ñòèëü 1' then style = 0 end
				if style_set.v == 'Ñòèëü 2' then style = 1 end
				if style_set.v == 'Ñòèëü 3' then style = 2 end
				end
				imgui.InputText(u8'Íèê (áåç "_")', save_name,imgui.ImVec2(200, 30))
				imgui.InputText(u8'Çâàíèå/Äîëæíîñòü', save_dol,imgui.ImVec2(200, 30))
				imgui.InputText(u8'Íîìåð', save_phone,imgui.ImVec2(200, 30))
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
			imgui.Checkbox(u8"Âêëþ÷èòü RP îòûãðîâêó îðóæèÿ", save_rpw)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /su", save_su)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /putpl", save_putpl)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /eject", save_eject)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /arrest", save_arrest)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /hold", save_hold)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /takelic", save_takelic)
			imgui.NextColumn()
			imgui.SetColumnWidth(-1, 280)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /invite", save_invite)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /uninvite", save_uninvite)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /rang", save_rang)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /changeskin", save_changeskin)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /search", save_search)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /cuff", save_cuff)
			imgui.Checkbox(u8"ÐÏ îòûãðîâêà /ticket", save_ticket)
			imgui.Columns(1)
			if imgui.Button(u8'Ñîõðàíèòü',imgui.ImVec2(685, 20)) then
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
			imgui.Text(u8'- ÎÎÑ ÷àò â /r ðàöèþ')
			imgui.Text(u8'- ÎÎÑ ÷àò â /f ðàöèþ')
			imgui.Text(u8'- íàäåòü íàðó÷íèêè')
			imgui.Text(u8'- ïîñàäèòü â ÊÏÇ')
			imgui.Text(u8'- ïîñàäèòü â ïàòðóëüíîå àâòî')
			imgui.Text(u8'- âûòàùèòü èç ìàøèíû')
			imgui.Text(u8'- îáúÿâèòü â ðîçûñê')
			imgui.Text(u8'- èçúÿòü âîäèòåëüñêîå óäîñòîâåðåíèå')
			imgui.Text(u8'- âûïèñàòü øòðàô')
			imgui.Text(u8'- ïðèíÿòü ÷åëîâåêà â îðãàíèçàöèþ')
			imgui.NextColumn()
			imgui.SetColumnWidth(-1, 100)
			imgui.Text(u8'/uninvite')
			imgui.Text(u8'/óä')
			imgui.Text(u8'/åïê')
			imgui.NextColumn()
			imgui.Text(u8'- óâîëèòü ñîòðóäíèêà')
			imgui.Text(u8'- ïîêàçàòü óäîñòîâåðåíèå')
			imgui.Text(u8'- ïîñìîòðåòü ÅÏÊ')
		end
        imgui.EndGroup()
		imgui.End()
	end
	if second_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Ãîñ. íîâîñòè | v. 1.3 beta', second_menu)
		if imgui.Button(u8'Äëÿ ìèíèñòðà',imgui.ImVec2(280, 20)) then
		 second_menu_1.v = not second_menu_1.v end
		 if imgui.Button(u8'Äëÿ ËÑÏÄ',imgui.ImVec2(280, 20)) then
		  second_menu_2.v = not second_menu_2.v end
		if imgui.Button(u8'Äëÿ ÑÔÏÄ',imgui.ImVec2(280, 20)) then
		 second_menu_3.v = not second_menu_3.v end
		if imgui.Button(u8'Äëÿ ËÂÏÄ',imgui.ImVec2(280, 20)) then
		 second_menu_4.v = not second_menu_4.v end
	imgui.End()
	end
			if second_menu_1.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 140), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Ãîñ. íîâîñòè | MVD | v. 1.3 beta', second_menu_1)
				if imgui.Button(u8'Íàáîð â PA (3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.')
					sampSendChat('/gnews Police Academy âñåõ ãîðîäîâ ïðîâîäèò íàáîð.')
					sampSendChat('/gnews Êàæäûé èç âàñ ìîæåò ïîïðîáîâàòü ñåáÿ â ðîëè îôèöåðà.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.\nPolice Academy âñåõ ãîðîäîâ ïðîâîäèò íàáîð.\nÊàæäûé èç âàñ ìîæåò ïîïðîáîâàòü ñåáÿ â ðîëè îôèöåðà.')
				if imgui.Button(u8'Âîññòàíîâëåíèå ïî /wbook (1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Îòêðûòû çàÿâëåíèÿ íà âîññòàíîâëåíèå â ÌÂÄ ïî òðóäîâîé êíèãå.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Îòêðûòû çàÿâëåíèÿ íà âîññòàíîâëåíèå â ÌÂÄ ïî òðóäîâîé êíèãå.')
				if imgui.Button(u8'Àãèòàöèîííîå ñîîáùåíèå(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Âàñ îãðàáèëè? Âàì óãðîæàþò? Óâèäåëè äðàêó? Çâîíèòå â 02!')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Âàñ îãðàáèëè? Âàì óãðîæàþò? Óâèäåëè äðàêó? Çâîíèòå â 02!')
				if imgui.Button(u8'Àãèòàöèîííîå ñîîáùåíèå(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.')
					sampSendChat('/gnews Âàñ îãðàáèëè? Âàì óãðîæàþò? Óâèäåëè äðàêó? Çâîíèòå â 02!')
					sampSendChat('/gnews Ïîëèöèÿ Áåëîãî Øòàòà ïîìîæåò Âàì!')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.\nÂàñ îãðàáèëè? Âàì óãðîæàþò? Óâèäåëè äðàêó? Çâîíèòå â 02!\nÏîëèöèÿ Áåëîãî Øòàòà ïîìîæåò Âàì!')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           Âðåìÿ:'..time)
			imgui.End()
			end
			if second_menu_2.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Ãîñ. íîâîñòè | LSPD | v. 1.3 beta', second_menu_2)
				if imgui.Button(u8'Ñîáåñåäîâàíèå(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.')
					sampSendChat('/gnews Ïðîõîäèò íàáîð êóðñàíòîâ â Los-Santos Police Academy.')
					sampSendChat('/gnews Êðèòåðèè: 4 ãîäà â Øòàòå, ëèöåíçèè, çàêîíîïîñëóøíîñòü')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.\nÏðîõîäèò íàáîð êóðñàíòîâ â Los-Santos Police Academy.\n Êðèòåðèè: 4 ãîäà â Øòàòå, ëèöåíçèè, çàêîíîïîñëóøíîñòü')
				if imgui.Button(u8'Íàïîìèíàíèå î ñîáåñåäîâàíèè(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Íàïîìèíàþ, ïðîõîäèò íàáîð êóðñàíòîâ â Los-Santos Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Íàïîìèíàþ, ïðîõîäèò íàáîð êóðñàíòîâ â Los-Santos Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           Âðåìÿ:'..time)
			imgui.End()
			end
			if second_menu_3.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Ãîñ. íîâîñòè | SFPD | v. 1.3 beta', second_menu_3)
				if imgui.Button(u8'Ñîáåñåäîâàíèå(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.')
					sampSendChat('/gnews Ïðîõîäèò íàáîð êóðñàíòîâ â San-Fierro Police Academy.')
					sampSendChat('/gnews Êðèòåðèè: 4 ãîäà â Øòàòå, ëèöåíçèè, çàêîíîïîñëóøíîñòü')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.\nÏðîõîäèò íàáîð êóðñàíòîâ â San-Fierro Police Academy.\n Êðèòåðèè: 4 ãîäà â Øòàòå, ëèöåíçèè, çàêîíîïîñëóøíîñòü')
				if imgui.Button(u8'Íàïîìèíàíèå î ñîáåñåäîâàíèè(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Íàïîìèíàþ, ïðîõîäèò íàáîð êóðñàíòîâ â San-Fierro Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Íàïîìèíàþ, ïðîõîäèò íàáîð êóðñàíòîâ â San-Fierro Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           Âðåìÿ:'..time)
			imgui.End()
			end
			if second_menu_4.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Ãîñ. íîâîñòè | LVPD | v. 1.3 beta', second_menu_4)
				if imgui.Button(u8'Ñîáåñåäîâàíèå(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.')
					sampSendChat('/gnews Ïðîõîäèò íàáîð êóðñàíòîâ â Las-Venturas Police Academy.')
					sampSendChat('/gnews Êðèòåðèè: 4 ãîäà â Øòàòå, ëèöåíçèè, çàêîíîïîñëóøíîñòü')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Óâàæàåìûå æèòåëè Øòàòà! Ìèíóòî÷êó âíèìàíèÿ.\nÏðîõîäèò íàáîð êóðñàíòîâ â Las-Venturas Police Academy.\n Êðèòåðèè: 4 ãîäà â Øòàòå, ëèöåíçèè, çàêîíîïîñëóøíîñòü')
				if imgui.Button(u8'Íàïîìèíàíèå î ñîáåñåäîâàíèè(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Íàïîìèíàþ, ïðîõîäèò íàáîð êóðñàíòîâ â Las-Venturas Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Íàïîìèíàþ, ïðîõîäèò íàáîð êóðñàíòîâ â Las-Venturas Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           Âðåìÿ:'..time)
			imgui.End()
			end
	if tree_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(505, 170), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Ïðîâåðêà ðàáîòû Äåïàðòàìåíòîâ | v. 1.3 beta', tree_menu)
	imgui.BeginChild('left pane', imgui.ImVec2(180, 0), true)
		if not selected2 then selected2 = 1 end
        if imgui.Selectable(u8('Ïðîâåðêà ïîñòîâ ãîðîäîâ   '), selected2 == 1) then selected2 = 1 end
        if imgui.Selectable(u8('Ïðîâåðêà ïàòðóëÿ â ãîðîäàõ'), selected2 == 2) then selected2 = 2 end
        if imgui.Selectable(u8('Ñòàòèñòèêà ïðîâåðîê'), selected2 == 3) then selected2 = 3 end
		imgui.EndChild()
        imgui.SameLine()
        imgui.BeginGroup()
		if selected2 == 1 then
			if imgui.Button(u8'Ãîðîä Los-Santos',imgui.ImVec2(300, 20)) then
				tree_menu_1.v = not tree_menu_1.v end
			if imgui.Button(u8'Ãîðîä San-Fierro',imgui.ImVec2(300, 20)) then
				tree_menu_2.v = not tree_menu_2.v end
			if imgui.Button(u8'Ãîðîä Las-Venturas',imgui.ImVec2(300, 20)) then
				tree_menu_3.v = not tree_menu_3.v end
			if imgui.Button(u8'Èòîã ïðîâåðêè',imgui.ImVec2(300, 20)) then
				sampSendChat(string.format("/f Èòîã ïðîâåðêè ïîñòîâ: Ëîñ-Ñàíòîñ: %d/3, Ñàí-Ôèåððî: %d/3, Ëàñ-Âåíòóðàñ: %d/3", post[4], post[5], post[6]))
				local flog = io.open(path, "a")
				flog:write('['..os.date('%d.%m.%Y | %X')..'] Èòîã ïðîâåðêè ïîñòîâ: ËÑ - '..post[4]..' ÑÔ - '..post[5]..' ËÂ - '..post[6]..'\n')
				flog:close()
				mainIni.settings.sls = mainIni.settings.sls+post[4]
				mainIni.settings.ssf = mainIni.settings.ssf+post[5]
				mainIni.settings.slv = mainIni.settings.slv+post[6]
				mainIni.settings.kpsls = mainIni.settings.kpsls+1
				mainIni.settings.kpssf = mainIni.settings.kpssf+1
				mainIni.settings.kpslv = mainIni.settings.kpslv+1
				inicfg.save(mainIni, '..\\config\\MVDLead.ini')
				sampAddChatMessage(string.format("[Leader-MVD] {FFFFFF}LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]), 0x4b58ebFF)
				sampAddChatMessage("[Leader-MVD] {FFFFFF}Äàííûå îáíóëèëèñü", 0x4b58ebFF)
				post[4] = 0
				post[5] = 0
				post[6] = 0
			end
			--[[imgui.SameLine(nil, 4)
			if imgui.Button(u8'Îáíóëèòü ïîñòû',imgui.ImVec2(148, 20)) then
				mainIni.settings.sls = mainIni.settings.sls+post[4]
				mainIni.settings.ssf = mainIni.settings.ssf+post[5]
				mainIni.settings.slv = mainIni.settings.slv+post[6]
				mainIni.settings.kpsls = mainIni.settings.kpsls+1
				mainIni.settings.kpssf = mainIni.settings.kpssf+1
				mainIni.settings.kpslv = mainIni.settings.kpslv+1
				inicfg.save(mainIni, '..\\config\\MVDLead.ini')
				sampAddChatMessage(string.format("[Leader-MVD] {FFFFFF}LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]), 0x4b58ebFF)
				sampAddChatMessage("[Leader-MVD] {FFFFFF}Äàííûå îáíóëèëèñü", 0x4b58ebFF)
				post[4] = 0
				post[5] = 0
				post[6] = 0
			end]]
		end
		if selected2 == 2 then
			imgui.Columns(2)
			imgui.SetColumnWidth(-1, 320)
			----------------------------
			imgui.PushItemWidth(150)
			imgui.InputInt('', post[1], 0, 0)
			imgui.PopItemWidth()
			imgui.SameLine(nil, 5)
			if imgui.Button(u8'-##but104',imgui.ImVec2(20, 20)) then
				if post[1].v > 0 then
					post[1].v = post[1].v-1
					sampSendChat("/f Àííóëèðîâàë ïàòðóëü â ãîðîäå Ëîñ-Ñàíòîñ. Êîë-âî ïàòðóëåé íà äàííûé ìîìåíò: "..post[1].v)
				else sampAddChatMessage("[Leader-MVD] {FFFFFF}Êîë-âî ïàòðóëåé íå ìîæåò áûòü ìåíüøå 0.", 0x4b58ebFF) end
			end
			imgui.SameLine(nil, 5)
			if imgui.Button(u8'+##but106',imgui.ImVec2(20, 20)) then
				post[1].v = post[1].v+1
				sampSendChat("/f Îáíàðóæåí ïàòðóëü â ãîðîäå Ëîñ-Ñàíòîñ. Êîë-âî ïàòðóëåé íà äàííûé ìîìåíò: "..post[1].v)
			end
			imgui.SameLine(nil, 5)
			imgui.Text(u8'Ëîñ-Ñàíòîñ')
			--------------------------------
			imgui.PushItemWidth(150)
			imgui.InputInt('', post[2], 0, 0)
			imgui.PopItemWidth()
			imgui.SameLine(nil, 5)
			if imgui.Button(u8'-##but103',imgui.ImVec2(20, 20)) then
				if  post[2].v > 0 then
					 post[2].v =  post[2].v-1
					sampSendChat("/f Àííóëèðîâàë ïàòðóëü â ãîðîäå Ñàí-Ôèåððî. Êîë-âî ïàòðóëåé íà äàííûé ìîìåíò: "..post[2].v)
				else sampAddChatMessage("[Leader-MVD] {FFFFFF}Êîë-âî ïàòðóëåé íå ìîæåò áûòü ìåíüøå 0.", 0x4b58ebFF) end
			end
			imgui.SameLine(nil, 5)
			if imgui.Button(u8'+##but102',imgui.ImVec2(20, 20)) then
				 post[2].v =  post[2].v+1
				sampSendChat("/f Îáíàðóæåí ïàòðóëü â ãîðîäå Ñàí-Ôèåððî. Êîë-âî ïàòðóëåé íà äàííûé ìîìåíò: "..post[2].v)
			end
			imgui.SameLine(nil, 5)
			imgui.Text(u8'Ñàí-Ôèåððî')
			--------------------------------
			imgui.PushItemWidth(150)
			imgui.InputInt('',  post[3], 0, 0)
			imgui.PopItemWidth()
			imgui.SameLine(nil, 5)
			if imgui.Button(u8'-##but100',imgui.ImVec2(20, 20)) then
				if post[3].v > 0 then
					post[3].v = post[3].v-1
					sampSendChat("/f Àííóëèðîâàë ïàòðóëü â ãîðîäå Ëàñ-Âåíòóðàñ. Êîë-âî ïàòðóëåé íà äàííûé ìîìåíò: "..post[3].v)
				else sampAddChatMessage("[Leader-MVD] {FFFFFF}Êîë-âî ïàòðóëåé íå ìîæåò áûòü ìåíüøå 0.", 0x4b58ebFF) end
			end
			imgui.SameLine(nil, 5)
			if imgui.Button(u8'+##but101',imgui.ImVec2(20, 20)) then
				post[3].v = post[3].v+1
				sampSendChat("/f Îáíàðóæåí ïàòðóëü â ãîðîäå Ëàñ-Âåíòóðàñ. Êîë-âî ïàòðóëåé íà äàííûé ìîìåíò: "..post[3].v)
			end
			imgui.SameLine(nil, 5)
			imgui.Text(u8'Ëàñ-Âåíòóðàñ')
			--------------------------------
			imgui.Text(u8'Êîë-âî ïàòðóëåé â ãîðîäàõ:')
			imgui.Text(u8'Ëîñ-Ñàíòîñ: '..post[1].v.. " |")
			imgui.SameLine(nil, 4)
			imgui.Text(u8'Ñàí-Ôèåððî: '..post[2].v.. " |")
			imgui.SameLine(nil, 4)
			imgui.Text(u8'Ëàñ-Âåíòóðàñ: '..post[3].v)
			if imgui.Button(u8'Èòîã ïðîâåðêè',imgui.ImVec2(300, 20)) then
				sampSendChat(string.format(" /f Èòîã ïðîâåðêè ïàòðóëåé: Ëîñ-Ñàíòîñ: %s, Ñàí-Ôèåððî: %s, Ëàñ-Âåíòóðàñ: %s", post[1].v, post[2].v, post[3].v))
				local flog = io.open(path, "a")
				flog:write('['..os.date('%d.%m.%Y | %X')..'] Èòîã ïðîâåðêè ïàòðóëåé: ËÑ - '..post[1].v..' ÑÔ - '..post[2].v..' ËÂ - '..post[3].v..'\n')
				flog:close()
				mainIni.settings.sls = mainIni.settings.sls+post[1].v
				mainIni.settings.ssf = mainIni.settings.ssf+post[2].v
				mainIni.settings.slv = mainIni.settings.slv+post[3].v
				mainIni.settings.kpsls = mainIni.settings.kpsls+1
				mainIni.settings.kpssf = mainIni.settings.kpssf+1
				mainIni.settings.kpslv = mainIni.settings.kpslv+1
				inicfg.save(mainIni, '..\\config\\MVDLead.ini')
				sampAddChatMessage(string.format("[Leader-MVD] {FFFFFF}LS: %d SF: %d LV: %d", post[1].v, post[2].v, post[3].v), 0x4b58ebFF)
				sampAddChatMessage("[Leader-MVD] {FFFFFF}Äàííûå îáíóëèëèñü", 0x4b58ebFF)
				post[1].v = 0
				post[2].v = 0
				post[3].v = 0
			end
		end
		if selected2 == 3 then
			local it =
			{
				[1] = (mainIni.settings.sls/mainIni.settings.sfls)*100,
				[2] = (mainIni.settings.ssf/mainIni.settings.sfsf)*100,
				[3] = (mainIni.settings.slv/mainIni.settings.sflv)*100,
				---------------------------
				[4] = mainIni.settings.sls/mainIni.settings.kpsls,
				[5] = mainIni.settings.ssf/mainIni.settings.kpssf,
				[6] = mainIni.settings.slv/mainIni.settings.kpslv,
				---------------------------
				[7] = mainIni.settings.sfls/mainIni.settings.ksfls,
				[8] = mainIni.settings.sfsf/mainIni.settings.ksfsf,
				[9] = mainIni.settings.sflv/mainIni.settings.ksflv
			}
			

			imgui.Columns(4)
			imgui.Separator()
			imgui.SetColumnWidth(-1, 20)
			if imgui.Button(u8'^',imgui.ImVec2(14, 16)) then
				tree_menu_0.v = not tree_menu_0.v end
			imgui.NextColumn()
			imgui.Text(u8'Ëîñ-Ñàíòîñ')
			imgui.SetColumnWidth(-1, 100)
			imgui.NextColumn()
			imgui.Text(u8'Ñàí-Ôèåððî')
			imgui.SetColumnWidth(-1, 100)
			imgui.NextColumn()
			imgui.Text(u8'Ëàñ-Âåíòóðàñ')
			imgui.Separator()
			imgui.Columns(1)
			-----------------------------------------
			imgui.Columns(4)
			imgui.SetColumnWidth(-1, 20)
			imgui.TextQuestion(u8'Ñðåäíèé find')
			imgui.NextColumn()
			imgui.Text(u8('%d'):format(it[7]))
			imgui.SetColumnWidth(-1, 100)
			imgui.NextColumn()
			imgui.Text(u8('%d'):format(it[8]))
			imgui.SetColumnWidth(-1, 100)
			imgui.NextColumn()
			imgui.Text(u8('%d'):format(it[9]))
			imgui.Separator()
			-------------------------------------
			imgui.NextColumn()
			imgui.TextQuestion(u8'Ñðåäíèé % ðàáîòàþùèõ ñîòðóäíèêîâ')
			imgui.NextColumn()
			imgui.Text(u8('%0.1f'):format(it[1])..'%')
			imgui.NextColumn()
			imgui.Text(u8('%0.1f'):format(it[2])..'%')
			imgui.NextColumn()
			imgui.Text(u8('%0.1f'):format(it[3])..'%')
			imgui.Separator()
			-----------------------------------------
			imgui.NextColumn()
			imgui.TextQuestion(u8'Ñðåäíåå êîë-âî ïàòðóëåé è çàíÿòûõ ïîñòîâ')
			imgui.NextColumn()
			imgui.Text(u8('%d'):format(it[4]))
			imgui.NextColumn()
			imgui.Text(u8('%d'):format(it[5]))
			imgui.NextColumn()
			imgui.Text(u8('%d'):format(it[6]))
			imgui.Separator()
			imgui.Columns(1)
			imgui.Text(u8'\t\t\t\t\t\t\tÎ÷èñòèòü äàííûå:')
			imgui.SameLine(nil, 3)
			imgui.TextQuestion(u8'Åñëè â ïîäðàçäåëåíèè ïîìåíÿëñÿ ëèäåð, òî æåëàòåëüíî î÷èñòèòü äàííûå ðàáîòû ïîäðàçäåëåíèÿ  ëèäåðà. Íàæìèòå íà êíîïêó, íà êîòîðîé íàïèñàí ãîðîä, ãäå ïîìåíÿëñÿ ëèäåð')
			imgui.TextQuestion(u8'Áóäüòå âíèìàòåëüíû, åñëè âû íàæì¸òå íà îäíó èç êíîïîê, òî î÷èñòÿòñÿ âñå äàííûå ðàáîòû ïîäðàçäåëåíèÿ')
			imgui.SameLine(nil, 1)
			if imgui.Button(u8'Ëîñ-Ñàíòîñ',imgui.ImVec2(100, 20)) then
				mainIni.settings.sls = 0
				mainIni.settings.sfls = 0
				mainIni.settings.ksfls = 0
				inicfg.save(mainIni, '..\\config\\MVDLead.ini')
			end
			imgui.SameLine(nil, 1)
			if imgui.Button(u8'Ñàí-Ôèåððî',imgui.ImVec2(99, 20)) then
				mainIni.settings.ssf = 0
				mainIni.settings.sfsf = 0
				mainIni.settings.ksfsf = 0
				inicfg.save(mainIni, '..\\config\\MVDLead.ini')
			end
			imgui.SameLine(nil, 1)
			if imgui.Button(u8'Ëàñ-Âåíòóðàñ',imgui.ImVec2(98, 20)) then
				mainIni.settings.slv = 0
				mainIni.settings.sflv = 0
				mainIni.settings.ksflv = 0
				inicfg.save(mainIni, '..\\config\\MVDLead.ini')
			end
		end
		imgui.EndGroup()
	imgui.End()
	end
			if tree_menu_0.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(400, 500), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Ïðîâåðêà ðàáîòû Äåïàðòàìåíòîâ | Äèàãðàììû | v. 1.3 beta', tree_menu_0)
			local it =
			{
				[1] = (mainIni.settings.sls/mainIni.settings.sfls)*100,
				[2] = (mainIni.settings.ssf/mainIni.settings.sfsf)*100,
				[3] = (mainIni.settings.slv/mainIni.settings.sflv)*100,
				---------------------------
				[4] = mainIni.settings.sls/mainIni.settings.kpsls,
				[5] = mainIni.settings.ssf/mainIni.settings.kpssf,
				[6] = mainIni.settings.slv/mainIni.settings.kpslv,
				---------------------------
				[7] = mainIni.settings.sfls/mainIni.settings.ksfls,
				[8] = mainIni.settings.sfsf/mainIni.settings.ksfsf,
				[9] = mainIni.settings.sflv/mainIni.settings.ksflv
			}
			local flightFind = {
				{
					v = it[7],
					name = 'Los-Santos',
					color = 0xFFFF7755
				},
				{
					v = it[8],
					name = 'San-Fierro',
					color = 0xFF77FF55
				},
				{
					v = it[9],
					name = 'Las-Venturas',
					color = 0xFF3F85CD
				}
			}
			
			local flightKpst = {
				{
					v = it[4],
					name = 'Los-Santos',
					color = 0xFFFF7755
				},
				{
					v = it[5],
					name = 'San-Fierro',
					color = 0xFF77FF55
				},
				{
					v = it[6],
					name = 'Las-Venturas',
					color = 0xFF3F85CD
				}
			}
			
			local flightDiagram = {
				{
					v = it[1],
					name = 'Los-Santos',
					color = 0xFFFF7755
				},
				{
					v = it[2],
					name = 'San-Fierro',
					color = 0xFF77FF55
				},
				{
					v = it[3],
					name = 'Las-Venturas',
					color = 0xFF3F85CD
				}
			}
			imgui.Text(u8'Ñðåäíèé find:')
			imgui.RoundDiagram(flightFind, 60, 50)
			imgui.Text(u8'Ñðåäíåå êîë-âî ïàòðóëåé è çàíÿòûõ ïîñòîâ:')
			imgui.RoundDiagram(flightKpst, 60, 50)
			imgui.Text(u8'Ñðåäíèé % ðàáîòàþùèõ ñîòðóäíèêîâ:')
			imgui.RoundDiagram(flightDiagram, 60, 50)
			imgui.End()
			end
			----------------------------------------
			if tree_menu_1.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(380, 110), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Ïðîâåðêà ïîñòîâ | Los-Santos | v. 1.3 beta', tree_menu_1)
				imgui.Text(u8'Àâòîñòàíöèÿ Ëîñ-Ñàíòîñ:')
				imgui.SameLine(nil, 92)
				if imgui.Button(u8'Çàíÿòî##but8',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Àâòîñòàíöèÿ Ëîñ-Ñàíòîñ. Ñîñòîÿíèå: Çàíÿò')
					post[4] = post[4]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but8',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Àâòîñòàíöèÿ Ëîñ-Ñàíòîñ. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.Text(u8'Ìýðèÿ Ëîñ-Ñàíòîñ:')
				imgui.SameLine(nil, 129)
				if imgui.Button(u8'Çàíÿòî##but7',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Ìýðèÿ Ëîñ-Ñàíòîñ. Ñîñòîÿíèå: Çàíÿò')
					post[4] = post[4]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but7',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Ìýðèÿ Ëîñ-Ñàíòîñ. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.Text(u8'Æåëåçíî-äîðîæíûé âîêçàë Ëîñ-Ñàíòîñ:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Çàíÿòî##but6',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Æåëåçíî-äîðîæíûé âîêçàë Ëîñ-Ñàíòîñ. Ñîñòîÿíèå: Çàíÿò')
					post[4] = post[4]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but6',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Æåëåçíî-äîðîæíûé âîêçàë Ëîñ-Ñàíòîñ. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
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
			imgui.Begin(u8'Ïðîâåðêà ïîñòîâ | San-Fierro | v. 1.3 beta', tree_menu_2)
				imgui.Text(u8'Àâòîøêîëà Ñàí-Ôèåððî:')
				imgui.SameLine(nil, 103)
				if imgui.Button(u8'Çàíÿòî##but2',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Àâòîøêîëà Ñàí-Ôèåððî. Ñîñòîÿíèå: Çàíÿò')
					post[5] = post[5]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but2',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Àâòîøêîëà Ñàí-Ôèåððî. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'Ìýðèÿ Ñàí-Ôèåððî:')
				imgui.SameLine(nil, 130)
				if imgui.Button(u8'Çàíÿòî##but1',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Ìýðèÿ Ñàí-Ôèåððî. Ñîñòîÿíèå: Çàíÿò')
					post[5] = post[5]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but1',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Ìýðèÿ Ñàí-Ôèåððî. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'Æåëåçíî-äîðîæíûé âîêçàë Ñàí-Ôèåððî:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Çàíÿòî##but',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Æåëåçíî-äîðîæíûé âîêçàë Ñàí-Ôèåððî. Ñîñòîÿíèå: Çàíÿò')
					post[5] = post[5]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Æåëåçíî-äîðîæíûé âîêçàë Ñàí-Ôèåððî. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
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
			imgui.Begin(u8'Ïðîâåðêà ïîñòîâ | Las-Venturas | v. 1.3 beta', tree_menu_3)
				imgui.Text(u8'Ðàäèîöåíòð Ëàñ-Âåíòóðàñ:')
				imgui.SameLine(nil, 96)
				if imgui.Button(u8'Çàíÿòî##but5',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Ðàäèîöåíòð Ëàñ-Âåíòóðàñ. Ñîñòîÿíèå: Çàíÿò')
					post[6] = post[6]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but5',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Ðàäèîöåíòð Ëàñ-Âåíòóðàñ. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'Öåíòðàëüíàÿ Áîëüíèöà Ëàñ-Âåíòóðàñ:')
				imgui.SameLine(nil, 30)
				if imgui.Button(u8'Çàíÿòî##but4',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Öåíòðàëüíàÿ Áîëüíèöà Ëàñ-Âåíòóðàñ. Ñîñòîÿíèå: Çàíÿò')
					post[6] = post[6]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but4',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Öåíòðàëüíàÿ Áîëüíèöà Ëàñ-Âåíòóðàñ. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'Æåëåçíî-äîðîæíûé âîêçàë Ëàñ-Âåíòóðàñ:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Çàíÿòî##but3',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Æåëåçíî-äîðîæíûé âîêçàë Ëàñ-Âåíòóðàñ. Ñîñòîÿíèå: Çàíÿò')
					post[6] = post[6]+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Ïóñòî##but3',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Ïîñò: Æåëåçíî-äîðîæíûé âîêçàë Ëàñ-Âåíòóðàñ. Ñîñòîÿíèå: Ïóñòî')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", post[4], post[5], post[6]),3000)
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
    imgui.Begin(u8'Ñîîáùèòü â ðàöèþ | v. 1.3 beta', fo_menu)
		if imgui.Button(u8'Ñòðîé ËÑÏÄ',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Îáùèé ñòðîé â ãàðàæå ËÑÏÄ")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8'Ñòðîé ÑÔÏÄ',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Îáùèé ñòðîé â ãàðàæå ÑÔÏÄ")
		end
		if imgui.Button(u8'Ñòðîé ËÂÏÄ',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Îáùèé ñòðîé â ãàðàæå ËÂÏÄ")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8'Ñòðîé FBI',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Îáùèé ñòðîé â îôèñå FBI")
		end
		if imgui.Button(u8'Ñîáðàíèå (5 ìèí)',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Ñîáðàíèå Ìèí. Âíóòðåííèõ Äåë íà÷í¸òñÿ ÷åðåç 5 ìèíóò.")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8"Ïðîâåðêà /find'a",imgui.ImVec2(138, 20)) then
			ears_menu.v = not ears_menu.v
			sampSendChat(string.format("/f WSPD, äîëîæèòå êîë-âî ñîòðóäíèêîâ â Øòàòå! FBI íà íîìåð %s", mainIni.settings.phone))
		end
	imgui.End()
	end
	if ears_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(-1.0, -1.0))
	imgui.SetNextWindowSize(imgui.ImVec2(205, 135), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Ïðîâåðêà ôèíäà | v. 1.3 beta', ears_menu)
	imgui.Text(u8'  Óêàæèòå êîë-âî ñîòðóäíèêîâ\n\t êàæäîãî ïîäðàçäåëåíèÿ:')
	imgui.PushItemWidth(68)
	imgui.InputInt(u8'ËÑ', find[1], 1, 10)
	imgui.PopItemWidth()
	imgui.SameLine(nil, 4)
	imgui.PushItemWidth(68)
	imgui.InputInt(u8'ÑÔ', find[2], 1, 10)
	imgui.PopItemWidth()
	imgui.PushItemWidth(68)
	imgui.InputInt(u8'ËÂ', find[3], 1, 10)
	imgui.PopItemWidth()
	imgui.SameLine(nil, 4)
	imgui.PushItemWidth(68)
	imgui.InputInt(u8'FBI', find[4], 1, 10)
	imgui.PopItemWidth()
	if imgui.Button(u8"Ñîõðàíèòü",imgui.ImVec2(182, 20)) then
			local flog = io.open(path, "a")
			flog:write('['..os.date('%d.%m.%Y | %X')..'] Ôèíä îðãàíèçàöèé: ËÑ - '..find[1].v..' ÑÔ - '..find[2].v..' ËÂ - '..find[3].v..' FBI - '..find[4].v..'\n')
			flog:close()
			mainIni.settings.sfls = mainIni.settings.sfls+find[1].v
			mainIni.settings.sfsf = mainIni.settings.sfsf+find[2].v
			mainIni.settings.sflv = mainIni.settings.sflv+find[3].v
			mainIni.settings.ksfls = mainIni.settings.ksfls+1
			mainIni.settings.ksfsf = mainIni.settings.ksfsf+1
			mainIni.settings.ksflv = mainIni.settings.ksflv+1
			inicfg.save(mainIni, '..\\config\\MVDLead.ini')
	end
	--[[imgui.Text(u8'             Î÷èñòèòü äàííûå î ôèíäàõ: ')
	imgui.SameLine(nil, 1)
	imgui.TextQuestion(u8'Åñëè â ïîäðàçäåëåíèè ïîìåíÿëñÿ ëèäåð, òî æåëàòåëüíî î÷èñòèòü äàííûå î ôèíäàõ äðóãîãî ëèäåðà. Íàæìèòå íà êíîïêó, íà êîòîðîé íàïèñàí ãîðîä, â êîòîðîì ïîìåíÿëñÿ ëèäåð')
	if imgui.Button(u8"Clear LS*",imgui.ImVec2(88, 20)) then
			mainIni.settings.sfls = 0
			inicfg.save(mainIni, '..\\config\\MVDLead.ini')
	end
	imgui.SameLine(nil, 3)
	if imgui.Button(u8"Clear SF*",imgui.ImVec2(88, 20)) then
			mainIni.settings.sfsf = 0
			inicfg.save(mainIni, '..\\config\\MVDLead.ini')
	end
	imgui.SameLine(nil, 3)
	if imgui.Button(u8"Clear LV*",imgui.ImVec2(88, 20)) then
			mainIni.settings.sflv = 0
			inicfg.save(mainIni, '..\\config\\MVDLead.ini')
	end]]
	imgui.End()
	end
	if five_menu.v then
    local sw, sh = getScreenResolution()
    imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
    imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Ïîñòàâèòü ëèäåðà | v. 1.3 beta', five_menu)
		imgui.InputInt(u8'ID ', new_id, 1, 10)
        if imgui.Combo(u8'Ëèäåðêà', new_frak, {u8'ËÑÏÄ',u8'ÑÔÏÄ',u8'ËÂÏÄ',u8'FBI'}) then
            if new_frak.v == 0 then name_lid = 'Ïîëèöèè Ëîñ-Ñàíòîñà' end
            if new_frak.v == 1 then name_lid = 'Ïîëèöèè Ñàí-Ôèåððî' end
            if new_frak.v == 2 then name_lid = 'Ïîëèöèè Ëàñ Âåíòóðàñà' end
            if new_frak.v == 3 then name_lid = 'ÔÁÐ' end
        end
        if sampIsPlayerConnected(new_id.v) then
            local nick = sampGetPlayerNickname(new_id.v)
			imgui.Text(u8(string.format('Âû ñîáèðàåòåñü ïîñòàâèòü %s íà ïîñò ëèäåðà %s',nick, name_lid)))
			else
			imgui.Text(u8'Óêàçàí íåâåðíûé ID, èëè èãðîê íå ïîäêëþ÷åí.')
		end
        if imgui.Button(u8'Ïîñòàâèòü ëèäåðà') then
            sampSendChat(string.format(" /newleader %s %s", new_id.v, new_frak.v))
		end
	imgui.End()
	end
	if seven_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(250, 150), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Ïîñòàâèòü ëèäåðà | v. 1.3 beta', seven_menu)
		imgui.Text(u8'v. 0.1:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8' ..::Release::..')
		imgui.SameLine(nil, 20)
		imgui.Text(u8'v. 1.1 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'-Äîáàâëåí âûáîð ñòèëÿ ñêðèïòà\n-Èñïðàâëåí áàã ñ ïðîâåðêîé ïîñòîâ\n-Äîáàâëåíà ôóíêöèÿ "Ïîñòàâèòü ëèäåðà"')
		imgui.Text(u8'v. 0.2:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Äîáàâëåíà ôóíêöèÿ: Àâòîìàòè÷èñêèé ñ÷¸ò÷èê ïîñòîâ\n- Òåïåðü ðàáîòàåò êíîïêà: Èòîã ïðîâåðêè ïîñòîâ.\n- Äîáàâëåíû /gnews äëÿ: ËÑ/ÑÔ/ËÂÏÄ.')
		imgui.SameLine(nil, 20)
		imgui.Text(u8'v. 1.2 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Äîáàâëåíû ÐÏ îòûãðîâêè êîìàíä\n-Àêòèâàöèÿ ÐÏ îòûãðîâîê â íàñòðîéêàõ\n- Èçìåíåíà ñòðóêòóðà ñêðèïòà\n- Â ãîñ. íîâîñòÿõ äîáàâëåíî âðåìÿ\n-Äîáàâëåí ÅÏÊ (/åïê)')
		imgui.Text(u8'v. 0.3:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Äîáàâëåíà ôóíêöèÿ: Îáíóëåíèå ñ÷¸ò÷èêà ïîñòîâ.\n - Èñïðàâëåíû íàéäåííûå áàãè.\n - Îáíîâëåíû îòâåòû äëÿ ñîáåñåäîâàíèé.')
		imgui.SameLine(nil, 20)
		imgui.Text(u8'v. 1.3 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Äîáàâëåíà ñòàòèñòèêà ïðîâåðêè ïîñòîâ\n-Äîáàâëåíà ïðîâåðêà ïàòðóëåé\n- Èñïðàâëåíû áàãè/îøèáêè')
		imgui.Text(u8'v. 0.4:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Èñïðàâëåíû íåêòîðûå áàãè.\n - Äîáàâëåíû íåñêîëüêî íîâûé ãîñ. íîâîñòåé äëÿ Ìèíèñòðà.')
		imgui.Text(u8'v. 0.5:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Èñïðàâëåíû áàãè/îøèáêè. ')
		imgui.Text(u8'v. 1.0 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Íîâûé äèçàéí\n-Óáðàíû íåêîòîðûå ôóíêöèè')
	imgui.End()
	end
	if ten_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(-1.2, -1.0))
	imgui.SetNextWindowSize(imgui.ImVec2(150, 105), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Îáûñê | v. 1.3 beta', ten_menu)
		if imgui.Button(u8"Íè÷åãî íå íàøëè",imgui.ImVec2(135, 20)) then
			sampSendChat("Ñýð, ìû ó âàñ íè÷åãî íå íàøëè. Âû ñâîáîäíû.")
		end
		if imgui.Button(u8"Íàøëè íàðêîòèêè",imgui.ImVec2(135, 20)) then
			sampSendChat("/me íàø¸ë ïàêåòèê ñ êîêàèíîì")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me îòîáðàë ïàêåòèê")
			wait(1000)
			sampSendChat("/me äîñòàë èç êàðìàíà ïàêåò äëÿ óëèê")
			wait(1000)
			sampSendChat("/me óáðàë íàðêîòèêè â ïàêåò")
		end)
		lua_thread.create(function() wait(4000)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Èñïîëüçóéòå êîìàíäó /remove [ID] [D] äëÿ èçúÿòèÿ íàðêîòèêîâ.", 0x4b58ebFF)
		end)
		end
		if imgui.Button(u8"Íàøëè ïàòðîíû",imgui.ImVec2(135, 20)) then
			sampSendChat("/me íàø¸ë êîðîáî÷êó ñ ïàòðîíàìè")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me îòîáðàë êîðîáî÷êó")
			wait(1000)
			sampSendChat("/me äîñòàë ïàêåò äëÿ óëèê")
			wait(1000)
			sampSendChat("/me óáðàë êîðîáî÷êó â ïàêåò")
		end)
		lua_thread.create(function() wait(4000)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Èñïîëüçóéòå êîìàíäó /remove [ID] [P] äëÿ èçúÿòèÿ ïàòðîí.", 0x4b58ebFF)
		end)
		end
	imgui.End()
	end
	if ten_menu_one.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	imgui.SetNextWindowSize(imgui.ImVec2(1130, 600), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Åäèíûé ïðîöåññóàëüíûé êîäåêñ	| v. 1.3 beta', ten_menu_one)
	imgui.Text(u8[[Åäèíûé ïðîöåññóàëüíûé êîäåêñ.?
[1] - Ïðåñòóïëåíèÿ ïðîòèâ ãðàæäàí øòàòà/ãîñ.ñëóæàùèõ.

1.1 - Çà ëþáîå íàïàäåíèå íà ãðàæäàíà øòàò/ãîñ.ñëóæàùåãî ñ ïðè÷èíåíèåì òÿæêèõ òåëåñíûõ ïîâðåæäåíèé ïðåñòóïíèêó ïðèñâàèâàåòñÿ 2 óðîâåíü ðîçûñêà.
1.2 - Çà ëþáîå íàïàäåíèå íà ãðàæäàíà øòàò/ãîñ.ñëóæàùåãî ïîâëåêøåå çà ñîáîé ãèáåëü, ïðåñòóïíèêó ïðèñâàèâàåòñÿ 4 óðîâåíü ðîçûñêà.
1.3 - Çà óãðîçû ãðàæäàíèíó â âèäå ðàñïðàâû èëè ëþáîì äðóãîì äåéñòâèè, íàðóøèòåëþ ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà.
1.4 - Çà âûìîãàòåëüñòâî äåíåæíûõ ñðåäñòâ ïóò¸ì óãðîç è íàñèëèÿ, 2-é óðîâåíü ðîçûñêà.
1.5 - Çà îñêîðáëåíèå ÷åñòè è äîñòîèíñòâà ëþáîãî ãðàæäàíèíà ïðåñòóïíèêó ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñê è øòðàô â âèäå 2.000$
1.6 - Çà îðãàíèçàöèþ/ó÷àñòèå â íåëåãàëüíûõ àçàðòíûõ èãðàõ ïðåñòóïíèêó ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà è øòðàô â âèäå 2.000$
1.7 - Çà ñîó÷àñòèå â ïðåñòóïëåíèè, ïðåñòóïíèêó ïðèñâàèâàåòñÿ 1-6-ûé óðîâåíü ðîçûñêà (âûäà¸òñÿ òàêîå æå óðîâåíü ðîçûñêà êàê è ïðåñòóïíèêó)
1.8 - Çà óãîí èëè ïîïûòêó óãîíà òðàíñïîðòíîãî ñðåäñòâà íàðóøèòåëþ ïðèñâàèâàåòñÿ 1é óðîâåíü ðîçûñêà.]])
imgui.Text(u8[[[2] - Äåéñòâèÿ ïðîòèâ ìèíèñòåðñòâà âíóòðåííèõ äåë.

2.1 - Çà ïðåäëîæåíèå âçÿòêè ñîòðóäíèêó ïðàâîîõðàíèòåëüíûõ îðãàíîâ ïðè èñïîëíåíèè, ïðåñòóïíèêó ïðèñâàèâàåòñÿ 2-îé óðîâåíü ðîçûñêà.
2.2 - Çà âîñïðåïÿòñòâîâàíèå äåéñòâèÿì ñîòðóäíèêà ïðàâîîõðàíèòåëüíûõ îðãàíîâ ïî çàäåðæàíèþ ïðåñòóïíèêà ãðàæäàíèíó ïðèñâàèâàåòñÿ 2-îé óðîâåíü ðîçûñêà.
2.3 - Çà íåïîä÷èíåíèå ñîòðóäíèêó ïðàâîîõðàíèòåëüíûõ îðãàíîâ, åñëè òîãî òðåáóåò ñëåäñòâèå, ïðåñòóïíèêó ïðèñâàèâàåòñÿ 2-ûé óðîâåíü ðîçûñêà.
2.4 - Çà ïðîíèêíîâåíèå íà òåððèòîðèþ ÔÁÐ èëè ïîëèöåéñêèõ äåïàðòàìåíòîâ áåç êàêèõ-ëèáî âåñîìûõ ïðè÷èí ïðåñòóïíèêó äàåòñÿ îòñ÷åò äî 5 ÷òîáû 
ïîêèíóòü òåððèòîðèþ, â ïðîòèâíîì ñëó÷àå 1 óðîâåíü ðîçûñêà.
2.5 - Çà ïðîíèêíîâåíèå â ñëóæåáíûé àâòîìîáèëü íàðóøèòåëþ äà¸òñÿ 5 ñåêóíä ÷òîáû ïîêèíóòü åãî à çàòåì ïðèñâàèâàåòñÿ 1-é óðîâåíü ðîçûñêà.
2.6 - Çà îñêîðáëåíèå ÷åñòè è äîñòîèíñòâà ñîòðóäíèêà ÌÂÄ íàðóøèòåëþ ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà è âûïèñûâàåòñÿ øòðàô â âèäå 2.000$
2.7 - Çà óãðîçû ñîòðóäíèêó ÌÂÄ â âèäå ðàñïðàâû èëè ëþáîì äðóãîì äåéñòâèè, íàðóøèòåëþ ïðèñâàèâàåòñÿ 2 óðîâåíü ðîçûñêà.
2.8 - Çà ïîêðûâàòåëüñêóþ äåÿòåëüíîñòü ïðåñòóïíèêà ñîòðóäíèêîì ÌÂÄ, ñîòðóäíèê ïîëó÷àåò óâîëüíåíèå è ïðèñâàèâàåòñÿ 5 óðîâåíü ðîçûñêà.
2.9 - Çà äà÷ó çàâåäîìî ëîæíûõ ïîêàçàíèé, êîòîðûå ìîãóò çàâåñòè ñëåäñòâèå â òóïèê ïðåñòóïíèêó ïðèñâàèâàåòñÿ 4 óðîâåíü ðîçûñêà.]])
imgui.Text(u8[[?[3] - Íàðêîòè÷åñêèå âåùåñòâà, îðóæèå è ïðåäìåòû çàïðåùåííûå â øòàòå.
3.1 - Çà õðàíåíèå è óïîòðåáëåíèå íàðêîòè÷åñêèõ âåùåñòâ èëè äðóãèõ ïñèõîòðîïíûõ ïðåïïàðàòîâ íàðóøèòåëþ ïðèñâàèâàåòñÿ 3 óðîâåíü ðîçûñêà è ïîñëåäóþùåå 
èçúÿòèå âåùåñòâ.
3.2 - Çà ïðîäàæó/ïîêóïêó/ðàñïðîñòðàíåíèå íàðêîòè÷åñêèõ âåùåñòâ èëè äðóãèõ ïñèõîòðîïíûõ ïðåïïàðàòîâ íàðóøèòåëþ ïðèñâàèâàåòñÿ 3 óðîâåíü ðîçûñêà è 
ïîñëåäóþùåå èçúÿòèå âåùåñòâ.
3.3 - Çà ïðèçûâ ê óïîòðåáëåíèþ íàðêîòè÷åñêèõ âåùåñòâ èëè äðóãèõ ïñèõîòðîïíûõ ïðåïïàðàòîâ íàðóøèòåëþ ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà è âûïèñûâàåòñÿ 
øòðàô â ðàçìåðå 1.500$
3.4 - Çà íîøåíèå îðóæèÿ â îòêðûòîì âèäå,åñëè òîãî íå òðåáóåò ñèòóàöèÿ, ïðåñòóïíèêó ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà è èçúÿòèå îðóæèÿ.
3.5 - Çà õðàíåíèå/òðàíñïîðòèðîâêó áîåïðèïàñîâ â ëþáîì êîëè÷åñòâå ïðåñòóïíèêó ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà è ïîñëåäóþùåå èçúÿòèå.
Èñêëþ÷åíèå: 1-2 ðàíãè ìýðèé/ÀÏ, ñîòðóäíèêè ÌÂÄ, âîåííîñëóæàùèå.
3.6 - Çà ïðîäàæó/ïîêóïêó/ðàñïðîñòðàíåíèå îðóæèÿ èëè áîåïðèïàñîâ ïðåñòóïíèêó ïðèñâàèâàåòñÿ 2 óðîâåíü ðîçûñêà è ïîñëåäóþùåå èçúÿòèå.
3.7 - Çà êðàæó áîåïðèïàñîâ ñ îáúåêòîâ ìèíèñòåðñòâà îáîðîíû ïðåñòóïíèêó ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà è ïîñëåäóþùåå èçúÿòèå.
3.8 - Çà òðàíñïîðòèðîâêó ïàòðîíîâ â îñîáî áîëüøèõ êîëè÷åñòâàõ(ÿùèêè â àâòî) ëèöàìè, íå ñîñòîÿùèìè íà ñëóæáå â Ìèíèñòåðñòâå Îáîðîíû, ïðåñòóïíèêó 
ïðèñâàèâàåòñÿ 4-é óðîâåíü ðîçûñêà
Oñòàíîâêà òðàíñïîðòíîãî ñðåäñòâà ìîæåò áûòü ïðîèçâåäåíà ëèøü ïî ïðè÷èíå íàðóøåíèÿ äðóãîé ñòàòüè, ïî ÐÏ íåëüçÿ îïðåäåëèòü åñòü â ìàøèíå ïàòðîíû èëè íåò.]])
imgui.Text(u8[[[4] - Ïðåñòóïëåíèÿ ïðîòèâ ãîñóäàðñòâåííîãî ðåæèìà èëè èìóùåñòâà.

4.1 - Çà ïëàíèðîâàíèå, îðãàíèçàöèþ, èëè ñîó÷àñòèå â íåñàíêöèîíèðîâàííûõ ìèòèíãàõ ëèáî áóíòàõ, ãðàæäàíèíó ïðèñâàèâàåòñÿ 2-ûé óðîâåíü ðîçûñêà.
4.2 - Çà ñðûâ îäîáðåííîãî ìåðîïðèÿòèÿ, ïîìåõà ïðîâåäåíèþ îäîáðåííîãî ìåðîïðèÿòèÿ, ãðàæäàíèíó ïðèñâàèâàåòñÿ 1-é óðîâåíü ðîçûñêà
4.3 - Çà øïèîíàæ, ïðîäàæó, ðàçãëàøåíèå ãîñóäàðñòâåííîé èíôîðìàöèè, ïðåñòóïíèêó ïðèñâàèâàåòñÿ 6-îé óðîâåíü ðîçûñê/
4.4 - Çà ïåðåäà÷ó èíôîðìàöèè ãîñóäàðñòâåííîé âàæíîñòè ïðåäñòàâèòåëÿì îðãàíèçîâàííûõ ïðåñòóïíûõ ãðóïèðîâîê íàðóøèòåëþ ïðèñâàèâàåòñÿ 6-é óðîâåíü ðîçûñêà
4.5 - Çà Ïëàíèðîâàíèå èëè ðåàëèçàöèÿ äåéñòâèé, êîòîðûå ìîãóò áûòü ðàñöåíåíû êàê ãîñóäàðñòâåííàÿ èçìåíà, íàðóøèòåëü îáúÿâëÿåòñÿ â 6 óðîâåíü ðîçûñêà, 
ëèøàåòñÿ âñåõ ëèöåíçèé, ïîïàäàåò â ×Ñ ñâîåé îðãàíèçàöèè âûñøåé êàòåãîðèè áåç ïðàâà âûõîäà. Ïîìèìî ýòîãî íàðóøèòåëü ïîïàäàåò â ñïèñîê Ïðåäàòåëåé Øòàòà, 
î ÷¸ì áóäåò îïîâåùåíî â ãîñóäàðñòâåííûå íîâîñòè. 
4.6 - Çà ïîð÷ó ãîñóäàðñòâåííîãî èìóùåñòâà(Ìàøèí,ñòîëáîâ,äâåðåé,äåðåâüåâ,ëàâîê è òä) ïðåñòóïíèêó ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà è âûïèñûâàåòñÿ øòðàô â 
ðàçìåðå 2.000$
4.7 - Çà äà÷ó âçÿòêè çà ïðîäâèæåíèå ïî êàðüåðíîé ëåñòíèöå ãðóïïå ëèö ïðèñâàèâàåòñÿ 6 óðîâåíü ðîçûñêà è ïîñëóäóþùåå çàíåñåíèå â ÷åðíûé ñïèñîê îðãàíèçàöèè.
]])
imgui.Text(u8[[[5] - Ìåëêèå ïðàâîíàðóøåíèÿ. Ïðåñòóïëåíèÿ ïðîòèâ îáùåñòâåííîé íðàâñòâåííîñòè.

5.1 - Ïðè îòêàçå ïðåäîñòâèòü äîêóìåíòû åñëè òîãî òðåáóåò ñëåäñòâèå èëè æå óòåðå äîêóìåíòîâ íàðóøèòåëþ ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà è øòðàô â ðàçìåðå 1.000$
5.2 - Çà îòêàç èëè íåâîçìîæíîñòü îïëàòû øòðàôà ïðåñòóïíèêó ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà.
5.3 - Çà èñïîëüçîâàíèå áðàííûõ ñëîâ íàðóøèòåëþ ïðèñâàèâàåòñÿ øòðàô â ðàçìåðå 1.500$
5.4 - Çà îñóùåñòâëåíèå/ïîïûòêó îñóùåñòâëåíèÿ èíòèìíûõ óñëóã, ïîñîáíè÷åñòâî ïðîñòèòóöèè íàðóøèòåëþ ïðèñâàèâàåòñÿ 2 óðîâåíü ðîçûñêà.
5.5 - Çà âûïîëíåíèå îïàñíûõ òðþêîâ íà âåëîñèïåäå, êîòîðûå ìîãóò ïîâëå÷ü çà ñîáîé òðàâìû îêðóæàþùèõ íàðóøèòåëþ ïðèñâàèâàåòñÿ 1 ó.ð. 
(ïîÿñíåíèå: ïðûæêè ÷åðåç ëþäåé èëè íà ëþäåé)
5.6 - Çà ïîïðàøàéíè÷åñòâî â ëþáîì âèäå íàðóøèòåëþ ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà.
5.7 - Çà ïðîÿâëåíèå íàöèîíàëèçìà ëèáî ðàñèçìà, ïðåñòóïíèêó ïðèñâàèâàåòñÿ 3-èé óðîâåíü ðîçûñêà.
5.8 - Çà îðãàíèçàöèþ èëè ó÷àñòèå â ìåðîïðèÿòèÿõ, ïðèçûâàþùèõ ê íàöèîíàëèçìó ëèáî ðàñèçìó íåçàâèñèìî îò òîãî, îäîáðåíî ëè îíî ïðàâèòåëüñòâîì, ïðåñòóïíèêó 
ïðèñâàèâàåòñÿ 5-é óðîâåíü ðîçûñêà.
5.9 - Çà ëîæíûé âûçîâ íàðóøèòåëþ ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà èëè æå øòðàô â ðàçìåðå 2000$.
5.10 - Çà ïîð÷ó ëè÷íîãî èìóùåñòâà èëè ïðîíèêíîâåíèå íà ëè÷íóþ òåððèòîðèþ(äîì) ëþáîãî ãðàæäàíèíà íàðóøèòåëþ ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà.
5.11 - Ïðîíèêíîâåíèå çà îöåïëåíèå âî âðåìÿ òåðàêòà, íàðóøèòåëþ ïðèñâàèâàåòñÿ 1-é óðîâåíü ðîçûñêà (íå îòíîñèòüñÿ ê ðàáîòíèêàìè ÑÌÈ è ÌÇ, âûïîëíÿþùèì 
ñâîè îáÿçàííîñòè]])
	imgui.Text(u8[[[6] - Îðãàíèçàöèîííàÿ ïðåñòóïíàÿ äåÿòåëüíîñòü.

6.1 - Çà ïîõèùåíèå/ïîïûòêó ïîõèòèòü îäíîãî èëè ãðóïïó ëèö ïðåñòóïíèêàì ïðèñâàèâàåòñÿ 6 óðîâåíü ðîçûñêà.
6.2 - Çà ïëàíèðîâàíèå èëè îðãàíèçàöèþ òåðàêòà ïðåñòóïíèêó/ãðóïïå ëèö ïðèñâàèâàåòñÿ 6 óðîâåíü ðîçûñêà.
6.3 - Çà ïðîäàæó/ðàñïðîñòðàíåíèå/êðàæó ñëóæåáíîé ôîðìû(íàïðèìåð: ôîðìó ÌÎ èëè ÌÂÄ) ïðåñòóïíèêó èëè ãðóïïå ëèö ïðèñâàèâàåòñÿ 3 óðîâåíü ðîçûñêà.
6.4 - Çà ïîääåëêó äîêóìåíòîâ, óäîñòîâåðåíèé, çíà÷êîâ ãîñóäàðñòâåííûõ îðãàíèçàöèé, à ðàâíî èõ ïîêóïêà, ïðîäàæà è ïðèìåíåíèå â ëè÷íûõ öåëÿõ íàêàçûâàåòñÿ 
4-ûé óðîâíÿìè ðîçûñêà.
6.5 - Çà ðàáîòó â îðãàíèçàöèè ÷üÿ äåÿòåëüíîñòü ïóòåì ðàññëåäîâàíèÿ è ïîñëåäóþùåãî äîïðîñà èñïîëíèòåëåé ïðåñòóïëåíèé äîêàçàíà àãåíò ÔÁÐ(5+ ðàíã) èìååò ïðàâî 
ïðèñâîèòü 4 óðîâåíü ðîçûñêà.
6.6 - Çà äà÷ó çàâåäîìî ëîæíîé èíôîðìàöèè î òåðàêòå èëè ïîõèùåíèè ïðåñòóïíèêó ïðèñâàèâàåòñÿ 2 óðîâåíü ðîçûñêà.]])
	imgui.Text(u8[[[7] - Íàðóøåíèÿ ïðàâèë äîðîæíîãî äâèæåíèÿ.

7.1 - Åçäà ïî âñòðå÷íîé ïîëîñå. Íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 2.000$, èçûìàåòñÿ âîäèòåëüñêîå óäîñòîâåðåíèå è ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà.
7.2 - Íàåçä íà ïåøåõîäà ñ ïðè÷èíåíèåì êàêèõ-ëèáî òåëåñíûõ ïîâðåæäåíèéé. Íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 2.000$, ïðèñâàèâàåòñÿ 2 óðîâåíü ðîçûñêà è èçúÿòèå âîä.óä.
7.3 - Ïàðêîâêà â íåïîëîæåííîì ìåñòå. Íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 2.000$ è èçûìàåòñÿ âîäèòåëüñêîå óäîñòîâåðåíèå.
7.4 - Èãíîðèðîâàíèå çâóêîâûõ (ñèðåí) è/èëè âèçóàëüíûõ ñèãíàëîâ (ïðîáëåñêîâûõ ìàÿ÷êîâ) ñïåöèàëüíûõ ñëóæá. Íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 2.000$.
7.5 - Óåçä ñ ìåñòà ÄÒÏ. Íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 1.000$, èçûìàåòñÿ âîäèòåëüñêîå óäîñòîâåðåíèå è ïðèñâàèâàåòñÿ 1 óðîâåíü ðîçûñêà.
7.6 - Óìûøëåííîå ñîçäàíèå àâàðèéíîé ñèòóàöèè. Íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 2.000$, èçûìàåòñÿ âîäèòåëüñêîå óäîñòîâåðåíèå è ïðèñâàèâàåòñÿ 2 óðîâåíü ðîçûñêà.
7.7 - Ïîìåõà ðàáîòå ïðàâîîõðàíèòåëüíûõ îðãàíîâ íà òðàíñïîðòíîì ñðåäñòâå ( ïîäðåçàíèå , âðåçàíèå â ìàøèíó ìâä ñïåöèàëüíî è ò.ä ).Ó íàðóøèòåëÿ èçûìàåòñÿ âîäèòåëüñêîå 
óäîñòîâåðåíèå è ïðèñâàèâàåòñÿ 2 óðîâåíü ðîçûñêà.
7.8 - Åçäà ñ âûêëþ÷åííûìè ôàðàìè â òåìíîå âðåìÿ ñóòîê(ïîñëå 19:30) íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 500$
7.9 - Ó÷àñòèå/îðãàíèçàöèÿ íåñàíêöèîíèðîâàííûõ óëè÷íûõ ãîíîê. Íàðóøèòåëÿì âûïèñûâàåòñÿ øòðàô â ðàçìåðå 2.000$
7.10 - Çà ïàðêîâêó âîçäóøíîãî òðàíñïîðòà âíå ñïåöèàëüíî îòâåäåííîãî ìåñòà íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 1.500$ è èçûìàåòñÿ óäîñòîâåðåíèå íà óïðàâëåíèå 
âîçäóøíûì òðàíñïîðòîì.
7.11 - Çà èñïîëüçîâàíèå ñëóæåáíîãî / îáùåñòâåííîãî òðàíñïîðòà â ëè÷íûõ öåëÿõ, áåç óñòàíîâëåííîãî òàðèôà. Íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 1000$.]])
	imgui.Text(u8[[[8] - Ïîâåäåíèå â ìåñòå îòáûâàíèÿ íàêàçàíèÿ.

8.1 - Çà íåàäåêâàòíîå ïîâåäåíèå, à èìåííî: äðàêà è ò.ï. íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 2000$.
8.2 - Çà íåïîä÷èíåíèå ñîòðóäíèêîâ Òþðüìû, íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 1500$.
8.3 - Çà îñêîðáëåíèå ñîòðóäíèêà Òþðüìû èëè äðóãèõ çàêëþ÷åííûõ, íàðóøèòåëþ âûïèñûâàåòñÿ øòðàô â ðàçìåðå 1500$.]])

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
	dat = os.date('%d.%m.20%y', time)
	
	checkUpdate()
	
	local statusa = 0
	local dostup = '24.08.2018'
	if dat == dostup then statusa = 1 end
	print( dat,dostup,statusa)
	
	local _,  playerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	if sampGetPlayerNickname(playerid) == 'Mateo_Penaloza' then
		if statusa == 0 then
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Ñêðèïò çàïóùåí.{9d00bd} Àâòîð: Mateo Penaloza. {4b58eb} | Version: 1.4 beta", 0x4b58ebFF)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Èñïîëüçóéòå êîìàíäó /lm èëè êëàâèøó F2 äëÿ âûçîâà ìåíþ. Ñêðèïò äîñòóïåí âàì äî: "..dostup, 0x4b58ebFF)
			--sampAddChatMessage("[Leader-MVD] {FFFFFF} Ñêðèïò äîñòóïåí òîëüêî äëÿ ëèäåðîâ. Ïðîïèøèòå êîìàíäó {4b58eb}/lm{ffffff} äëÿ ðåãèñòðàöèè.", 0x4b58ebFF)
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
			sampRegisterChatCommand("åïê", ud) -- +
			sampRegisterChatCommand("óä", udos) -- +
			sampRegisterChatCommand("zone", nzone) -- +
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
							if weapon == 3 then -- äóáèíêà
								sampSendChat("/do Äóáèíêà âèñèò íà ïîÿñå.")
								wait(1000)
								sampSendChat("/me ñíÿë äóáèíêó ñ ïîÿñà")
								while true and save_rpw.v == true do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 3 then
										sampSendChat("/me ïîâåñèë äóáèíêó íà ïîÿñ")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 17 then -- Äûìîâàÿ øàøêà
								sampSendChat("/do Äûìîâàÿ øàøêà â ÷åõëå íà ïîÿñå.")
								wait(1000)
								sampSendChat("/me âûòàùèë äûìîâóþ øàøêó")
									while true and save_rpw.v do
									wait(0)
									imgui.Process = main_menu.v
									local weapon = getCurrentCharWeapon(PLAYER_PED)
										if weapon ~= 17 then
											break
										end
									end
									---------------------------------
							elseif weapon == 23 then -- Ïèñòîë
								sampSendChat("/do Â êîáóðå ïèñòîëåò SD-Pistol")
								wait(1000)
								sampSendChat("/me äîñòàë ïèñòîëåò èç êîáóðû")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 23 then
										sampSendChat("/do Êîáóðà íà ïîÿñå.")
										wait(1000)
										sampSendChat("/me çàñóíóë ïèñòîëåò â êîáóðó")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 24 then -- Äèãë
								sampSendChat("/do Â êîáóðå ïèñòîëåò Desert Eagle .")
								wait(1000)
								sampSendChat("/me äîñòàë ïèñòîëåò èç êîáóðû")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 24 then
										sampSendChat("/do Êîáóðà íà ïîÿñå.")
										wait(1000)
										sampSendChat("/me çàñóíóë ïèñòîëåò â êîáóðó")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 25 then -- Øîòãàí
								sampSendChat("/do Íà ïëå÷å âåñèò äðîáîâèê Shotgun.")
								wait(1000)
								sampSendChat("/me ñíÿë ñ ïëå÷à äðîáîâèê")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 25 then
										sampSendChat("/me ïîâåñèë äðîáîâèê íà ïëå÷î")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 29 then -- ÌÏ 5
								sampSendChat("/do Íà ïëå÷å âåñèò ïèñòîëåò-ïóëåì¸ò MP-5.")
								wait(1000)
								sampSendChat("/me ñíÿë ñ ïëå÷à ïèñòîëåò-ïóëåì¸ò")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 29 then
										sampSendChat("/me ïîâåñèë ïèñòîëåò-ïóëåì¸ò íà ïëå÷î")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 34 then -- Ñíàéïåðêà
								sampSendChat("/do  Íà ñïèíå ñíàéïåðñêàÿ âèíòîâêà.")
								wait(1000)
								sampSendChat("/me âçÿë ñî ñïèíû ñíàéïåðñêóþ âèíòîâêó")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 34 then
										sampSendChat("/do Â ðóêå ñíàéïåðñêàÿ âèíòîâêà")
										wait(1000)
										sampSendChat("/me ïîâåñèò ñíàéïåðñêóþ âèíòîâêó íà ñïèíó")
										wait(1000)
										break
									end
								end
							end
						end
					end
				end
			else
				sampAddChatMessage("[Leader-MVD] {FFFFFF} Ñêðèïò çàïóùåí.{9d00bd} Àâòîð: Mateo Penaloza. {4b58eb} | Version: 1.3 beta", 0x4b58ebFF)
				sampAddChatMessage("[Leader-MVD] {FFFFFF} Ó âàñ çàêîí÷èëñÿ ñðîê èñïîëüçîâàíèÿ ñêðèïòà. Îáðàòèòåñü ê àâòîðó: vk.com/si8646222 èëè Skype: danilbw", 0x4b58ebFF)
				thisScript():unload()
			end
		else
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Ñêðèïò çàïóùåí.{9d00bd} Àâòîð: Mateo Penaloza. {4b58eb} | Version: 1.3 beta", 0x4b58ebFF)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Ó âàñ íåò äîñòóïà ê ñêðèïòó. Îáðàòèòåñü ê àâòîðó: vk.com/si8646222 èëè Skype: danilbw", 0x4b58ebFF)
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
					itog = dialogtext:match('.+Èãðîâîé ñòàòóñ:%s(.+)')
					sampCloseCurrentDialogWithButton(1)
					if itog == '	Îïûòíûé èãðîê' then 
						st = 1
						sampAddChatMessage("[Leader-MVD] {FFFFFF} Èñïîëüçóéòå êëàâèøó F2 äëÿ âûçîâà ìåíþ.", 0x4b58ebFF)
						else sampAddChatMessage("[Leader-MVD] {FFFFFF} Âû íå ëèäåð. Ñêðèïò âàì íå äîñòóïåí.", 0x4b58ebFF) end
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
			if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /cuff [id].", 0x4b58ebFF) else
				if mainIni.settings.cuff == 1 then
					sampSendChat("/do Íàðó÷íèêè íà ïîÿñíîì äåðæàòåëå.")
				lua_thread.create(function() wait(1000)
					sampSendChat("/me ñíÿë íàðó÷íèêè ñ ïîÿñíîãî äåðæàòåëÿ.")
					wait(1000)
					sampSendChat("/me ðåçêèì äâèæåíèåì ñêðåñòèë ðóêè çàäåðæàííîãî.")
					wait(1000)
					sampSendChat("/me îäåâàåò íàðó÷íèêè íà ïðàâóþ ðóêó çàäåðæàííîãî.")
					wait(1000)
					sampSendChat("/me îäåâàåò íàðó÷íèêè íà ëåâóþ ðóêó çàäåðæàííîãî.")
					wait(1000)
					sampSendChat("/do Íà ïðåñòóïíèêå íàäåòû íàðó÷íèêè.")
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
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /arrest [id].", 0x4b58ebFF) else
		if mainIni.settings.arrest == 1 then
			sampSendChat("/do Ðó÷êà â áàðäà÷êå.")
		lua_thread.create(function() wait(1000)
			sampSendChat("/do Áëàíêè ïðîòîêîëîâ â áàðäà÷êå.")
			wait(1000)
			sampSendChat("/me îòêðûë áàðäà÷å, çàòåì âçÿë ðó÷êó è áëàíê ïðîòîêîëà")
			wait(1000)
			sampSendChat("/do Áëàíê ïðîòîêîëà è ðó÷êà â ðóêàõ.")
			wait(1000)
			sampSendChat("/me ïðèñòóïèë ê çàïîëíåíèþ áëàíêà ïðîòîêîëà")
			wait(3000)
			sampSendChat("/me çàïîëíÿåò îïèñàíèå âíåøíîñòè íàðóøèòåëÿ")
			wait(3000)
			sampSendChat("/me çàïîëíÿåò õàðàêòåðèñòèêó î íàðóøèòåëå")
			wait(3000)
			sampSendChat("/me çàïîëíÿåò äàííûå î íàðóøåíèè")
			wait(3000)
			sampSendChat("/me ïðîñòàâèë äàòó è ïîäïèñü")
			wait(2000)
			sampSendChat("/me ïîëîæèë ðó÷êó â áàðäà÷îê")
			wait(2000)
			sampSendChat("/me ïåðåäàë áëàíê ñîñòàâëåííîãî ïðîòîêîëà â ó÷àñòîê")
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
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /hold [id].", 0x4b58ebFF) else
		if mainIni.settings.hold == 1 then
			sampSendChat("/me âçÿë çà ðóêó ïðåñòóïíèêà, çàòåì ïîâ¸ë åãî çà ñîáîé")
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
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /eject [id].", 0x4b58ebFF) else
		if mainIni.settings.eject == 1 then
			sampSendChat("/me âûøåë èç àâòîìîáèëÿ, çàòåì âûòàùèë ÷åëîâåêà íàðóæó")
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
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /su [id] [Êîë-âî çâ¸çä] [Ïðè÷èíà].", 0x4b58ebFF) else
	local id, zv, re = string.match(params,"(%d+)%s+(%d+)%s+(.*).")
		if mainIni.settings.su == 1 then
			sampSendChat("/me äîñòàë ðàöèþ, çàòåì ñîîáùèë äàííûå î ïðåñòóïíèêå äèñïåò÷åðó")
			sampSendChat("/su "..id.." "..zv.." "..re)
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ïîâåñèë ðàöèþ íà ïîÿñ")
		end)
			else
			sampSendChat("/su "..id.." "..zv.." "..re)
		end
	end
end

function takelic(params)
if not string.match(params,"(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /takelic [id] [Ïðè÷èíà].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.takelic == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me äîñòàë ÊÏÊ")
			wait(1000)
			sampSendChat("/me ââ¸ë íîìåðíîé çíàê òðàíñïîðòíîãî ñðåäñòâà")
			wait(1000)
			sampSendChat('/me èçìåíèë çíà÷åíèå âîäèòåëüñêîãî óäîñòîâåðåíèÿ íà "íåäåéñòâèòåëüíî"')
			sampSendChat("/takelic "..id.." "..re)
			wait(1000)
			sampSendChat("/me âûêëþ÷èë ÊÏÊ, çàòåì óáðàë åãî")
		end)
			else
			sampSendChat("/takelic "..id.." "..re)
		end
	end
end

function putpl(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /putpl [id].", 0x4b58ebFF) else
		if mainIni.settings.putpl == 1 then
			sampSendChat("/me îòêðûë äâåðü àâòîìîáèëÿ, çàòåì çàòàùèë â íåãî ïðåñòóïíèêà")
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
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /uninvite [id] [Ïðè÷èíà].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.uninvite == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me äîñòàë ÊÏÊ")
			wait(1000)
			sampSendChat("/me ââ¸ë íîìåð æåòîíà ñîòðóäíèêà")
			wait(1000)
			sampSendChat('/me íàæàë íà êíîïêó "Óâîëèòü"')
			sampSendChat("/uninvite "..id.." "..re)
		end)
			else
			sampSendChat("/uninvite "..id.." "..re)
		end
	end
end

function rang(params)
if not string.match(params,"(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /rang [id] [+/-].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.rang == 1 then
			sampSendChat("/do Íà ïëå÷àõ âèñèò ðþêçàê")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ñíÿë ðþêçàê, îòêðûâ åãî, âçÿë íîâûå ïîãîíû, çàòåì ïåðåäàë èõ ÷åëîâåêó íà ïðîòèâ")
			sampSendChat("/rang "..id.." "..re)
		end)
			else
			sampSendChat("/rang "..id.." "..re)
		end
	end
end

function invite(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /invite [id].", 0x4b58ebFF) else
		if mainIni.settings.invite == 1 then
			sampSendChat("/do Íà ïëå÷àõ âèñèò ðþêçàê")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ñíÿë ðþêçàê, îòêðûâ åãî, âçÿë ôîðìó, ðàöèþ è æåòîí")
			wait(1000)
			sampSendChat("/me ïåðåäàë ôîðìó, ðàöèþ è æåòîí ÷åëîâåêó íà ïðîòèâ")
			sampSendChat("/invite "..id)
		end)
			else
			sampSendChat("/invite "..id)
		end
	end
end

function changeskin(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /changeskin [id].", 0x4b58ebFF) else
		if mainIni.settings.changeskin == 1 then
			sampSendChat("/do Íà ïëå÷àõ âèñèò ðþêçàê")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me ñíÿë ðþêçàê, îòêðûâ åãî, âçÿë íîâóþ ôîðìó")
			wait(1000)
			sampSendChat("/changeskin "..id)
			wait(1000)
			sampSendChat("/me ïåðåäàë íîâóþ ôîðìó ÷åëîâåêó íà ïðîòèâ")
		end)
			else  
			sampSendChat("/changeskin "..id)
		end
	end
end

function search(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /search [id].", 0x4b58ebFF) else
		if mainIni.settings.search == 1 then
			sampSendChat("Âñòàíüòå ëèöîì ê ñòåíå, ðóêè çà ãîëîâó.")
		lua_thread.create(function() wait(1000)
			sampSendChat("/n /anim 33")
			sampSendChat("/me äîñòàë ðåçèíîâûå ïåð÷àòêè.")
			wait(1000)
			sampSendChat("/me îäåë ðåçèíîâûå ïåð÷àòêè.")
			wait(1000)
			sampSendChat("/me îáûñêàë íîãè.")
			wait(1000)
			sampSendChat("/anim 14")
			wait(1000)
			sampSendChat("/me îáûñêàë òåëî.")
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
	if text == "" then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /fn [òåêñò].", 0x4b58ebFF) else
		sampSendChat("/f (( "..text.." ))")
	end
end

function rn(param)
local text = param
	if text == "" then sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /rn [òåêñò].", 0x4b58ebFF) else
		sampSendChat("/r (( "..text.." ))")
	end
end

function ticket(params)
if not string.match(params,"(%d+)%s+(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Íå ââåëè íåîáõîäèìûå çíà÷åíèÿ.{9d00bd} /ticket [id] [Ñóììà] [Ïðè÷èíà].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.ticket == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me äîñòàë êâèòàíöèþ")
			wait(1000)
			sampSendChat("/me äîñòàë ðó÷êó")
			wait(1000)
			sampSendChat('/me çàïîëíèë êâèòàíöèþ')
			wait(1000)
			sampSendChat("/me ïåðåäàë êâèòàíöèþ íàðóøèòåëþ")
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
		sampSendChat("/do Â çàäíåì êàðìàíå áðþê ëåæèò óäîñòîâåðåíèå ñîòðóäíèêà ÌÂÄ.")
		wait(1000)
		sampSendChat("/me ïðîòÿíóâ ðóêó ê êàðìàíó, ðåçêèì äâèæåíèåì âçÿë óäîñòîâåðåíèå â ðóêè")
		wait(2000)
		sampSendChat('/me îòêðûë óäîñòîâåðåíèå, çàòåì ïðîòÿíóë ðóêó è ïîêàçàë åãî')
		wait(1000)
		sampSendChat("/do Â óäîñòîâåðåíèè: Çâàíèå: "..u8:decode(mainIni.settings.dol).." | Èìÿ Ôàìèëèÿ: "..u8:decode(mainIni.settings.name).." ... ")
		sampSendChat("/do ... | Íîìåð óäîñòîâåðåíèÿ: "..u8:decode(mainIni.settings.phone).." | MofIA WS")
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

function nzone()
  local x, y, z = getCharCoordinates(PLAYER_PED)
  local nzone = getNameOfZone(x, y, z)
  local nzone = u8:decode(getGxtText(nzone))
  print(nzone)
  return nzone
end

function imgui.RoundDiagram(valTable, radius, segments)
    local draw_list = imgui.GetWindowDrawList()
    local default = imgui.GetStyle().AntiAliasedShapes
    imgui.GetStyle().AntiAliasedShapes = false
    local center = imgui.ImVec2(imgui.GetCursorScreenPos().x + radius, imgui.GetCursorScreenPos().y + radius)
    local function round(num)
        if num >= 0 then
            if select(2, math.modf(num)) >= 0.5 then
                return math.ceil(num)
            else
                return math.floor(num)
            end
        else
            if select(2, math.modf(num)) >= 0.5 then
                return math.floor(num)
            else
                return math.ceil(num)
            end
        end
    end

    local sum = 0
    local q = {}
 
    for k, v in ipairs(valTable) do
        sum = sum + v.v
    end

    for k, v in ipairs(valTable) do
        if k > 1 then
            q[k] = q[k-1] + round(valTable[k].v/sum*segments)
        else
            q[k] = round(valTable[k].v/sum*segments)
        end
    end

    local current = 1
    local count = 1
    local theta = 0
    local step = 2*math.pi/segments

    for i = 1, segments do -- theta < 2*math.pi
        if q[current] < count then
            current = current + 1
        end
        draw_list:AddTriangleFilled(center, imgui.ImVec2(center.x + radius*math.cos(theta), center.y + radius*math.sin(theta)), imgui.ImVec2(center.x + radius*math.cos(theta+step), center.y + radius*math.sin(theta+step)), valTable[current].color)
        theta = theta + step
        count = count + 1
    end

    local fontsize = imgui.GetFontSize()
    local indented = 2*(radius + imgui.GetStyle().ItemSpacing.x)
    imgui.Indent(indented)

    imgui.SameLine(0)
    imgui.NewLine() -- awful fix for first line padding
    imgui.SetCursorScreenPos(imgui.ImVec2(imgui.GetCursorScreenPos().x, center.y - imgui.GetTextLineHeight() * #valTable / 2))
    for k, v in ipairs(valTable) do
        draw_list:AddRectFilled(imgui.ImVec2(imgui.GetCursorScreenPos().x, imgui.GetCursorScreenPos().y), imgui.ImVec2(imgui.GetCursorScreenPos().x + fontsize, imgui.GetCursorScreenPos().y + fontsize), v.color)
        imgui.SetCursorPosX(imgui.GetCursorPosX() + fontsize*1.3)
        imgui.Text(u8(v.name .. ' - ' .. v.v .. ' (' .. string.format('%.2f', v.v/sum*100) .. '%)'))
    end
    imgui.Unindent(indented)
    imgui.SetCursorScreenPos(imgui.ImVec2(imgui.GetCursorScreenPos().x, center.y + radius + imgui.GetTextLineHeight()))
    imgui.GetStyle().AntiAliasedShapes = default
end
--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
--[[function update()
    local fpath = os.getenv('TEMP') .. '\\version.json'
    downloadUrlToFile('https://github.com/MateoPenaloza/leader_mvd/blob/master/version.json', fpath, function(id, status, p1, p2)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
        local f = io.open(fpath, 'r')
        if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            if info and info.latest then
                version = tonumber(info.latest)
                if version > tonumber(thisScript().version) then
                    lua_thread.create(goupdate)
                else
                    update = false
                end
            end
        end
    end
end)
end
--ñêà÷èâàíèå àêòóàëüíîé âåðñèè
function goupdate()
sampAddChatMessage(("[Leader-MVD] {f3f3f3}Îáíàðóæåíî îáíîâëåíèå. Ïîïðîáóþ îáíîâèòüñÿ.."), 0xffffff)
sampAddChatMessage(("[Leader-MVD] {f3f3f3}Òåêóùàÿ âåðñèÿ: {669acc}"..thisScript().version.." {f3f3f3}> Íîâàÿ âåðñèÿ: {669acc}"..version), 0x4b58ebFF)
downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23)
    if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
    sampAddChatMessage("[Leader-MVD] {FFFFFF} Ñêðèïò îáíàâë¸í. Ñåé÷àñ ïåðåçàéä¸ò ïåðåçàãðóçêà ñêðèïòà.", 0x4b58ebFF)
    thisScript():reload()
end
end)
end]]

-- https://raw.githubusercontent.com/MateoPenaloza/leader_mvd/master/version.json

function checkUpdate()
    local fpath = os.getenv('TEMP') .. '\\mvdhelp-version.json'
    downloadUrlToFile('https://raw.githubusercontent.com/MateoPenaloza/leader_mvd/master/version.json', fpath, function(id, status, p1, p2)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
        local f = io.open(fpath, 'r')
        if f then
            local info = decodeJson(f:read('*a'))
            local updatelink = info.donwloadUrl
            if info and info.latest then
                version = tonumber(info.latest)
                if version > tonumber(thisScript().version) then
                    lua_thread.create(downloadUpdate)
                else
                    checkUpdate = false
                end
            end
        end
    end
end)
end

function downloadUpdate()
    sampLocalMes('{4326c1}[IgFs] {ffffff}Âåðñèÿ, óñòàíîâëåííàÿ ó âàñ óñòàðåëà. Ñèñòåìà àâòî-îáíîâëåíèÿ àâòîìàòè÷åñêè óñòàíîâèò àêòóàëüíóþ.',-1)
    sampLocalMes('{4326c1}[IgFs] {ffffff}Âåðñèÿ, óñòàíîâëåííàÿ ó âàñ: ' ..thisScript().version.. '. Àêòóàëüíàÿ âåðñèÿ: ' ..version.. '.',-1)
    wait(300)
    downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23)
        if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
        sampLocalMes('{4326c1}[IgFs] {ffffff}Àêòóàëüíàÿ âåðñèÿ óñòàíîâëåíà.',-1)
        thisScript():reload()
    end
    end)
end
