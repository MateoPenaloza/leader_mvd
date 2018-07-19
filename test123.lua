require "lib.moonloader"
inicfg = require 'inicfg'
local imgui = require 'imgui'
local key = require 'vkeys'
local encoding = require 'encoding' -- ��������� ����������
encoding.default = 'CP1251' -- ��������� ��������� �� ���������, ��� ������ ��������� � ���������� �����. CP1251 - ��� Windows-1251
u8 = encoding.UTF8 -- � ������ �������� ��������� ��� ����������� UTF-8



local inicfg = require 'inicfg'

local mainIni = inicfg.load({
  settings =
  {
    phone = 'none'
  }
}, '..\\config\\LeaderMVD.ini')

-- ���� �� �������� ������� �� ������������� ���
-- ��� ����������, �������� ������� ������������ � ImGui �� ���������, ����� �������������� ������ ����� ����������� ����
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
  if main_window_state.v then -- ������ � ������ �������� ����� ���������� �������������� ����� ���� v (��� Value)
    imgui.SetNextWindowPos(imgui.ImVec2(x/2, y/2), imgui.Cond.FirstUseEver, imgui.ImVec2(3, 3))
    imgui.Begin(u8'Leader-MVD | v. 0.4', main_window_state)
    end
	if imgui.TreeNode(u8'����������') then
		imgui.InputText(u8'�����', save_phone,imgui.ImVec2(200, 30))
		if imgui.Button(u8'��������� �����') then
		 mainIni.settings.phone = save_phone.v
		 inicfg.save(mainIni, '..\\config\\LeaderMVD.ini')
		end
		imgui.Text(string.format(u8'������� �����: %s',mainIni.settings.phone))
		imgui.Text(u8'� ����������')
		imgui.TreePop()
	end
	if imgui.TreeNode(u8'���. �������') then
		if imgui.TreeNode(u8'��� ��������') then
			if imgui.Button(u8'����������� ������(3)') then
				sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
				sampSendChat('/gnews �� ������� ����� ������� ��������� �� ����������� ������.')
				sampSendChat('/gnews ��� ������� � ����� �����.')
			end
			if imgui.Button(u8'�������������� �� /wbook(1)') then
				sampSendChat('/gnews ������� ��������� �� �������������� � ��� �� �������� �����.')
			end
			if imgui.Button(u8'������������ ���������(1)') then
				sampSendChat('/gnews ��� ��������? ��� ��������? ������� �����? ������� � 02!')
			end
			if imgui.Button(u8'������������ ���������(3)') then
				sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
				sampSendChat('/gnews ��� ��������? ��� ��������? ������� �����? ������� � 02!')
				sampSendChat('/gnews ������� ������ ����� ������� ���!')
			end
			if imgui.Button(u8'� ���� �������������(3)') then
				sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
				sampSendChat('/gnews �� ��� ���������� ������������ ����� �������� �������������.')
				sampSendChat('/gnews ������� �������� ���� ���! ������ � ���!')
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'����') then
			if imgui.Button(u8'�������������(3)') then
				sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
				sampSendChat('/gnews �������� ������������� � ������� �. Los-Santos.')
				sampSendChat('/gnews ��������: 4 ���� � �����, ��������, �����������������')
			end
			if imgui.Button(u8'����������� � �������������(1)') then
				sampSendChat('/gnews ���������, �������� ������������� � ������� �. Los-Santos.')
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'����') then
			if imgui.Button(u8'�������������(3)') then
				sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
				sampSendChat('/gnews �������� ������������� � ������� �. San-Fierro.')
				sampSendChat('/gnews ��������: 4 ���� � �����, ��������, �����������������')
			end
			if imgui.Button(u8'����������� � �������������(1)') then
				sampSendChat('/gnews ���������, �������� ������������� � ������� �. San-Fierro.')
			end
			imgui.TreePop()
			end
		if imgui.TreeNode(u8'����') then
			if imgui.Button(u8'�������������(3)') then
				sampSendChat('/gnews ��������� ������ �����! ��������� ��������.')
				sampSendChat('/gnews �������� ������������� � ������� �. Las-Venturas.')
				sampSendChat('/gnews ��������: 4 ���� � �����, ��������, �����������������')
			end
			if imgui.Button(u8'����������� � �������������(1)') then
				sampSendChat('/gnews ���������, �������� ������������� � ������� �. Las-Venturas.')
			end
		imgui.TreePop()
		end
	imgui.Text(u8'� ����������')
	imgui.TreePop()
	end
	if imgui.TreeNode(u8'�������� ������') then
		if imgui.TreeNode(u8'���-������') then
			if imgui.TreeNode(u8'����� ��') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: ����� ���-������. ���������: �����')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					sampSendChat('/f ����: ����� ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'����������� ���-������') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: ����������� ���-������. ���������: �����')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					sampSendChat('/f ����: ����������� ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'�������-�������� ������ ���-������') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: �������-�������� ������ ���-������. ���������: �����')
					posls = posls+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'���-������') then
			if imgui.TreeNode(u8'����� ���-������') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: ����� ���-������. ���������: �����')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					sampSendChat('/f ����: ����� ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'��������� ���-������') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: ��������� ���-������. ���������: �����')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					sampSendChat('/f ����: ��������� ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'�������-�������� ������ ���-������') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: �������-�������� ������ ���-������. ���������: �����')
					possf = possf+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					sampSendChat('/f ����: �������-�������� ������ ���-������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'���-��������') then
			if imgui.TreeNode(u8'����������� �������� ���-��������') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: ����������� �������� ���-��������. ���������: �����')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					sampSendChat('/f ����: ����������� �������� ���-��������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'���������� ���-��������') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: ���������� ���-��������. ���������: �����')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					sampSendChat('/f ����: ���������� ���-��������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
			if imgui.TreeNode(u8'�������-�������� ������ ���-��������') then
				if imgui.Button(u8'�����') then
					sampSendChat('/f ����: �������-�������� ������ ���-��������. ���������: �����')
					poslv = poslv+1
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
				if imgui.Button(u8'������') then
					sampSendChat('/f ����: �������-�������� ������ ���-��������. ���������: �����')
					printStringNow(string.format("LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv),3000)
					lua_thread.create(function() wait(1000)
					sampSendChat('/c 60')
					end)
				end
			imgui.TreePop()
			end
		imgui.TreePop()
		end
		if imgui.Button(u8'���� �������� ������.') then
			sampSendChat(string.format("/f ���� �������� ������: ���-������: %d/3, ���-������: %d/3, ���-��������: %d/3", posls, possf, poslv))
			--printStringNow("It's not working", 2000)
		end
		if imgui.Button(u8'�������� �����.') then
			sampAddChatMessage(string.format("[Leader-MVD] {FFFFFF}LS: %d/3 SF: %d/3 LV: %d/3", posls, possf, poslv), 0x4b58ebFF)
			sampAddChatMessage("[Leader-MVD] {FFFFFF}������ ����������", 0x4b58ebFF)
			posls = 0
			possf = 0
			poslv = 0
		end
	imgui.TreePop()
	end
	if imgui.TreeNode(u8'��������� � �����') then
		if imgui.Button(u8'�������� � �������� (5 ���. �� ������)') then
			sampSendChat("/f �������� ���. ���������� ��� ������� ����� 5 �����.")
		end
		if imgui.Button(u8'�������� �� ����� ����� � ������ ����') then
			sampSendChat("/f ����� ����� � ������ ����")
		end
		if imgui.Button(u8'�������� �� ����� ����� � ������ ����') then
			sampSendChat("/f ����� ����� � ������ ����")
		end
		if imgui.Button(u8'�������� �� ����� ����� � ������ ����') then
			sampSendChat("/f ����� ����� � ������ ����")
		end
		if imgui.Button(u8'�������� /find') then
			sampSendChat(string.format("/f WSPD, �������� ���-�� ����������� � �����! FBI �� ����� %s", mainIni.settings.phone))
			--printStringNow("It's not working", 2000)
			--sampAddChatMessage("[Leader-MVD] {FFFFFF} �������� �� ��������.", 0x4b58ebFF)
		end
	imgui.TreePop()
	end
	if imgui.TreeNode(u8'���������� �������������') then
		if imgui.Button(u8'�����������') then
			sampSendChat("������ ����� �����! �� �� �������������?")
		end
		if imgui.Button(u8'���������') then
			sampSendChat("��������� ��� ���������� ���� ���������, � ������: ������� � ��������.")
			sampSendChat("/n /pass, /lic")
		end
		if imgui.TreeNode(u8'���� �� ���������') then
			if imgui.Button(u8'����� 1') then
			sampSendChat("������� ��� ���? ��� ����������? ���� �� �������?")
			end
			if imgui.Button(u8'����� 2') then
			sampSendChat("��� � ��� ��� �������?")
			end
			if imgui.Button(u8'����� 3') then
			sampSendChat("��� ����� ��?")
			end
			if imgui.Button(u8'����� 4') then
			sampSendChat(string.format("/n �� �� �� �� /sms %s", mainIni.settings.phone))
			end
		imgui.TreePop()
		end
		if imgui.TreeNode(u8'���� �� ��������') then
			if imgui.Button(u8'� ������ ���. �������') then
			sampSendChat("���, �� � ����� ���� ������������, ���� � ��.")
			sampSendChat("/n ����������������� ������ ���� > 20")
			end
			if imgui.Button(u8'� ������ �� ���������� �������') then
			sampSendChat("���, �� �� ���������� � ����� ���� ���.")
			sampSendChat("/n 4 ������� ������ ����")
			end
			if imgui.Button(u8'� ������ ���� ��������') then
			sampSendChat("���, �� � ��� ���� ��������.")
			end
			if imgui.Button(u8'� ������ ����') then
			sampSendChat("����� �� ��� ,� ���������, ���")
			sampSendChat("/n /unwarn - ����� ����")
			end
		imgui.TreePop()
		end
	imgui.TreePop()
	end
	-------------------------------
	if imgui.Button(u8"������ ������� ����������",imgui.ImVec2(230, 20)) then
		printStringNow("It's not working", 2000)
		sampAddChatMessage("[Leader-MVD] {FFFFFF} �������� �� ��������.", 0x4b58ebFF)
		--main1_window_state.v = not main1_window_state.v end
		--if main1_window_state.v then -- ������ � ������ �������� ����� ���������� �������������� ����� ���� v (��� Value)
		--imgui.SetNextWindowSize(imgui.ImVec2(250, 300), imgui.Cond.FirstUseEver) -- ������ ������
		-- �� ��� �������� �������� �� ��������� - ����������� ��������
		-- ��� main_window_state ��������� ������� imgui.Begin, ����� ����� ���� ��������� �������� ���� �������� �� �������
			--imgui.Begin(u8'Leader-MVD | ������ �������| v. 0.3', main1_window_state)
			--imgui.InputText(u8'��� � ������� ����������', vig_n,imgui.ImVec2(200, 30))
		--imgui.End()
	end
	-------------------------------
	if imgui.Button(u8"������� ������",imgui.ImVec2(230, 20)) then
		local _,  playerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
		sampSendChat(string.format("/f ��������! ���� ��������. ���� �������. ����� �����: %d.", playerid))
	lua_thread.create(function() wait(1000)
		sampSendChat(string.format("/su %d 1 ���������, ������ SOS.", playerid))
	end)
	lua_thread.create(function() wait(1000)
		sampSendChat("/f ���� ����. ������� ���������� � ���������. ����� �����.")
	end)
	end
	if imgui.TreeNode(u8'��������� ������') then
		--printStringNow("It's not working", 2000)
		--sampAddChatMessage("[Leader-MVD] {FFFFFF} �������� �� ��������.", 0x4b58ebFF)
		if imgui.InputText(u8'ID', new_id,imgui.ImVec2(200, 30)) then id = new_id end
		if imgui.InputText(u8'� �������', new_frak,imgui.ImVec2(200, 30)) then frak = new_frak end
		imgui.Text(u8" [1] - LSPD/[2] - SFPD/[3] - LVPD/[4] - FBI")
		if imgui.Button(u8'��������� ������') then
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
		imgui.Text(u8'� ����������')
	imgui.TreePop()
	end
	if imgui.TreeNode(u8'��� ����������') then
		imgui.Text(u8"v.0.2:\n - ��������� �������:\n    �������������� ������� ������\n - ������ �������� ������:\n    ���� �������� ������.\n- ��������� /gnews ���:\n    ��/��/����.")
		imgui.Text(u8"v.0.3:\n - ��������� �������:\n    ��������� �������� ������.\n - ���������� ��������� ����.\n - ��������� ������ ��� �������������.")
		imgui.Text(u8"v.0.4:\n - ��������� �������:\n    �������� �����.\n - ���������� ��������� ����.\n - ����������� �������� �� ������.")
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
	sampAddChatMessage("[Leader-MVD] {FFFFFF} ������ �������.{9d00bd} �����: Mateo Penaloza. {4b58eb} | Version: 0.4", 0x4b58ebFF)
	sampAddChatMessage("[Leader-MVD] {FFFFFF} ������ �������� ������ ��� �������. ��������� ������� {4b58eb}/lm{ffffff} ��� �����������.", 0x4b58ebFF)
	sampRegisterChatCommand("lm", lm)
	while true do
    wait(0)
	if st == 1 then
		if wasKeyPressed(key.VK_F2) then -- ��������� �� ������� ������� X
			main_window_state.v = not main_window_state.v -- ����������� ������ ���������� ����, �� �������� ��� .v
		end
	end
    imgui.Process = main_window_state.v	-- ������ �������� imgui.Process ������ ����� ���������� � ����������� �� ���������� ��������� ����
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
end