-- رابط الـ Webhook من Discord
local discordWebhook = "https://discord.com/api/webhooks/1359006187047096360/RuZdowvkGVRbBqWDk4coQYMmLgf-tMpf_eEohQwDyr-TQULaKBjcLTgMdobzflwxEtwj"

-- دالة ترسل الرسالة لـ Discord
function sendMessageToDiscord(player, command, ...)
    local message = table.concat({...}, " ") -- جمع الكلمات
    if message == "" then
        outputChatBox("اكتب رسالة! مثال: /discord مرحبا", player, 255, 0, 0)
        return
    end

    local playerName = getPlayerName(player) -- اسم اللاعب

    -- بيانات الرسالة (استخدام embeds)
    local webhookData = {
        username = "MTA:SA Server", -- اسم البوت في Discord
        embeds = {{
            title = "رسالة من اللاعب",
            description = message,
            color = 3447003, -- لون أزرق
            author = {name = playerName},
            footer = {text = "MTA:SA Discord Bot"},
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ") -- وقت ISO 8601
        }}
    }

    -- إرسال الرسالة باستخدام fetchRemote
    fetchRemote(discordWebhook, {
        method = "POST",
        headers = {["Content-Type"] = "application/json"},
        postData = toJSON(webhookData):sub(2, -2) -- إزالة [] الزائدة من toJSON
    }, function(responseData, responseInfo)
        if responseInfo.success then
            outputChatBox("تم إرسال رسالتك إلى Discord!", player, 0, 255, 0)
        else
            local statusCode = responseInfo.statusCode or "غير معروف"
            outputChatBox("فشل الإرسال! (الكود: " .. statusCode .. ")", player, 255, 0, 0)
            outputServerLog("خطأ Discord - الكود: " .. statusCode .. " - الرد: " .. tostring(responseData))

            if statusCode == 400 then
                outputChatBox("خطأ في البيانات، جاري التحقق...", player, 255, 0, 0)
            elseif statusCode == 401 or statusCode == 404 then
                outputChatBox("رابط الـ Webhook غير صحيح!", player, 255, 0, 0)
            elseif statusCode == 429 then
                outputChatBox("تجاوزت الحد، انتظر قليلاً", player, 255, 0, 0)
            end
        end
    end)
end

-- ربط الأمر /discord
addCommandHandler("discord", sendMessageToDiscord)