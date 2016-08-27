-- Creating addon object
OrbsUi = LibStub("AceAddon-3.0"):NewAddon("OrbsUi", "AceConsole-3.0", "AceGUI-3.0")

function OrbsUi:OnInitialize()
    -- Called when loaded for the first time
    OrbsUi:Print("Hello, world!")
end

function OrbsUi:OnEnable()
    -- Called when the addon is enabled
    OrbsUi:Print("Hey, Wazzup?")
end

function OrbsUi:OnDisable()
    -- Called wne the addon is disabled
    OrbsUi:Print("Good bye, world!")
end


--[[
OrbsUi:RegisterChatCommand("OrbsUi", "TestFunc")

function OrbsUi:TestFunc(input)
    OrbsUi:Print("Tested!")
end
]]

local options = {
    name = "OrbsUi",
    handler = OrbsUi,
    type = 'group',
    args = {
        msg = {
            type = 'input',
            name = 'My Message',
            desc = 'The message for my addon',
            set = 'SetMyMessage',
            get = 'GetMyMessage',
        },
    },
}

function OrbsUi:GetMyMessage(info)
    return myMessageVar
end

function OrbsUi:SetMyMessage(info, input)
    myMessageVar = input
end

LibStub("AceConfig-3.0"):RegisterOptionsTable("OrbsUi", options, {"OrbsUi"})

-- Create a container frame
local f = OrbsUi:Create("Frame")
f:SetCallback("OnClose",function(widget) OrbsUi:Release(widget) end)
f:SetTitle("AceGUI-3.0 Example")
f:SetStatusText("Status Bar")
f:SetLayout("Flow")
-- Create a button
local btn = OrbsUi:Create("Button")
btn:SetWidth(170)
btn:SetText("Button !")
btn:SetCallback("OnClick", function() print("Click!") end)
-- Add the button to the container
f:AddChild(btn)