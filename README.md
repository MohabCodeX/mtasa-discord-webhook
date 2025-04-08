# MTA:SA Discord Integration Resource

**[للعربية اضغط هنا ↓](#نظام-ربط-mtasa-مع-ديسكورد)**

## Overview

This resource allows players on your MTA:SA server to send messages directly to a Discord channel using a webhook integration. Players can use a simple in-game command to communicate with your Discord community.

## Features

- Send in-game messages to Discord using the `/discord` command
- Messages appear in Discord with proper formatting (embeds)
- Player names are included with each message
- Comprehensive error handling and feedback
- Arabic language support

## Installation

### Requirements

- MTA:SA Server (version 1.5.4-9.11342 or higher)
- A Discord server with webhook creation permissions

### Setup Steps

1. **Create a Discord Webhook**:

   - Go to your Discord server
   - Select a channel → Edit Channel → Integrations → Webhooks
   - Click "New Webhook", give it a name, and copy the webhook URL

2. **Configure the Script**:

   - Open `discord.lua`
   - Replace the webhook URL on line 2 with your own webhook URL:
     ```lua
     local discordWebhook = "YOUR_WEBHOOK_URL_HERE"
     ```

3. **Configure ACL Permissions**:

   - Edit your server's ACL file (`acl.xml`)
   - Find your resource group or admin group
   - Add the following permission to allow fetchRemote:
     ```xml
     <right name="function.fetchRemote" access="true" />
     ```
   - Restart your server or reload ACL for changes to take effect

4. **Verify MTA:SA Version**:

   - This script requires MTA:SA Server version 1.5.4-9.11342 or higher due to the fetchRemote function options
   - The meta.xml already includes this requirement with:
     ```xml
     <min_mta_version server="1.5.4-9.11342" />
     ```
   - Ensure your server meets this minimum version requirement

5. **Install the Resource**:
   - Place the entire `discord` folder in your server's resources directory
   - Add `<resource src="discord" startup="1" />` to your `mtaserver.conf` or start it via the admin panel

## Usage

Players can send messages to Discord using the command:

```
/discord [message]
```

Example:

```
/discord مرحبا بالجميع من السيرفر!
```

## Troubleshooting

### Error Codes

- **400**: Problem with the message format or webhook configuration
- **401/404**: Invalid webhook URL
- **429**: Rate limit exceeded (too many messages sent in a short time)

### Common Issues

- If messages aren't appearing in Discord, verify your webhook URL is correct
- Ensure your server has internet access and can reach Discord's API
- Check server console for detailed error logs

## Customization

You can customize the appearance of messages by modifying the `webhookData` table in `discord.lua`:

- Change the bot username
- Modify the embed color (current: blue/3447003)
- Add or remove fields in the embed

## License

Feel free to use and modify this resource for your MTA:SA server.

## Credits

Created for MTA:SA servers with ❤️

---

أكيد! هنا نسخة محسّنة باللغة العربية بطابع أخف وأقرب لأسلوب المبرمجين، بدون الصرامة الزائدة للفصحى، مع الحفاظ على الاحترافية والوضوح:

---

# نظام ربط MTA:SA مع ديسكورد

## نظرة سريعة

هالمورد يتيح للاعبين على سيرفر MTA:SA إنهم يرسلوا رسائل مباشرة لقناة في ديسكورد باستخدام Webhook. ببساطة، أي لاعب يقدر يستخدم أمر داخل اللعبة للتواصل مع سيرفر ديسكورد.

## المميزات

- إرسال رسائل من داخل اللعبة مباشرة إلى ديسكورد عن طريق الأمر `/discord`
- الرسائل تطلع بتنسيق مرتب داخل ديسكورد
- يظهر اسم اللاعب مع كل رسالة
- معالجة الأخطاء بشكل جيد
- يدعم اللغة العربية

## التثبيت

### المتطلبات

- سيرفر MTA:SA (يفضل نسخة 1.5.4-9.11342 أو أحدث)
- سيرفر ديسكورد فيه صلاحيات لإنشاء Webhook

### خطوات الإعداد

1. **سوِّ Webhook في ديسكورد**:

   - ادخل على إعدادات القناة اللي تبي توصلها الرسائل
   - روح لـ "تعديل القناة" → "التكاملات" → "Webhooks"
   - اضغط على "Webhook جديد"، سمّه، وانسخ الرابط

2. **ضبط السكربت**:

   - افتح ملف `s_discord.lua`
   - غير رابط الـ webhook في السطر 2 إلى الرابط اللي نسخته:
     ```lua
     local discordWebhook = "رابط_webhook_الخاص_فيك"
     ```

3. **تعديل صلاحيات ACL**:

   - افتح ملف `acl.xml` الخاص بالسيرفر
   - دور على مجموعة السكربت أو مجموعة الأدمنز
   - أضف هالصلاحية عشان تفعل `fetchRemote`:
     ```xml
     <right name="function.fetchRemote" access="true" />
     ```
   - بعد التعديل، أعد تشغيل السيرفر أو أعد تحميل ACL

4. **التأكد من نسخة MTA:SA**:

   - هذا السكربت يتطلب سيرفر MTA:SA نسخة 1.5.4-9.11342 أو أحدث بسبب استخدام خيارات دالة fetchRemote
   - الملف meta.xml يتضمن بالفعل هذا المتطلب من خلال:
     ```xml
     <min_mta_version server="1.5.4-9.11342" />
     ```
   - تأكد أن سيرفرك يلبي هذا المتطلب من الإصدار

5. **تثبيت السكربت**:
   - انسخ مجلد `discord` إلى مجلد الموارد بالسيرفر
   - أضف هذا السطر لملف `mtaserver.conf`:
     ```xml
     <resource src="discord" startup="1" />
     ```
   - أو شغله من لوحة الإدارة

## طريقة الاستخدام

أي لاعب يقدر يرسل رسالة للديسكورد باستخدام الأمر:

```
/discord [الرسالة]
```

مثال:

```
/discord مرحباً بالجميع من داخل السيرفر!
```

## مشاكل شائعة وحلول

- **400**: احتمال تنسيق الرسالة فيه مشكلة أو إعداد الـ webhook مو مضبوط
- **401 أو 404**: رابط الـ webhook غلط أو مو موجود
- **429**: تم إرسال عدد كبير من الرسائل في وقت قصير (سبام)

---
