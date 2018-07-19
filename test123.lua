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
    phone = 'none'
  }
}, '..\\config\\LeaderMVD.ini')

-- одно из основных отличий от оригинального апи
-- все переменные, значения которых записываются в ImGui по указателю, могут использоваться только через специальные типы
local main_window_state = imgui.ImBool(false)
local main1_window_state = imgui.ImBool(false)
local save_phone = imgui.ImBuffer(256)
local new_id = imgui.ImBuffer(256)
local new_frak = imgui.ImBuffer(256)
local id = imgui.ImBuffer(256)
local frak = imgui.ImBuffer(256)
local vig_n = imgui.ImBuffer(256)
local vig_p = imgui.ImBuffer(256)
local x, y = getScreenResolution()
local posls = 0
local possf = 0
local poslv = 0
function imgui.OnDrawFrame()
  if main_window_state.v then -- чтение и запись значения такой переменной осуществляется через поле v (или Value)
    imgui.SetNextWindowPos(imgui.ImVec2(x/2, y/2), imgui.Cond.FirstUseEver, imgui.ImVec2(3, 3))
    imgui.Begin(u8'Leader-MVD | v. 0.4', main_window_state)
    end
	if imgui.TreeNode(u8'Информация') then
		imgui.InputText(u8'Номер', save_phone,imgui.ImVec2(200, 30))
		if imgui.Button(u8'Сохранить номер') then
		 mainIni.settings.phone = save_phone.v
		 inicfg.save(mainIni, '..\\config\\LeaderMVD.ini')
		end
		imgui.Text(string.format(u8'Текущий номер: %s',mainIni.settings.phone))
		imgui.Text(u8'В разработке')
		imgui.TreePop()
	end
	if imgui.TreeNode(u8'Гос. новости') then
		if imgui.TreeNode(u8'Для Министра') then
			if imgui.Button(u8'Контрактная служба(3)') then
				sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
				sampSendChat('/gnews На портале Штата открыты заявления на контрактную службу.')
				sampSendChat('/gnews Ждём каждого в наших рядах.')
			end
			if imgui.Button(u8'Восстоновление по /wbook(1)') then
				sampSendChat('/gnews Открыты заявления на восстоновление в МВД по трудовой книге.')
			end
			if imgui.Button(u8'Агитационное сообщение(1)') then
				sampSendChat('/gnews Вас ограбили? Вам угрожают? Увидели драку? Звоните в 02!')
			end
			if imgui.Button(u8'Агитационное сообщение(3)') then
				sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
				sampSendChat('/gnews Вас ограбили? Вам угрожают? Увидели драку? Звоните в 02!')
				sampSendChat('/gnews Полиция Белого Штата поможет Вам!')
			end
			if imgui.Button(u8'У всех собеседование(3)') then
				sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
				sampSendChat('/gnews Во все Полицеские Департаменты Штата проходят собеседование.')
				sampSendChat('/gnews Опытные Генералы ждут Вас! Скорее к нам!')
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'ЛСПД') then
			if imgui.Button(u8'Собеседование(3)') then
				sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
				sampSendChat('/gnews Проходит собеседование в Полицию г. Los-Santos.')
				sampSendChat('/gnews Критерии: 4 года в Штате, лицензии, законопослушность')
			end
			if imgui.Button(u8'Напоминание о собеседовании(1)') then
				sampSendChat('/gnews Напоминаю, проходит собеседование в Полицию г. Los-Santos.')
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'СФПД') then
			if imgui.Button(u8'Собеседование(3)') then
				sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
				sampSendChat('/gnews Проходит собеседование в Полицию г. San-Fierro.')
				sampSendChat('/gnews Критерии: 4 года в Штате, лицензии, законопослушность')
			end
			if imgui.Button(u8'Напоминание о собеседовании(1)') then
				sampSendChat('/gnews Напоминаю, проходит собеседование в Полицию г. San-Fierro.')
			end
			imgui.TreePop()
			end
		if imgui.TreeNode(u8'ЛВПД') then
			if imgui.Button(u8'Собеседование(3)') then
				sampSendChat('/gnews Уважаемые жители Штата! Минуточку внимания.')
				sampSendChat('/gnews Проходит собеседование в Полицию г. Las-Venturas.')
				sampSendChat('/gnews Критерии: 4 года в Штате, лицензии, законопослушность')
			end
			if imgui.Button(u8'Напоминание о собеседовании(1)') then
				sampSendChat('/gnews Напоминаю, проходит собеседование в Полицию г. Las-Venturas.')
			end
		imgui.TreePop()
		end
	imgui.Text(u8'В разработке')
	imgui.TreePop()
	end
	if imgui.TreeNode(u8'Проверка постов') then
		if imgui.TreeNode(u8'Лос-Сантос') then
			if imgui.TreeNode(u8'Мэрия ЛС') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Мэрия Лос-Сантос. Состояние: Занят')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					sampSendChat('/f Пост: Мэрия Лос-Сантос. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'Автостанция Лос-Сантос') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Автостанция Лос-Сантос. Состояние: Занят')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					sampSendChat('/f Пост: Автостанция Лос-Сантос. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'Железно-дорожный вокзал Лос-Сантос') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Железно-дорожный вокзал Лос-Сантос. Состояние: Занят')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'Сан-Фиерро') then
			if imgui.TreeNode(u8'Мэрия Сан-Фиерро') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Мэрия Сан-Фиерро. Состояние: Занят')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					sampSendChat('/f Пост: Мэрия Сан-Фиерро. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'Автошкола Сан-Фиерро') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Автошкола Сан-Фиерро. Состояние: Занят')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					sampSendChat('/f Пост: Автошкола Сан-Фиерро. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'Железно-дорожный вокзал Сан-Фиерро') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Железно-дорожный вокзал Сан-Фиерро. Состояние: Занят')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					sampSendChat('/f Пост: Железно-дорожный вокзал Сан-Фиерро. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'Лас-Вентурас') then
			if imgui.TreeNode(u8'Центральная Больница Лас-Вентурас') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Центральная Больница Лас-Вентурас. Состояние: Занят')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					sampSendChat('/f Пост: Центральная Больница Лас-Вентурас. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'Радиоцентр Лас-Вентурас') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Радиоцентр Лас-Вентурас. Состояние: Занят')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					sampSendChat('/f Пост: Радиоцентр Лас-Вентурас. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'Железно-дорожный вокзал Лас-Вентурас') then
				if imgui.Button(u8'Занят') then
					sampSendChat('/f Пост: Железно-дорожный вокзал Лас-Вентурас. Состояние: Занят')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'Пустой') then
					sampSendChat('/f Пост: Железно-дорожный вокзал Лас-Вентурас. Состояние: Пусто')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
		imgui.TreePop()
		end
		if imgui.Button(u8'Итог проверки постов.') then
			sampSendChat(string.format("/f Итог проверки постов: Лос-Сантос: %d/3, Сан-Фиерро: %d/3, Лас-Вентурас: %d/3", posls, possf, poslv))
			--printStringNow("It's not working", 2000)
		end
		if imgui.Button(u8'Обнулить посты.') then
			sampAddChatMessage(string.format("[Leader-MVD] {FFFFFF}LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv), 0x4b58ebFF)
			sampAddChatMessage("[Leader-MVD] {FFFFFF}Данные обнулились", 0x4b58ebFF)
			posls = 0
			possf = 0
			poslv = 0
		end
	imgui.TreePop()
	end
	if imgui.TreeNode(u8'Сообщения в рацию') then
		if imgui.Button(u8'Сообщить о собрании (5 мин. до начала)') then
			sampSendChat("/f Собрание Мин. Внутренних Дел начнётся через 5 минут.")
		end
		if imgui.Button(u8'Сообщить об общем строе в гараже ЛСПД') then
			sampSendChat("/f Общий строй в гараже ЛСПД")
		end
		if imgui.Button(u8'Сообщить об общем строе в гараже СФПД') then
			sampSendChat("/f Общий строй в гараже СФПД")
		end
		if imgui.Button(u8'Сообщить об общем строе в гараже ЛВПД') then
			sampSendChat("/f Общий строй в гараже ЛВПД")
		end
		if imgui.Button(u8'Проверка /find') then
			sampSendChat(string.format("/f WSPD, доложите кол-во сотрудников в Штате! FBI на номер %s", mainIni.settings.phone))
			--printStringNow("It's not working", 2000)
			--sampAddChatMessage("[Leader-MVD] {FFFFFF} Временно не работает.", 0x4b58ebFF)
		end
	imgui.TreePop()
	end
	if imgui.TreeNode(u8'Проведение собеседования') then
		if imgui.Button(u8'Приветствие') then
			sampSendChat("Доброе время суток! Вы на собеседование?")
		end
		if imgui.Button(u8'Документы') then
			sampSendChat("Передайте мне пожалуйста ваши документы, а именно: паспорт и лицензии.")
			sampSendChat("/n /pass, /lic")
		end
		if imgui.TreeNode(u8'Если всё нормально') then
			if imgui.Button(u8'Опрос 1') then
			sampSendChat("Сколько Вам лет? Где проживаете? Были ли ранения?")
			end
			if imgui.Button(u8'Опрос 2') then
			sampSendChat("Что у вас над головой?")
			end
			if imgui.Button(u8'Опрос 3') then
			sampSendChat("Что такое ПГ?")
			end
			if imgui.Button(u8'Опрос 4') then
			sampSendChat(string.format("/n ПГ РП МГ на /sms %s", mainIni.settings.phone))
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'Если не подходит') then
			if imgui.Button(u8'У игрока мал. законка') then
			sampSendChat("Увы, но в нашей базе преступлений, если и вы.")
			sampSendChat("/n Законопослушность должна быть > 20")
			end
			if imgui.Button(u8'У игрока не подходящий уровень') then
			sampSendChat("Увы, но вы проживаете в Штате мало лет.")
			sampSendChat("/n 4 уровень должен быть")
			end
			if imgui.Button(u8'У игрока нету лицензий') then
			sampSendChat("Увы, но у вас нету лицензий.")
			end
			if imgui.Button(u8'У игрока варн') then
			sampSendChat("Формы на вас ,к сожалению, нет")
			sampSendChat("/n /unwarn - снять варн")
			end
		imgui.TreePop()
		end
	imgui.TreePop()
	end
	-------------------------------
	if imgui.Button(u8"Выдать выговор сотруднику",imgui.ImVec2(230, 20)) then
		printStringNow("It's not working", 2000)
		sampAddChatMessage("[Leader-MVD] {FFFFFF} Временно не работает.", 0x4b58ebFF)
		--main1_window_state.v = not main1_window_state.v end
		--if main1_window_state.v then -- чтение и запись значения такой переменной осуществляется через поле v (или Value)
		--imgui.SetNextWindowSize(imgui.ImVec2(250, 300), imgui.Cond.FirstUseEver) -- меняем размер
		-- но для передачи значения по указателю - обязательно напрямую
		-- тут main_window_state передаётся функции imgui.Begin, чтобы можно было отследить закрытие окна нажатием на крестик
			--imgui.Begin(u8'Leader-MVD | Выдать выговор| v. 0.3', main1_window_state)
			--imgui.InputText(u8'Имя и Фамилия сотрудника', vig_n,imgui.ImVec2(200, 30))
		--imgui.End()
	end
	-------------------------------
	if imgui.Button(u8"Красная кнопка",imgui.ImVec2(230, 20)) then
		local _,  playerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
		sampSendChat(string.format("/f Внимание! Меня похищают. Маяк активен. Номер маяка: %d.", playerid))
	lua_thread.create(function() wait(1000)
		sampSendChat(string.format("/su %d 1 Похищение, сигнал SOS.", playerid))
	end)
	lua_thread.create(function() wait(1000)
		sampSendChat("/f Всем спец. отрядам приступить к перехвату. Конец связи.")
	end)
	end
	if imgui.TreeNode(u8'Поставить лидера') then
		--printStringNow("It's not working", 2000)
		--sampAddChatMessage("[Leader-MVD] {FFFFFF} Временно не работает.", 0x4b58ebFF)
		if imgui.InputText(u8'ID', new_id,imgui.ImVec2(200, 30)) then id = new_id end
		if imgui.InputText(u8'№ фракции', new_frak,imgui.ImVec2(200, 30)) then frak = new_frak end
		imgui.Text(u8" [1] - LSPD/[2] - SFPD/[3] - LVPD/[4] - FBI")
		if imgui.Button(u8'Поставить лидера') then
		sampSendChat(string.format(" /newleader %s %s", id, frak))
			if new_frak == 4 then 
				lua_thread.create(function()
				sampSendChat('/changeskin')
				while not sampIsDialogActive() do wait(0) end
					sampSetCurrentDialogListItem(12)
					sampCloseCurrentDialogWithButton(1)
					sampSendChat('4')
				end)
			else
				lua_thread.create(function()
				sampSendChat('/changeskin')
				sampSendChat('123')
				while not sampIsDialogActive() do wait(0) end
					sampSetCurrentDialogListItem(12)
					sampCloseCurrentDialogWithButton(1)
				end)
			end
		end
		imgui.Text(u8'В разработке')
	imgui.TreePop()
	end
	if imgui.TreeNode(u8'Лог обновлений') then
		imgui.Text(u8"v.0.2:\n - Добавлена функция:\n    Автоматичиский счётчик постов\n - Теперь работает кнопка:\n    Итог проверки постов.\n- Добавлены /gnews для:\n    ЛС/СФ/ЛВПД.")
		imgui.Text(u8"v.0.3:\n - Добавлена функция:\n    Обнуление счётчика постов.\n - Исправлены найденные баги.\n - Обновлены ответы для собеседований.")
		imgui.Text(u8"v.0.4:\n - Добавлена функция:\n    Проверка финда.\n - Исправлены найденные баги.\n - Установлена проверка на лидера.")
	imgui.TreePop()
	end
	imgui.End()
end


--function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(0)
	end
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Скрипт запущен.{9d00bd} Автор: Mateo Penaloza. {4b58eb} | Version: 0.4", 0x4b58ebFF)
	sampAddChatMessage("[Leader-MVD] {FFFFFF} Скрипт доступен только для лидеров. Пропишите команду {4b58eb}/lm{ffffff} для регистрации.", 0x4b58ebFF)
	sampRegisterChatCommand("lm", lm)
	while true do
    wait(0)
	if st == 1 then
		if wasKeyPressed(key.VK_F2) then -- активация по нажатию клавиши X
			main_window_state.v = not main_window_state.v -- переключаем статус активности окна, не забываем про .v
		end
	end
    imgui.Process = main_window_state.v	-- теперь значение imgui.Process всегда будет задаваться в зависимости от активности основного окна
    end
 end

function lm()
			lua_thread.create(function()
				sampSendChat('/mn')
				st = 0
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
end