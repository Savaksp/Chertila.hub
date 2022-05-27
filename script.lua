local Config = {
    WindowName = "Chertila.hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightBracket,

    JF_AF = false,
    MS_AF = false,
    PP_AF = false,
    
    HASFLY = false,
    WEIGHT = 1,

    Chams_bool = false,
    Chams_color = Color3.new(255,0,0),
    Chams_transp = 0
}

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local win = lib:CreateWindow(Config, game:GetService("CoreGui"))

local Visuals_TAB = win:CreateTab("Visuals")
local Chams_SEC = Visuals_TAB:CreateSection("Chams")
local Chams_TOG = Chams_SEC:CreateToggle("Toggle chams", nil, function()
    Config["Chams_bool"] = not Config["Chams_bool"]
    if Config["Chams_bool"] == true then
        for i,plr in pairs(game:GetService("Players"):GetChildren()) do
            if plr ~= game.Players.LocalPlayer then
                for i,part in pairs(plr.Character:GetChildren()) do
                    if part:IsA("Part") or part:IsA("MeshPart") then
                        local ESP = Instance.new("BoxHandleAdornment")
                        ESP.Name = "ESP"
                        ESP.Parent = part
                        ESP.Adornee = part
                        ESP.AlwaysOnTop = true
                        ESP.Transparency = Config["Chams_transp"]
                        ESP.Color3 = Config["Chams_color"]
                    end
                end
            end
        end
    else
        for i,plr in pairs(game:GetService("Players"):GetChildren()) do
            if plr ~= game.Players.LocalPlayer then
                for i,part in pairs(plr.Character:GetChildren()) do
                    if part:IsA("Part") or part:IsA("MeshPart") then
                        part.ESP:Remove()
                    end
                end
            end
        end
    end
end)
local Chams_SLD = Chams_SEC:CreateSlider("Chams transparency", 0,1,nil,false, function(value)
	if Config["Chams_bool"] == true then
        for i,plr in pairs(game:GetService("Players"):GetChildren()) do
            if plr ~= game.Players.LocalPlayer then
                for i,part in pairs(plr.Character:GetChildren()) do
                    if part:IsA("Part") or part:IsA("MeshPart") then
                        part.ESP.Transparency = value
                        Config["Chams_transp"] = value
                    end
                end
            end
        end
    else    
        Config["Chams_transp"] = value
    end
end)
local Chams_COL = Chams_SEC:CreateColorpicker("Chams color", function(value)
	if Config["Chams_bool"] == true then
        for i,plr in pairs(game:GetService("Players"):GetChildren()) do
            if plr ~= game.Players.LocalPlayer then
                for i,part in pairs(plr.Character:GetChildren()) do
                    if part:IsA("Part") or part:IsA("MeshPart") then
                        part.ESP.Color3 = value
                        Config["Chams_color"] = value
                    end
                end
            end
        end
    else    
        Config["Chams_color"] = value
    end
end)
