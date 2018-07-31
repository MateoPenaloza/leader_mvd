require "lib.moonloader"
inicfg = require 'inicfg'
local imgui = require 'imgui'
local key = require 'vkeys'
local encoding = require 'encoding' -- Р·Р°РіСЂСѓР¶Р°РµРј Р±РёР±Р»РёРѕС‚РµРєСѓ
encoding.default = 'CP1251' -- СѓРєР°Р·С‹РІР°РµРј РєРѕРґРёСЂРѕРІРєСѓ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ, РѕРЅР° РґРѕР»Р¶РЅР° СЃРѕРІРїР°РґР°С‚СЊ СЃ РєРѕРґРёСЂРѕРІРєРѕР№ С„Р°Р№Р»Р°. CP1251 - СЌС‚Рѕ Windows-1251
u8 = encoding.UTF8 -- Рё СЃРѕР·РґР°С‘Рј РєРѕСЂРѕС‚РєРёР№ РїСЃРµРІРґРѕРЅРёРј РґР»СЏ РєРѕРґРёСЂРѕРІС‰РёРєР° UTF-8



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
	if imgui.Button(u8'Настройки',imgui.ImVec2(280, 20)) then
		one_menu.v = not one_menu.v end
	if imgui.Button(u8'Гос. новости',imgui.ImVec2(280, 20)) then
		second_menu.v = not second_menu.v end
	if imgui.Button(u8'Проверка работы Департаментов',imgui.ImVec2(280, 20)) then
		tree_menu.v = not tree_menu.v end	
	if imgui.Button(u8'Сообщить в рацию',imgui.ImVec2(280, 20)) then
		fo_menu.v = not fo_menu.v end
	if imgui.Button(u8'Поставить лидера',imgui.ImVec2(280, 20)) then
		five_menu.v = not five_menu.v end
	if imgui.Button(u8'Красная кнопка',imgui.ImVec2(280, 20)) then
		--six_menu.v = not six_menu.v end
		printStringNow("It's not working", 2000)
		sampAddChatMessage("[Leader-MVD] {FFFFFF} Временно не работает.", 0x4b58ebFF)
		end
	if imgui.Button(u8'Лог обновления',imgui.ImVec2(280, 20)) then
		seven_menu.v = not seven_menu.v end
	imgui.End()
	end
   if one_menu.v then
   local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, -0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(852, 220), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Информация | v. 1.2 beta', one_menu)
		imgui.BeginChild('left pane', imgui.ImVec2(150, 0), true)
		if not selected then selected = 1 end
        if imgui.Selectable(u8('Настройки'), selected == 1) then selected = 1 end
        if imgui.Selectable(u8('Команды'), selected == 2) then selected = 2 end
        if imgui.Selectable(u8('Разработка'), selected == 3) then selected = 3 end
        if imgui.Selectable(u8('Разработка'), selected == 4) then selected = 4 end
        if imgui.Selectable(u8('Разработка'), selected == 5) then selected = 5 end
        imgui.EndChild()
        imgui.SameLine()
        imgui.BeginGroup()
        if selected == 1 then 
			imgui.Columns(3)
			imgui.SetColumnWidth(-1, 280)
				if imgui.Combo(u8'Стиль скрипта', style_set, {u8'Стиль 1',u8'Стиль 2'}) then 
				if style_set.v == 'Стиль 1' then style = 0 end
				if style_set.v == 'Стиль 2' then style = 1 end
				if style_set.v == 'Стиль 3' then style = 2 end
				end
				imgui.InputText(u8'Ник (без "_")', save_name,imgui.ImVec2(200, 30))
				imgui.InputText(u8'Звание/Должность', save_dol,imgui.ImVec2(200, 30))
				imgui.InputText(u8'Номер', save_phone,imgui.ImVec2(200, 30))
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
			imgui.Checkbox(u8"Включить RP отыгровку оружия", save_rpw)
			imgui.Checkbox(u8"РП отыгровка /su", save_su)
			imgui.Checkbox(u8"РП отыгровка /putpl", save_putpl)
			imgui.Checkbox(u8"РП отыгровка /eject", save_eject)
			imgui.Checkbox(u8"РП отыгровка /arrest", save_arrest)
			imgui.Checkbox(u8"РП отыгровка /hold", save_hold)
			imgui.Checkbox(u8"РП отыгровка /takelic", save_takelic)
			imgui.NextColumn()
			imgui.SetColumnWidth(-1, 280)
			imgui.Checkbox(u8"РП отыгровка /invite", save_invite)
			imgui.Checkbox(u8"РП отыгровка /uninvite", save_uninvite)
			imgui.Checkbox(u8"РП отыгровка /rang", save_rang)
			imgui.Checkbox(u8"РП отыгровка /changeskin", save_changeskin)
			imgui.Checkbox(u8"РП отыгровка /search", save_search)
			imgui.Checkbox(u8"РП отыгровка /cuff", save_cuff)
			imgui.Checkbox(u8"РП отыгровка /ticket", save_ticket)
			imgui.Columns(1)
			if imgui.Button(u8'Сохранить',imgui.ImVec2(685, 20)) then
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
			imgui.Text(u8'- ООС чат в /r рацию')
			imgui.Text(u8'- ООС чат в /f рацию')
			imgui.Text(u8'- надеть наручники')
			imgui.Text(u8'- посадить в КПЗ')
			imgui.Text(u8'- посадить в патрульное авто')
			imgui.Text(u8'- вытащить из машины')
			imgui.Text(u8'- объявить в розыск')
			imgui.Text(u8'- изъять водительское удостоверение')
			imgui.Text(u8'- выписать штраф')
			imgui.Text(u8'- принять человека в организацию')
			imgui.NextColumn()
			imgui.SetColumnWidth(-1, 100)
			imgui.Text(u8'/uninvite')
			imgui.Text(u8'/уд')
			imgui.Text(u8'/епк')
			imgui.NextColumn()
			imgui.Text(u8'- уволить сотрудника')
			imgui.Text(u8'- показать удостоверение')
			imgui.Text(u8'- посмотреть ЕПК')
		end
        imgui.EndGroup()
		imgui.End()
	end
	if second_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Гос. новости | v. 1.2 beta', second_menu)
		if imgui.Button(u8'Для министра',imgui.ImVec2(280, 20)) then
		 second_menu_1.v = not second_menu_1.v end
		 if imgui.Button(u8'Для ЛСПД',imgui.ImVec2(280, 20)) then
		  second_menu_2.v = not second_menu_2.v end
		if imgui.Button(u8'Для СФПД',imgui.ImVec2(280, 20)) then
		 second_menu_3.v = not second_menu_3.v end
		if imgui.Button(u8'Для ЛВПД',imgui.ImVec2(280, 20)) then
		 second_menu_4.v = not second_menu_4.v end
	imgui.End()
	end
			if second_menu_1.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 140), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Гос. новости | MVD | v. 1.2 beta', second_menu_1)
				if imgui.Button(u8'Набор в PA (3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
					sampSendChat('/gnews Police Academy всех городов проводит набор.')
					sampSendChat('/gnews Каждый из вас может попробовать себя в роли офицера.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Уважаемые жители Штата! Минуточку внимания.\nPolice Academy всех городов проводит набор.\nКаждый из вас может попробовать себя в роли офицера.')
				if imgui.Button(u8'Восстановление по /wbook (1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Открыты заявления на восстановление в МВД по трудовой книге.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Открыты заявления на восстановление в МВД по трудовой книге.')
				if imgui.Button(u8'Агитационное сообщение(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Вас ограбили? Вам угрожают? Увидели драку? Звоните в 02!')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Вас ограбили? Вам угрожают? Увидели драку? Звоните в 02!')
				if imgui.Button(u8'Агитационное сообщение(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
					sampSendChat('/gnews Вас ограбили? Вам угрожают? Увидели драку? Звоните в 02!')
					sampSendChat('/gnews Полиция Белого Штата поможет Вам!')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Уважаемые жители Штата! Минуточку внимания.\nВас ограбили? Вам угрожают? Увидели драку? Звоните в 02!\nПолиция Белого Штата поможет Вам!')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           Время:'..time)
			imgui.End()
			end
			if second_menu_2.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Гос. новости | LSPD | v. 1.2 beta', second_menu_2)
				if imgui.Button(u8'Собеседование(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
					sampSendChat('/gnews Проходит набор курсантов в Los-Santos Police Academy.')
					sampSendChat('/gnews Критерии: 4 года в Штате, лицензии, законопослушность')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Уважаемые жители Штата! Минуточку внимания.\nПроходит набор курсантов в Los-Santos Police Academy.\n Критерии: 4 года в Штате, лицензии, законопослушность')
				if imgui.Button(u8'Напоминание о собеседовании(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Напоминаю, проходит набор курсантов в Los-Santos Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Напоминаю, проходит набор курсантов в Los-Santos Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           Время:'..time)
			imgui.End()
			end
			if second_menu_3.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Гос. новости | SFPD | v. 1.2 beta', second_menu_3)
				if imgui.Button(u8'Собеседование(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
					sampSendChat('/gnews Проходит набор курсантов в San-Fierro Police Academy.')
					sampSendChat('/gnews Критерии: 4 года в Штате, лицензии, законопослушность')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Уважаемые жители Штата! Минуточку внимания.\nПроходит набор курсантов в San-Fierro Police Academy.\n Критерии: 4 года в Штате, лицензии, законопослушность')
				if imgui.Button(u8'Напоминание о собеседовании(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Напоминаю, проходит набор курсантов в San-Fierro Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Напоминаю, проходит набор курсантов в San-Fierro Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           Время:'..time)
			imgui.End()
			end
			if second_menu_4.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(300, 90), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Гос. новости | LVPD | v. 1.2 beta', second_menu_4)
				if imgui.Button(u8'Собеседование(3)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
					sampSendChat('/gnews Проходит набор курсантов в Las-Venturas Police Academy.')
					sampSendChat('/gnews Критерии: 4 года в Штате, лицензии, законопослушность')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Уважаемые жители Штата! Минуточку внимания.\nПроходит набор курсантов в Las-Venturas Police Academy.\n Критерии: 4 года в Штате, лицензии, законопослушность')
				if imgui.Button(u8'Напоминание о собеседовании(1)',imgui.ImVec2(260, 20)) then
					sampSendChat('/gnews Напоминаю, проходит набор курсантов в Las-Venturas Police Academy.')
				end
				imgui.SameLine(nil, 5)
				imgui.TextQuestion(u8'Напоминаю, проходит набор курсантов в Las-Venturas Police Academy.')
				local time = os.date('%H:%M:%S')
				imgui.Text(u8'                           Время:'..time)
			imgui.End()
			end
	if tree_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(500, 170), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Проверка работы Департаментов | v. 1.2 beta', tree_menu)
	imgui.BeginChild('left pane', imgui.ImVec2(180, 0), true)
		if not selected then selected = 1 end
        if imgui.Selectable(u8('Проверка постов городов   '), selected == 1) then selected = 1 end
        if imgui.Selectable(u8('Проверка патруля в городах'), selected == 2) then selected = 2 end
		imgui.EndChild()
        imgui.SameLine()
        imgui.BeginGroup()
		if selected == 1 then
			if imgui.Button(u8'Город Los-Santos',imgui.ImVec2(300, 20)) then
				tree_menu_1.v = not tree_menu_1.v end
			if imgui.Button(u8'Город San-Fierro',imgui.ImVec2(300, 20)) then
				tree_menu_2.v = not tree_menu_2.v end
			if imgui.Button(u8'Город Las-Venturas',imgui.ImVec2(300, 20)) then
				tree_menu_3.v = not tree_menu_3.v end
			if imgui.Button(u8'Итог проверки',imgui.ImVec2(148, 20)) then
				sampSendChat(string.format("/f Итог проверки постов: Лос-Сантос: %d/3, Сан-Фиерро: %d/3, Лас-Вентурас: %d/3", posls, possf, poslv))
			end
			imgui.SameLine(nil, 4)
			if imgui.Button(u8'Обнулить посты',imgui.ImVec2(148, 20)) then
				sampAddChatMessage(string.format("[Leader-MVD] {FFFFFF}LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv), 0x4b58ebFF)
				sampAddChatMessage("[Leader-MVD] {FFFFFF}Данные обнулились", 0x4b58ebFF)
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
			imgui.InputText(u8'Лос-Сантос', pls,imgui.ImVec2(200, 30))
			--[[if imgui.InputInt(u8'Лос-Сантос ', pls, 1, 10) then
			if plsv < pls.v then
				sampSendChat(" /f Обнаружен патруль в городе Лос-Сантос. Кол-во патрулей на данный момент: "..pls.v) end
				plsv = plsv + 1
				print(plsv)
				print(pls.v)
			end]]
			imgui.InputInt(u8'Сан-Фиерро ', psf, 1, 10)
			imgui.InputInt(u8'Лас-Вентурас ', plv, 1, 10)
			imgui.Text(u8'Кол-во патрулей в городах:')
			imgui.Text(u8'Лос-Сантос: '..pls.v.. " |")
			imgui.SameLine(nil, 4)
			imgui.Text(u8'Сан-Фиерро: '..psf.v.. " |")
			imgui.SameLine(nil, 4)
			imgui.Text(u8'Лас-Вентурас: '..plv.v)
			if imgui.Button(u8'Итог проверки',imgui.ImVec2(300, 20)) then
				sampSendChat(string.format(" /f Итог проверки патрулей: Лос-Сантос: %s, Сан-Фиерро: %s, Лас-Вентурас: %s", pls.v, psf.v, plv.v))
			end
		end
		imgui.EndGroup()
	imgui.End()
	end
			if tree_menu_1.v then
			local sw, sh = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
			imgui.SetNextWindowSize(imgui.ImVec2(380, 110), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'Проверка постов | Los-Santos | v. 1.2 beta', tree_menu_1)
				imgui.Text(u8'Автостанция Лос-Сантос:')
				imgui.SameLine(nil, 92)
				if imgui.Button(u8'Занято##but8',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Автостанция Лос-Сантос. Состояние: Занят')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but8',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Автостанция Лос-Сантос. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.Text(u8'Мэрия Лос-Сантос:')
				imgui.SameLine(nil, 129)
				if imgui.Button(u8'Занято##but7',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Мэрия Лос-Сантос. Состояние: Занят')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but7',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Мэрия Лос-Сантос. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.Text(u8'Железно-дорожный вокзал Лос-Сантос:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Занято##but6',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Железно-дорожный вокзал Лос-Сантос. Состояние: Занят')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but6',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Железно-дорожный вокзал Лос-Сантос. Состояние: Пусто')
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
			imgui.Begin(u8'Проверка постов | San-Fierro | v. 1.2 beta', tree_menu_2)
				imgui.Text(u8'Автошкола Сан-Фиерро:')
				imgui.SameLine(nil, 103)
				if imgui.Button(u8'Занято##but2',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Автошкола Сан-Фиерро. Состояние: Занят')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but2',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Автошкола Сан-Фиерро. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'Мэрия Сан-Фиерро:')
				imgui.SameLine(nil, 130)
				if imgui.Button(u8'Занято##but1',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Мэрия Сан-Фиерро. Состояние: Занят')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but1',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Мэрия Сан-Фиерро. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'Железно-дорожный вокзал Сан-Фиерро:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Занято##but',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Железно-дорожный вокзал Сан-Фиерро. Состояние: Занят')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Железно-дорожный вокзал Сан-Фиерро. Состояние: Пусто')
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
			imgui.Begin(u8'Проверка постов | Las-Venturas | v. 1.2 beta', tree_menu_3)
				imgui.Text(u8'Радиоцентр Лас-Вентурас:')
				imgui.SameLine(nil, 96)
				if imgui.Button(u8'Занято##but5',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Радиоцентр Лас-Вентурас. Состояние: Занят')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but5',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Радиоцентр Лас-Вентурас. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'Центральная Больница Лас-Вентурас:')
				imgui.SameLine(nil, 30)
				if imgui.Button(u8'Занято##but4',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Центральная Больница Лас-Вентурас. Состояние: Занят')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but4',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Центральная Больница Лас-Вентурас. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				---
				imgui.Text(u8'Железно-дорожный вокзал Лас-Вентурас:')
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Занято##but3',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Железно-дорожный вокзал Лас-Вентурас. Состояние: Занят')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				imgui.SameLine(nil, 5)
				if imgui.Button(u8'Пусто##but3',imgui.ImVec2(60, 20)) then
					sampSendChat('/f Пост: Железно-дорожный вокзал Лас-Вентурас. Состояние: Пусто')
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
    imgui.Begin(u8'Сообщить в рацию | v. 1.2 beta', fo_menu)
		if imgui.Button(u8'Строй ЛСПД',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Общий строй в гараже ЛСПД")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8'Строй СФПД',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Общий строй в гараже СФПД")
		end
		if imgui.Button(u8'Строй ЛВПД',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Общий строй в гараже ЛВПД")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8'Строй FBI',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Общий строй в офисе FBI")
		end
		if imgui.Button(u8'Собрание (5 мин)',imgui.ImVec2(138, 20)) then
			sampSendChat("/f Собрание Мин. Внутренних Дел начнётся через 5 минут.")
		end
		imgui.SameLine(nil, 4)
		if imgui.Button(u8"Проверка /find'a",imgui.ImVec2(138, 20)) then
			sampSendChat(string.format("/f WSPD, доложите кол-во сотрудников в Штате! FBI на номер %s", mainIni.settings.phone))
		end
	imgui.End()
	end
	if five_menu.v then
    local sw, sh = getScreenResolution()
    imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
    imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Поставить лидера | v. 1.2 beta', five_menu)
        imgui.InputInt(u8'ID ', new_id, 1, 10)
        if imgui.Combo(u8'Лидерка', new_frak, {u8'ЛСПД',u8'СФПД',u8'ЛВПД',u8'FBI'}) then
            if new_frak.v == 0 then name_lid = 'Полиции Лос-Сантоса' end
            if new_frak.v == 1 then name_lid = 'Полиции Сан-Фиерро' end
            if new_frak.v == 2 then name_lid = 'Полиции Лас Вентураса' end
            if new_frak.v == 3 then name_lid = 'ФБР' end
        end
        if sampIsPlayerConnected(new_id.v) then
            local nick = sampGetPlayerNickname(new_id.v)
			imgui.Text(u8(string.format('Вы собираетесь поставить %s на пост лидера %s',nick, name_lid)))
			else
			imgui.Text(u8'Указан неверный ID, или игрок не подключен.')
		end
        if imgui.Button(u8'Поставить лидера') then
            sampSendChat(string.format(" /newleader %s %s", new_id.v, new_frak.v))
		end
	imgui.End()
	end
	if seven_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.0, 0.0))
	imgui.SetNextWindowSize(imgui.ImVec2(250, 145), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Поставить лидера | v. 1.2 beta', seven_menu)
		imgui.Text(u8'v. 0.1:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8' ..::Release::..')
		imgui.SameLine(nil, 20)
		imgui.Text(u8'v. 1.1 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'-Добавлен выбор стиля скрипта\n-Исправлен баг с проверкой постов\n-Добавлена функция "Поставить лидера"')
		imgui.Text(u8'v. 0.2:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Добавлена функция: Автоматичиский счётчик постов\n- Теперь работает кнопка: Итог проверки постов.\n- Добавлены /gnews для: ЛС/СФ/ЛВПД.')
		imgui.SameLine(nil, 20)
		imgui.Text(u8'v. 1.2 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Добавлены РП отыгровки команд\n-Активация РП отыгровок в настройках\n- Изменена структура скрипта\n- В гос. новостях добавлено время\n-Добавлен ЕПК (/епк)')
		imgui.Text(u8'v. 0.3:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Добавлена функция: Обнуление счётчика постов.\n - Исправлены найденные баги.\n - Обновлены ответы для собеседований.')
		imgui.Text(u8'v. 0.4:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Исправлены некторые баги.\n - Добавлены несколько новый гос. новостей для Министра.')
		imgui.Text(u8'v. 0.5:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Исправлены баги/ошибки. ')
		imgui.Text(u8'v. 1.0 beta:')
		imgui.SameLine(nil, 5)
		imgui.TextQuestion(u8'- Новый дизайн\n-Убраны некоторые функции')
	imgui.End()
	end
	if ten_menu.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(-1.2, -1.0))
	imgui.SetNextWindowSize(imgui.ImVec2(150, 105), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Обыск | v. 1.2 beta', ten_menu)
		if imgui.Button(u8"Ничего не нашли",imgui.ImVec2(135, 20)) then
			sampSendChat("Сэр, мы у вас ничего не нашли. Вы свободны.")
		end
		if imgui.Button(u8"Нашли наркотики",imgui.ImVec2(135, 20)) then
			sampSendChat("/me нашёл пакетик с кокаином")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me отобрал пакетик")
			wait(1000)
			sampSendChat("/me достал из кармана пакет для улик")
			wait(1000)
			sampSendChat("/me убрал наркотики в пакет")
		end)
		lua_thread.create(function() wait(4000)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Используйте команду /remove [ID] [D] для изъятия наркотиков.", 0x4b58ebFF)
		end)
		end
		if imgui.Button(u8"Нашли патроны",imgui.ImVec2(135, 20)) then
			sampSendChat("/me нашёл коробочку с патронами")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me отобрал коробочку")
			wait(1000)
			sampSendChat("/me достал пакет для улик")
			wait(1000)
			sampSendChat("/me убрал коробочку в пакет")
		end)
		lua_thread.create(function() wait(4000)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Используйте команду /remove [ID] [P] для изъятия патрон.", 0x4b58ebFF)
		end)
		end
	imgui.End()
	end
	if ten_menu_one.v then
	local sw, sh = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	imgui.SetNextWindowSize(imgui.ImVec2(1130, 600), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Единый процессуальный кодекс	| v. 1.2 beta', ten_menu_one)
	imgui.Text(u8[[Единый процессуальный кодекс.?
[1] - Преступления против граждан штата/гос.служащих.

1.1 - За любое нападение на граждана штат/гос.служащего с причинением тяжких телесных повреждений преступнику присваивается 2 уровень розыска.
1.2 - За любое нападение на граждана штат/гос.служащего повлекшее за собой гибель, преступнику присваивается 4 уровень розыска.
1.3 - За угрозы гражданину в виде расправы или любом другом действии, нарушителю присваивается 1 уровень розыска.
1.4 - За вымогательство денежных средств путём угроз и насилия, 2-й уровень розыска.
1.5 - За оскорбление чести и достоинства любого гражданина преступнику присваивается 1 уровень розыск и штраф в виде 2.000$
1.6 - За организацию/участие в нелегальных азартных играх преступнику присваивается 1 уровень розыска и штраф в виде 2.000$
1.7 - За соучастие в преступлении, преступнику присваивается 1-6-ый уровень розыска (выдаётся такое же уровень розыска как и преступнику)
1.8 - За угон или попытку угона транспортного средства нарушителю присваивается 1й уровень розыска.]])
imgui.Text(u8[[[2] - Действия против министерства внутренних дел.

2.1 - За предложение взятки сотруднику правоохранительных органов при исполнении, преступнику присваивается 2-ой уровень розыска.
2.2 - За воспрепятствование действиям сотрудника правоохранительных органов по задержанию преступника гражданину присваивается 2-ой уровень розыска.
2.3 - За неподчинение сотруднику правоохранительных органов, если того требует следствие, преступнику присваивается 2-ый уровень розыска.
2.4 - За проникновение на территорию ФБР или полицейских департаментов без каких-либо весомых причин преступнику дается отсчет до 5 чтобы 
покинуть территорию, в противном случае 1 уровень розыска.
2.5 - За проникновение в служебный автомобиль нарушителю даётся 5 секунд чтобы покинуть его а затем присваивается 1-й уровень розыска.
2.6 - За оскорбление чести и достоинства сотрудника МВД нарушителю присваивается 1 уровень розыска и выписывается штраф в виде 2.000$
2.7 - За угрозы сотруднику МВД в виде расправы или любом другом действии, нарушителю присваивается 2 уровень розыска.
2.8 - За покрывательскую деятельность преступника сотрудником МВД, сотрудник получает увольнение и присваивается 5 уровень розыска.
2.9 - За дачу заведомо ложных показаний, которые могут завести следствие в тупик преступнику присваивается 4 уровень розыска.]])
imgui.Text(u8[[?[3] - Наркотические вещества, оружие и предметы запрещенные в штате.
3.1 - За хранение и употребление наркотических веществ или других психотропных преппаратов нарушителю присваивается 3 уровень розыска и последующее 
изъятие веществ.
3.2 - За продажу/покупку/распространение наркотических веществ или других психотропных преппаратов нарушителю присваивается 3 уровень розыска и 
последующее изъятие веществ.
3.3 - За призыв к употреблению наркотических веществ или других психотропных преппаратов нарушителю присваивается 1 уровень розыска и выписывается 
штраф в размере 1.500$
3.4 - За ношение оружия в открытом виде,если того не требует ситуация, преступнику присваивается 1 уровень розыска и изъятие оружия.
3.5 - За хранение/транспортировку боеприпасов в любом количестве преступнику присваивается 1 уровень розыска и последующее изъятие.
Исключение: 1-2 ранги мэрий/АП, сотрудники МВД, военнослужащие.
3.6 - За продажу/покупку/распространение оружия или боеприпасов преступнику присваивается 2 уровень розыска и последующее изъятие.
3.7 - За кражу боеприпасов с объектов министерства обороны преступнику присваивается 1 уровень розыска и последующее изъятие.
3.8 - За транспортировку патронов в особо больших количествах(ящики в авто) лицами, не состоящими на службе в Министерстве Обороны, преступнику 
присваивается 4-й уровень розыска
Oстановка транспортного средства может быть произведена лишь по причине нарушения другой статьи, по РП нельзя определить есть в машине патроны или нет.]])
imgui.Text(u8[[[4] - Преступления против государственного режима или имущества.

4.1 - За планирование, организацию, или соучастие в несанкционированных митингах либо бунтах, гражданину присваивается 2-ый уровень розыска.
4.2 - За срыв одобренного мероприятия, помеха проведению одобренного мероприятия, гражданину присваивается 1-й уровень розыска
4.3 - За шпионаж, продажу, разглашение государственной информации, преступнику присваивается 6-ой уровень розыск/
4.4 - За передачу информации государственной важности представителям организованных преступных групировок нарушителю присваивается 6-й уровень розыска
4.5 - За Планирование или реализация действий, которые могут быть расценены как государственная измена, нарушитель объявляется в 6 уровень розыска, 
лишается всех лицензий, попадает в ЧС своей организации высшей категории без права выхода. Помимо этого нарушитель попадает в список Предателей Штата, 
о чём будет оповещено в государственные новости. 
4.6 - За порчу государственного имущества(Машин,столбов,дверей,деревьев,лавок и тд) преступнику присваивается 1 уровень розыска и выписывается штраф в 
размере 2.000$
4.7 - За дачу взятки за продвижение по карьерной лестнице группе лиц присваивается 6 уровень розыска и послудующее занесение в черный список организации.
]])
imgui.Text(u8[[[5] - Мелкие правонарушения. Преступления против общественной нравственности.

5.1 - При отказе предоствить документы если того требует следствие или же утере документов нарушителю присваивается 1 уровень розыска и штраф в размере 1.000$
5.2 - За отказ или невозможность оплаты штрафа преступнику присваивается 1 уровень розыска.
5.3 - За использование бранных слов нарушителю присваивается штраф в размере 1.500$
5.4 - За осуществление/попытку осуществления интимных услуг, пособничество проституции нарушителю присваивается 2 уровень розыска.
5.5 - За выполнение опасных трюков на велосипеде, которые могут повлечь за собой травмы окружающих нарушителю присваивается 1 у.р. 
(пояснение: прыжки через людей или на людей)
5.6 - За попрашайничество в любом виде нарушителю присваивается 1 уровень розыска.
5.7 - За проявление национализма либо расизма, преступнику присваивается 3-ий уровень розыска.
5.8 - За организацию или участие в мероприятиях, призывающих к национализму либо расизму независимо от того, одобрено ли оно правительством, преступнику 
присваивается 5-й уровень розыска.
5.9 - За ложный вызов нарушителю присваивается 1 уровень розыска или же штраф в размере 2000$.
5.10 - За порчу личного имущества или проникновение на личную территорию(дом) любого гражданина нарушителю присваивается 1 уровень розыска.
5.11 - Проникновение за оцепление во время теракта, нарушителю присваивается 1-й уровень розыска (не относиться к работниками СМИ и МЗ, выполняющим 
свои обязанности]])
	imgui.Text(u8[[[6] - Организационная преступная деятельность.

6.1 - За похищение/попытку похитить одного или группу лиц преступникам присваивается 6 уровень розыска.
6.2 - За планирование или организацию теракта преступнику/группе лиц присваивается 6 уровень розыска.
6.3 - За продажу/распространение/кражу служебной формы(например: форму МО или МВД) преступнику или группе лиц присваивается 3 уровень розыска.
6.4 - За подделку документов, удостоверений, значков государственных организаций, а равно их покупка, продажа и применение в личных целях наказывается 
4-ый уровнями розыска.
6.5 - За работу в организации чья деятельность путем расследования и последующего допроса исполнителей преступлений доказана агент ФБР(5+ ранг) имеет право 
присвоить 4 уровень розыска.
6.6 - За дачу заведомо ложной информации о теракте или похищении преступнику присваивается 2 уровень розыска.]])
	imgui.Text(u8[[[7] - Нарушения правил дорожного движения.

7.1 - Езда по встречной полосе. Нарушителю выписывается штраф в размере 2.000$, изымается водительское удостоверение и присваивается 1 уровень розыска.
7.2 - Наезд на пешехода с причинением каких-либо телесных поврежденийй. Нарушителю выписывается штраф в размере 2.000$, присваивается 2 уровень розыска и изъятие вод.уд.
7.3 - Парковка в неположенном месте. Нарушителю выписывается штраф в размере 2.000$ и изымается водительское удостоверение.
7.4 - Игнорирование звуковых (сирен) и/или визуальных сигналов (проблесковых маячков) специальных служб. Нарушителю выписывается штраф в размере 2.000$.
7.5 - Уезд с места ДТП. Нарушителю выписывается штраф в размере 1.000$, изымается водительское удостоверение и присваивается 1 уровень розыска.
7.6 - Умышленное создание аварийной ситуации. Нарушителю выписывается штраф в размере 2.000$, изымается водительское удостоверение и присваивается 2 уровень розыска.
7.7 - Помеха работе правоохранительных органов на транспортном средстве ( подрезание , врезание в машину мвд специально и т.д ).У нарушителя изымается водительское 
удостоверение и присваивается 2 уровень розыска.
7.8 - Езда с выключенными фарами в темное время суток(после 19:30) нарушителю выписывается штраф в размере 500$
7.9 - Участие/организация несанкционированных уличных гонок. Нарушителям выписывается штраф в размере 2.000$
7.10 - За парковку воздушного транспорта вне специально отведенного места нарушителю выписывается штраф в размере 1.500$ и изымается удостоверение на управление 
воздушным транспортом.
7.11 - За использование служебного / общественного транспорта в личных целях, без установленного тарифа. Нарушителю выписывается штраф в размере 1000$.]])
	imgui.Text(u8[[[8] - Поведение в месте отбывания наказания.

8.1 - За неадекватное поведение, а именно: драка и т.п. нарушителю выписывается штраф в размере 2000$.
8.2 - За неподчинение сотрудников Тюрьмы, нарушителю выписывается штраф в размере 1500$.
8.3 - За оскорбление сотрудника Тюрьмы или других заключенных, нарушителю выписывается штраф в размере 1500$.]])

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
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Скрипт запущен.{9d00bd} Автор: Mateo Penaloza. {4b58eb} | Version: 1.2 beta", 0x4b58ebFF)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Используйте команду /lm или клавишу F2 для вызова меню.", 0x4b58ebFF)
			--sampAddChatMessage("[Leader-MVD] {FFFFFF} Скрипт доступен только для лидеров. Пропишите команду {4b58eb}/lm{ffffff} для регистрации.", 0x4b58ebFF)
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
			sampRegisterChatCommand("епк", ud) -- +
			sampRegisterChatCommand("уд", udos) -- +
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
							if weapon == 3 then -- дубинка
								sampSendChat("/do Дубинка висит на поясе.")
								wait(1000)
								sampSendChat("/me снял дубинку с пояса")
								while true and save_rpw.v == true do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 3 then
										sampSendChat("/me повесил дубинку на пояс")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 17 then -- Дымовая шашка
								sampSendChat("/do Дымовая шашка в чехле на поясе.")
								wait(1000)
								sampSendChat("/me вытащил дымовую шашку")
									while true and save_rpw.v do
									wait(0)
									imgui.Process = main_menu.v
									local weapon = getCurrentCharWeapon(PLAYER_PED)
										if weapon ~= 17 then
											break
										end
									end
									---------------------------------
							elseif weapon == 23 then -- Пистол
								sampSendChat("/do В кобуре пистолет SD-Pistol")
								wait(1000)
								sampSendChat("/me достал пистолет из кобуры")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 23 then
										sampSendChat("/do Кобура на поясе.")
										wait(1000)
										sampSendChat("/me засунул пистолет в кобуру")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 24 then -- Дигл
								sampSendChat("/do В кобуре пистолет Desert Eagle .")
								wait(1000)
								sampSendChat("/me достал пистолет из кобуры")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 24 then
										sampSendChat("/do Кобура на поясе.")
										wait(1000)
										sampSendChat("/me засунул пистолет в кобуру")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 25 then -- Шотган
								sampSendChat("/do На плече весит дробовик Shotgun.")
								wait(1000)
								sampSendChat("/me снял с плеча дробовик")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 25 then
										sampSendChat("/me повесил дробовик на плечо")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 29 then -- МП 5
								sampSendChat("/do На плече весит пистолет-пулемёт MP-5.")
								wait(1000)
								sampSendChat("/me снял с плеча пистолет-пулемёт")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 29 then
										sampSendChat("/me повесил пистолет-пулемёт на плечо")
										wait(1000)
										break
									end
								end
								---------------------------------
							elseif weapon == 34 then -- Снайперка
								sampSendChat("/do  На спине снайперская винтовка.")
								wait(1000)
								sampSendChat("/me взял со спины снайперскую винтовку")
								while true and save_rpw.v do
								wait(0)
								imgui.Process = main_menu.v
								local weapon = getCurrentCharWeapon(PLAYER_PED)
									if weapon ~= 34 then
										sampSendChat("/do В руке снайперская винтовка")
										wait(1000)
										sampSendChat("/me повесит снайперскую винтовку на спину")
										wait(1000)
										break
									end
								end
							end
						end
					end
				end
			else
				sampAddChatMessage("[Leader-MVD] {FFFFFF} Скрипт запущен.{9d00bd} Автор: Mateo Penaloza. {4b58eb} | Version: 1.2 beta", 0x4b58ebFF)
				sampAddChatMessage("[Leader-MVD] {FFFFFF} У вас закончился срок использования скрипта. Обратитесь к автору: vk.com/si8646222 или Skype: danilbw", 0x4b58ebFF)
				thisScript():unload()
			end
		else
			sampAddChatMessage("[Leader-MVD] {FFFFFF} Скрипт запущен.{9d00bd} Автор: Mateo Penaloza. {4b58eb} | Version: 1.2 beta", 0x4b58ebFF)
			sampAddChatMessage("[Leader-MVD] {FFFFFF} У вас нет доступа к скрипту. Обратитесь к автору: vk.com/si8646222 или Skype: danilbw", 0x4b58ebFF)
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
					itog = dialogtext:match('.+Игровой статус:%s(.+)')
					sampCloseCurrentDialogWithButton(1)
					if itog == '	Опытный игрок' then 
						st = 1
						sampAddChatMessage("[Leader-MVD] {FFFFFF} Используйте клавишу F2 для вызова меню.", 0x4b58ebFF)
						else sampAddChatMessage("[Leader-MVD] {FFFFFF} Вы не лидер. Скрипт вам не доступен.", 0x4b58ebFF) end
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
			if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /cuff [id].", 0x4b58ebFF) else
				if mainIni.settings.cuff == 1 then
					sampSendChat("/do Наручники на поясном держателе.")
				lua_thread.create(function() wait(1000)
					sampSendChat("/me снял наручники с поясного держателя.")
					wait(1000)
					sampSendChat("/me резким движением скрестил руки задержанного.")
					wait(1000)
					sampSendChat("/me одевает наручники на правую руку задержанного.")
					wait(1000)
					sampSendChat("/me одевает наручники на левую руку задержанного.")
					wait(1000)
					sampSendChat("/do На преступнике надеты наручники.")
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
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /arrest [id].", 0x4b58ebFF) else
		if mainIni.settings.arrest == 1 then
			sampSendChat("/do Ручка в бардачке.")
		lua_thread.create(function() wait(1000)
			sampSendChat("/do Бланки протоколов в бардачке.")
			wait(1000)
			sampSendChat("/me открыл бардаче, затем взял ручку и бланк протокола")
			wait(1000)
			sampSendChat("/do Бланк протокола и ручка в руках.")
			wait(1000)
			sampSendChat("/me приступил к заполнению бланка протокола")
			wait(3000)
			sampSendChat("/me заполняет описание внешности нарушителя")
			wait(3000)
			sampSendChat("/me заполняет характеристику о нарушителе")
			wait(3000)
			sampSendChat("/me заполняет данные о нарушении")
			wait(3000)
			sampSendChat("/me проставил дату и подпись")
			wait(2000)
			sampSendChat("/me положил ручку в бардачок")
			wait(2000)
			sampSendChat("/me передал бланк составленного протокола в участок")
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
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /hold [id].", 0x4b58ebFF) else
		if mainIni.settings.hold == 1 then
			sampSendChat("/me взял за руку преступника, затем повёл его за собой")
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
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /eject [id].", 0x4b58ebFF) else
		if mainIni.settings.eject == 1 then
			sampSendChat("/me вышел из автомобиля, затем вытащил человека наружу")
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
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /su [id] [Кол-во звёзд] [Причина].", 0x4b58ebFF) else
	local id, zv, re = string.match(params,"(%d+)%s+(%d+)%s+(.*).")
		if mainIni.settings.su == 1 then
			sampSendChat("/me достал рацию, затем сообщил данные о преступнике диспетчеру")
			sampSendChat("/su "..id.." "..zv.." "..re)
		lua_thread.create(function() wait(1000)
			sampSendChat("/me повесил рацию на пояс")
		end)
			else
			sampSendChat("/su "..id.." "..zv.." "..re)
		end
	end
end

function takelic(params)
if not string.match(params,"(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /takelic [id] [Причина].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.takelic == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me достал КПК")
			wait(1000)
			sampSendChat("/me ввёл номерной знак транспортного средства")
			wait(1000)
			sampSendChat('/me изменил значение водительского удостоверения на "недействительно"')
			sampSendChat("/takelic "..id.." "..re)
			wait(1000)
			sampSendChat("/me выключил КПК, затем убрал его")
		end)
			else
			sampSendChat("/takelic "..id.." "..re)
		end
	end
end

function putpl(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /putpl [id].", 0x4b58ebFF) else
		if mainIni.settings.putpl == 1 then
			sampSendChat("/me открыл дверь автомобиля, затем затащил в него преступника")
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
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /uninvite [id] [Причина].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.uninvite == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me достал КПК")
			wait(1000)
			sampSendChat("/me ввёл номер жетона сотрудника")
			wait(1000)
			sampSendChat('/me нажал на кнопку "Уволить"')
			sampSendChat("/uninvite "..id.." "..re)
		end)
			else
			sampSendChat("/uninvite "..id.." "..re)
		end
	end
end

function rang(params)
if not string.match(params,"(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /rang [id] [+/-].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.rang == 1 then
			sampSendChat("/do На плечах висит рюкзак")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me снял рюкзак, открыв его, взял новые погоны, затем передал их человеку на против")
			sampSendChat("/rang "..id.." "..re)
		end)
			else
			sampSendChat("/rang "..id.." "..re)
		end
	end
end

function invite(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /invite [id].", 0x4b58ebFF) else
		if mainIni.settings.invite == 1 then
			sampSendChat("/do На плечах висит рюкзак")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me снял рюкзак, открыв его, взял форму, рацию и жетон")
			wait(1000)
			sampSendChat("/me передал форму, рацию и жетон человеку на против")
			sampSendChat("/invite "..id)
		end)
			else
			sampSendChat("/invite "..id)
		end
	end
end

function changeskin(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /changeskin [id].", 0x4b58ebFF) else
		if mainIni.settings.changeskin == 1 then
			sampSendChat("/do На плечах висит рюкзак")
		lua_thread.create(function() wait(1000)
			sampSendChat("/me снял рюкзак, открыв его, взял новую форму")
			wait(1000)
			sampSendChat("/сhangeskin "..id)
			wait(1000)
			sampSendChat("/me передал новую форму человеку на против")
		end)
			else
			sampSendChat("/сhangeskin "..id)
		end
	end
end

function search(param)
local id = tonumber(param)
	if id == nil then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /search [id].", 0x4b58ebFF) else
		if mainIni.settings.search == 1 then
			sampSendChat("Встаньте лицом к стене, руки за голову.")
		lua_thread.create(function() wait(1000)
			sampSendChat("/n /anim 33")
			sampSendChat("/me достал резиновые перчатки.")
			wait(1000)
			sampSendChat("/me одел резиновые перчатки.")
			wait(1000)
			sampSendChat("/me обыскал ноги.")
			wait(1000)
			sampSendChat("/anim 14")
			wait(1000)
			sampSendChat("/me обыскал тело.")
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
	if text == "" then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /fn [текст].", 0x4b58ebFF) else
		sampSendChat("/f (( "..text.." ))")
	end
end

function rn(param)
local text = param
	if text == "" then sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /rn [текст].", 0x4b58ebFF) else
		sampSendChat("/r (( "..text.." ))")
	end
end

function ticket(params)
if not string.match(params,"(%d+)%s+(%d+)%s+(.*)") then
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Не ввели необходимые значения.{9d00bd} /ticket [id] [Сумма] [Причина].", 0x4b58ebFF) else
	local id, re = string.match(params,"(%d+)%s+(.*).")
		if mainIni.settings.ticket == 1 then
		lua_thread.create(function() wait(1000)
			sampSendChat("/me достал квитанцию")
			wait(1000)
			sampSendChat("/me достал ручку")
			wait(1000)
			sampSendChat('/me заполнил квитанцию')
			wait(1000)
			sampSendChat("/me передал квитанцию нарушителю")
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
		sampSendChat("/do В заднем кармане брюк лежит удостоверение сотрудника МВД.")
		wait(1000)
		sampSendChat("/me протянув руку к карману, резким движением взял удостоверение в руки")
		wait(2000)
		sampSendChat('/me открыл удостоверение, затем протянул руку и показал его')
		wait(1000)
		sampSendChat("/do В удостоверении: Звание: "..u8:decode(mainIni.settings.dol).." | Имя Фамилия: "..u8:decode(mainIni.settings.name).." ... ")
		sampSendChat("/do ... | Номер удостоверения: "..u8:decode(mainIni.settings.phone).." | MofIA WS")
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
