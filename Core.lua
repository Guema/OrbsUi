-- Creating addon object
OrbsUi = LibStub("AceAddon-3.0"):NewAddon("OrbsUi", "AceConsole-3.0")

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

OrbsUi:RegisterChatCommand("OrbsUi test", "TestFunc")

function OrbsUi:TestFunc(input)
    OrbsUi:Print("Tested!")
end