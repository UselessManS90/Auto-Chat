-- Auto Chat Script
-- Version 2.4
-- Script By Patriot & Validaron

-- Imports
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Variables
local chatToggle = false
local roastReply = {
  "Sorry, I didn't mean to offend you."
  "I'm not sure what you mean by that."
  "Can you explain why you said that?"
}
local roastReplyChance = 50 -- Chance in percentage that the script will roast back

-- Functions
function ReplyBack()
  if chatToggle then
    local player = Players.LocalPlayer
    local message = UserInputService.InputBegan:Wait():GetText()
    player:Chat(message)
  end
end

function AntiRoast()
  if chatToggle then
    local player = Players.LocalPlayer
    local message = UserInputService.InputBegan:Wait():GetText()
    for i, v in pairs(roastReply) do
      if string.find(message, v) then
        local randomChance = math.random(100)
        if randomChance <= roastReplyChance then
          player:Chat(v)
        else
          player:Chat("Sorry, but I don't think that's very nice.")
        end
        break
      end
    end
  end
end

-- Events
UserInputService.InputBegan:Connect(ReplyBack)
UserInputService.InputBegan:Connect(AntiRoast)

-- Toggle
function ToggleChat()
  chatToggle = not chatToggle
end

-- Binds
local chatButton = Players.LocalPlayer.PlayerGui.MainGui.ChatButton
chatButton.MouseButton1Click:Connect(ToggleChat)
