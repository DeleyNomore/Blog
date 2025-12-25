---
title: "Telegram Bot API 中文翻译文档 - 官方文档完全版"
date: 2025-12-26T07:00:00+08:00
publishDate: 2025-12-26T07:00:00+08:00
draft: false
categories: ["Docs", "Telegram"]
tags: ["Telegram", "Bot", "API", "翻译", "官方文档", "机器人开发", "HTTP 接口"]
slug: "telegram-bot-api-zh-cn-translation"
description: "Telegram Bot API 官方文档的完整中文翻译版本。包含所有可用方法、类型、更新和 API 使用的详细说明，适合中文开发者学习和参考。"
---

# Telegram Bot API
> **Telegram 机器人 API**

> Bot API 是一个基于 HTTP 的接口，专为热衷于为 Telegram 开发机器人的开发者而设计。要了解如何创建和设置机器人，请参阅我们的[**机器人简介**](https://core.telegram.org/bots)和[**机器人常见问题解答**](https://core.telegram.org/bots/faq) 。

### 近期更新

> 订阅 [@BotNews](https://t.me/botnews) 以第一时间了解最新动态，并加入 [@BotTalk](https://t.me/bottalk) 参与讨论。

#### 2025 年 8 月 15 日

**Bot API 9.2**

**清单**

* 在类 [ReplyParameters](#replyparameters) 中新增了字段 *checklist_task_id*，允许机器人回复特定的清单任务。
* 为 [Message](#message) 类添加了 *reply_to_checklist_task_id* 字段。

**礼物**

* 为 [Gift](#gift) 和 [UniqueGift](#uniquegift) 类添加了 *publisher_chat* 字段，可用于获取发布礼物的聊天信息。

**频道中的私信**

* 在 [Chat](#chat) 和 [ChatFullInfo](#chatfullinfo) 类中新增了 *is_direct_messages* 字段，可用于识别用作频道私信聊天的超级群组。
* 在 [ChatFullInfo](#chatfullinfo) 类中新增了 *parent_chat* 字段，用于指示频道私信聊天的父级频道聊天。
* 新增了 [DirectMessagesTopic](#directmessagestopic) 类，并在 [Message](#message) 类中新增了 *direct_messages_topic* 字段，用于描述私信聊天的主题。
* 在 [sendMessage](#sendmessage)、[sendPhoto](#sendphoto)、[sendVideo](#sendvideo)、[sendAnimation](#sendanimation)、[sendAudio](#sendaudio)、[sendDocument](#senddocument)、[sendPaidMedia](#sendpaidmedia)、[sendSticker](#sendsticker)、[sendVideoNote](#sendvideonote)、[sendVoice](#sendvoice)、[sendLocation](#sendlocation)、[sendVenue](#sendvenue)、[sendContact](#sendcontact)、[sendDice](#senddice)、[sendInvoice](#sendinvoice)、[sendMediaGroup](#sendmediagroup)、[copyMessage](#copymessage)、[copyMessages](#copymessages)、[forwardMessage](#forwardmessage) 和 [forwardMessages](#forwardmessages) 方法中新增了 *direct_messages_topic_id* 参数。该参数可用于向私信聊天主题发送消息。

**推荐帖子**

* 向方法 [sendMessage](#sendmessage)、[sendPhoto](#sendphoto)、[sendVideo](#sendvideo)、[sendAnimation](#sendanimation)、[sendAudio](#sendaudio)、[sendDocument](#senddocument)、[sendPaidMedia](#sendpaidmedia)、[sendSticker](#sendsticker)、[sendVideoNote](#sendvideonote)、[sendVoice](#sendvoice)、[sendLocation](#sendlocation)、[sendVenue](#sendvenue)、[sendContact](#sendcontact)、[sendDice](#senddice)、[sendInvoice](#sendinvoice)、[copyMessage](#copymessage)、[forwardMessage](#forwardmessage) 添加了类 [SuggestedPostParameters](#suggestedpostparameters) 和参数 *suggested_post_parameters*。此参数可用于向私信聊天主题发送推荐帖子。
* 添加了方法 [approveSuggestedPost](#approvesuggestedpost)，允许机器人批准传入的推荐帖子。
* 添加了方法 [declineSuggestedPost](#declinesuggestedpost)，允许机器人拒绝传入的推荐帖子。
* 为类 [ChatMemberAdministrator](#chatmemberadministrator) 和 [ChatAdministratorRights](#chatadministratorrights) 新增了字段 *can_manage_direct_messages*。
* 为方法 [promoteChatMember](#promotechatmember) 新增了参数 *can_manage_direct_messages*。
* 为类 [Message](#message) 新增了字段 *is_paid_post*，该字段可用于识别付费帖子。此类帖子在 24 小时内不得删除，以便接收付款。
* 新增了类 [SuggestedPostPrice](#suggestedpostprice)，用于描述推荐帖子的价格。
* 在类 [Message](#message) 中添加了类 [SuggestedPostInfo](#suggestedpostinfo) 和字段 *suggested_post_info*，用于描述一条建议发布的帖子。
* 在类 [Message](#message) 中添加了类 [SuggestedPostApproved](#suggestedpostapproved) 和字段 *suggested_post_approved*，用于描述一条关于建议发布的帖子已获批准的服务消息。
* 在类 [Message](#message) 中添加了类 [SuggestedPostApprovalFailed](#suggestedpostapprovalfailed) 和字段 *suggested_post_approval_failed*，用于描述一条关于建议发布的帖子审批失败的服务消息。
* 在类 [Message](#message) 中添加了类 [SuggestedPostDeclined](#suggestedpostdeclined) 和字段 *suggested_post_declined*，用于描述一条关于建议发布的帖子被拒绝的服务消息。
* 在类 [Message](#message) 中添加了类 [SuggestedPostPaid](#suggestedpostpaid) 和字段 *suggested_post_paid*，用于描述关于推荐帖子支付成功的服务消息。
* 在类 [Message](#message) 中添加了类 [SuggestedPostRefunded](#suggestedpostrefunded) 和字段 *suggested_post_refunded*，用于描述关于推荐帖子支付退款的服务消息。

#### 2025 年 7 月 3 日

**Bot API 9.1**

**清单**

* 添加了表示清单中任务的类 [ChecklistTask](#checklisttask)。
* 添加了表示清单的类 [Checklist](#checklist)。
* 添加了表示要添加到清单中的任务的类 [InputChecklistTask](#inputchecklisttask)。
* 新增了表示待创建清单的类 [InputChecklist](#inputchecklist)。
* 在类 [Message](#message) 和 [ExternalReplyInfo](#externalreplyinfo) 中新增了字段 *checklist*，用于描述消息中的清单。
* 新增了类 [ChecklistTasksDone](#checklisttasksdone)，并在类 [Message](#message) 中新增了字段 *checklist_tasks_done*，用于描述清单中任务状态变更（即标记为已完成/未完成）的服务消息。
* 新增了类 [ChecklistTasksAdded](#checklisttasksadded)，并在类 [Message](#message) 中新增了字段 *checklist_tasks_added*，用于描述向清单添加新任务的服务消息。
* 新增了方法 [sendChecklist](#sendchecklist)，允许机器人代表企业账户发送核对清单。
* 新增了方法 [editMessageChecklist](#editmessagechecklist)，允许机器人代表企业账户编辑核对清单。

**礼物**

* 在类 [OwnedGiftUnique](#ownedgiftunique) 和 [UniqueGiftInfo](#uniquegiftinfo) 中新增了字段 *next_transfer_date*。
* 在类 [UniqueGiftInfo](#uniquegiftinfo) 中新增了字段 *last_resale_star_count*。
* 在类 [UniqueGiftInfo](#uniquegiftinfo) 中，为字段 *origin* 新增了“resale”作为可能的取值。

**通用**

* 将投票中的最大选项数量增加至 12 个。
* 新增了 [getMyStarBalance](#getmystarbalance) 方法，允许机器人获取其当前的 Telegram Stars 余额。
* 新增了 [DirectMessagePriceChanged](#directmessagepricechanged) 类，并在 [Message](#message) 类中添加了 *direct_message_price_changed* 字段，用于描述关于发送到频道聊天的私信价格变更的服务消息。
* 在 [WebApp](https://core.telegram.org/bots/webapps#initializing-mini-apps) 类中新增了 *hideKeyboard* 方法。

#### 2025 年 4 月 11 日

**Bot API 9.0**

**企业账户**

* 新增了类 [BusinessBotRights](#businessbotrights)，并在类 [BusinessConnection](#businessconnection) 中将字段 *can_reply* 替换为类型为 [BusinessBotRights](#businessbotrights) 的字段 *rights*。
* 新增了方法 [readBusinessMessage](#readbusinessmessage)，允许机器人代表企业账户将收到的消息标记为已读。
* 新增了 [deleteBusinessMessages](#deletebusinessmessages) 方法，允许机器人代表企业账户删除消息。
* 新增了 [setBusinessAccountName](#setbusinessaccountname) 方法，允许机器人修改托管企业账户的姓名。
* 新增了 [setBusinessAccountUsername](#setbusinessaccountusername) 方法，允许机器人修改托管企业账户的用户名。
* 新增了 [setBusinessAccountBio](#setbusinessaccountbio) 方法，允许机器人修改托管企业账户的个人简介。
* 新增了类 [InputProfilePhoto](#inputprofilephoto)，用于描述待设置的个人资料照片。
* 新增了方法 [setBusinessAccountProfilePhoto](#setbusinessaccountprofilephoto) 和 [removeBusinessAccountProfilePhoto](#removebusinessaccountprofilephoto)，允许机器人修改托管企业账户的个人资料照片。
* 新增了方法 [setBusinessAccountGiftSettings](#setbusinessaccountgiftsettings)，允许机器人修改托管企业账户中关于接收礼物的隐私设置。
* 新增了类 [StarAmount](#staramount) 和方法 [getBusinessAccountStarBalance](#getbusinessaccountstarbalance)，允许机器人查询托管企业账户当前的 Telegram Star 余额。
* 新增了 [transferBusinessAccountStars](#transferbusinessaccountstars) 方法，允许机器人将托管企业账户余额中的 Telegram Stars 转入自身账户以便提现。
* 新增了 [OwnedGiftRegular](#ownedgiftregular)、[OwnedGiftUnique](#ownedgiftunique)、[OwnedGifts](#ownedgifts) 类以及 [getBusinessAccountGifts](#getbusinessaccountgifts) 方法，允许机器人获取托管企业账户所拥有的礼物列表。
* 新增了 [convertGiftToStars](#convertgifttostars) 方法，允许机器人将托管企业账户收到的礼物转换为 Telegram Stars。
* 新增了 [upgradeGift](#upgradegift) 方法，允许机器人将托管企业账户收到的普通礼物升级为专属礼物。
* 新增了 [transferGift](#transfergift) 方法，允许机器人转移托管企业账户所拥有的专属礼物。
* 新增了 [InputStoryContentPhoto](#inputstorycontentphoto) 和 [InputStoryContentVideo](#inputstorycontentvideo) 类，用于表示待发布故事的图文内容。
* 新增了 [StoryArea](#storyarea)、[StoryAreaPosition](#storyareaposition)、[LocationAddress](#locationaddress)、[StoryAreaTypeLocation](#storyareatypelocation)、[StoryAreaTypeSuggestedReaction](#storyareatypesuggestedreaction)、[StoryAreaTypeLink](#storyareatypelink)、[StoryAreaTypeWeather](#storyareatypeweather) 和 [StoryAreaTypeUniqueGift](#storyareatypeuniquegift) 类，用于描述故事中可点击的互动区域。
* 新增了 [postStory](#poststory) 方法，允许机器人代表托管企业账户发布故事。
* 新增了 [editStory](#editstory) 方法，允许机器人编辑其先前代表托管企业账户发布的故事。
* 新增了 [deleteStory](#deletestory) 方法，允许机器人删除其先前代表托管企业账户发布的故事。

**小程序**

* 新增了 [DeviceStorage](https://core.telegram.org/bots/webapps#devicestorage) 字段，允许小程序在用户设备上使用持久性本地存储。
* 新增了字段 [SecureStorage](https://core.telegram.org/bots/webapps#securestorage)，允许小程序在用户设备上使用安全的本地存储来保存敏感数据。

**礼物**

* 新增了类 [UniqueGiftModel](#uniquegiftmodel)、[UniqueGiftSymbol](#uniquegiftsymbol)、[UniqueGiftBackdropColors](#uniquegiftbackdropcolors) 和 [UniqueGiftBackdrop](#uniquegiftbackdrop)，用于描述独特礼物的属性。
* 新增了类 [UniqueGift](#uniquegift)，用于描述已升级为独特礼物的礼物。
* 新增了类 [AcceptedGiftTypes](#acceptedgifttypes)，用于描述用户或聊天可接受的礼物类型。
* 在类 [ChatFullInfo](#chatfullinfo) 中，将字段 *can_send_gift* 替换为类型为 [AcceptedGiftTypes](#acceptedgifttypes) 的字段 *accepted_gift_types*。
* 新增了类 [GiftInfo](#giftinfo) 并将其字段 *gift* 添加至类 [Message](#message)，用于描述发送或接收常规礼物的服务消息。
* 新增了类 [UniqueGiftInfo](#uniquegiftinfo) 并将其字段 *unique_gift* 添加至类 [Message](#message)，用于描述发送或接收独特礼物的服务消息。

**Telegram Premium**

* 新增了 [giftPremiumSubscription](#giftpremiumsubscription) 方法，允许机器人赠送用户以 Telegram Stars 支付的 Telegram Premium 订阅。
* 在 [TransactionPartnerUser](#transactionpartneruser) 类中新增了 *premium_subscription_duration* 字段，用于处理由机器人购买的 Telegram Premium 订阅相关交易。
* 在 [TransactionPartnerUser](#transactionpartneruser) 类中新增了 *transaction_type* 字段，简化了所有交易类型的区分与处理流程。

**通用**

* 已将付费媒体的最高价格提高至 10000 Telegram Stars。
* 已将订阅周期的最高价格提高至 10000 Telegram Stars。
* 在类 [Message](#message) 中新增了类 [PaidMessagePriceChanged](#paidmessagepricechanged) 以及字段 *paid_message_price_changed*，用于描述发送至聊天室的付费消息价格变更的服务通知。
* 为 [Message](#message) 类添加了 *paid_star_count* 字段，其中包含为发送该消息而支付的 [Telegram Stars](https://telegram.org/blog/telegram-stars) 数量。

**[查看之前的更改 »](https://core.telegram.org/bots/api-changelog)**

### 授权你的机器人

每个机器人在[创建时](https://core.telegram.org/bots/features#botfather)都会获得一个唯一的认证令牌。令牌看起来像 `123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11` 这样，但在本文档中我们将简单地使用 **<token>**。你可以在[这份文档](https://core.telegram.org/bots/features#botfather)中了解如何获取令牌以及生成新令牌。

### 发起请求

所有对 Telegram Bot API 的查询都必须通过 HTTPS 进行，并且需要以这种形式呈现： `https://api.telegram.org/bot<token>/METHOD_NAME` 。例如：

```
https://api.telegram.org/bot123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11/getMe
```

我们支持 **GET** 和 **POST** HTTP 方法。在 Bot API 请求中，我们支持四种传递参数的方式：

* [URL 查询字符串](https://en.wikipedia.org/wiki/Query_string)
* application/x-www-form-urlencoded
* application/json（除上传文件外）
* multipart/form-data（用于上传文件）

响应包含一个 JSON 对象，该对象始终包含一个布尔字段'ok'，并可能包含一个可选的字符串字段'description'，用于提供人类可读的结果描述。如果'ok'等于 *True*，则表示请求成功，查询结果可在'result'字段中找到。如果请求不成功，'ok'等于 false，错误信息将在'description'中说明。同时还会返回一个整数类型的'error_code'字段，但其内容未来可能会发生变化。某些错误还可能包含一个可选的'parameters'字段，其类型为 [ResponseParameters](#responseparameters)，这有助于自动处理错误。

* Bot API 中的所有方法均不区分大小写。
* 所有查询必须使用 UTF-8 编码进行。

#### 在获取更新时发起请求

如果你正在使用 [**Webhook**](#getting-updates)，可以在向 Webhook 发送应答的同时向 Bot API 发起请求。使用 *application/json*、*application/x-www-form-urlencoded* 或 *multipart/form-data* 响应内容类型来传递参数。在请求的 *method* 参数中指定要调用的方法。无法得知此类请求是否成功或获取其结果。

> 请参阅我们的[常见问题解答](https://core.telegram.org/bots/faq#how-can-i-make-requests-in-response-to-updates)以获取示例。

### 使用本地机器人 API 服务器

机器人 API 服务器的源代码可在 [telegram-bot-api](https://github.com/tdlib/telegram-bot-api) 获取。您可以在本地运行它，并将请求发送到您自己的服务器，而不是 `https://api.telegram.org`。如果您切换到本地机器人 API 服务器，您的机器人将能够：

* 无大小限制地下载文件。
* 上传文件大小最高可达 2000 MB。
* 使用本地路径和[文件 URI 方案](https://en.wikipedia.org/wiki/File_URI_scheme)上传文件。
* 为 Webhook 使用 HTTP URL。
* 为 Webhook 使用任何本地 IP 地址。
* 为 Webhook 使用任意端口。
* 将 *max_webhook_connections* 设置为最高 100000。
* 在 [getFile](#getfile) 请求后，无需下载文件即可接收绝对本地路径作为 *file_path* 字段的值。

#### 我需要本地 Bot API 服务器吗？

大多数机器人使用默认配置并在我们的服务器上运行即可正常工作。但如果您觉得需要用到[这些功能](#using-a-local-bot-api-server) ，随时欢迎切换到您自己的配置。

### 获取更新

接收机器人更新有两种互斥的方式：一种是使用 [getUpdates](#getupdates) 方法，另一种是设置 [webhooks](#setwebhook)。无论采用哪种方式，服务器都会暂存传入的更新直到机器人接收，但保存时间不会超过 24 小时。

无论选择哪种方式，您最终都会收到 JSON 序列化的 [Update](#update) 对象。

#### Update
> **更新对象**

此[对象](#available-types)表示一个传入的更新。在任何给定的更新中，最多只能出现**一个**可选参数。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| update_id | Integer | 更新的唯一标识符。更新标识符从某个正数开始，并按顺序递增。如果您使用 webhooks，这个标识符会特别有用，因为它允许您忽略重复的更新，或者在更新顺序错乱时恢复正确的更新顺序。如果至少一周没有新的更新，那么下一个更新的标识符将被随机选择，而不是按顺序递增。 |
| message | [Message](#message) | *可选*。任何类型的新消息 - 文本、照片、贴纸等。 |
| edited_message | [Message](#message) | *可选*。机器人已知消息的新版本，该消息已被编辑。此更新有时可能由消息字段的更改触发，这些字段要么不可用，要么未被您的机器人主动使用。 |
| channel_post | [Message](#message) | *可选*。任何类型的新频道帖子 - 文本、照片、贴纸等。 |
| edited_channel_post | [Message](#message) | *可选*。已知机器人且已编辑的频道帖子的新版本。此更新有时可能由消息字段的更改触发，这些字段要么不可用，要么未被您的机器人主动使用。 |
| business_connection | [BusinessConnection](#businessconnection) | *可选*。机器人连接到或断开与企业账户的连接，或用户编辑了与机器人的现有连接 |
| business_message | [Message](#message) | *可选*。来自关联企业账户的新消息 |
| edited_business_message | [Message](#message) | *可选*。来自关联企业账户的新版本消息 |
| deleted_business_messages | [BusinessMessagesDeleted](#businessmessagesdeleted) | *可选*。关联企业账户中的消息已被删除 |
| message_reaction | [MessageReactionUpdated](#messagereactionupdated) | *可选*。用户更改了对消息的反应。机器人必须是聊天中的管理员，并且必须在 allowed_updates 列表中明确指定 "message_reaction" 才能接收这些更新。对于由机器人设置的反应，不会收到此更新。 |
| message_reaction_count | [MessageReactionCountUpdated](#messagereactioncountupdated) | *可选*。对一条带有匿名反应的消息的反应已更改。机器人必须是聊天中的管理员，并且必须在 allowed_updates 列表中明确指定 "message_reaction_count" 才能接收这些更新。更新会被分组，并可能延迟几分钟发送。 |
| inline_query | [InlineQuery](#inlinequery) | *可选*。新收到的内联查询 |
| chosen_inline_result | [ChosenInlineResult](#choseninlineresult) | *可选*。用户选择并发送给其聊天伙伴的内联查询结果。请参阅我们关于反馈收集的文档，了解如何为您的机器人启用这些更新。 |
| callback_query | [CallbackQuery](#callbackquery) | *可选*。新的回调查询 |
| shipping_query | [ShippingQuery](#shippingquery) | *可选*。新的运费查询请求。仅适用于价格可变的发票 |
| pre_checkout_query | [PreCheckoutQuery](#precheckoutquery) | *可选*。新的预结账查询。包含结账的完整信息 |
| purchased_paid_media | [PaidMediaPurchased](#paidmediapurchased) | *可选*。用户购买了付费媒体，其中包含机器人在非频道聊天中发送的非空有效载荷 |
| poll | [Poll](#poll) | *可选*。新的投票状态。机器人仅接收关于手动停止的投票以及由机器人发送的投票的更新 |
| poll_answer | [PollAnswer](#pollanswer) | *可选*。用户在非匿名投票中更改了答案。机器人仅能接收由机器人自身发起的投票中的新投票。 |
| my_chat_member | [ChatMemberUpdated](#chatmemberupdated) | *可选*。机器人在聊天中的成员状态已更新。对于私聊，仅当用户屏蔽或取消屏蔽机器人时才会收到此更新。 |
| chat_member | [ChatMemberUpdated](#chatmemberupdated) | *可选*。聊天成员在聊天中的状态已更新。机器人必须是该聊天的管理员，并且必须在 allowed_updates 列表中明确指定 "chat_member" 才能接收这些更新。 |
| chat_join_request | [ChatJoinRequest](#chatjoinrequest) | *可选*。已发送加入聊天请求。机器人必须拥有聊天中的 can_invite_users 管理员权限才能接收这些更新。 |
| chat_boost | [ChatBoostUpdated](#chatboostupdated) | *可选*。聊天助力已添加或更改。机器人必须是聊天中的管理员才能接收这些更新。 |
| removed_chat_boost | [ChatBoostRemoved](#chatboostremoved) | *可选*。聊天中的助力被移除。机器人必须是聊天中的管理员才能接收这些更新。 |

#### getUpdates
> **获取更新**

使用此方法通过长轮询（[wiki](https://en.wikipedia.org/wiki/Push_technology#Long_polling)）接收传入的更新。返回一个 [Update](#update) 对象数组。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| offset | Integer | 否 | 要返回的第一个更新的标识符。必须比之前收到的更新标识符中的最高值大一。默认情况下，返回从最早未确认的更新开始的更新。一旦调用 getUpdates 时使用的 *offset* 高于其 *update_id*，该更新即被视为已确认。可以指定负的 *offset* 来从更新队列末尾的 -*offset* 更新开始检索。所有之前的更新将被遗忘。 |
| limit | Integer | 否 | 限制要检索的更新数量。接受 1-100 之间的值。默认为 100。 |
| timeout | Integer | 否 | 长轮询的超时时间（秒）。默认为 0，即常规短轮询。应为正数，短轮询仅用于测试目的。 |
| allowed_updates | Array of String | 否 | 一个 JSON 序列化的列表，包含您希望机器人接收的更新类型。例如，指定 ["message", "edited_channel_post", "callback_query"] 以仅接收这些类型的更新。有关可用更新类型的完整列表，请参阅 [Update](#update)。指定一个空列表以接收除 *chat_member*、*message_reaction* 和 *message_reaction_count* 之外的所有更新类型（默认）。如果未指定，将使用之前的设置。请注意，此参数不会影响在调用 getUpdates 之前创建的更新，因此短时间内可能会收到不需要的更新。 |

> **注意** **1.** 如果设置了传出 Webhook，此方法将不起作用。 **2.** 为避免收到重复更新，请在每次服务器响应后重新计算 *offset*。

#### setWebhook
> **设置网络回调 (Webhook)**

使用此方法可指定一个 URL，并通过外发 webhook 接收传入的更新。每当机器人有更新时，我们将向指定 URL 发送一个 HTTPS POST 请求，其中包含一个 JSON 序列化的 [Update](#update) 对象。如果请求失败（即响应 [HTTP 状态码](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)不是 `2XY`），我们将重试该请求，并在合理次数的尝试后放弃。成功时返回 *True*。

如果您想确认 webhook 是由您设置的，可以在参数 *secret_token* 中指定密钥数据。如果指定了该参数，请求将包含一个名为“X-Telegram-Bot-Api-Secret-Token”的请求头，其内容即为该密钥。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| url | String | 是 | 用于发送更新的 HTTPS URL。使用空字符串可移除 Webhook 集成 |
| certificate | [InputFile](#inputfile) | 否 | 上传您的公钥证书，以便检查正在使用的根证书。详情请参阅我们的 [自签名指南](https://core.telegram.org/bots/self-signed)。 |
| ip_address | String | 否 | 将用于发送 Webhook 请求的固定 IP 地址，而非通过 DNS 解析获得的 IP 地址 |
| max_connections | Integer | 否 | 允许同时向 Webhook 发送更新的 HTTPS 连接的最大数量，范围为 1-100。默认值为 *40*。使用较低的值可以限制机器人服务器的负载，使用较高的值可以增加机器人的吞吐量。 |
| allowed_updates | Array of String | 否 | 一个 JSON 序列化的列表，包含你希望机器人接收的更新类型。例如，指定 ["message", "edited_channel_post", "callback_query"] 以仅接收这些类型的更新。有关可用更新类型的完整列表，请参阅 [Update](#update)。指定一个空列表以接收除 *chat_member*、*message_reaction* 和 *message_reaction_count* 之外的所有更新类型（默认）。如果未指定，将使用之前的设置。请注意，此参数不会影响在调用 setWebhook 之前创建的更新，因此在短时间内可能会收到不需要的更新。 |
| drop_pending_updates | Boolean | 否 | 传递 *True* 以丢弃所有待处理的更新 |
| secret_token | String | 否 | 一个秘密令牌，将在每个 Webhook 请求中通过请求头“X-Telegram-Bot-Api-Secret-Token”发送，长度为 1-256 个字符。仅允许使用字符 `A-Z`、`a-z`、`0-9`、`_` 和 `-`。该请求头有助于确保请求来自您设置的 Webhook。 |

> **注意事项** **1.** 只要设置了外发 Webhook，您将无法通过 [getUpdates](#getupdates) 接收更新。 **2.** 若要使用自签名证书，您需要通过 *certificate* 参数上传您的 [公钥证书](https://core.telegram.org/bots/self-signed) 。请以 [InputFile](#inputfile) 形式上传，发送字符串将无效。 **3.** 当前*Webhook*支持的端口：**443、80、88、8443**。
> 
> 如果您在设置 Webhook 时遇到任何问题，请查阅这份 [Webhook 超全指南](https://core.telegram.org/bots/webhooks) 。

#### deleteWebhook
> **删除网络回调 (Webhook)**

如果您决定切换回 [getUpdates](#getupdates)，请使用此方法来移除 webhook 集成。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| drop_pending_updates | Boolean | 否 | 传递 *True* 以丢弃所有待处理的更新 |

#### getWebhookInfo
> **获取 Webhook 信息**

使用此方法获取当前 webhook 状态。无需参数。成功时，返回一个 [WebhookInfo](#webhookinfo) 对象。如果机器人正在使用 [getUpdates](#getupdates)，将返回一个 *url* 字段为空的对象。

#### WebhookInfo
> **Webhook 信息对象**

描述 Webhook 的当前状态。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| url | String | Webhook URL，如果未设置 Webhook 则可能为空 |
| has_custom_certificate | Boolean | *True*，如果为 Webhook 证书检查提供了自定义证书 |
| pending_update_count | Integer | 等待交付的更新数量 |
| ip_address | String | *可选*。当前使用的 Webhook IP 地址 |
| last_error_date | Integer | *可选*。最近一次尝试通过 Webhook 发送更新时发生错误的 Unix 时间 |
| last_error_message | String | *可选*。最近一次尝试通过 Webhook 发送更新时发生错误的人类可读错误消息 |
| last_synchronization_error_date | Integer | *可选*。尝试与 Telegram 数据中心同步可用更新时发生的最新错误的 Unix 时间 |
| max_connections | Integer | *可选*。允许同时向 Webhook 发送更新推送的最大 HTTPS 连接数 |
| allowed_updates | Array of String | *可选*。机器人订阅的更新类型列表。默认包含除 *chat_member* 外的所有更新类型 |

### 可用类型

Bot API 响应中使用的所有类型均以 JSON 对象形式表示。

除非另有说明，使用 32 位有符号整数存储所有 **Integer** 字段是安全的。

> **可选** 字段在无关时可能不会返回。

#### User
> **用户对象**

此对象表示一个 Telegram 用户或机器人。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | Integer | 此用户或机器人的唯一标识符。此数字可能超过 32 位有效位，某些编程语言在解析时可能存在困难或产生静默缺陷。但其最多只有 52 位有效位，因此使用 64 位整数或双精度浮点类型存储此标识符是安全的。 |
| is_bot | Boolean | True，如果该用户是机器人 |
| first_name | String | 用户或机器人的名字 |
| last_name | String | *可选*。用户或机器人的姓氏 |
| username | String | *可选*。用户或机器人的用户名 |
| language_code | String | *可选*。用户语言的 IETF 语言标签 |
| is_premium | Boolean | *可选*。若此用户为 Telegram Premium 用户，则值为 True |
| added_to_attachment_menu | Boolean | *可选*。若此用户已将机器人添加至附件菜单，则值为 True |
| can_join_groups | Boolean | *可选*。如果机器人可以被邀请到群组中，则为 True。仅在 getMe 中返回。 |
| can_read_all_group_messages | Boolean | *可选*。如果机器人的隐私模式被禁用，则为 True。仅在 getMe 中返回。 |
| supports_inline_queries | Boolean | *可选*。如果机器人支持内联查询，则为 True。仅在 getMe 中返回。 |
| can_connect_to_business | Boolean | *可选*。如果机器人可以连接到 Telegram 企业账户以接收其消息，则为 True。仅在 getMe 中返回。 |
| has_main_web_app | Boolean | *可选*。如果机器人拥有主 Web 应用，则为 True。仅在 getMe 中返回。 |

#### Chat
> **聊天对象**

此对象表示一个聊天。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | Integer | 此聊天的唯一标识符。此数字可能超过 32 位有效位，某些编程语言在解析时可能会遇到困难或产生静默缺陷。但它最多只有 52 位有效位，因此使用有符号 64 位整数或双精度浮点类型来存储此标识符是安全的。 |
| type | String | 聊天类型，可以是“private”（私聊）、“group”（群组）、“supergroup”（超级群组）或“channel”（频道） |
| title | String | *可选*。适用于超级群组、频道和群聊的标题 |
| username | String | *可选*。适用于私聊、超级群组和频道的用户名（如有） |
| first_name | String | *可选*。私聊中对方的名字 |
| last_name | String | *可选*。私聊中对方的姓氏 |
| is_forum | Boolean | *可选*。若超级群组聊天为论坛（已启用话题功能），则为 True |
| is_direct_messages | Boolean | *可选*。若该聊天为频道的私信聊天，则为 True |

#### ChatFullInfo
> **聊天完整信息对象**

此对象包含有关聊天的完整信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | Integer | 此聊天的唯一标识符。此数字可能超过 32 位有效位，某些编程语言在解析时可能会遇到困难或产生静默缺陷。但它最多只有 52 位有效位，因此使用有符号 64 位整数或双精度浮点类型来存储此标识符是安全的。 |
| type | String | 聊天类型，可以是“private”（私聊）、“group”（群组）、“supergroup”（超级群组）或“channel”（频道） |
| title | String | *可选*。适用于超级群组、频道和群聊的标题 |
| username | String | *可选*。适用于私聊、超级群组和频道的用户名（如有） |
| first_name | String | *可选*。私聊中对方的名字 |
| last_name | String | *可选*。私聊中对方的姓氏 |
| is_forum | Boolean | *可选*。若超级群组聊天为论坛（已启用话题功能），则为 True |
| is_direct_messages | Boolean | *可选*。若该聊天为频道的私信聊天，则为 True |
| accent_color_id | Integer | 聊天名称、聊天照片背景、回复标题和链接预览的强调色标识符。详情请参阅强调色。 |
| max_reaction_count | Integer | 聊天中消息可设置的最大反应数量 |
| photo | [ChatPhoto](#chatphoto) | *可选*。聊天照片 |
| active_usernames | Array of String | *可选*。若非空，则为所有活跃聊天用户名的列表；适用于私聊、超级群组和频道 |
| birthdate | [Birthdate](#birthdate) | *可选*。对于私聊，用户的出生日期 |
| business_intro | [BusinessIntro](#businessintro) | *可选*。对于与企业账户的私聊，企业简介 |
| business_location | [BusinessLocation](#businesslocation) | *可选*。对于与企业账户的私人聊天，表示该商业的位置 |
| business_opening_hours | [BusinessOpeningHours](#businessopeninghours) | *可选*。对于与企业账户的私聊，显示该企业的营业时间 |
| personal_chat | [Chat](#chat) | *可选*。对于私聊，用户的个人频道 |
| parent_chat | [Chat](#chat) | *可选*。关于对应频道聊天的信息；仅适用于直接消息聊天 |
| available_reactions | Array of [ReactionType](#reactiontype) | *可选*。聊天中允许使用的可用反应列表。如果省略，则允许所有 表情符号反应。 |
| background_custom_emoji_id | String | *可选*。聊天选定的表情符号自定义标识符，用于回复标题和链接预览背景 |
| profile_accent_color_id | Integer | *可选*。聊天个人资料背景的强调色标识符。详情请参阅个人资料强调色。 |
| profile_background_custom_emoji_id | String | *可选*。聊天为其个人资料背景所选表情符号的自定义表情标识符 |
| emoji_status_custom_emoji_id | String | *可选*。聊天或私聊中对方表情状态的自定义表情标识符 |
| emoji_status_expiration_date | Integer | *可选*。聊天或私聊中对方的表情符号状态到期时间，以 Unix 时间表示（如有） |
| bio | String | *可选*。私聊中对方的个人简介 |
| has_private_forwards | Boolean | *可选*。若私聊中对方的隐私设置仅允许在与其本人的聊天中使用 tg://user?id= 链接，则为 True |
| has_restricted_voice_and_video_messages | Boolean | *可选*。若对方的隐私设置限制在私聊中发送语音和视频笔记消息，则为 True |
| join_to_send_messages | Boolean | *可选*。如果用户需要先加入超级群组才能发送消息，则设为 True |
| join_by_request | Boolean | *可选*。如果所有未使用邀请链接直接加入超级群组的用户都需要超级群组管理员批准，则设为 True |
| description | String | *可选*。描述，适用于群组、超级群组和频道聊天 |
| invite_link | String | *可选*。主要邀请链接，适用于群组、超级群组和频道聊天 |
| pinned_message | [Message](#message) | *可选*。最近置顶的消息（按发送日期） |
| permissions | [ChatPermissions](#chatpermissions) | *可选*。适用于群组和超级群组的默认聊天成员权限 |
| accepted_gift_types | [AcceptedGiftTypes](#acceptedgifttypes) | 关于聊天（或私聊中相应用户）接受的礼物类型信息 |
| can_send_paid_media | Boolean | *可选*。如果付费媒体消息可以发送或转发到频道聊天，则为 True。此字段仅适用于频道聊天。 |
| slow_mode_delay | Integer | *可选*。对于超级群组，每个非特权用户连续发送消息之间的最小允许延迟；单位为秒。 |
| unrestrict_boost_count | Integer | *可选*。对于超级群组，非管理员用户需要添加的最小助力次数，以便忽略慢速模式和聊天权限 |
| message_auto_delete_time | Integer | *可选*。发送到该聊天的所有消息将在指定时间后自动删除；单位为秒 |
| has_aggressive_anti_spam_enabled | Boolean | *可选*。如果超级群组中启用了激进的反垃圾邮件检查，则为 True。此字段仅对聊天管理员可用。 |
| has_hidden_members | Boolean | *可选*。如果非管理员只能获取聊天中的机器人和管理员列表，则为 True |
| has_protected_content | Boolean | *可选*。若为真，则禁止将来自该聊天的消息转发至其他聊天 |
| has_visible_history | Boolean | *可选*。若为真，则新加入的聊天成员将有权查看历史消息；仅对聊天管理员可见 |
| sticker_set_name | String | *可选*。对于超级群组，群组贴纸集的名称 |
| can_set_sticker_set | Boolean | *可选*。True，如果机器人可以更改群组贴纸集 |
| custom_emoji_sticker_set_name | String | *可选*。对于超级群组，可设置群组自定义表情贴纸集的名称。该群组内的所有用户和机器人都可以使用此表情集中的自定义表情。 |
| linked_chat_id | Integer | *可选*。关联聊天的唯一标识符，例如频道的讨论组标识符，反之亦然；适用于超级群组和频道聊天。此标识符可能超过 32 位，某些编程语言在解析时可能存在困难或静默缺陷。但其小于 52 位，因此使用有符号 64 位整数或双精度浮点类型存储此标识符是安全的。 |
| location | [ChatLocation](#chatlocation) | *可选*。对于超级群组，指定超级群组所关联的位置 |

#### Message
> **消息对象**

此对象代表一条消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| message_id | Integer | 此聊天内的唯一消息标识符。在某些特定情况下（例如，向大型聊天群发送包含视频的消息），服务器可能会自动安排消息发送，而非立即发送。在这种情况下，此字段将为 0，且相关消息在实际发送前将无法使用。 |
| message_thread_id | Integer | *可选*。消息所属的线程的唯一标识符；仅适用于超级群组。 |
| direct_messages_topic | [DirectMessagesTopic](#directmessagestopic) | *可选*。包含该消息的私信聊天主题信息 |
| from | [User](#user) | *可选*。消息的发送者；对于发送到频道的消息，该字段可能为空。为了向后兼容，如果消息是代表聊天发送的，该字段在非频道聊天中包含一个虚拟的发送者用户。 |
| sender_chat | [Chat](#chat) | *可选*。当消息代表聊天发送时的发送者。例如，由其匿名管理员发送的消息的超群组本身，或自动转发到频道讨论组的消息的关联频道。为了向后兼容，如果消息是代表聊天发送的，from 字段在非频道聊天中包含一个虚拟的发送者用户。 |
| sender_boost_count | Integer | *可选*。若消息发送者曾为该聊天助力，则显示该用户添加的助力次数 |
| sender_business_bot | [User](#user) | *可选*。代表企业账户实际发送消息的机器人。仅适用于通过已关联企业账户发送的对外消息。 |
| date | Integer | 消息发送的 Unix 时间戳。始终为正数，代表有效日期。 |
| business_connection_id | String | *可选*。接收消息的商业连接的唯一标识符。若非空，则该消息属于对应企业账户的独立聊天，该聊天与可能共享相同标识符的任何潜在机器人聊天无关。 |
| chat | [Chat](#chat) | 消息所属的聊天 |
| forward_origin | [MessageOrigin](#messageorigin) | *可选*。转发消息的原始消息信息 |
| is_topic_message | True | *可选*。如果消息发送至论坛主题，则为 True |
| is_automatic_forward | True | *可选*。若该消息是自动转发至关联讨论组的频道帖子，则值为 True |
| reply_to_message | [Message](#message) | *可选*。针对同一聊天和消息线程中的回复，此字段表示原始消息。请注意，即使该消息本身是回复，此字段中的消息对象也不会包含进一步的 reply_to_message 字段。 |
| external_reply | [ExternalReplyInfo](#externalreplyinfo) | *可选*。关于被回复消息的信息，该消息可能来自其他聊天或论坛话题 |
| quote | [TextQuote](#textquote) | *可选*。对于引用原始消息部分内容的回复，消息中被引用的部分 |
| reply_to_story | [Story](#story) | *可选*。用于回复故事时，指代原始故事 |
| reply_to_checklist_task_id | Integer | *可选*。正在回复的特定清单任务的标识符 |
| via_bot | [User](#user) | *可选*。发送消息的机器人 |
| edit_date | Integer | *可选*。消息最后编辑的 Unix 时间戳 |
| has_protected_content | True | *可选*。如果消息无法转发，则为 True |
| is_from_offline | True | *可选*。若消息是通过隐式操作发送的（例如作为离开或问候类商务消息，或作为定时消息），则为 True |
| is_paid_post | True | *可选*。若消息为付费帖子，则为 True。请注意，此类帖子在 24 小时内不得删除以获取报酬，且不可编辑。 |
| media_group_id | String | *可选*。此消息所属媒体消息组的唯一标识符 |
| author_signature | String | *可选*。频道消息中帖子作者的签名，或匿名群组管理员的自定义头衔 |
| paid_star_count | Integer | *可选*。消息发送者为发送该消息所支付的 Telegram Stars 数量 |
| text | String | *可选*。对于文本消息，消息的实际 UTF-8 文本内容 |
| entities | Array of [MessageEntity](#messageentity) | *可选*。对于文本消息，出现在文本中的特殊实体，如用户名、URL、机器人命令等 |
| link_preview_options | [LinkPreviewOptions](#linkpreviewoptions) | *可选*。用于消息链接预览生成的选项，如果它是文本消息且链接预览选项已更改 |
| suggested_post_info | [SuggestedPostInfo](#suggestedpostinfo) | *可选*。如果消息是频道私信聊天中的建议帖子，则包含建议帖子参数的信息。如果消息是已批准或已拒绝的建议帖子，则无法编辑。 |
| effect_id | String | *可选*。添加到消息中的消息特效的唯一标识符 |
| animation | [Animation](#animation) | *可选*。消息为动画时，包含动画相关信息。为保持向后兼容性，当此字段被设置时，文档字段也将被设置 |
| audio | [Audio](#audio) | *可选*。消息为音频文件时，包含文件相关信息 |
| document | [Document](#document) | *可选*。消息是一个通用文件，包含文件相关信息 |
| paid_media | [PaidMediaInfo](#paidmediainfo) | *可选*。消息包含付费媒体；关于付费媒体的信息 |
| photo | Array of [PhotoSize](#photosize) | *可选*。消息为照片，照片的可用尺寸 |
| sticker | [Sticker](#sticker) | *可选*。消息为贴纸，贴纸的相关信息 |
| story | [Story](#story) | *可选*。消息为转发的故事 |
| video | [Video](#video) | *可选*。消息为视频，包含视频相关信息 |
| video_note | [VideoNote](#videonote) | *可选*。消息是一个视频笔记，关于视频消息的信息 |
| voice | [Voice](#voice) | *可选*。消息为语音消息，包含文件相关信息 |
| caption | String | *可选*。动画、音频、文档、付费媒体、照片、视频或语音的说明文字 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。对于带有说明文字的消息，出现在说明文字中的特殊实体，如用户名、URL、机器人命令等 |
| show_caption_above_media | True | *可选*。如果说明文字必须显示在消息媒体上方，则为 True |
| has_media_spoiler | True | *可选*。如果消息媒体被剧透动画覆盖，则为 True |
| checklist | [Checklist](#checklist) | *可选*。消息为清单 |
| contact | [Contact](#contact) | *可选*。消息为共享联系人，包含联系人信息 |
| dice | [Dice](#dice) | *可选*。消息是一个具有随机值的骰子 |
| game | [Game](#game) | *可选*。消息是一个游戏，包含游戏相关信息。更多关于游戏 » |
| poll | [Poll](#poll) | *可选*。消息为原生投票时，包含投票相关信息 |
| venue | [Venue](#venue) | *可选*。消息为地点时，包含地点相关信息。为保持向后兼容性，当此字段被设置时，位置字段也将被设置 |
| location | [Location](#location) | *可选*。消息是一个共享位置，包含该位置的信息 |
| new_chat_members | Array of [User](#user) | *可选*。被添加到群组或超级群组的新成员及其相关信息（机器人本身可能是这些成员之一） |
| left_chat_member | [User](#user) | *可选*。有成员被移出群组，关于该成员的信息（此成员可能是机器人自身） |
| new_chat_title | String | *可选*。聊天标题已更改为该值 |
| new_chat_photo | Array of [PhotoSize](#photosize) | *可选*。聊天照片已更改为此值 |
| delete_chat_photo | True | *可选*。服务消息：聊天照片已被删除 |
| group_chat_created | True | *可选*。服务消息：群组已创建 |
| supergroup_chat_created | True | *可选*。服务消息：超级群组已创建。此字段无法通过更新消息接收，因为机器人无法在超级群组创建时成为其成员。仅当有人回复在直接创建的超级群组中的首条消息时，才能在 reply_to_message 中找到此字段。 |
| channel_chat_created | True | *可选*。服务消息：频道已创建。此字段无法通过更新消息接收，因为频道创建时机器人无法成为其成员。它只能在回复频道中第一条消息的回复消息中找到。 |
| message_auto_delete_timer_changed | [MessageAutoDeleteTimerChanged](#messageautodeletetimerchanged) | *可选*。服务消息：聊天中的自动删除计时器设置已更改 |
| migrate_to_chat_id | Integer | *可选*。该群组已迁移至指定标识符的超级群组。此数值可能超过 32 位有效位，某些编程语言在解析时可能存在困难/静默缺陷。但其最多包含 52 位有效位，因此使用有符号 64 位整数或双精度浮点类型存储此标识符是安全的。 |
| migrate_from_chat_id | Integer | *可选*。该超级群组是从指定标识符的群组迁移而来。此数值可能超过 32 位有效位，某些编程语言在解析时可能存在困难/静默缺陷。但其最多包含 52 位有效位，因此使用有符号 64 位整数或双精度浮点类型存储此标识符是安全的。 |
| pinned_message | [MaybeInaccessibleMessage](#maybeinaccessiblemessage) | *可选*。指定的消息已被置顶。请注意，即使该消息本身是一条回复，此字段中的消息对象也不会包含进一步的回复消息字段。 |
| invoice | [Invoice](#invoice) | *可选*。消息是一张支付的发票，包含发票的相关信息。更多关于支付的信息 » |
| successful_payment | [SuccessfulPayment](#successfulpayment) | *可选*。消息是关于成功付款的服务通知，包含付款信息。更多关于付款的信息 » |
| refunded_payment | [RefundedPayment](#refundedpayment) | *可选*。消息是关于已退款付款的服务通知，包含付款信息。更多关于付款的信息 » |
| users_shared | [UsersShared](#usersshared) | *可选*。服务消息：用户已与机器人共享 |
| chat_shared | [ChatShared](#chatshared) | *可选*。服务消息：聊天已与机器人共享 |
| gift | [GiftInfo](#giftinfo) | *可选*。服务消息：发送或接收了常规礼物 |
| unique_gift | [UniqueGiftInfo](#uniquegiftinfo) | *可选*。服务消息：发送或接收了独特礼物 |
| connected_website | String | *可选*。用户已登录的网站域名。了解更多关于 Telegram 登录的信息 » |
| write_access_allowed | [WriteAccessAllowed](#writeaccessallowed) | *可选*。服务消息：用户在将机器人添加到附件或侧边菜单、从链接启动 Web 应用，或接受 Web 应用通过 requestWriteAccess 方法发送的明确请求后，允许机器人写入消息。 |
| passport_data | [PassportData](#passportdata) | *可选*。Telegram Passport 数据 |
| proximity_alert_triggered | [ProximityAlertTriggered](#proximityalerttriggered) | *可选*。服务消息。聊天中的用户在共享实时位置时触发了另一用户的接近警报。 |
| boost_added | [ChatBoostAdded](#chatboostadded) | *可选*。服务消息：用户已为该聊天助力 |
| chat_background_set | [ChatBackground](#chatbackground) | *可选*。服务消息：聊天背景已设置 |
| checklist_tasks_done | [ChecklistTasksDone](#checklisttasksdone) | *可选*。服务消息：清单中的部分任务被标记为已完成或未完成 |
| checklist_tasks_added | [ChecklistTasksAdded](#checklisttasksadded) | *可选*。服务消息：任务已添加至清单 |
| direct_message_price_changed | [DirectMessagePriceChanged](#directmessagepricechanged) | *可选*。服务消息：频道对应私信聊天中付费消息的价格已更改 |
| forum_topic_created | [ForumTopicCreated](#forumtopiccreated) | *可选*。服务消息：论坛主题已创建 |
| forum_topic_edited | [ForumTopicEdited](#forumtopicedited) | *可选*。服务消息：论坛主题已编辑 |
| forum_topic_closed | [ForumTopicClosed](#forumtopicclosed) | *可选*。服务消息：论坛主题已关闭 |
| forum_topic_reopened | [ForumTopicReopened](#forumtopicreopened) | *可选*。服务消息：论坛主题已重新开放 |
| general_forum_topic_hidden | [GeneralForumTopicHidden](#generalforumtopichidden) | *可选*。服务消息：'General' 论坛主题已隐藏 |
| general_forum_topic_unhidden | [GeneralForumTopicUnhidden](#generalforumtopicunhidden) | *可选*。服务消息：'General' 论坛主题已取消隐藏 |
| giveaway_created | [GiveawayCreated](#giveawaycreated) | *可选*。服务消息：已创建定时赠品活动 |
| giveaway | [Giveaway](#giveaway) | *可选*。该消息是一条预定的赠品消息 |
| giveaway_winners | [GiveawayWinners](#giveawaywinners) | *可选*。一个公开获奖者的赠品活动已完成 |
| giveaway_completed | [GiveawayCompleted](#giveawaycompleted) | *可选*。服务消息：一场未公开获奖者的赠品活动已结束 |
| paid_message_price_changed | [PaidMessagePriceChanged](#paidmessagepricechanged) | *可选*。服务消息：聊天中的付费消息价格已变更 |
| suggested_post_approved | [SuggestedPostApproved](#suggestedpostapproved) | *可选*。服务消息：一个建议的帖子已获批准 |
| suggested_post_approval_failed | [SuggestedPostApprovalFailed](#suggestedpostapprovalfailed) | *可选*。服务消息：建议帖子的批准失败 |
| suggested_post_declined | [SuggestedPostDeclined](#suggestedpostdeclined) | *可选*。服务消息：推荐帖子被拒绝 |
| suggested_post_paid | [SuggestedPostPaid](#suggestedpostpaid) | *可选*。服务消息：收到推荐帖子的付款 |
| suggested_post_refunded | [SuggestedPostRefunded](#suggestedpostrefunded) | *可选*。服务消息：建议帖子的付款已退款 |
| video_chat_scheduled | [VideoChatScheduled](#videochatscheduled) | *可选*。服务消息：视频聊天已安排 |
| video_chat_started | [VideoChatStarted](#videochatstarted) | *可选*。服务消息：视频聊天已开始 |
| video_chat_ended | [VideoChatEnded](#videochatended) | *可选*。服务消息：视频聊天已结束 |
| video_chat_participants_invited | [VideoChatParticipantsInvited](#videochatparticipantsinvited) | *可选*。服务消息：新参与者被邀请加入视频聊天 |
| web_app_data | [WebAppData](#webappdata) | *可选*。服务消息：由 Web 应用发送的数据 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加在消息上的内联键盘。login_url 按钮会显示为普通的 url 按钮。 |

#### MessageId
> **消息 ID 对象**

此对象代表一个唯一的消息标识符。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| message_id | Integer | 唯一消息标识符。在某些特定情况下（例如，向大型聊天群组发送包含视频的消息时），服务器可能会自动安排消息发送而非立即发送。在这种情况下，该字段将显示为 0，且相关消息在实际发送前将无法使用 |

#### InaccessibleMessage
> **不可访问消息对象**

此对象描述一条已被删除或机器人无法访问的消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 消息所属的聊天 |
| message_id | Integer | 聊天中的唯一消息标识符 |
| date | Integer | 始终为 0。该字段可用于区分常规消息和无法访问的消息。 |

#### MaybeInaccessibleMessage
> **可能不可访问消息对象**

此对象描述了一个机器人可能无法访问的消息。它可以是以下之一

* [Message](#message)
* [InaccessibleMessage](#inaccessiblemessage)

#### MessageEntity
> **消息实体对象**

此对象表示文本消息中的一个特殊实体。例如，话题标签、用户名、网址等。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 实体的类型。目前可以是“提及”（@用户名）、“话题标签”（#话题标签或 #话题标签@聊天用户名）、“现金标签”（$USD 或 $USD@聊天用户名）、“机器人命令”（/start@jobs_bot）、“网址”（https://telegram.org）、“电子邮件”（do-not-reply@telegram.org）、“电话号码”（+1-212-555-0123）、“粗体”（粗体文本）、“斜体”（斜体文本）、“下划线”（带下划线的文本）、“删除线”（带删除线的文本）、“剧透”（剧透消息）、“块引用”（块引用）、“可展开块引用”（默认折叠的块引用）、“代码”（等宽字符串）、“预格式文本”（等宽块）、“文本链接”（用于可点击的文本网址）、“文本提及”（用于没有用户名的用户）、“自定义表情符号”（用于内联自定义表情符号贴纸） |
| offset | Integer | 在 UTF-16 代码单元中到实体起始位置的偏移量 |
| length | Integer | 实体在 UTF-16 编码单元中的长度 |
| url | String | *可选*。仅适用于“text_link”类型，用户点击文本后将打开的网址 |
| user | [User](#user) | *可选*。仅适用于“text_mention”，即被提及的用户 |
| language | String | *可选*。仅适用于“pre”标签，表示实体文本的编程语言 |
| custom_emoji_id | String | *可选*。仅适用于“custom_emoji”，自定义表情符号的唯一标识符。使用 getCustomEmojiStickers 获取关于贴纸的完整信息 |

#### TextQuote
> **文本引用对象**

此对象包含有关给定消息所回复的消息中被引用部分的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| text | String | 被回复消息的引用部分文本 |
| entities | Array of [MessageEntity](#messageentity) | *可选*。引用中出现的特殊实体。目前仅保留粗体、斜体、下划线、删除线、剧透和自定义表情实体。 |
| position | Integer | 根据发送方指定，原始消息中引用的大致位置（以 UTF-16 代码单元表示） |
| is_manual | True | *可选*。如果消息发送者手动选择了引用，则为 True。否则，引用是由服务器自动添加的。 |

#### ExternalReplyInfo
> **外部回复信息对象**

此对象包含有关正在回复的消息的信息，该消息可能来自其他聊天或论坛主题。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| origin | [MessageOrigin](#messageorigin) | 给定消息所回复消息的来源 |
| chat | [Chat](#chat) | *可选*。原始消息所属的聊天。仅当聊天为超级群组或频道时可用。 |
| message_id | Integer | *可选*。原始聊天中的唯一消息标识符。仅当原始聊天为超级群组或频道时可用。 |
| link_preview_options | [LinkPreviewOptions](#linkpreviewoptions) | *可选*。用于原始消息链接预览生成的选项（若该消息为文本消息） |
| animation | [Animation](#animation) | *可选*。消息为动画，关于动画的信息 |
| audio | [Audio](#audio) | *可选*。消息为音频文件，包含文件相关信息 |
| document | [Document](#document) | *可选*。消息是一个通用文件，包含文件相关信息 |
| paid_media | [PaidMediaInfo](#paidmediainfo) | *可选*。消息包含付费媒体；关于付费媒体的信息 |
| photo | Array of [PhotoSize](#photosize) | *可选*。消息为照片，照片的可用尺寸 |
| sticker | [Sticker](#sticker) | *可选*。消息为贴纸，关于贴纸的信息 |
| story | [Story](#story) | *可选*。消息为转发的故事 |
| video | [Video](#video) | *可选*。消息为视频，包含视频相关信息 |
| video_note | [VideoNote](#videonote) | *可选*。消息是一个视频笔记，关于视频消息的信息 |
| voice | [Voice](#voice) | *可选*。消息为语音消息，包含文件相关信息 |
| has_media_spoiler | Boolean | *可选*。若消息媒体被剧透动画覆盖，则为 True |
| checklist | [Checklist](#checklist) | *可选*。消息为清单 |
| contact | [Contact](#contact) | *可选*。消息为共享的联系人，包含该联系人的信息 |
| dice | [Dice](#dice) | *可选*。消息是一个带有随机值的骰子 |
| game | [Game](#game) | *可选*。消息为游戏，包含游戏相关信息。更多游戏信息 » |
| giveaway | [Giveaway](#giveaway) | *可选*。消息为预定赠品活动，包含活动相关信息 |
| giveaway_winners | [GiveawayWinners](#giveawaywinners) | *可选*。一个公开获奖者的赠品活动已完成 |
| invoice | [Invoice](#invoice) | *可选*。消息是一张付款的发票，包含发票的相关信息。了解更多关于付款的信息 » |
| location | [Location](#location) | *可选*。消息为共享位置，包含位置相关信息 |
| poll | [Poll](#poll) | *可选*。消息为原生投票，包含投票相关信息 |
| venue | [Venue](#venue) | *可选*。消息是一个地点，关于该地点的信息 |

#### ReplyParameters
> **回复参数对象**

描述正在发送消息的回复参数。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| message_id | Integer | 在当前聊天中要回复的消息标识符，如果指定了聊天 chat_id，则指该聊天中的消息标识符 |
| chat_id | Integer or String | *可选*。若需回复的消息来自其他聊天，此处应填写目标聊天或频道的唯一标识符（格式为 @channelusername）。企业账户发送的消息及频道私信会话中的消息不支持此功能。 |
| allow_sending_without_reply | Boolean | *可选*。当指定回复的消息不存在时，若仍需发送本消息请设为 True。跨聊天或跨论坛主题的回复始终为 False。企业账户发送的消息始终为 True。 |
| quote | String | *可选*。要回复的消息中被引用的部分；经过实体解析后长度为 0-1024 个字符。引用内容必须是待回复消息的精确子字符串，包括粗体、斜体、下划线、删除线、剧透和自定义表情实体。如果在原始消息中未找到引用内容，则消息将发送失败。 |
| quote_parse_mode | String | *可选*。用于解析引用中实体的模式。更多详情请参阅格式化选项。 |
| quote_entities | Array of [MessageEntity](#messageentity) | *可选*。一个 JSON 序列化的特殊实体列表，这些实体出现在引用中。可以指定此参数来代替 quote_parse_mode。 |
| quote_position | Integer | *可选*。引文在原始消息中的位置，以 UTF-16 代码单元表示 |
| checklist_task_id | Integer | *可选*。待回复的具体清单任务的标识符 |

#### MessageOrigin
> **消息来源对象**

此对象描述消息的来源。它可以是以下之一

* [MessageOriginUser](#messageoriginuser)
* [MessageOriginHiddenUser](#messageoriginhiddenuser)
* [MessageOriginChat](#messageoriginchat)
* [MessageOriginChannel](#messageoriginchannel)

#### MessageOriginUser
> **来自用户的消息来源**

该消息最初由已知用户发送。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 消息来源的类型，始终为“user” |
| date | Integer | 消息最初发送的日期，以 Unix 时间表示 |
| sender_user | [User](#user) | 最初发送消息的用户 |

#### MessageOriginHiddenUser
> **来自隐藏用户的消息来源**

该消息最初由未知用户发送。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 消息来源类型，始终为“hidden_user” |
| date | Integer | 消息最初发送的日期，以 Unix 时间表示 |
| sender_user_name | String | 最初发送消息的用户名称 |

#### MessageOriginChat
> **来自聊天的消息来源**

该消息最初是以聊天形式代表发送给群聊的。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 消息来源的类型，始终为“chat” |
| date | Integer | 消息最初发送的日期，以 Unix 时间表示 |
| sender_chat | [Chat](#chat) | 最初发送消息的聊天 |
| author_signature | String | *可选*。对于最初由匿名聊天管理员发送的消息，原始消息作者签名 |

#### MessageOriginChannel
> **来自频道的消息来源**

该消息最初发送至频道聊天。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 消息来源的类型，始终为“channel” |
| date | Integer | 消息最初发送的日期，以 Unix 时间表示 |
| chat | [Chat](#chat) | 消息最初发送到的频道聊天 |
| message_id | Integer | 聊天内的唯一消息标识符 |
| author_signature | String | *可选*。原始帖子作者的签名 |

#### PhotoSize
> **照片尺寸对象**

此对象代表照片或[文件](#document) / [贴纸](#sticker)缩略图的一种尺寸。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的唯一标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 此文件的唯一标识符，预计在不同时间和不同机器人之间保持一致。无法用于下载或重复使用该文件。 |
| width | Integer | 照片宽度 |
| height | Integer | 照片高度 |
| file_size | Integer | *可选*。文件大小（字节） |

#### Animation
> **动画对象**

此对象代表一个动画文件（GIF 或无声的 H.264/MPEG-4 AVC 视频）。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的唯一标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 此文件的唯一标识符，预计在不同时间和不同机器人之间保持一致。无法用于下载或重复使用该文件。 |
| width | Integer | 发送方定义的视频宽度 |
| height | Integer | 发送方定义的视频高度 |
| duration | Integer | 由发送方定义的视频时长（以秒为单位） |
| thumbnail | [PhotoSize](#photosize) | *可选*。由发送方定义的动画缩略图 |
| file_name | String | *可选*。由发送方定义的原始动画文件名 |
| mime_type | String | *可选*。由发送方定义的文件 MIME 类型 |
| file_size | Integer | *可选*。文件大小，单位为字节。该值可能大于 2^31，某些编程语言在解析时可能会遇到困难或出现静默缺陷。但其最多只有 52 个有效位，因此使用有符号 64 位整数或双精度浮点类型来存储该值是安全的。 |

#### Audio
> **音频对象**

此对象代表一个音频文件，Telegram 客户端会将其视为音乐处理。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 此文件的唯一标识符，预计在不同时间和不同机器人之间保持一致。不可用于下载或重复使用该文件。 |
| duration | Integer | 音频时长（秒），由发送方定义 |
| performer | String | *可选*。由发送方或音频标签定义的音频表演者 |
| title | String | *可选*。由发送方或音频标签定义的音频标题 |
| file_name | String | *可选*。由发送方定义的原文件名 |
| mime_type | String | *可选*。由发送方定义的文件 MIME 类型 |
| file_size | Integer | *可选*。文件大小，以字节为单位。该值可能大于 2^31，某些编程语言在解析时可能会遇到困难或产生静默缺陷。但其最多只有 52 个有效位，因此使用有符号 64 位整数或双精度浮点类型来存储此值是安全的。 |
| thumbnail | [PhotoSize](#photosize) | *可选*。音乐文件所属专辑封面的缩略图 |

#### Document
> **文档对象**

此对象代表一个通用文件（与[照片](#photosize) 、 [语音消息](#voice)和[音频文件](#audio)相对）。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 此文件的唯一标识符，预计在不同时间和不同机器人之间保持一致。不可用于下载或重复使用该文件。 |
| thumbnail | [PhotoSize](#photosize) | *可选*。由发送方定义的文档缩略图 |
| file_name | String | *可选*。由发送方定义的原文件名 |
| mime_type | String | *可选*。由发送方定义的文件 MIME 类型 |
| file_size | Integer | *可选*。文件大小，以字节为单位。该值可能大于 2^31，某些编程语言在解析时可能会遇到困难或产生静默缺陷。但其最多只有 52 个有效位，因此使用有符号 64 位整数或双精度浮点类型来存储此值是安全的。 |

#### Story
> **快拍对象**

这个对象代表一个故事。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 发布故事的聊天 |
| id | Integer | 聊天中故事的唯一标识符 |

#### Video
> **视频对象**

此对象代表一个视频文件。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的唯一标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 此文件的唯一标识符，预计在不同时间和不同机器人之间保持一致。无法用于下载或重复使用该文件。 |
| width | Integer | 由发送方定义的视频宽度 |
| height | Integer | 由发送方定义的视频高度 |
| duration | Integer | 视频时长（秒），由发送者定义 |
| thumbnail | [PhotoSize](#photosize) | *可选*。视频缩略图 |
| cover | Array of [PhotoSize](#photosize) | *可选*。消息中视频封面的可用尺寸 |
| start_timestamp | Integer | *可选*。视频在消息中开始播放的时间戳（以秒为单位） |
| file_name | String | *可选*。由发送方定义的原始文件名 |
| mime_type | String | *可选*。发送方定义的文件 MIME 类型 |
| file_size | Integer | *可选*。以字节为单位的文件大小。该值可能超过 2^31，某些编程语言在解析时可能存在困难/静默缺陷。但其有效位最多为 52 位，因此使用有符号 64 位整数或双精度浮点类型存储此值是安全的。 |

#### VideoNote
> **视频笔记对象**

此对象表示一个[视频消息](https://telegram.org/blog/video-messages-and-telescope) （自 [v.4.0](https://telegram.org/blog/video-messages-and-telescope) 起在 Telegram 应用中可用）。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的唯一标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 该文件的唯一标识符，预计在不同时间和不同机器人中保持不变。无法用于下载或重复使用该文件。 |
| length | Integer | 视频宽度和高度（视频消息的直径），由发送者定义 |
| duration | Integer | 视频时长（秒），由发送者定义 |
| thumbnail | [PhotoSize](#photosize) | *可选*。视频缩略图 |
| file_size | Integer | *可选*。文件大小，单位为字节 |

#### Voice
> **语音对象**

此对象表示一条语音消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的唯一标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 此文件的唯一标识符，预计在不同时间和不同机器人之间保持一致。无法用于下载或重复使用该文件。 |
| duration | Integer | 发送方定义的音频时长（秒） |
| mime_type | String | *可选*。发送方定义的文件 MIME 类型 |
| file_size | Integer | *可选*。文件大小，单位为字节。该值可能大于 2^31，某些编程语言在解析时可能会遇到困难或产生静默缺陷。但其最多只有 52 个有效位，因此使用有符号 64 位整数或双精度浮点类型来存储此值是安全的。 |

#### PaidMediaInfo
> **付费媒体信息对象**

描述添加到消息中的付费媒体。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| star_count | Integer | 购买媒体访问权限所需支付的 Telegram Stars 数量 |
| paid_media | Array of [PaidMedia](#paidmedia) | 关于付费媒体的信息 |

#### PaidMedia
> **付费媒体对象**

此对象描述付费媒体。目前，它可以是以下之一

* [PaidMediaPreview](#paidmediapreview)
* [PaidMediaPhoto](#paidmediaphoto)
* [PaidMediaVideo](#paidmediavideo)

#### PaidMediaPreview
> **付费媒体预览对象**

付费媒体在付款前不可用。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 付费媒体的类型，始终为“preview” |
| width | Integer | *可选*。由发送方定义的媒体宽度 |
| height | Integer | *可选*。由发送方定义的媒体高度 |
| duration | Integer | *可选*。由发送方定义的媒体时长（以秒为单位） |

#### PaidMediaPhoto
> **付费媒体照片对象**

付费媒体为照片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 付费媒体的类型，始终为“photo” |
| photo | Array of [PhotoSize](#photosize) | 照片 |

#### PaidMediaVideo
> **付费媒体视频对象**

付费媒体是一段视频。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 付费媒体类型，始终为“video” |
| video | [Video](#video) | 视频 |

#### Contact
> **联系人对象**

该对象表示一个电话联系人。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| phone_number | String | 联系人的电话号码 |
| first_name | String | 联系人的名字 |
| last_name | String | *可选*。联系人的姓氏 |
| user_id | Integer | *可选*。联系人在 Telegram 中的用户标识符。此数字可能超过 32 位有效位，某些编程语言在解析时可能存在困难或产生静默缺陷。但其最多只有 52 位有效位，因此使用 64 位整数或双精度浮点类型存储此标识符是安全的。 |
| vcard | String | *可选*。以 [vCard](https://en.wikipedia.org/wiki/VCard) 形式提供的联系人附加信息 |

#### Dice
> **骰子对象**

此对象代表一个显示随机值的动态表情符号。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| emoji | String | 骰子投掷动画所基于的表情符号 |
| value | Integer | 骰子的数值，对于“![🎲](https://telegram.org/img/emoji/40/F09F8EB2.png)”、“![🎯](https://telegram.org/img/emoji/40/F09F8EAF.png)”和“![🎳](https://telegram.org/img/emoji/40/F09F8EB3.png)”基础表情为 1-6，对于“![🏀](https://telegram.org/img/emoji/40/F09F8F80.png)”和“![⚽](https://telegram.org/img/emoji/40/E29ABD.png)”为 1-5，对于“![🎰](https://telegram.org/img/emoji/40/F09F8EB0.png)”为 1-64 |

#### PollOption
> **投票选项对象**

此对象包含投票中一个答案选项的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| text | String | 选项文本，1-100 个字符 |
| text_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在选项 *text* 中的特殊实体。目前，投票选项文本中仅允许自定义表情符号实体 |
| voter_count | Integer | 投票给此选项的用户数量 |

#### InputPollOption
> **输入投票选项对象**

此对象包含待发送投票中一个答案选项的相关信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| text | String | 选项文本，1-100 个字符 |
| text_parse_mode | String | *可选*。用于解析文本中实体的模式。详情请参阅格式设置选项。目前仅允许自定义表情符号实体 |
| text_entities | Array of [MessageEntity](#messageentity) | *可选*。一个 JSON 序列化的特殊实体列表，这些实体出现在投票选项文本中。可以指定此参数以替代 *text_parse_mode* |

#### PollAnswer
> **投票回答对象**

此对象表示用户在非匿名投票中的回答。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| poll_id | String | 唯一投票标识符 |
| voter_chat | [Chat](#chat) | *可选*。如果投票者是匿名的，则更改投票答案的聊天记录 |
| user | [User](#user) | *可选*。若投票者非匿名，则记录更改投票答案的用户 |
| option_ids | Array of Integer | 所选答案选项的从 0 开始的标识符。若投票被撤销，可能为空数组。 |

#### Poll
> **投票对象**

此对象包含有关投票的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 唯一投票标识符 |
| question | String | 投票问题，1-300 个字符 |
| question_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在问题中的特殊实体。目前，投票问题中仅允许自定义表情符号实体 |
| options | Array of [PollOption](#polloption) | 投票选项列表 |
| total_voter_count | Integer | 参与投票的用户总数 |
| is_closed | Boolean | *True*，如果投票已结束 |
| is_anonymous | Boolean | *True*，如果投票是匿名的 |
| type | String | 投票类型，目前可以是“regular”或“quiz” |
| allows_multiple_answers | Boolean | *True*，如果该投票允许多个答案 |
| correct_option_id | Integer | *可选*。正确答案选项的从 0 开始的标识符。仅适用于测验模式下的投票，这些投票已关闭，或由机器人发送（非转发），或发送至与机器人的私聊中。 |
| explanation | String | *可选*。当用户在测验式投票中选择错误答案或点击灯泡图标时显示的文本，0-200 个字符 |
| explanation_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明中的特殊实体，如用户名、URL、机器人命令等。 |
| open_period | Integer | *可选*。投票创建后保持活跃的时间（以秒为单位） |
| close_date | Integer | *可选*。投票将自动关闭的时间点（Unix 时间戳） |

#### ChecklistTask
> **清单任务对象**

描述清单中的一项任务。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | Integer | 任务的唯一标识符 |
| text | String | 任务文本 |
| text_entities | Array of [MessageEntity](#messageentity) | *可选*。任务文本中出现的特殊实体 |
| completed_by_user | [User](#user) | *可选*。完成任务的用户；若任务未完成则省略 |
| completion_date | Integer | *可选*。任务完成的时间点（Unix 时间戳）；若任务未完成则为 0 |

#### Checklist
> **清单对象**

描述一个检查清单。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| title | String | 清单标题 |
| title_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在清单标题中的特殊实体 |
| tasks | Array of [ChecklistTask](#checklisttask) | 清单中的任务列表 |
| others_can_add_tasks | True | *可选*。 *True*，如果列表创建者以外的用户可以向列表添加任务 |
| others_can_mark_tasks_as_done | True | *可选*。 *True*，如果列表创建者以外的用户可以将任务标记为已完成或未完成 |

#### InputChecklistTask
> **输入清单任务对象**

描述要添加到检查清单中的任务。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | Integer | 任务的唯一标识符；必须为正数，且在清单当前所有任务标识符中保持唯一 |
| text | String | 任务文本；完成实体解析后长度为 1-100 个字符 |
| parse_mode | String | *可选*。用于解析文本中实体的模式。更多详情请参阅[格式设置选项](#formatting-options)。 |
| text_entities | Array of [MessageEntity](#messageentity) | *可选*。文本中出现的特殊实体列表，可用于替代 *parse_mode* 指定。目前仅允许 *bold*、*italic*、*underline*、*strikethrough*、*spoiler* 和 *custom_emoji* 实体。 |

#### InputChecklist
> **输入清单对象**

描述要创建的清单。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| title | String | 清单标题；完成实体解析后长度为 1-255 个字符 |
| parse_mode | String | *可选*。用于解析标题中实体的模式。更多详情请参阅[格式设置选项](#formatting-options)。 |
| title_entities | Array of [MessageEntity](#messageentity) | *可选*。标题中出现的特殊实体列表，可替代 *parse_mode* 指定。目前仅允许 *bold*、*italic*、*underline*、*strikethrough*、*spoiler* 和 *custom_emoji* 实体。 |
| tasks | Array of [InputChecklistTask](#inputchecklisttask) | 清单中的 1-30 个任务列表 |
| others_can_add_tasks | Boolean | *可选*。传递 *True* 表示其他用户可以向清单中添加任务 |
| others_can_mark_tasks_as_done | Boolean | *可选*。传递 *True* 表示其他用户可以在清单中将任务标记为已完成或未完成 |

#### ChecklistTasksDone
> **清单任务完成对象**

描述关于清单任务标记为已完成或未完成的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| checklist_message | [Message](#message) | *可选*。包含任务标记为已完成或未完成的清单的消息。注意，此字段中的 [Message](#message) 对象即使本身是回复，也不会包含 *reply_to_message* 字段。 |
| marked_as_done_task_ids | Array of Integer | *可选*。标记为已完成的任务标识符 |
| marked_as_not_done_task_ids | Array of Integer | *可选*。标记为未完成的任务标识符 |

#### ChecklistTasksAdded
> **清单任务添加对象**

描述关于已添加到清单的任务的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| checklist_message | [Message](#message) | *可选*。包含任务被添加到的清单的消息。注意，即使该消息本身是回复，此字段中的 [Message](#message) 对象也不会包含 *reply_to_message* 字段。 |
| tasks | Array of [ChecklistTask](#checklisttask) | 已添加到清单的任务列表 |

#### Location
> **位置对象**

此对象代表地图上的一个点。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| latitude | Float | 发送方定义的纬度 |
| longitude | Float | 发送方定义的经度 |
| horizontal_accuracy | Float | *可选*。位置的不确定半径，以米为单位；范围 0-1500 |
| live_period | Integer | *可选*。相对于消息发送时间，在此时间段内可以更新位置；以秒为单位。仅适用于活动实时位置。 |
| heading | Integer | *可选*。用户移动的方向，以度为单位；范围为 1-360。仅适用于活动的实时位置。 |
| proximity_alert_radius | Integer | *可选*。接近提醒的最大距离，以米为单位，用于提醒接近其他聊天成员。仅适用于已发送的实时位置。 |

#### Venue
> **场所对象**

此对象代表一个地点。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| location | [Location](#location) | 场地位置。不能是实时位置 |
| title | String | 场馆名称 |
| address | String | 场地地址 |
| foursquare_id | String | *可选*。场所的 Foursquare 标识符 |
| foursquare_type | String | *可选*。场所的 Foursquare 类型。（例如，“arts_entertainment/default”、“arts_entertainment/aquarium”或“food/icecream”。） |
| google_place_id | String | *可选*。场地的 Google Places 标识符 |
| google_place_type | String | *可选*。场所的 Google Places 类型。（参见[支持的类型](https://developers.google.com/places/web-service/supported_types)。） |

#### WebAppData
> **Web 应用数据对象**

描述从 [Web App](https://core.telegram.org/bots/webapps) 发送给机器人的数据。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| data | String | 数据。请注意，不可信客户端可能会在该字段中发送任意数据。 |
| button_text | String | 打开 Web App 的 *web_app* 键盘按钮的文本。请注意，不可信客户端可能会在该字段中发送任意数据。 |

#### ProximityAlertTriggered
> **接近警报触发对象**

此对象表示服务消息的内容，每当聊天中的用户触发由另一用户设置的接近警报时发送。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| traveler | [User](#user) | 触发警报的用户 |
| watcher | [User](#user) | 设置警报的用户 |
| distance | Integer | 用户之间的距离 |

#### MessageAutoDeleteTimerChanged
> **消息自动删除定时器变更对象**

此对象表示关于自动删除计时器设置变更的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| message_auto_delete_time | Integer | 聊天中消息的新自动删除时间；以秒为单位 |

#### ChatBoostAdded
> **聊天助力添加对象**

此对象表示关于用户提升聊天等级的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| boost_count | Integer | 用户添加的提升次数 |

#### BackgroundFill
> **背景填充对象**

此对象描述了基于所选颜色填充背景的方式。目前，它可以是以下之一：

* [BackgroundFillSolid](#backgroundfillsolid)
* [BackgroundFillGradient](#backgroundfillgradient)
* [BackgroundFillFreeformGradient](#backgroundfillfreeformgradient)

#### BackgroundFillSolid
> **纯色背景填充**

背景使用所选颜色填充。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 背景填充类型，始终为“solid” |
| color | Integer | RGB24 格式的背景填充颜色 |

#### BackgroundFillGradient
> **渐变背景填充**

背景为渐变填充。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 背景填充的类型，始终为“gradient” |
| top_color | Integer | 渐变的顶部颜色，采用 RGB24 格式 |
| bottom_color | Integer | 渐变的底部颜色，采用 RGB24 格式 |
| rotation_angle | Integer | 背景填充的顺时针旋转角度，以度为单位；范围 0-359 |

#### BackgroundFillFreeformGradient
> **自由渐变背景填充**

背景是一个自由形式的渐变，在聊天中每条消息后都会旋转。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 背景填充的类型，始终为“freeform_gradient” |
| colors | Array of Integer | 用于在 RGB24 格式中生成自由形式渐变的 3 或 4 种基色列表 |

#### BackgroundType
> **背景类型对象**

此对象描述背景的类型。目前，它可以是以下之一：

* [BackgroundTypeFill](#backgroundtypefill)
* [BackgroundTypeWallpaper](#backgroundtypewallpaper)
* [BackgroundTypePattern](#backgroundtypepattern)
* [BackgroundTypeChatTheme](#backgroundtypechattheme)

#### BackgroundTypeFill
> **填充背景类型**

背景会根据所选颜色自动填充。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 背景类型，始终为“fill” |
| fill | [BackgroundFill](#backgroundfill) | 背景填充 |
| dark_theme_dimming | Integer | 暗色主题下背景调暗程度，以百分比表示；范围 0-100 |

#### BackgroundTypeWallpaper
> **壁纸背景类型**

背景是一张 JPEG 格式的壁纸。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 背景的类型，始终为“wallpaper” |
| document | [Document](#document) | 带壁纸的文档 |
| dark_theme_dimming | Integer | 暗色主题下背景的变暗程度，以百分比表示；0-100 |
| is_blurred | True | *可选*。若为 *True*，则壁纸会先缩放到适合 450x450 的正方形内，然后进行半径为 12 的方框模糊处理 |
| is_moving | True | *可选*。当设备倾斜时，如果背景会轻微移动，则设为 *True* |

#### BackgroundTypePattern
> **图案背景类型**

背景是一个 .PNG 或 .TGV（SVG 的 gzip 压缩子集，MIME 类型为 "application/x-tgwallpattern"）图案，将与用户选择的背景填充相结合。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 背景的类型，始终为“pattern” |
| document | [Document](#document) | 带模式的文档 |
| fill | [BackgroundFill](#backgroundfill) | 与图案结合的背景填充 |
| intensity | Integer | 图案在填充背景上方显示时的强度；0-100 |
| is_inverted | True | *可选*。 *True* 表示背景填充仅应用于图案本身。在这种情况下，所有其他像素均为黑色。仅适用于深色主题 |
| is_moving | True | *可选*。当设备倾斜时，如果背景会轻微移动，则设为 *True* |

#### BackgroundTypeChatTheme
> **聊天主题背景类型**

背景直接取自内置的聊天主题。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 背景类型，始终为“chat_theme” |
| theme_name | String | 聊天主题的名称，通常是一个表情符号 |

#### ChatBackground
> **聊天背景对象**

此对象表示一个聊天背景。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | [BackgroundType](#backgroundtype) | 背景类型 |

#### ForumTopicCreated
> **论坛主题创建对象**

此对象表示聊天中创建新论坛主题的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| name | String | 主题名称 |
| icon_color | Integer | 主题图标的 RGB 格式颜色 |
| icon_custom_emoji_id | String | *可选*。作为话题图标显示的自定义表情符号的唯一标识符 |

#### ForumTopicClosed
> **论坛主题关闭对象**

此对象表示聊天中论坛主题已关闭的服务消息。目前不包含任何信息。

#### ForumTopicEdited
> **论坛主题编辑对象**

此对象表示论坛主题已编辑的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| name | String | *可选*。话题的新名称，如果已被编辑 |
| icon_custom_emoji_id | String | *可选*。作为话题图标显示的自定义表情符号的新标识符，如果已被编辑；如果图标被移除，则为空字符串 |

#### ForumTopicReopened
> **论坛主题重开对象**

此对象表示聊天中论坛主题重新开启的服务消息。目前不包含任何信息。

#### GeneralForumTopicHidden
> **通用论坛主题隐藏对象**

此对象表示聊天中通用论坛主题被隐藏的服务消息。目前不包含任何信息。

#### GeneralForumTopicUnhidden
> **通用论坛主题取消隐藏对象**

此对象表示聊天中关于通用论坛主题取消隐藏的服务消息。目前不包含任何信息。

#### SharedUser
> **共享用户对象**

此对象包含通过 [KeyboardButtonRequestUsers](#keyboardbuttonrequestusers) 按钮与机器人共享的用户信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| user_id | Integer | 共享用户的标识符。此数字可能超过 32 位有效位，某些编程语言在解析时可能存在困难或静默缺陷。但其最多只有 52 位有效位，因此使用 64 位整数或双精度浮点类型存储这些标识符是安全的。机器人可能无法访问该用户，因此可能无法使用此标识符，除非机器人已通过其他方式知晓该用户。 |
| first_name | String | *可选*。用户的名字，如果机器人请求了该信息 |
| last_name | String | *可选*。用户的姓氏，如果机器人请求了姓名 |
| username | String | *可选*。用户名称，如果机器人请求了用户名 |
| photo | Array of [PhotoSize](#photosize) | *可选*。聊天照片的可用尺寸，如果机器人请求了照片 |

#### UsersShared
> **用户已共享对象**

此对象包含通过 [KeyboardButtonRequestUsers](#keyboardbuttonrequestusers) 按钮与机器人共享其标识符的用户信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| request_id | Integer | 请求标识符 |
| users | Array of [SharedUser](#shareduser) | 与机器人共享的用户信息。 |

#### ChatShared
> **聊天已共享对象**

此对象包含通过 [KeyboardButtonRequestChat](#keyboardbuttonrequestchat) 按钮与机器人共享的聊天信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| request_id | Integer | 请求的标识符 |
| chat_id | Integer | 共享聊天的标识符。此数字可能超过 32 位有效位，某些编程语言在解析时可能会遇到困难或出现静默缺陷。但它最多只有 52 位有效位，因此使用 64 位整数或双精度浮点类型来存储此标识符是安全的。机器人可能无法访问该聊天，因此可能无法使用此标识符，除非机器人已通过其他方式知晓该聊天。 |
| title | String | *可选*。聊天的标题，如果机器人请求了标题。 |
| username | String | *可选*。聊天用户名，如果机器人请求且该信息可用。 |
| photo | Array of [PhotoSize](#photosize) | *可选*。聊天照片的可用尺寸，如果机器人请求了照片 |

#### WriteAccessAllowed
> **允许写入权限对象**

此对象表示一个服务消息，内容为用户在以下情况后允许机器人发送消息：将其添加到附件菜单、从链接启动 Web 应用，或接受通过 [requestWriteAccess](https://core.telegram.org/bots/webapps#initializing-mini-apps) 方法发送的 Web 应用的明确请求。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| from_request | Boolean | *可选*。若用户接受由 Web App 通过方法 requestWriteAccess 发送的明确请求后授予访问权限，则为 *True*。 |
| web_app_name | String | *可选*。若从链接启动 Web App 时授予访问权限，则为该 Web App 的名称。 |
| from_attachment_menu | Boolean | *可选*。若在将机器人添加到附件或侧边菜单时授予访问权限，则为 *True*。 |

#### VideoChatScheduled
> **视频聊天已安排对象**

此对象表示聊天中预定的视频聊天服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| start_date | Integer | 视频聊天应由聊天管理员开始的时刻（Unix 时间戳） |

#### VideoChatStarted
> **视频聊天已开始对象**

此对象表示聊天中视频聊天已开始的服务消息。目前不包含任何信息。

#### VideoChatEnded
> **视频聊天已结束对象**

此对象表示聊天中视频聊天已结束的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| duration | Integer | 视频聊天时长（秒） |

#### VideoChatParticipantsInvited
> **视频聊天参与者受邀对象**

此对象表示关于新成员被邀请加入视频聊天的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| users | Array of [User](#user) | 被邀请加入视频聊天的新成员 |

#### PaidMessagePriceChanged
> **付费消息价格变更对象**

描述聊天中付费消息价格变更的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| paid_message_star_count | Integer | 超级群聊中非管理员用户发送每条消息必须支付的新 Telegram Stars 数量 |

#### DirectMessagePriceChanged
> **私信价格变更对象**

描述了一项关于向频道聊天发送私信价格变更的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| are_direct_messages_enabled | Boolean | *True*，如果频道聊天启用了私信功能；否则为 *false* |
| direct_message_star_count | Integer | *可选*。用户向频道发送每条私信必须支付的新 Telegram Stars 数量。不适用于已被管理员豁免的用户。默认为 0。 |

#### SuggestedPostApproved
> **建议帖子已批准对象**

描述关于建议帖子获得批准的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| suggested_post_message | [Message](#message) | *可选*。包含建议帖子的消息。注意，即使该消息本身是回复，此字段中的 [Message](#message) 对象也不会包含 *reply_to_message* 字段。 |
| price | [SuggestedPostPrice](#suggestedpostprice) | *可选*。为帖子支付的金额 |
| send_date | Integer | 帖子计划发布的日期 |

#### SuggestedPostApprovalFailed
> **建议帖子批准失败对象**

描述关于建议帖子审批失败的服务消息。目前仅由审批时用户资金不足导致。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| suggested_post_message | [Message](#message) | *可选*。包含审批失败的建议发布消息。注意：此字段中的 [Message](#message) 对象即使本身是回复，也不会包含 *reply_to_message* 字段。 |
| price | [SuggestedPostPrice](#suggestedpostprice) | 帖子的预期价格 |

#### SuggestedPostDeclined
> **建议帖子已拒绝对象**

描述关于建议帖子被拒绝的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| suggested_post_message | [Message](#message) | *可选*。包含建议帖子的消息。注意：此字段中的 [Message](#message) 对象即使本身是回复，也不会包含 *reply_to_message* 字段。 |
| comment | String | *可选*。帖子被拒绝时附带的评论 |

#### SuggestedPostPaid
> **建议帖子已支付对象**

描述关于付费推广帖子成功支付的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| suggested_post_message | [Message](#message) | *可选*。包含建议帖子的消息。注意：此字段中的 [Message](#message) 对象即使本身是回复，也不会包含 *reply_to_message* 字段。 |
| currency | String | 支付所使用的货币。目前可能为“XTR”（Telegram Stars）或“TON”（toncoins） |
| amount | Integer | *可选*。频道收到的货币数量（单位：纳吨币）；仅适用于 toncoins 支付 |
| star_amount | [StarAmount](#staramount) | *可选*。频道收到的 Telegram Stars 数量；仅适用于 Telegram Stars 支付 |

#### SuggestedPostRefunded
> **建议帖子已退款对象**

描述关于建议帖子支付退款的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| suggested_post_message | [Message](#message) | *可选*。包含建议帖子的消息。注意：此字段中的 [Message](#message) 对象即使本身是回复，也不会包含 *reply_to_message* 字段。 |
| reason | String | 退款原因。目前为以下之一：“post_deleted”（帖子发布后 24 小时内被删除或从定时消息中移除未发布）或“payment_refunded”（付款人退款）。 |

#### GiveawayCreated
> **赠品创建对象**

此对象表示关于创建定时抽奖的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| prize_star_count | Integer | *可选*。将在抽奖获胜者之间分配的 Telegram Stars 数量；仅适用于 Telegram Stars 抽奖 |

#### Giveaway
> **赠品对象**

此对象表示一条关于已安排抽奖的消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chats | Array of [Chat](#chat) | 用户必须加入的聊天列表才能参与赠品活动 |
| winners_selection_date | Integer | 赠品获奖者将被选定的时间点（Unix 时间戳） |
| winner_count | Integer | 应被选为赠品中奖者的用户数量 |
| only_new_members | True | *可选*。*True* 表示仅允许在赠品活动开始后加入聊天的用户有资格获奖 |
| has_public_winners | True | *可选*。*True* 表示所有用户均可查看赠品获奖者名单 |
| prize_description | String | *可选*。额外赠品奖品的描述 |
| country_codes | Array of String | *可选*。两个字母组成的 [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) 国家代码列表，指定合格用户必须来自的国家。若为空，所有用户均可参与。拥有在 Fragment 上购买的手机号的用户始终可以参与抽奖活动。 |
| prize_star_count | Integer | *可选*。Telegram Stars 在抽奖获胜者之间分配的数量；仅适用于 Telegram Stars 抽奖 |
| premium_subscription_month_count | Integer | *可选*。从赠品活动中赢得的 Telegram Premium 订阅将生效的月数；仅适用于 Telegram Premium 赠品活动 |

#### GiveawayWinners
> **赠品获胜者对象**

此对象代表一条关于公开获奖者抽奖活动完成的消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 创建抽奖的聊天 |
| giveaway_message_id | Integer | 聊天中带有抽奖信息的消息标识符 |
| winners_selection_date | Integer | 赠品获奖者被选中的时间点（Unix 时间戳） |
| winner_count | Integer | 赠品活动的获奖者总数 |
| winners | Array of [User](#user) | 最多 100 名赠品获奖者名单 |
| additional_chat_count | Integer | *可选*。用户为获得赠品资格而必须加入的其他聊天数量 |
| prize_star_count | Integer | *可选*。在抽奖获胜者之间分配的 Telegram Stars 数量；仅适用于 Telegram Stars 抽奖 |
| premium_subscription_month_count | Integer | *可选*。从赠品活动中赢得的 Telegram Premium 订阅将有效的月数；仅适用于 Telegram Premium 赠品活动 |
| unclaimed_prize_count | Integer | *可选*。未分配奖品数量 |
| only_new_members | True | *可选*。*True* 表示仅在抽奖开始后加入聊天的用户具备获奖资格 |
| was_refunded | True | *可选*。*True* 表示赠品因付款被退款而取消 |
| prize_description | String | *可选*。额外赠品描述 |

#### GiveawayCompleted
> **赠品完成对象**

此对象表示关于无公开获奖者的赠品活动已结束的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| winner_count | Integer | 赠品活动中的获奖者数量 |
| unclaimed_prize_count | Integer | *可选*。未分配奖品数量 |
| giveaway_message | [Message](#message) | *可选*。已完成但未删除的赠品活动消息 |
| is_star_giveaway | True | *可选*。*True* 表示该赠品为 Telegram Stars 赠品。否则当前为 Telegram Premium 赠品活动。 |

#### LinkPreviewOptions
> **链接预览选项对象**

描述用于生成链接预览的选项。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| is_disabled | Boolean | *可选*。若链接预览被禁用，则为 *True* |
| url | String | *可选*。用于生成链接预览的 URL。若为空，将使用消息文本中找到的第一个 URL |
| prefer_small_media | Boolean | *可选*。若链接预览中的媒体应缩小。若 URL 未显式指定或该预览不支持媒体尺寸调整，则忽略 |
| prefer_large_media | Boolean | *可选*。若链接预览中的媒体应放大。若 URL 未显式指定或该预览不支持媒体尺寸调整，则忽略 |
| show_above_text | Boolean | *可选*。若链接预览必须显示在消息文本上方；否则显示在消息文本下方 |

#### SuggestedPostPrice
> **建议帖子价格对象**

描述建议帖子的价格。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| currency | String | 支付帖子所使用的货币。目前必须是“XTR”（Telegram Stars）或“TON”（toncoins）之一 |
| amount | Integer | 将为帖子支付的该货币金额，以该货币的最小单位表示（Telegram Stars 或纳吨币）。目前，Telegram Stars 的价格必须在 5 到 100000 之间，nanotoncoins 的价格必须在 10000000 到 10000000000000 之间 |

#### SuggestedPostInfo
> **建议帖子信息对象**

包含有关推荐帖子的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| state | String | 建议帖子的状态。目前可能为“pending”、“approved”、“declined” |
| price | [SuggestedPostPrice](#suggestedpostprice) | *可选*。帖子的建议价格。若省略则为未付费 |
| send_date | Integer | *可选*。建议帖子的发送日期。若省略，则帖子可在 30 天内任何时间发布，由批准该帖子的用户或管理员自行决定 |

#### SuggestedPostParameters
> **建议帖子参数对象**

包含由机器人建议的帖子的参数。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| price | [SuggestedPostPrice](#suggestedpostprice) | *可选*。帖子的建议价格。若省略则为未付费 |
| send_date | Integer | *可选*。帖子的建议发送日期。若指定，则日期必须在未来 300 到 2678400 秒（30 天）之间。若省略，则帖子可在 30 天内任何时间发布，由批准帖子的用户自行决定 |

#### DirectMessagesTopic
> **私信主题对象**

描述私信聊天的话题。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| topic_id | Integer | 主题的唯一标识符。此数字可能超过 32 位有效位，某些编程语言在解析时可能存在困难或静默缺陷。但其最多只有 52 位有效位，因此使用 64 位整数或双精度浮点类型存储此标识符是安全的。 |
| user | [User](#user) | *可选*。创建该话题的用户信息。目前始终存在 |

#### UserProfilePhotos
> **用户个人资料照片对象**

此对象代表用户的个人资料图片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| total_count | Integer | 目标用户拥有的个人资料照片总数 |
| photos | Array of Array of [PhotoSize](#photosize) | 请求的个人资料照片（每种尺寸最多 4 张） |

#### File
> **文件对象**

此对象表示一个可供下载的文件。该文件可通过链接 `https://api.telegram.org/file/bot<token>/<file_path>` 下载。保证该链接至少在一小时内有效。当链接过期时，可通过调用 [getFile](#getfile) 来请求新的链接。

> 可下载的最大文件大小为 20 MB

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 此文件的唯一标识符，预期在不同时间和不同机器人之间保持一致。无法用于下载或重复使用该文件 |
| file_size | Integer | *可选*。文件大小（字节）。该值可能大于 2^31，某些编程语言在解析时可能会遇到困难或出现静默缺陷。但其最多只有 52 个有效位，因此使用有符号 64 位整数或双精度浮点类型来存储此值是安全的 |
| file_path | String | *可选*。文件路径。使用 `https://api.telegram.org/file/bot<token>/<file_path>` 获取文件 |

#### WebAppInfo
> **Web 应用信息对象**

描述一个 [Web 应用](https://core.telegram.org/bots/webapps) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| url | String | 一个 HTTPS URL，用于打开一个 Web App，并附带 [Initializing Web Apps](https://core.telegram.org/bots/webapps#initializing-mini-apps) 中指定的额外数据 |

#### ReplyKeyboardMarkup
> **回复键盘标记对象**

此对象代表一个带有回复选项的[自定义键盘](https://core.telegram.org/bots/features#keyboards) （详情和示例请参阅[机器人简介](https://core.telegram.org/bots/features#keyboards) ）。在频道中以及代表 Telegram 企业账户发送的消息中不受支持。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| keyboard | Array of Array of [KeyboardButton](#keyboardbutton) | 按钮行数组，每行由一组 [KeyboardButton](#keyboardbutton) 对象表示 |
| is_persistent | Boolean | *可选*。要求客户端在常规键盘隐藏时始终显示此键盘。默认为 false，此时自定义键盘可被隐藏，并通过键盘图标重新打开。 |
| resize_keyboard | Boolean | *可选*。请求客户端垂直调整键盘大小以实现最佳适配（例如，如果只有两行按钮，则使键盘变小）。默认为 false，在这种情况下，自定义键盘始终与应用程序的标准键盘高度相同。 |
| one_time_keyboard | Boolean | *可选*。请求客户端在使用键盘后立即隐藏。键盘仍然可用，但客户端会自动在聊天中显示通常的字母键盘——用户可以按下输入字段中的特殊按钮再次查看自定义键盘。默认为 false。 |
| input_field_placeholder | String | *可选*。当键盘处于活动状态时，输入框中显示的占位符；长度为 1-64 个字符 |
| selective | Boolean | *可选*。若您希望仅向特定用户显示键盘，请使用此参数。目标用户包括：1) 在消息对象的文本中被@提及的用户；2) 如果机器人的消息是对同一聊天和论坛主题中某条消息的回复，则为原始消息的发送者。示例：用户请求更改机器人的语言，机器人回复该请求并附带一个用于选择新语言的键盘。群组中的其他用户不会看到该键盘。 |

#### KeyboardButton
> **键盘按钮对象**

此对象代表回复键盘上的一个按钮。最多只能使用一个可选字段来指定按钮的类型。对于简单的文本按钮，可以使用 *String* 类型代替此对象来指定按钮文本。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| text | String | 按钮的文本。如果未使用任何可选字段，按下按钮时将作为消息发送 |
| request_users | [KeyboardButtonRequestUsers](#keyboardbuttonrequestusers) | *可选*。如果指定，按下按钮将打开一个合适的用户列表。所选用户的标识符将以“users_shared”服务消息的形式发送给机器人。仅在私人聊天中可用。 |
| request_chat | [KeyboardButtonRequestChat](#keyboardbuttonrequestchat) | *可选*。如果指定，按下按钮将打开一个合适的聊天列表。点击聊天将在一个“chat_shared”服务消息中将其标识符发送给机器人。仅在私人聊天中可用。 |
| request_contact | Boolean | *可选*。若设为 True，按下按钮时用户的电话号码将作为联系人信息发送。仅限私聊场景使用。 |
| request_location | Boolean | *可选*。若设为 True，按下按钮时将发送用户的实时位置。仅限私聊场景使用。 |
| request_poll | [KeyboardButtonPollType](#keyboardbuttonpolltype) | *可选*。如果指定，当用户按下按钮时，系统将要求用户创建一个投票并将其发送给机器人。仅在私聊中可用。 |
| web_app | [WebAppInfo](#webappinfo) | *可选*。若指定此项，按下按钮时将启动所描述的网页应用。该网页应用将能够发送“web_app_data”服务消息。仅限私聊中使用。 |

**注意：***request_users* 和 *request_chat* 选项仅在 2023 年 2 月 3 日之后发布的 Telegram 版本中生效。旧版客户端将显示*不支持的消息* 。

#### KeyboardButtonRequestUsers
> **请求用户键盘按钮对象**

此对象定义了用于请求合适用户的标准。当按下相应按钮时，所选用户的信息将与机器人共享。 [更多关于请求用户的信息 »](https://core.telegram.org/bots/features#chat-and-user-selection)

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| request_id | Integer | 将在 [UsersShared](#usersshared) 对象中接收到的请求的带符号 32 位标识符。在消息中必须是唯一的 |
| user_is_bot | Boolean | *可选*。传递 True 以请求机器人，传递 False 以请求普通用户。如果未指定，则不应用额外限制。 |
| user_is_premium | Boolean | *可选*。传递 True 以请求高级用户，传递 False 以请求非高级用户。如果未指定，则不应用额外限制。 |
| max_quantity | Integer | *可选*。要选择的用户最大数量；1-10。默认为 1。 |
| request_name | Boolean | *可选*。传递 True 以请求用户的名字和姓氏 |
| request_username | Boolean | *可选*。传递 True 以请求用户的用户名 |
| request_photo | Boolean | *可选*。传递 True 以请求用户的照片 |

#### KeyboardButtonRequestChat
> **请求聊天键盘按钮对象**

此对象定义了用于请求合适聊天的标准。当按下相应按钮时，所选聊天的信息将与机器人共享。如果条件允许，机器人将被授予在聊天中请求的权限。 [更多关于请求聊天的信息 »](https://core.telegram.org/bots/features#chat-and-user-selection)。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| request_id | Integer | 请求的带符号 32 位标识符，将在 [ChatShared](#chatshared) 对象中返回。该标识符在消息中必须唯一 |
| chat_is_channel | Boolean | 传递 True 以请求一个频道聊天，传递 False 以请求一个群组或超级群组聊天。 |
| chat_is_forum | Boolean | *可选*。传递 True 以请求一个论坛超级群组，传递 False 以请求一个非论坛聊天。如果未指定，则不应用额外限制。 |
| chat_has_username | Boolean | *可选*。传递 True 以请求一个带用户名的超级群组或频道，传递 False 以请求一个不带用户名的聊天。如果未指定，则不应用额外限制。 |
| chat_is_created | Boolean | *可选*。传递 True 以请求一个属于用户的聊天。否则，不应用额外的限制。 |
| user_administrator_rights | [ChatAdministratorRights](#chatadministratorrights) | *可选*。一个 JSON 序列化对象，列出用户在聊天中所需的管理员权限。必须为 *bot_administrator_rights* 的超集。 |
| bot_administrator_rights | [ChatAdministratorRights](#chatadministratorrights) | *可选*。一个 JSON 序列化对象，列出机器人在聊天中所需的管理员权限。必须为 *user_administrator_rights* 的子集。 |
| bot_is_member | Boolean | *可选*。传递 True 以请求一个机器人作为成员的聊天。否则，不应用额外限制。 |
| request_title | Boolean | *可选*。传递 True 以请求聊天标题 |
| request_username | Boolean | *可选*。传递 True 以请求聊天用户名 |
| request_photo | Boolean | *可选*。传递 True 以请求聊天照片 |

#### KeyboardButtonPollType
> **投票类型键盘按钮对象**

此对象表示投票的类型，当按下相应按钮时允许创建并发送。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | *可选*。如果传递了 *quiz*，用户将只能在测验模式下创建投票。如果传递了 *regular*，则只允许创建常规投票。否则，用户将被允许创建任何类型的投票。 |

#### ReplyKeyboardRemove
> **移除回复键盘对象**

当收到包含此对象的消息时，Telegram 客户端将移除当前的自定义键盘，并显示默认的字母键盘。默认情况下，自定义键盘会一直显示，直到机器人发送新的键盘。但一次性键盘例外，它们在用户按下按钮后会立即隐藏（参见 [ReplyKeyboardMarkup](#replykeyboardmarkup)）。此功能在频道中以及代表 Telegram 企业账户发送的消息中不受支持。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| remove_keyboard | True | 请求客户端移除自定义键盘（用户将无法召唤此键盘；若想隐藏键盘但保持其可访问性，请在 [ReplyKeyboardMarkup](#replykeyboardmarkup) 中使用 *one_time_keyboard* 参数） |
| selective | Boolean | *可选*。若您希望仅对特定用户移除键盘，请使用此参数。目标对象包括：1) 在消息对象的文本中被@提及的用户；2) 若机器人消息是对同一聊天和论坛主题中某条消息的回复，则原消息的发送者亦为目标。示例：某用户在投票中投票后，机器人回复投票消息并发送确认信息，同时移除该用户的键盘，而对尚未投票的用户仍显示带有投票选项的键盘。 |

#### InlineKeyboardMarkup
> **内联键盘标记对象**

此对象代表一个[内联键盘](https://core.telegram.org/bots/features#inline-keyboards) ，它紧邻其所属的消息显示。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| inline_keyboard | Array of Array of [InlineKeyboardButton](#inlinekeyboardbutton) | 按钮行的数组，每行由 [InlineKeyboardButton](#inlinekeyboardbutton) 对象的数组表示 |

#### InlineKeyboardButton
> **内联键盘按钮对象**

此对象表示内联键盘的一个按钮。必须使用且仅能使用一个可选字段来指定按钮的类型。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| text | String | 按钮上的标签文本 |
| url | String | *可选*。按下按钮时打开的 HTTP 或 tg:// URL。可使用 `tg://user?id=<user_id>` 通过其标识符提及用户，而无需使用用户名（若隐私设置允许）。 |
| callback_data | String | *可选*。按下按钮时，将通过 回调查询 发送给机器人的数据，长度为 1-64 字节 |
| web_app | [WebAppInfo](#webappinfo) | *可选*。用户按下按钮时将启动的 Web App 的描述。该 Web App 将能够代表用户使用 answerWebAppQuery 方法发送任意消息。仅在用户与机器人之间的私聊中可用。不支持代表 Telegram 企业账户发送的消息。 |
| login_url | [LoginUrl](#loginurl) | *可选*。一个用于自动授权用户的 HTTPS 网址。可作为 Telegram 登录小部件 的替代方案。 |
| switch_inline_query | String | *可选*。如果设置此参数，按下按钮将提示用户选择其某个聊天，打开该聊天并在输入字段中插入机器人的用户名及指定的内联查询。可为空，此时仅插入机器人的用户名。不支持在频道私信聊天中发送的消息以及代表 Telegram 企业账户发送的消息。 |
| switch_inline_query_current_chat | String | *可选*。如果设置，按下按钮将在当前聊天输入框中插入机器人的用户名和指定的内联查询。可以为空，此时仅插入机器人的用户名。这为用户提供了一种快捷方式，可在同一聊天中以内联模式打开你的机器人——适用于从多个选项中选择内容。在频道中、通过频道私信聊天发送的消息以及代表 Telegram 企业账户发送的消息中不支持此功能。 |
| switch_inline_query_chosen_chat | [SwitchInlineQueryChosenChat](#switchinlinequerychosenchat) | *可选*。如果设置此参数，按下按钮将提示用户选择指定类型的聊天之一，打开该聊天并在输入字段中插入机器人的用户名和指定的内联查询。不支持在频道私信聊天中发送的消息以及代表 Telegram 企业账户发送的消息。 |
| copy_text | [CopyTextButton](#copytextbutton) | *可选*。描述将指定文本复制到剪贴板的按钮。 |
| callback_game | [CallbackGame](#callbackgame) | *可选*。描述用户按下按钮时将启动的游戏。注意：此类按钮必须始终位于第一行的第一个位置。 |
| pay | Boolean | *可选*。指定为 True 以发送一个 支付按钮。按钮文本中的子字符串“![⭐](https://telegram.org/img/emoji/40/E2AD90.png)”和“XTR”将被替换为 Telegram Star 图标。注意：此类按钮必须始终位于第一行的第一个按钮，并且仅能在发票消息中使用。 |

#### LoginUrl
> **登录 URL 对象**

此对象代表用于自动授权用户的嵌入式键盘按钮的参数。当用户来自 Telegram 时，可作为 [Telegram 登录小部件](https://core.telegram.org/widgets/login)的绝佳替代品。用户只需点击按钮并确认登录意愿即可：

[![TITLE](https://core.telegram.org/file/811140909/1631/20k1Z53eiyY.23995/c541e89b74253623d9)](https://core.telegram.org/file/811140015/1734/8VZFkwWXalM.97872/6127fa62d8a0bf2b3c)

自 [5.7 版本](https://telegram.org/blog/privacy-discussions-web-bots#meet-seamless-web-bots)起，Telegram 应用程序已支持此类按钮。

> 示例机器人：[@discussbot](https://t.me/discussbot)

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| url | String | 当按钮被按下时，一个带有用户授权数据添加到查询字符串中的 HTTPS URL 将被打开。如果用户拒绝提供授权数据，将打开不包含用户信息的原始 URL。添加的数据与接收授权数据中描述的一致。注意：您必须始终按照检查授权中的描述，检查接收数据的哈希值以验证认证和数据完整性。 |
| forward_text | String | *可选*。转发消息中按钮的新文本。 |
| bot_username | String | *可选*。用于用户授权的机器人用户名。详情请参阅设置机器人。若未指定，将默认使用当前机器人的用户名。网址的域名必须与机器人关联的域名一致。详情请参阅将您的域名关联至机器人。 |
| request_write_access | Boolean | *可选*。传递 True 以请求你的机器人向用户发送消息的权限。 |

#### SwitchInlineQueryChosenChat
> **切换内联查询选中聊天对象**

此对象表示一个内联按钮，可将当前用户切换到指定聊天中的内联模式，并可选择设置默认内联查询。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| query | String | *可选*。默认插入到输入框中的内联查询。如果留空，则仅插入机器人的用户名。 |
| allow_user_chats | Boolean | *可选*。若可选择与用户的私聊，则为 True |
| allow_bot_chats | Boolean | *可选*。若可选择与机器人的私聊，则为 True |
| allow_group_chats | Boolean | *可选*。True 表示可以选择群组和超级群组聊天 |
| allow_channel_chats | Boolean | *可选*。True 表示可以选择频道聊天 |

#### CopyTextButton
> **复制文本按钮对象**

此对象表示一个内联键盘按钮，可将指定文本复制到剪贴板。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| text | String | 要复制到剪贴板的文本；1-256 个字符 |

#### CallbackQuery
> **回调查询对象**

此对象表示来自[内联键盘](https://core.telegram.org/bots/features#inline-keyboards)中回调按钮的传入回调查询。如果触发查询的按钮附加在机器人发送的消息上，则会存在 *message* 字段。如果按钮附加在通过机器人（在[内联模式](#inline-mode)下）发送的消息上，则会存在 *inline_message_id* 字段。字段 *data* 或 *game_short_name* 中恰好有一个会存在。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 此查询的唯一标识符 |
| from | [User](#user) | 发件人 |
| message | [MaybeInaccessibleMessage](#maybeinaccessiblemessage) | *可选*。由机器人发送的消息，该消息包含触发查询的回调按钮 |
| inline_message_id | String | *可选*。通过机器人以内联模式发送的消息标识符，该消息是查询的起源。 |
| chat_instance | String | 全局标识符，唯一对应于包含回调按钮的消息所发送到的聊天。适用于游戏中的高分记录。 |
| data | String | *可选*。与回调按钮关联的数据。请注意，发起查询的消息可能不包含带有此数据的回调按钮。 |
| game_short_name | String | *可选*。要返回的游戏的简称，作为该游戏的唯一标识符 |

> **注意：** 用户按下回调按钮后，Telegram 客户端将显示进度条，直到您调用 [answerCallbackQuery](#answercallbackquery)。因此，即使不需要向用户发送通知（例如，不指定任何可选参数），也必须通过调用 [answerCallbackQuery](#answercallbackquery) 来做出响应。

#### ForceReply
> **强制回复对象**

当收到包含此对象的消息时，Telegram 客户端将向用户显示回复界面（就像用户选择了机器人的消息并点击了"回复"一样）。如果你想创建用户友好的分步界面，同时又不牺牲[隐私模式](https://core.telegram.org/bots/features#privacy-mode) ，这将非常有用。在频道中以及代表 Telegram 企业账户发送的消息中不受支持。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| force_reply | Boolean | 向用户显示回复界面，就像他们手动选择了机器人的消息并点击了“回复”一样 |
| input_field_placeholder | String | *可选*。当回复处于活动状态时，输入字段中显示的占位符；长度为 1-64 个字符 |
| selective | Boolean | *可选*。若您希望仅强制特定用户回复，可使用此参数。目标对象包括：1) 在消息对象的文本中被@提及的用户；2) 若机器人消息是对同一聊天和论坛主题中某条消息的回复，则原消息发送者亦为目标对象。 |

> **示例：** 某群组[投票机器人](https://t.me/PollBot)在隐私模式下运行（仅接收指令、回复其消息及提及）。创建新投票可能存在两种方式：
> 
> * 向用户解释如何发送带参数的指令（例如 /newpoll 问题 答案 1 答案 2）。可能吸引硬核用户，但缺乏现代设计的精致感。
> * 引导用户完成分步流程。“请发送您的问题”、“很好，现在添加第一个答案选项”、“太棒了。继续添加答案选项，准备就绪后发送 /done”。
> 
> 最后一个选项无疑更具吸引力。而且，如果你在机器人的提问中使用[强制回复](#forcereply) ，那么即使机器人只接收回复、命令和提及，它也能收到用户的答案——用户无需进行任何额外操作。

#### ChatPhoto
> **聊天照片对象**

此对象表示聊天照片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| small_file_id | String | 小尺寸（160x160）聊天照片的文件标识符。此 file_id 仅可用于下载照片，且仅在照片未被更改时有效。 |
| small_file_unique_id | String | 小尺寸（160x160）聊天照片的唯一文件标识符，该标识符预期在不同时间和不同机器人之间保持一致。无法用于下载或重复使用该文件。 |
| big_file_id | String | 大尺寸（640x640）聊天照片的文件标识符。此 file_id 仅可用于照片下载，且仅在照片未被更改期间有效。 |
| big_file_unique_id | String | 大尺寸（640x640）聊天照片的唯一文件标识符，该标识符预期在不同时间和不同机器人之间保持一致。无法用于下载或重复使用该文件。 |

#### ChatInviteLink
> **聊天邀请链接对象**

表示聊天邀请链接。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| invite_link | String | 邀请链接。如果该链接由其他聊天管理员创建，则链接的第二部分将被替换为“...”。 |
| creator | [User](#user) | 链接创建者 |
| creates_join_request | Boolean | True，表示通过链接加入聊天的用户需要管理员批准 |
| is_primary | Boolean | True，表示该链接为主要链接 |
| is_revoked | Boolean | True，表示链接已撤销 |
| name | String | *可选*。邀请链接名称 |
| expire_date | Integer | *可选*。链接将过期或已过期的时间点（Unix 时间戳） |
| member_limit | Integer | *可选*。通过此邀请链接加入聊天后，可同时成为聊天成员的最大用户数；范围 1-99999 |
| pending_join_request_count | Integer | *可选*。使用此链接创建的待处理加入请求数量 |
| subscription_period | Integer | *可选*。订阅在下次付款前保持活跃的秒数 |
| subscription_price | Integer | *可选*。用户在初始和每个后续订阅周期需要支付的 Telegram Stars 数量，以通过该链接成为聊天成员 |

#### ChatAdministratorRights
> **聊天管理员权限对象**

代表聊天中管理员的权限。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| is_anonymous | Boolean | True，表示用户在聊天中的存在状态是隐藏的 |
| can_manage_chat | Boolean | True，表示管理员可访问聊天事件日志、获取助力列表、查看隐藏的超级群组与频道成员、举报垃圾消息、忽略慢速模式，以及无需支付 Telegram Stars 即可发送消息。此权限由任何其他管理员权限隐含。 |
| can_delete_messages | Boolean | True，表示管理员可以删除其他用户的消息 |
| can_manage_video_chats | Boolean | True，表示管理员可以管理视频聊天 |
| can_restrict_members | Boolean | True，表示管理员可以限制、封禁或解封聊天成员，或访问超级群组统计信息 |
| can_promote_members | Boolean | True，表示管理员可以添加权限为其自身权限子集的新管理员，或降级由其直接或间接晋升的管理员 |
| can_change_info | Boolean | True，表示允许用户更改聊天标题、照片和其他设置 |
| can_invite_users | Boolean | True，表示允许用户邀请新用户加入聊天 |
| can_post_stories | Boolean | True，表示管理员可以向聊天发布故事 |
| can_edit_stories | Boolean | True，表示管理员可以编辑其他用户发布的故事、发布到聊天页面、置顶聊天故事，并访问聊天的故事存档 |
| can_delete_stories | Boolean | True，表示管理员可以删除其他用户发布的故事 |
| can_post_messages | Boolean | *可选*。True，表示管理员可以在频道中发布消息、批准建议的帖子或访问频道统计信息；仅适用于频道 |
| can_edit_messages | Boolean | *可选*。True，表示管理员可以编辑其他用户的消息并可置顶消息；仅适用于频道 |
| can_pin_messages | Boolean | *可选*。True，表示允许用户置顶消息；仅适用于群组和超级群组 |
| can_manage_topics | Boolean | *可选*。True，表示允许用户创建、重命名、关闭和重新开放论坛话题；仅适用于超级群组 |
| can_manage_direct_messages | Boolean | *可选*。True，表示管理员可以管理频道的直接消息并拒绝建议的帖子；仅适用于频道 |

#### ChatMemberUpdated
> **聊天成员更新对象**

该对象表示聊天成员状态的变化。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 用户所属的聊天 |
| from | [User](#user) | 执行动作并导致变更的用户 |
| date | Integer | 变更发生的日期（Unix 时间戳） |
| old_chat_member | [ChatMember](#chatmember) | 聊天成员的先前信息 |
| new_chat_member | [ChatMember](#chatmember) | 聊天成员的新信息 |
| invite_link | [ChatInviteLink](#chatinvitelink) | *可选*。用户加入聊天时使用的邀请链接；仅适用于通过邀请链接加入事件 |
| via_join_request | Boolean | *可选*。True 表示用户通过直接加入请求（未使用邀请链接）并经管理员批准后加入聊天 |
| via_chat_folder_invite_link | Boolean | *可选*。True 表示用户通过聊天文件夹邀请链接加入 |

#### ChatMember
> **聊天成员对象**

此对象包含有关聊天中一个成员的信息。目前，支持以下六种类型的聊天成员：

* [ChatMemberOwner](#chatmemberowner)
* [ChatMemberAdministrator](#chatmemberadministrator)
* [ChatMemberMember](#chatmembermember)
* [ChatMemberRestricted](#chatmemberrestricted)
* [ChatMemberLeft](#chatmemberleft)
* [ChatMemberBanned](#chatmemberbanned)

#### ChatMemberOwner
> **聊天群主成员**

代表拥有聊天室所有权并享有所有管理员权限的[聊天成员](#chatmember) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| status | String | 成员在聊天中的状态，始终为“creator” |
| user | [User](#user) | 用户信息 |
| is_anonymous | Boolean | True，表示用户在聊天中的存在状态为隐藏 |
| custom_title | String | *可选*。此用户的自定义标题 |

#### ChatMemberAdministrator
> **聊天管理员成员**

代表一个拥有某些额外权限的[聊天成员](#chatmember) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| status | String | 成员在聊天中的状态，始终为“administrator” |
| user | [User](#user) | 用户信息 |
| can_be_edited | Boolean | True，表示允许机器人编辑该用户的管理员权限 |
| is_anonymous | Boolean | True，如果用户在聊天中的存在被隐藏 |
| can_manage_chat | Boolean | True，如果管理员可以访问聊天事件日志、获取超级会员列表、查看隐藏的超级群组和频道成员、举报垃圾消息、忽略慢速模式，以及无需支付 Telegram Stars 即可向聊天发送消息。此权限隐含于任何其他管理员权限中。 |
| can_delete_messages | Boolean | 是，如果管理员可以删除其他用户的消息 |
| can_manage_video_chats | Boolean | True，表示管理员可以管理视频聊天 |
| can_restrict_members | Boolean | 如果管理员可以限制、封禁或解封聊天成员，或访问超级群组统计信息，则为 True |
| can_promote_members | Boolean | True，如果管理员可以添加权限为其自身权限子集的新管理员，或降级由其直接或间接（由用户任命的管理员所任命）晋升的管理员 |
| can_change_info | Boolean | 是，如果允许用户更改聊天标题、照片和其他设置 |
| can_invite_users | Boolean | 是，如果允许用户邀请新用户加入聊天 |
| can_post_stories | Boolean | True，表示管理员可以向聊天中发布故事 |
| can_edit_stories | Boolean | True，如果管理员可以编辑其他用户发布的故事、将故事发布到聊天页面、置顶聊天故事，并访问聊天的故事存档 |
| can_delete_stories | Boolean | 是，如果管理员可以删除其他用户发布的故事 |
| can_post_messages | Boolean | *可选*。是，如果管理员可以在频道中发布消息、批准建议的帖子或访问频道统计信息；仅适用于频道 |
| can_edit_messages | Boolean | *可选*。如果管理员可以编辑其他用户的消息并可以置顶消息，则为 True；仅适用于频道 |
| can_pin_messages | Boolean | *可选*。如果允许用户置顶消息，则为 True；仅适用于群组和超级群组 |
| can_manage_topics | Boolean | *可选*。若允许用户创建、重命名、关闭和重新开启论坛话题，则为 True；仅适用于超级群组 |
| can_manage_direct_messages | Boolean | *可选*。若管理员可管理频道的私信并拒绝建议的帖子，则为 True；仅适用于频道 |
| custom_title | String | *可选*。该用户的自定义标题 |

#### ChatMemberMember
> **聊天普通成员**

表示一个[聊天成员](#chatmember) ，该成员没有额外的特权或限制。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| status | String | 成员在聊天中的状态，始终为“member” |
| user | [User](#user) | 关于用户的信息 |
| until_date | Integer | *可选*。用户订阅到期日期；Unix 时间戳 |

#### ChatMemberRestricted
> **聊天受限成员**

表示一个在聊天中受到特定限制的[聊天成员](#chatmember) 。仅适用于超级群组。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| status | String | 该成员在聊天中的状态，始终为“restricted” |
| user | [User](#user) | 关于该用户的信息 |
| is_member | Boolean | True，表示在请求时用户是该聊天的成员 |
| can_send_messages | Boolean | True，如果允许用户发送文本消息、联系人、赠品、赠品获奖者、发票、位置和场所 |
| can_send_audios | Boolean | True，如果用户被允许发送音频 |
| can_send_documents | Boolean | True，如果用户被允许发送文档 |
| can_send_photos | Boolean | True，如果允许用户发送照片 |
| can_send_videos | Boolean | True，如果允许用户发送视频 |
| can_send_video_notes | Boolean | True，如果允许用户发送视频笔记 |
| can_send_voice_notes | Boolean | True，如果用户被允许发送语音消息 |
| can_send_polls | Boolean | True，如果用户被允许发送投票和清单 |
| can_send_other_messages | Boolean | True，如果允许用户发送动画、游戏、贴纸和使用内联机器人 |
| can_add_web_page_previews | Boolean | True，如果允许用户在其消息中添加网页预览 |
| can_change_info | Boolean | 是，如果允许用户更改聊天标题、照片和其他设置 |
| can_invite_users | Boolean | 是，如果允许用户邀请新用户加入聊天 |
| can_pin_messages | Boolean | True，如果允许用户置顶消息 |
| can_manage_topics | Boolean | True，如果允许用户创建论坛主题 |
| until_date | Integer | 该用户限制解除日期；Unix 时间戳。若为 0，则表示该用户被永久限制 |

#### ChatMemberLeft
> **聊天已离开成员**

表示当前并非聊天成员但可自行加入的[聊天成员](#chatmember) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| status | String | 成员在聊天中的状态，始终为“left” |
| user | [User](#user) | 关于用户的信息 |

#### ChatMemberBanned
> **聊天被封禁成员**

表示一个在聊天中被封禁的[聊天成员](#chatmember) ，无法返回聊天或查看聊天消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| status | String | 该成员在聊天中的状态，始终为“kicked” |
| user | [User](#user) | 关于该用户的信息 |
| until_date | Integer | 该用户限制解除的日期；Unix 时间戳。如果为 0，则表示该用户被永久封禁。 |

#### ChatJoinRequest
> **聊天加入请求对象**

表示发送给聊天的加入请求。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 接收请求的聊天 |
| from | [User](#user) | 发送加入请求的用户 |
| user_chat_id | Integer | 发送加入请求用户的私聊标识符。此数字可能超过 32 位有效位，但最多只有 52 位，因此使用 64 位整数或双精度浮点类型存储安全。机器人可在加入请求被处理前 5 分钟内使用该标识符发送消息（若无其他管理员联系该用户）。 |
| date | Integer | 请求发送日期（Unix 时间戳） |
| bio | String | *可选*。用户的个人简介 |
| invite_link | [ChatInviteLink](#chatinvitelink) | *可选*。用户发送加入请求所使用的聊天邀请链接 |

#### ChatPermissions
> **聊天权限对象**

描述非管理员用户在聊天中允许执行的操作。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| can_send_messages | Boolean | *可选*。若为 True，则允许用户发送文本消息、联系人、赠品、赠品获奖者、发票、位置和场所 |
| can_send_audios | Boolean | *可选*。*True*，若允许用户发送音频 |
| can_send_documents | Boolean | *可选*。*True*，若允许用户发送文档 |
| can_send_photos | Boolean | *可选*。*True*，若允许用户发送照片 |
| can_send_videos | Boolean | *可选*。*True*，若允许用户发送视频 |
| can_send_video_notes | Boolean | *可选*。*True*，若允许用户发送视频笔记 |
| can_send_voice_notes | Boolean | *可选*。*True*，若允许用户发送语音笔记 |
| can_send_polls | Boolean | *可选*。*True*，若允许用户发送投票和清单 |
| can_send_other_messages | Boolean | *可选*。*True*，若允许用户发送动画、游戏、贴纸并使用内联机器人 |
| can_add_web_page_previews | Boolean | *可选*。*True*，若允许用户在其消息中添加网页预览 |
| can_change_info | Boolean | *可选*。*True*，若允许用户更改聊天标题、头像及其他设置；在公开超级群组中忽略 |
| can_invite_users | Boolean | *可选*。True，如果允许用户邀请新成员加入聊天 |
| can_pin_messages | Boolean | *可选*。*True*，若允许用户置顶消息；在公开超级群组中忽略 |
| can_manage_topics | Boolean | *可选*。*True*，若允许用户创建论坛主题；若省略，默认为 can_pin_messages 的值 |

#### Birthdate
> **出生日期对象**

描述用户的出生日期。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| day | Integer | 用户的出生日；1-31 |
| month | Integer | 用户出生月份；1-12 |
| year | Integer | *可选*。用户出生年份 |

#### BusinessIntro
> **业务简介对象**

包含有关 Telegram 企业账户起始页面设置的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| title | String | *可选*。业务介绍标题文本 |
| message | String | *可选*。业务介绍的消息文本 |
| sticker | [Sticker](#sticker) | *可选*。商家介绍贴纸 |

#### BusinessLocation
> **业务位置对象**

包含 Telegram 企业账户位置信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| address | String | 营业地址 |
| location | [Location](#location) | *可选*。企业所在地 |

#### BusinessOpeningHoursInterval
> **业务营业时间段对象**

描述企业营业的时间段。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| opening_minute | Integer | 以周一为起始，一周中的分钟序号，表示营业时间区间的开始；范围 0 - 7 * 24 * 60 |
| closing_minute | Integer | 以周一为起始，一周中的分钟序号，表示营业时间区间的结束；范围 0 - 8 * 24 * 60 |

#### BusinessOpeningHours
> **业务营业时间对象**

描述一家企业的营业时间。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| time_zone_name | String | 定义营业时间的时区唯一名称 |
| opening_hours | Array of [BusinessOpeningHoursInterval](#businessopeninghoursinterval) | 描述营业时间的时间间隔列表 |

#### StoryAreaPosition
> **快拍区域位置对象**

描述故事中可点击区域的位置。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| x_percentage | Float | 区域中心的横坐标，以媒体宽度的百分比表示 |
| y_percentage | Float | 区域中心的纵坐标，以媒体高度的百分比表示 |
| width_percentage | Float | 区域矩形的宽度，以媒体宽度的百分比表示 |
| height_percentage | Float | 区域矩形的高度，以媒体高度的百分比表示 |
| rotation_angle | Float | 矩形的顺时针旋转角度，以度为单位；范围 0-360 |
| corner_radius_percentage | Float | 矩形圆角的半径，以媒体宽度的百分比表示 |

#### LocationAddress
> **位置地址对象**

描述一个地点的实际地址。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| country_code | String | 该位置所在国家的两位字母 ISO 3166-1 alpha-2 国家代码 |
| state | String | *可选*。地点所在州/省 |
| city | String | *可选*。地点所在城市 |
| street | String | *可选*。位置的街道地址 |

#### StoryAreaType
> **快拍区域类型对象**

描述故事中可点击区域的类型。目前，它可以是以下之一

* [StoryAreaTypeLocation](#storyareatypelocation)
* [StoryAreaTypeSuggestedReaction](#storyareatypesuggestedreaction)
* [StoryAreaTypeLink](#storyareatypelink)
* [StoryAreaTypeWeather](#storyareatypeweather)
* [StoryAreaTypeUniqueGift](#storyareatypeuniquegift)

#### StoryAreaTypeLocation
> **位置快拍区域类型**

描述指向地点的故事区域。目前，一个故事最多可拥有 10 个地点区域。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 区域类型，始终为“location” |
| latitude | Float | 位置纬度（度） |
| longitude | Float | 位置经度（度） |
| address | [LocationAddress](#locationaddress) | *可选*。位置的地址 |

#### StoryAreaTypeSuggestedReaction
> **建议反应快拍区域类型**

描述指向建议反应的故事区域。目前，一个故事最多可以拥有 5 个建议反应区域。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 区域类型，始终为“suggested_reaction” |
| reaction_type | [ReactionType](#reactiontype) | 反应的类型 |
| is_dark | Boolean | *可选*。若反应区域背景为深色，则为 True |
| is_flipped | Boolean | *可选*。若反应区域角翻转，则为 True |

#### StoryAreaTypeLink
> **链接快拍区域类型**

描述一个指向 HTTP 或 tg://链接的故事区域。目前，一个故事最多可以包含 3 个链接区域。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 区域类型，始终为“link” |
| url | String | 点击区域时打开的 HTTP 或 tg:// URL |

#### StoryAreaTypeWeather
> **天气快拍区域类型**

描述一个包含天气信息的故事区域。目前，一个故事最多可以拥有 3 个天气区域。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 区域类型，始终为“weather” |
| temperature | Float | 温度，单位为摄氏度 |
| emoji | String | 代表天气的表情符号 |
| background_color | Integer | ARGB 格式的区域背景颜色 |

#### StoryAreaTypeUniqueGift
> **独特礼物快拍区域类型**

描述指向独特礼物的故事区域。目前，一个故事最多只能有 1 个独特礼物区域。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 区域类型，始终为“unique_gift” |
| name | String | 礼物的唯一名称 |

#### StoryArea
> **快拍区域对象**

描述故事媒体上的可点击区域。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| position | [StoryAreaPosition](#storyareaposition) | 区域位置 |
| type | [StoryAreaType](#storyareatype) | 区域类型 |

#### ChatLocation
> **聊天位置对象**

表示聊天连接到的位置。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| location | [Location](#location) | 超级群组所连接的位置。不能是实时位置。 |
| address | String | 位置地址；由聊天所有者定义，长度为 1-64 个字符 |

#### ReactionType
> **反应类型对象**

此对象描述反应的类型。目前，它可以是以下之一：
* [ReactionTypeEmoji](#reactiontypeemoji)
* [ReactionTypeCustomEmoji](#reactiontypecustomemoji)
* [ReactionTypePaid](#reactiontypepaid)

#### ReactionTypeEmoji
> **Emoji 反应类型**

该反应基于一个表情符号。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 反应类型，始终为“emoji” |
| emoji | String | 反应表情符号 |

#### ReactionTypeCustomEmoji
> **自定义 Emoji 反应类型**

该反应基于自定义表情符号。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 反应类型，始终为“custom_emoji” |
| custom_emoji_id | String | 自定义表情符号标识符 |

#### ReactionTypePaid
> **付费反应类型**

该反应已付费。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 反应类型，始终为“paid” |

#### ReactionCount
> **反应计数对象**

表示添加到消息中的反应及其被添加的次数。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | [ReactionType](#reactiontype) | 反应的类型 |
| total_count | Integer | 添加反应的次数 |

#### MessageReactionUpdated
> **消息反应更新对象**

该对象表示用户对消息做出的反应变更。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 包含用户所回复消息的聊天 |
| message_id | Integer | 聊天中消息的唯一标识符 |
| user | [User](#user) | *可选*。更改反应的用户，如果用户不是匿名的 |
| actor_chat | [Chat](#chat) | *可选*。如果用户是匿名的，则代表更改反应的聊天 |
| date | Integer | 变更日期的 Unix 时间戳 |
| old_reaction | Array of [ReactionType](#reactiontype) | 用户先前设置的反应类型列表 |
| new_reaction | Array of [ReactionType](#reactiontype) | 用户设置的新反应类型列表 |

#### MessageReactionCountUpdated
> **消息反应计数更新对象**

此对象表示一条消息上匿名反应的变化。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 包含消息的聊天 |
| message_id | Integer | 聊天中的唯一消息标识符 |
| date | Integer | 变更的 Unix 时间戳日期 |
| reactions | Array of [ReactionCount](#reactioncount) | 消息上存在的反应列表 |

#### ForumTopic
> **论坛主题对象**

此对象代表一个论坛主题。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| message_thread_id | Integer | 论坛主题的唯一标识符 |
| name | String | 主题名称 |
| icon_color | Integer | 主题图标的 RGB 格式颜色 |
| icon_custom_emoji_id | String | *可选*。作为话题图标显示的自定义表情符号的唯一标识符 |

#### Gift
> **礼物对象**

此对象表示可由机器人发送的礼物。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 礼物的唯一标识符 |
| sticker | [Sticker](#sticker) | 代表礼物的贴纸 |
| star_count | Integer | 发送该贴纸需要支付的 Telegram Stars 数量 |
| upgrade_star_count | Integer | *可选*。将礼物升级为独特礼物必须支付的 Telegram Stars 数量 |
| total_count | Integer | *可选*。可发送的此类礼物总数；仅限限量礼物 |
| remaining_count | Integer | *可选*。此类型礼物剩余可赠送数量；仅限限量礼物 |
| publisher_chat | [Chat](#chat) | *可选*。关于发布礼物的聊天信息 |

#### Gifts
> **礼物列表对象**

此对象代表一份礼物列表。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| gifts | Array of [Gift](#gift) | 礼物清单 |

#### UniqueGiftModel
> **独特礼物模型对象**

这个对象描述了一个独特礼物的模型。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| name | String | 模型名称 |
| sticker | [Sticker](#sticker) | 代表独特礼物的贴纸 |
| rarity_per_mille | Integer | 每升级 1000 个礼物，获得此模型的独特礼物数量 |

#### UniqueGiftSymbol
> **独特礼物符号对象**

此对象描述了独特礼物图案上显示的符号。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| name | String | 符号名称 |
| sticker | [Sticker](#sticker) | 代表独特礼物的贴纸 |
| rarity_per_mille | Integer | 每升级 1000 个礼物中，获得此模型的独特礼物数量 |

#### UniqueGiftBackdropColors
> **独特礼物背景颜色对象**

这个对象描述了独特礼物背景的颜色。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| center_color | Integer | 背景中央的颜色，以 RGB 格式表示 |
| edge_color | Integer | 背景边缘的颜色，以 RGB 格式表示 |
| symbol_color | Integer | 应用于符号的颜色，采用 RGB 格式 |
| text_color | Integer | 背景上文本的颜色，采用 RGB 格式 |

#### UniqueGiftBackdrop
> **独特礼物背景对象**

此对象描述独特礼物的背景。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| name | String | 背景名称 |
| colors | [UniqueGiftBackdropColors](#uniquegiftbackdropcolors) | 背景颜色 |
| rarity_per_mille | Integer | 每升级 1000 个礼物中，获得此背景的独特礼物数量 |

#### UniqueGift
> **独特礼物对象**

此对象描述了一个由普通礼物升级而来的独特礼物。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| base_name | String | 此独特礼物由哪个常规礼物升级而来的人类可读名称 |
| name | String | 礼物的唯一名称。此名称可用于 `https://t.me/nft/...` 链接和故事区域 |
| number | Integer | 从同一常规礼物升级而来的礼物中，升级礼物的唯一编号 |
| model | [UniqueGiftModel](#uniquegiftmodel) | 礼物模型 |
| symbol | [UniqueGiftSymbol](#uniquegiftsymbol) | 礼物的象征 |
| backdrop | [UniqueGiftBackdrop](#uniquegiftbackdrop) | 礼物的背景 |
| publisher_chat | [Chat](#chat) | *可选*。关于发布礼物的聊天信息 |

#### GiftInfo
> **礼物信息对象**

描述关于已发送或接收的常规礼物的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| gift | [Gift](#gift) | 礼物信息 |
| owned_gift_id | String | *可选*。机器人收到的礼物的唯一标识符；仅当代表企业账户收到礼物时存在 |
| convert_star_count | Integer | *可选*。接收方通过兑换礼物可获得的 Telegram Stars 数量；如果无法兑换为 Telegram Stars，则省略此项 |
| prepaid_upgrade_star_count | Integer | *可选*。发送者为升级礼物能力而预付的 Telegram Stars 数量 |
| can_be_upgraded | Boolean | *可选*。True，表示该礼物可升级为独特礼物 |
| text | String | *可选*。添加到礼物的消息文本 |
| entities | Array of [MessageEntity](#messageentity) | *可选*。文本中出现的特殊实体 |
| is_private | Boolean | *可选*。True 表示发送者和礼物文本仅对礼物接收者可见；否则，所有人都能看到它们 |

#### UniqueGiftInfo
> **独特礼物信息对象**

描述关于已发送或接收的独特礼物的服务消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| gift | [UniqueGift](#uniquegift) | 关于礼物的信息 |
| origin | String | 礼物来源。目前为以下之一：“upgrade”（从常规礼物升级）、“transfer”（从其他用户或频道转移）、“resale”（从其他用户购买） |
| last_resale_star_count | Integer | *可选*。对于从其他用户购买的礼物，指为该礼物支付的价格 |
| owned_gift_id | String | *可选*。机器人收到的礼物的唯一标识符；仅当代表企业账户收到礼物时存在 |
| transfer_star_count | Integer | *可选*。转移礼物必须支付的 Telegram Stars 数量；如果机器人无法转移礼物，则省略此项 |
| next_transfer_date | Integer | *可选*。礼物可被转移的时间点（Unix 时间戳）。如果该时间点已过去，则礼物现在即可转移 |

#### OwnedGift
> **拥有的礼物对象**

此对象描述用户或聊天室收到并拥有的礼物。目前，它可以是以下类型之一：

* [OwnedGiftRegular](#ownedgiftregular)
* [OwnedGiftUnique](#ownedgiftunique)

#### OwnedGiftRegular
> **拥有的常规礼物**

描述用户或聊天所拥有的常规礼物。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 礼物类型，始终为“regular” |
| gift | [Gift](#gift) | 常规礼物信息 |
| owned_gift_id | String | *可选*。机器人礼物的唯一标识符；仅适用于代表企业账户收到的礼物 |
| sender_user | [User](#user) | *可选*。若为已知用户，则填写礼物赠送者 |
| send_date | Integer | 礼物发送的 Unix 时间戳日期 |
| text | String | *可选*。添加到礼物的消息文本 |
| entities | Array of [MessageEntity](#messageentity) | *可选*。文本中出现的特殊实体 |
| is_private | True | *可选*。True 表示仅礼物接收者可见发送者与赠言文本；否则所有用户均可见 |
| is_saved | True | *可选*。True 表示礼物将展示在账户个人资料页；仅适用于代表企业账户接收的礼物 |
| can_be_upgraded | True | *可选*。True 表示该礼物可升级为专属礼物；仅适用于代表企业账户收到的礼物 |
| was_refunded | True | *可选*。True 表示礼物已退款且不再可用 |
| convert_star_count | Integer | *可选*。接收者可领取的 Telegram Stars 数量；若礼物无法转换为 Telegram Stars，则此项省略 |
| prepaid_upgrade_star_count | Integer | *可选*。发送者为升级礼物能力而支付的 Telegram Stars 数量 |

#### OwnedGiftUnique
> **拥有的独特礼物**

描述用户或聊天所收到并拥有的独特礼物。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 礼物的类型，始终为“unique” |
| gift | [UniqueGift](#uniquegift) | 关于独特礼物的信息 |
| owned_gift_id | String | *可选*。机器人收到礼物的唯一标识符；仅适用于代表企业账户收到的礼物 |
| sender_user | [User](#user) | *可选*。如果送礼者是已知用户，则指送礼者 |
| send_date | Integer | 礼物发送的日期，以 Unix 时间表示 |
| is_saved | True | *可选*。如果礼物显示在账户的个人资料页面上，则为 True；仅适用于代表企业账户收到的礼物 |
| can_be_transferred | True | *可选*。True 表示该礼物可转让给其他所有者；仅适用于代表企业账户接收的礼物 |
| transfer_star_count | Integer | *可选*。转让礼物需支付的 Telegram Stars 数量；若机器人无法转让礼物则省略此项 |
| next_transfer_date | Integer | *可选*。礼物可转让的时间点（Unix 时间戳）。如果时间戳已过，则礼物现在可以转让 |

#### OwnedGifts
> **拥有的礼物列表**

包含用户或聊天接收并拥有的礼物列表。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| total_count | Integer | 用户或聊天室拥有的礼物总数 |
| gifts | Array of [OwnedGift](#ownedgift) | 礼物列表 |
| next_offset | String | *可选*。下一个请求的偏移量。如果为空，则表示没有更多结果 |

#### AcceptedGiftTypes
> **接受的礼物类型对象**

此对象描述了可以赠送给用户或聊天的礼物类型。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| unlimited_gifts | Boolean | True，表示接受无限常规礼物 |
| limited_gifts | Boolean | True，表示接受有限的常规礼物 |
| unique_gifts | Boolean | True，表示接受独特礼物或可免费升级为独特礼物 |
| premium_subscription | Boolean | True，表示接受 Telegram Premium 订阅 |

#### StarAmount
> **Star 数量对象**

描述 Telegram Stars 的数量。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| amount | Integer | Telegram Stars 的整数数量，四舍五入到 0；可以为负数 |
| nanostar_amount | Integer | *可选*。Telegram Stars 的 1/1000000000 份额数量；范围从 -999999999 到 999999999；当且仅当 *amount* 为非正数时，该值可以为负数 |

#### BotCommand
> **机器人指令对象**

此对象代表一个机器人命令。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| command | String | 命令文本；长度为 1-32 个字符。只能包含小写英文字母、数字和下划线。 |
| description | String | 命令的描述；长度为 1-256 个字符。 |

#### BotCommandScope
> **机器人指令范围对象**

此对象表示机器人命令所适用的范围。目前支持以下 7 种范围：

* [BotCommandScopeDefault](#botcommandscopedefault)
* [BotCommandScopeAllPrivateChats](#botcommandscopeallprivatechats)
* [BotCommandScopeAllGroupChats](#botcommandscopeallgroupchats)
* [BotCommandScopeAllChatAdministrators](#botcommandscopeallchatadministrators)
* [BotCommandScopeChat](#botcommandscopechat)
* [BotCommandScopeChatAdministrators](#botcommandscopechatadministrators)
* [BotCommandScopeChatMember](#botcommandscopechatmember)

#### Determining list of commands
> **确定指令列表**

以下算法用于确定特定用户查看机器人菜单时的命令列表。返回的是第一个被设置的命令列表：

**Commands in the chat with the bot**

* botCommandScopeChat + language_code
* botCommandScopeChat
* botCommandScopeAllPrivateChats + language_code
* botCommandScopeAllPrivateChats
* botCommandScopeDefault + language_code
* botCommandScopeDefault

**Commands in group and supergroup chats**

* botCommandScopeChatMember + language_code
* botCommandScopeChatMember
* botCommandScopeChatAdministrators + language_code（仅限管理员）
* botCommandScopeChatAdministrators（仅限管理员）
* botCommandScopeChat + language_code
* botCommandScopeChat
* botCommandScopeAllChatAdministrators + language_code（仅限管理员）
* botCommandScopeAllChatAdministrators（仅限管理员）
* botCommandScopeAllGroupChats + language_code
* botCommandScopeAllGroupChats
* botCommandScopeDefault + language_code
* botCommandScopeDefault

#### BotCommandScopeDefault
> **默认指令范围**

表示机器人命令的默认[作用域](#botcommandscope) 。如果未为用户指定[更具体作用域](#determining-list-of-commands)的命令，则使用默认命令。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 作用域类型，必须为 default |

#### BotCommandScopeAllPrivateChats
> **所有私聊指令范围**

表示机器人命令的[作用范围](#botcommandscope) ，涵盖所有私聊。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 作用域类型，必须为 all_private_chats |

#### BotCommandScopeAllGroupChats
> **所有群聊指令范围**

表示机器人命令的[作用范围](#botcommandscope) ，涵盖所有群组和超级群组聊天。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 作用域类型，必须为 all_group_chats |

#### BotCommandScopeAllChatAdministrators
> **所有聊天管理员指令范围**

代表机器人命令的[作用范围](#botcommandscope) ，涵盖所有群组和超级群组聊天管理员。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 范围类型，必须为 all_chat_administrators |

#### BotCommandScopeChat
> **特定聊天指令范围**

表示机器人命令的[作用范围](#botcommandscope) ，涵盖特定聊天。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 作用域类型，必须为 chat |
| chat_id | Integer or String | 目标聊天的唯一标识符或目标超级群的用户名（格式 @supergroupusername）。不支持频道私信聊天与频道聊天。 |

#### BotCommandScopeChatAdministrators
> **特定聊天管理员指令范围**

表示机器人命令的[作用范围](#botcommandscope) ，涵盖特定群组或超级群组聊天的所有管理员。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 作用域类型，必须为 chat_administrators |
| chat_id | Integer or String | 目标聊天的唯一标识符或目标超级群的用户名（格式 @supergroupusername）。不支持频道私信聊天与频道聊天。 |

#### BotCommandScopeChatMember
> **特定聊天成员指令范围**

表示机器人命令的[作用范围](#botcommandscope) ，涵盖群组或超级群组聊天中的特定成员。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 范围类型，必须为 chat_member |
| chat_id | Integer or String | 目标聊天的唯一标识符或目标超级群的用户名（格式 @supergroupusername）。不支持频道私信聊天与频道聊天。 |
| user_id | Integer | 目标用户的唯一标识符 |

#### BotName
> **机器人名称对象**

此对象表示机器人的名称。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| name | String | 机器人的名称 |

#### BotDescription
> **机器人描述对象**

此对象代表机器人的描述。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| description | String | 机器人的描述 |

#### BotShortDescription
> **机器人简短描述对象**

此对象代表机器人的简短描述。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| short_description | String | 机器人的简短描述 |

#### MenuButton
> **菜单按钮对象**

此对象描述了私聊中机器人的菜单按钮。它应为以下之一

* [MenuButtonCommands](#menubuttoncommands)
* [MenuButtonWebApp](#menubuttonwebapp)
* [MenuButtonDefault](#menubuttondefault)

如果为私聊设置了除 [MenuButtonDefault](#menubuttondefault) 以外的菜单按钮，则该按钮将在聊天中生效。否则将应用默认菜单按钮。默认情况下，菜单按钮会打开机器人命令列表。

#### MenuButtonCommands
> **指令菜单按钮**

表示一个菜单按钮，用于打开机器人的命令列表。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 按钮类型，必须为 commands |

#### MenuButtonWebApp
> **Web 应用菜单按钮**

表示一个菜单按钮，用于启动 [Web App](https://core.telegram.org/bots/webapps)。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 按钮类型，必须为 web_app |
| text | String | 按钮上的文本 |
| web_app | [WebAppInfo](#webappinfo) | 当用户按下按钮时将启动的 Web 应用程序的描述。该 Web 应用程序将能够代表用户使用 [answerWebAppQuery](#answerwebappquery) 方法发送任意消息。或者，可以在对象中指定一个指向机器人 Web 应用程序的 t.me 链接来代替 Web 应用程序的 URL，在这种情况下，Web 应用程序将像用户点击链接一样被打开。 |

#### MenuButtonDefault
> **默认菜单按钮**

描述未为菜单按钮设置具体值。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 按钮类型，必须为 default |

#### ChatBoostSource
> **聊天助力来源对象**

此对象描述聊天助力的来源。它可以是以下之一：
* [ChatBoostSourcePremium](#chatboostsourcepremium)
* [ChatBoostSourceGiftCode](#chatboostsourcegiftcode)
* [ChatBoostSourceGiveaway](#chatboostsourcegiveaway)

#### ChatBoostSourcePremium
> **Premium 助力来源**

该加速是通过订阅 Telegram 高级版或向其他用户赠送 Telegram 高级版订阅获得的。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 提升来源，始终为“premium” |
| user | [User](#user) | 提升聊天的用户 |

#### ChatBoostSourceGiftCode
> **礼物代码助力来源**

该提升是通过创建 Telegram 高级版礼品码来提升聊天获得的。每个此类代码在相应的 Telegram 高级版订阅期间内，可将聊天提升 4 次。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 提升来源，始终为“gift_code” |
| user | [User](#user) | 创建礼品码所对应的用户 |

#### ChatBoostSourceGiveaway
> **赠品助力来源**

该加成是通过创建 Telegram Premium 或 Telegram Stars 赠品活动获得的。对于 Telegram Premium 赠品，加成效果在相应的 Telegram Premium 订阅期间内使聊天获得 4 倍加成；对于 Telegram Stars 赠品，加成效果为 *prize_star_count* / 500 倍，持续一年。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 提升来源，始终为“giveaway” |
| giveaway_message_id | Integer | 抽奖活动聊天中某条消息的标识符；该消息可能已被删除。若消息尚未发送，可能为 0。 |
| user | [User](#user) | *可选*。若存在获奖用户，则指在赠品活动中获奖的用户；仅适用于 Telegram Premium 赠品活动 |
| prize_star_count | Integer | *可选*。抽奖获胜者之间分配的 Telegram Stars 数量；仅适用于 Telegram Stars 抽奖 |
| is_unclaimed | True | *可选*。True，表示抽奖已完成，但没有用户赢得奖品 |

#### ChatBoost
> **聊天助力对象**

此对象包含有关聊天助推的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| boost_id | String | 助推的唯一标识符 |
| add_date | Integer | 聊天被提升的时间点（Unix 时间戳） |
| expiration_date | Integer | 提升将自动到期的时间点（Unix 时间戳），除非提升者的 Telegram Premium 订阅被延长 |
| source | [ChatBoostSource](#chatboostsource) | 新增助力的来源 |

#### ChatBoostUpdated
> **聊天助力更新对象**

此对象表示添加到聊天或已更改的助力。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 已提升的聊天 |
| boost | [ChatBoost](#chatboost) | 关于聊天助力的信息 |

#### ChatBoostRemoved
> **聊天助力移除对象**

此对象表示从聊天中移除的助力。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| chat | [Chat](#chat) | 已提升的聊天 |
| boost_id | String | 提升的唯一标识符 |
| remove_date | Integer | 提升被移除的时间点（Unix 时间戳） |
| source | [ChatBoostSource](#chatboostsource) | 已移除助力的来源 |

#### UserChatBoosts
> **用户聊天助力对象**

此对象表示用户为聊天添加的助力列表。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| boosts | Array of [ChatBoost](#chatboost) | 用户添加到聊天中的助力列表 |

#### BusinessBotRights
> **业务机器人权限对象**

代表商业机器人的权限。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| can_reply | True | *可选*。True 表示机器人可在过去 24 小时内有私聊来信的私聊中发送与编辑消息 |
| can_read_messages | True | *可选*。True 表示机器人可将收到的私信标记为已读 |
| can_delete_sent_messages | True | *可选*。True 表示机器人可删除其发送的消息 |
| can_delete_all_messages | True | *可选*。True 表示机器人可删除所管理聊天中的所有私信 |
| can_edit_name | True | *可选*。True 表示机器人可编辑企业账户的名字与姓氏 |
| can_edit_bio | True | *可选*。True 表示机器人可编辑企业账户的个人简介 |
| can_edit_profile_photo | True | *可选*。True 表示机器人可编辑企业账户的个人资料照片 |
| can_edit_username | True | *可选*。True 表示机器人可编辑企业账户的用户名 |
| can_change_gift_settings | True | *可选*。True 表示机器人可更改与企业账户礼物相关的隐私设置 |
| can_view_gifts_and_stars | True | *可选*。True 表示机器人可查看企业账户的礼物与 Telegram Stars 余额 |
| can_convert_gifts_to_stars | True | *可选*。True 表示机器人可将企业账户拥有的常规礼物转换为 Telegram Stars |
| can_transfer_and_upgrade_gifts | True | *可选*。True 表示机器人可转移与升级企业账户拥有的礼物 |
| can_transfer_stars | True | *可选*。True 表示机器人可将企业账户收到的 Telegram Stars 转移到自身账户，或用于升级与转移礼物 |
| can_manage_stories | True | *可选*。True 表示机器人可代表企业账户发布、编辑与删除故事 |

#### BusinessConnection
> **业务连接对象**

描述机器人与企业账户的连接。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 业务连接的唯一标识符 |
| user | [User](#user) | 创建业务连接的企业账户用户 |
| user_chat_id | Integer | 与创建业务连接的用户进行私聊的标识符。此数字可能超过 32 位有效位，但最多只有 52 位，因此使用 64 位整数或双精度浮点类型存储此标识符是安全的。 |
| date | Integer | 连接建立的 Unix 时间戳 |
| rights | [BusinessBotRights](#businessbotrights) | *可选*。企业机器人的权限 |
| is_enabled | Boolean | True，表示连接处于活动状态 |

#### BusinessMessagesDeleted
> **业务消息删除对象**

当从关联的企业账户中删除消息时，会收到此对象。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| business_connection_id | String | 业务连接的唯一标识符 |
| chat | [Chat](#chat) | 关于企业账户中某个聊天的信息。机器人可能无法访问该聊天或相应用户。 |
| message_ids | Array of Integer | 业务账户聊天中已删除消息的标识符列表 |

#### ResponseParameters
> **响应参数对象**

描述请求失败的原因。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| migrate_to_chat_id | Integer | *可选*。该群组已迁移至具有指定标识符的超群。此数字可能超过 32 位有效位，但最多只有 52 位，因此使用有符号 64 位整数或双精度浮点类型存储此标识符是安全的。 |
| retry_after | Integer | *可选*。若超出流量控制，需等待的秒数后方可重复请求 |

#### InputMedia
> **输入媒体对象**

此对象表示待发送的媒体消息内容，应为以下类型之一：

* [InputMediaAnimation](#inputmediaanimation)
* [InputMediaDocument](#inputmediadocument)
* [InputMediaAudio](#inputmediaaudio)
* [InputMediaPhoto](#inputmediaphoto)
* [InputMediaVideo](#inputmediavideo)

#### InputMediaPhoto
> **输入照片媒体**

代表要发送的照片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 photo |
| media | String | 要发送的文件。传递一个 file_id 来发送 Telegram 服务器上已有的文件（推荐），传递一个 HTTP URL 让 Telegram 从互联网获取文件，或者传递“attach://<file_attach_name>”以使用 multipart/form-data 在 <file_attach_name> 名称下上传新文件。更多关于发送文件的信息 » |
| caption | String | *可选*。要发送的照片的说明文字，实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。用于解析照片说明中实体的模式。更多详情请参阅格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表；可用于替代 *parse_mode* 指定 |
| show_caption_above_media | Boolean | *可选*。若标题必须显示在消息媒体上方，请传递 True |
| has_spoiler | Boolean | *可选*。若需为照片添加剧透动画遮盖，请传入 True |

#### InputMediaVideo
> **输入视频媒体**

表示要发送的视频。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 video |
| media | String | 要发送的文件。传递一个 file_id 以发送 Telegram 服务器上已存在的文件（推荐），传递一个 HTTP URL 让 Telegram 从互联网获取文件，或传递“attach://<file_attach_name>”以使用 multipart/form-data 上传新文件，文件名为 <file_attach_name>。更多关于发送文件的信息 » |
| thumbnail | String | *可选*。所发送文件的缩略图；若服务器端支持生成缩略图，则可忽略。缩略图应为 JPEG 格式且小于 200 kB，宽高不超过 320。若文件未使用 multipart/form-data 上传，则忽略。缩略图不可复用，只能作为新文件上传；若缩略图通过 multipart/form-data 在 <file_attach_name> 上传，可传递“attach://<file_attach_name>”。更多关于发送文件的信息 » |
| cover | String | *可选*。消息中视频的封面。可传递 file_id、HTTP URL，或通过 multipart/form-data 以“attach://<file_attach_name>”上传新文件 |
| start_timestamp | Integer | *可选*。消息中视频的开始时间戳 |
| caption | String | *可选*。待发送视频的说明文字，实体解析后 0-1024 字符 |
| parse_mode | String | *可选*。视频说明文字中实体的解析模式。详情请参阅格式设置选项 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。说明文字中的特殊实体列表；可用于替代 *parse_mode* |
| show_caption_above_media | Boolean | *可选*。若标题必须显示在消息媒体上方，请传递 True |
| width | Integer | *可选*。视频宽度 |
| height | Integer | *可选*。视频高度 |
| duration | Integer | *可选*。视频时长（秒） |
| supports_streaming | Boolean | *可选*。若上传的视频适合流式播放，请传递 True |
| has_spoiler | Boolean | *可选*。若视频需被剧透动画覆盖，请传递 True |

#### InputMediaAnimation
> **输入动画媒体**

表示要发送的动画文件（GIF 或 H.264/MPEG-4 AVC 视频，无声音）。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 animation |
| media | String | 要发送的文件。传递 file_id（推荐）、HTTP URL，或通过 multipart/form-data 以“attach://<file_attach_name>”上传新文件（文件名为 <file_attach_name>）。更多关于发送文件的信息 » |
| thumbnail | String | *可选*。所发送文件的缩略图；服务器端支持生成缩略图时可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。未使用 multipart/form-data 上传时忽略。缩略图不可复用，只能作为新文件上传；可传递“attach://<file_attach_name>” |
| caption | String | *可选*。动画的说明文字，实体解析后 0-1024 字符 |
| parse_mode | String | *可选*。用于解析动画说明文字中实体的模式 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。说明文字中的特殊实体列表；可用于替代 *parse_mode* |
| show_caption_above_media | Boolean | *可选*。若标题必须显示在消息媒体上方，请传递 True |
| width | Integer | *可选*。动画宽度 |
| height | Integer | *可选*。动画高度 |
| duration | Integer | *可选*。动画持续时间（秒） |
| has_spoiler | Boolean | *可选*。若动画需被剧透动画覆盖，请传递 True |

#### InputMediaAudio
> **输入音频媒体**

代表一个将被视为音乐发送的音频文件。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 audio |
| media | String | 要发送的文件。传递 file_id（推荐）、HTTP URL，或通过 multipart/form-data 以“attach://<file_attach_name>”上传新文件 |
| thumbnail | String | *可选*。发送文件的缩略图；服务器端支持生成缩略图时可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。未使用 multipart/form-data 上传时忽略。缩略图不可复用，只能作为新文件上传；可传递“attach://<file_attach_name>” |
| caption | String | *可选*。音频的说明文字，实体解析后 0-1024 字符 |
| parse_mode | String | *可选*。音频说明文字中实体的解析模式 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。说明文字中的特殊实体列表；可用于替代 *parse_mode* |
| duration | Integer | *可选*。音频时长（秒） |
| performer | String | *可选*。音频表演者 |
| title | String | *可选*。音频标题 |

#### InputMediaDocument
> **输入文档媒体**

表示要发送的通用文件。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 document |
| media | String | 要发送的文件。传递 file_id（推荐）、HTTP URL，或通过 multipart/form-data 以“attach://<file_attach_name>”上传新文件（文件名为 <file_attach_name>） |
| thumbnail | String | *可选*。所发送文件的缩略图；服务器端支持生成缩略图时可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。未使用 multipart/form-data 上传时忽略。缩略图不可复用，只能作为新文件上传；可传递“attach://<file_attach_name>” |
| caption | String | *可选*。文档的说明文字，实体解析后 0-1024 字符 |
| parse_mode | String | *可选*。文档说明文字中实体的解析模式 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。说明文字中的特殊实体列表；可用于替代 *parse_mode* |
| disable_content_type_detection | Boolean | *可选*。禁用对通过 multipart/form-data 上传文件的自动服务器端内容类型检测；若文档作为相册的一部分发送，则始终为 True |

#### InputFile
> **输入文件对象**

此对象表示要上传的文件内容。必须使用 multipart/form-data 方式，按照通常通过浏览器上传文件的方式进行发布。

#### InputPaidMedia
> **输入付费媒体对象**

此对象描述要发送的付费媒体内容。目前，它可以是以下类型之一：

* [InputPaidMediaPhoto](#inputpaidmediaphoto)
* [InputPaidMediaVideo](#inputpaidmediavideo)

#### InputPaidMediaPhoto
> **输入付费照片媒体**

要发送的付费媒体是一张照片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 媒体类型，必须为 photo |
| media | String | 要发送的文件。传递 file_id（推荐）、HTTP URL，或通过 multipart/form-data 以“attach://<file_attach_name>”在 <file_attach_name> 名称下上传新文件 |

#### InputPaidMediaVideo
> **输入付费视频媒体**

付费媒体发送的内容是视频。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 媒体类型，必须为 video |
| media | String | 要发送的文件。传递 file_id（推荐）、HTTP URL，或通过 multipart/form-data 以“attach://<file_attach_name>”在 <file_attach_name> 名称下上传新文件 |
| thumbnail | String | *可选*。发送文件的缩略图；服务器端支持生成缩略图时可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。未使用 multipart/form-data 上传时忽略。缩略图不可复用，只能作为新文件上传；可传递“attach://<file_attach_name>” |
| cover | String | *可选*。消息中视频的封面。可传递 file_id、HTTP URL，或通过 multipart/form-data 以“attach://<file_attach_name>”上传新文件 |
| start_timestamp | Integer | *可选*。消息中视频的起始时间戳 |
| width | Integer | *可选*。视频宽度 |
| height | Integer | *可选*。视频高度 |
| duration | Integer | *可选*。视频时长（秒） |
| supports_streaming | Boolean | *可选*。若上传的视频适合流媒体播放，请传递 True |

#### InputProfilePhoto
> **输入个人资料照片对象**

此对象描述要设置的个人资料照片。目前，它可以是以下之一：

* [InputProfilePhotoStatic](#inputprofilephotostatic)
* [InputProfilePhotoAnimated](#inputprofilephotoanimated)

#### InputProfilePhotoStatic
> **输入静态个人资料照片**

一张静态的.JPG 格式个人资料照片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 头像类型，必须为 static |
| photo | String | 静态头像。头像不可复用，只能作为新文件上传；若通过 multipart/form-data 在 <file_attach_name> 上传，可传递“attach://<file_attach_name>”。更多关于发送文件的信息 » |

#### InputProfilePhotoAnimated
> **输入动画个人资料照片**

一个 MPEG4 格式的动态个人资料照片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 个人资料照片的类型，必须为 animated |
| animation | String | 动态个人资料照片。不可复用，只能作为新文件上传；若通过 multipart/form-data 在 <file_attach_name> 上传，可传递“attach://<file_attach_name>”。更多关于发送文件的信息 » |
| main_frame_timestamp | Float | *可选*。用作静态个人资料照片的帧的时间戳（秒）。默认为 0.0 |

#### InputStoryContent
> **输入快拍内容对象**

此对象描述要发布的故事内容。目前，它可以是以下之一

* [InputStoryContentPhoto](#inputstorycontentphoto)
* [InputStoryContentVideo](#inputstorycontentvideo)

#### InputStoryContentPhoto
> **输入快拍照片内容**

描述一张要发布为故事的图片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 内容类型，必须为 photo |
| photo | String | 作为故事发布的照片。尺寸须为 1080x1920，大小不超过 10 MB。照片不可复用，只能作为新文件上传；若通过 multipart/form-data 以 <file_attach_name> 为名上传，可传递“attach://<file_attach_name>”。更多关于发送文件的信息 » |

#### InputStoryContentVideo
> **输入快拍视频内容**

描述一个视频作为故事发布。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 内容类型，必须为 video |
| video | String | 作为故事发布的视频。尺寸须为 720x1280、可流式播放、采用 H.265 编码、MPEG4 格式下每秒加入关键帧，且不超过 30 MB。视频不可复用，只能作为新文件上传；若通过 multipart/form-data 以 <file_attach_name> 为名上传，可传递“attach://<file_attach_name>”。更多关于发送文件的信息 » |
| duration | Float | *可选*。视频的精确时长（秒）；范围 0-60 |
| cover_frame_timestamp | Float | *可选*。用作故事静态封面的帧的时间戳（秒）。默认为 0.0 |
| is_animation | Boolean | *可选*。若视频无声音，请传递 True |

#### Sending files
> **发送文件**

有三种方式可以发送文件（照片、贴纸、音频、媒体等）：

1. 如果文件已存储在 Telegram 服务器的某个位置，您无需重新上传：每个文件对象都有一个 **file_id** 字段，只需将此 **file_id** 作为参数传递，而无需上传。通过这种方式发送的文件**没有限制** 。
2. 向 Telegram 提供要发送文件的 HTTP URL。Telegram 将下载并发送该文件。照片最大为 5 MB，其他类型内容最大为 20 MB。
3. 使用 multipart/form-data 以通常通过浏览器上传文件的方式发布文件。照片最大为 10 MB，其他文件最大为 50 MB。

**通过 file_id 发送**

* 通过 **file_id** 重新发送时，无法更改文件类型。也就是说， [视频](#video)不能[作为照片发送](#sendphoto) ， [照片](#photosize)不能[作为文档发送](#senddocument) ，等等。
* 无法重新发送缩略图。
* 通过 **file_id** 重新发送照片时，会发送其所有[尺寸](#photosize) 。
* **file_id** 对于每个独立的机器人是唯一的，并且**不能**从一个机器人转移到另一个机器人。
* **file_id** 唯一标识一个文件，但即使对于同一个机器人，一个文件也可能拥有多个有效的 **file_id**。

**通过 URL 发送**

* 通过 URL 发送时，目标文件必须具有正确的 MIME 类型（例如，[sendAudio](#sendaudio) 需要 audio/mpeg 等）。
* 在 [sendDocument](#senddocument) 中，通过 URL 发送目前仅适用于 **.PDF** 和 **.ZIP** 文件。
* 要使用 [sendVoice](#sendvoice)，文件类型必须为 audio/ogg 且大小不超过 1MB。1-20MB 的语音消息将以文件形式发送。
* 其他配置或许可行，但我们无法保证其稳定性。

#### Accent Colors
> **强调色**

标识符为 0（红色）、1（橙色）、2（紫色/紫罗兰色）、3（绿色）、4（青色）、5（蓝色）、6（粉色）的颜色可通过应用主题进行自定义。此外，以下 RGB 格式的颜色目前正在使用中。

| 颜色标识符 | 浅色模式 | 深色模式 |
| :--- | :--- | :--- |
| 7 | E15052 F9AE63 | FF9380 992F37 |
| 8 | E0802B FAC534 | ECB04E C35714 |
| 9 | A05FF3 F48FFF | C697FF 5E31C8 |
| 10 | 27A910 A7DC57 | A7EB6E 167E2D |
| 11 | 27ACCE 82E8D6 | 40D8D0 045C7F |
| 12 | 3391D4 7DD3F0 | 52BFFF 0B5494 |
| 13 | DD4371 FFBE9F | FF86A6 8E366E |
| 14 | 247BED F04856 FFFFFF | 3FA2FE E5424F FFFFFF |
| 15 | D67722 1EA011 FFFFFF | FF905E 32A527 FFFFFF |
| 16 | 179E42 E84A3F FFFFFF | 66D364 D5444F FFFFFF |
| 17 | 2894AF 6FC456 FFFFFF | 22BCE2 3DA240 FFFFFF |
| 18 | 0C9AB3 FFAD95 FFE6B5 | 22BCE2 FF9778 FFDA6B |
| 19 | 7757D6 F79610 FFDE8E | 9791FF F2731D FFDB59 |
| 20 | 1585CF F2AB1D FFFFFF | 3DA6EB EEA51D FFFFFF |

#### Profile Accent Colors
> **个人资料强调色**

目前，个人资料背景正在使用以下 RGB 格式的颜色。

| 颜色标识符 | 浅色模式 | 深色模式 |
| :--- | :--- | :--- |
| 0 | BA5650 | 9C4540 |
| 1 | C27C3E | 945E2C |
| 2 | 956AC8 | 715099 |
| 3 | 49A355 | 33713B |
| 4 | 3E97AD | 387E87 |
| 5 | 5A8FBB | 477194 |
| 6 | B85378 | 944763 |
| 7 | 7F8B95 | 435261 |
| 8 | C9565D D97C57 | 994343 AC583E |
| 9 | CF7244 CC9433 | 8F552F A17232 |
| 10 | 9662D4 B966B6 | 634691 9250A2 |
| 11 | 3D9755 89A650 | 296A43 5F8F44 |
| 12 | 3D95BA 50AD98 | 306C7C 3E987E |
| 13 | 538BC2 4DA8BD | 38618C 458BA1 |
| 14 | B04F74 D1666D | 884160 A65259 |
| 15 | 637482 7B8A97 | 53606E 384654 |

#### Inline mode objects
> **内联模式对象**

内联模式中使用的对象和方法在[内联模式章节](#inline-mode)中有详细说明。

### 可用方法

> Bot API 中的所有方法均不区分大小写。我们支持 **GET** 和 **POST** 两种 HTTP 方法。在 Bot API 请求中传递参数时，可使用 [URL 查询字符串](https://en.wikipedia.org/wiki/Query_string) 、*application/json*、*application/x-www-form-urlencoded* 或 *multipart/form-data* 格式。调用成功后，将返回包含结果的 JSON 对象。

#### getMe
> **获取机器人信息**

一个用于测试机器人认证令牌的简单方法。无需参数。以[用户](#user)对象的形式返回关于机器人的基本信息。

#### logOut
> **退出登录**

使用此方法在本地启动机器人前从云端 Bot API 服务器注销。在本地运行机器人前**必须**先注销，否则无法保证机器人能收到更新。成功调用后，可立即在本地服务器登录，但 10 分钟内无法重新登录云端 Bot API 服务器。成功时返回 *True*。无需参数。

#### close
> **关闭机器人实例**

在将机器人实例从一台本地服务器迁移到另一台之前，请使用此方法关闭机器人实例。在调用此方法之前，您需要删除 webhook，以确保服务器重启后不会再次启动机器人。在机器人启动后的前 10 分钟内，此方法将返回错误 429。成功时返回 *True*。无需参数。

#### sendMessage
> **发送消息**

使用此方法发送文本消息。成功时，将返回已发送的 [消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| text | String | 是 | 要发送的消息文本，实体解析后长度为 1-4096 个字符 |
| parse_mode | String | 否 | 用于解析消息文本中实体的模式。详情请参阅[格式设置选项](#formatting-options) |
| entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，这些实体出现在消息文本中，可替代 *parse_mode* 指定 |
| link_preview_options | [LinkPreviewOptions](#linkpreviewoptions) | 否 | 消息的链接预览生成选项 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容，禁止转发与保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；将从机器人的余额扣除相关 Stars |
| message_effect_id | String | 否 | 将添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) 或 [ReplyKeyboardMarkup](#replykeyboardmarkup) 或 [ReplyKeyboardRemove](#replykeyboardremove) 或 [ForceReply](#forcereply) | 否 | 额外的界面选项。内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### Formatting options
> **格式化选项**

Bot API 支持消息的基本格式设置。您可以在机器人消息中使用粗体、斜体、下划线、删除线、剧透文本、块引用以及内联链接和预格式化代码。Telegram 客户端将相应地渲染这些格式。您可以直接指定文本实体，或使用 Markdown 风格或 HTML 风格的格式设置。

请注意，Telegram 客户端在打开内联链接（"打开此链接？"以及完整 URL）之前会向用户显示**警告** 。

消息实体可以嵌套，但需满足以下限制条件：- 如果两个实体有共同字符，则其中一个必须完全包含在另一个内部。- *粗体* 、 *斜体* 、 *下划线* 、 *删除线*和*剧透*实体可以包含其他任何实体，也可以成为其他任何实体的一部分，但*预格式化文本*和*代码*实体除外。- *块引用*和*可展开块引用*实体不能嵌套。- 所有其他实体不能相互包含。

链接 `tg://user?id=<user_id>` 可用于通过用户标识符提及用户，而无需使用用户名。请注意：

* 这些链接**仅**在用作内联链接或内联键盘按钮时有效。例如，在消息文本中使用时，它们将不起作用。
* 除非用户是被提及的聊天群组的成员，否则只有在用户过去曾与机器人私聊过，或通过内联按钮向机器人发送过回调查询，并且未为机器人启用“转发消息”隐私设置时，这些提及才保证有效。

您可以在 [libprisma#supported-languages](https://github.com/TelegramMessenger/libprisma#supported-languages) 中找到支持语法高亮的编程和标记语言列表。

###### MarkdownV2 style
> **MarkdownV2 样式**

要使用此模式，请在 *parse_mode* 字段中传递 *MarkdownV2*。在您的消息中使用以下语法：

````
*bold \*text*
_italic \*text_
__underline__
~strikethrough~
||spoiler||
*bold _italic bold ~italic bold strikethrough ||italic bold strikethrough spoiler||~ __underline italic bold___ bold*
[inline URL](http://www.example.com/)
[inline mention of a user](tg://user?id=123456789)
![](tg://emoji?id=5368324170671202286)
`inline fixed-width code`
```
pre-formatted fixed-width code block
```
```python
pre-formatted fixed-width code block written in the Python programming language
```
>Block quotation started
>Block quotation continued
>Block quotation continued
>Block quotation continued
>The last line of the block quotation
**>The expandable block quotation started right after the previous block quotation
>It is separated from the previous block quotation by an empty bold entity
>Expandable block quotation continued
>Hidden by default part of the expandable block quotation started
>Expandable block quotation continued
>The last line of the expandable block quotation with the expandability mark||
````

请注意：

* 任何代码在 1 到 126 之间（含）的字符都可以在任何地方通过在前面加上 '\' 字符进行转义，在这种情况下，它将被视为普通字符，而不是标记的一部分。这意味着 '\' 字符通常必须通过在前面加上 '\' 字符进行转义。
* 在 `pre` 和 `code` 元素内部，所有 '`' 和 '\' 字符必须通过前置 '\' 字符进行转义。
* 在行内链接和自定义表情符号定义的 `(...)` 部分内，所有 ')' 和 '\' 必须通过前置 '\' 字符进行转义。
* 在所有其他位置，字符 '_'、'*'、'['、']'、'('、')'、'~'、'`'、'>'、'#'、'+'、'-'、'='、'|'、'{'、'}'、'.'、'!' 必须通过前置字符 '\' 进行转义。
* 当 `italic` 和 `underline` 实体之间存在歧义时，`__` 总是从左到右贪婪地被视为 `underline` 实体的开始或结束。因此，应使用 `___italic underline_**__` 而非 `___italic underline___`，通过添加一个空粗体实体作为分隔符。
* 必须提供一个有效的表情符号作为自定义表情符号的替代值。在无法显示自定义表情符号的地方（例如，系统通知）或消息被非高级用户转发时，将显示该表情符号而非自定义表情符号。建议使用自定义表情符号[贴纸](#sticker)的 **emoji** 字段中的表情符号。
* 自定义表情符号实体只能由在 [Fragment](https://fragment.com/) 上购买了额外用户名的机器人使用。

###### HTML style
> **HTML 样式**

要使用此模式，请在 *parse_mode* 字段中传递 *HTML*。目前支持以下标签：

```
<b>bold</b>, <strong>bold</strong>
<i>italic</i>, <em>italic</em>
<u>underline</u>, <ins>underline</ins>
<s>strikethrough</s>, <strike>strikethrough</strike>, <del>strikethrough</del>
<span class="tg-spoiler">spoiler</span>, <tg-spoiler>spoiler</tg-spoiler>
<b>bold <i>italic bold <s>italic bold strikethrough <span class="tg-spoiler">italic bold strikethrough spoiler</span></s> <u>underline italic bold</u></i> bold</b>
<a href="http://www.example.com/">inline URL</a>
<a href="tg://user?id=123456789">inline mention of a user</a>
<tg-emoji emoji-id="5368324170671202286"></tg-emoji>
<code>inline fixed-width code</code>
<pre>pre-formatted fixed-width code block</pre>
<pre><code class="language-python">pre-formatted fixed-width code block written in the Python programming language</code></pre>
<blockquote>Block quotation started\nBlock quotation continued\nThe last line of the block quotation</blockquote>
<blockquote expandable>Expandable block quotation started\nExpandable block quotation continued\nExpandable block quotation continued\nHidden by default part of the block quotation started\nExpandable block quotation continued\nThe last line of the block quotation</blockquote>
```

请注意：

* 目前仅支持上述提及的标签。
* 所有不属于标签或 HTML 实体的 `<`、`>` 和 `&` 符号都必须替换为对应的 HTML 实体（`<` 替换为 `&lt;`，`>` 替换为 `&gt;`，`&` 替换为 `&amp;`）。
* 支持所有数字 HTML 实体。
* 该 API 目前仅支持以下命名的 HTML 实体：`&lt;`、`&gt;`、`&amp;` 和 `&quot;`。
* 使用嵌套的 `pre` 和 `code` 标签，为 `pre` 实体定义编程语言。
* 独立 `code` 标签无法指定编程语言。
* 有效的表情符号必须用作 `tg-emoji` 标签的内容。在无法显示自定义表情符号的地方（例如系统通知）或消息被非高级用户转发时，将显示该表情符号以替代自定义表情符号。建议使用自定义表情符号[贴纸](#sticker)的 **emoji** 字段中的表情符号。
* 自定义表情符号实体仅限在 [Fragment](https://fragment.com/) 上购买了额外用户名的机器人使用。

###### Markdown style
> **Markdown 样式**

这是一个遗留模式，为向后兼容而保留。要使用此模式，请在 *parse_mode* 字段中传递 *Markdown*。在您的消息中使用以下语法：

````
*bold text*
_italic text_
[inline URL](http://www.example.com/)
[inline mention of a user](tg://user?id=123456789)
`inline fixed-width code`
```
pre-formatted fixed-width code block
```
```python
pre-formatted fixed-width code block written in the Python programming language
```
````

请注意：

* 实体不得嵌套，请改用解析模式 [MarkdownV2](#markdownv2-style)。
* 无法指定“下划线”、“删除线”、“剧透”、“引用块”、“可展开引用块”和“自定义表情符号”实体，请改用 [MarkdownV2](#markdownv2-style) 解析模式。
* 要转义实体外的字符 '_'、'*'、'`'、'['，请在它们前面加上字符 '\'。
* 不允许在实体内部进行转义，因此必须先关闭实体再重新打开：使用 `_snake___case_` 表示斜体 `snake_case`，使用 `*2*\**2=4*` 表示粗体 `2*2=4`。

#### Paid Broadcasts
> **付费广播**

默认情况下，所有机器人每秒最多可向用户广播 [30 条消息](https://core.telegram.org/bots/faq#my-bot-is-hitting-limits-how-do-i-avoid-this)。开发者可通过在 [@Botfather](https://t.me/botfather) 中启用 *Paid Broadcasts* 功能来提升此限制——使其机器人能够实现每秒 **高达 1000 条消息** 的广播能力。

超出每秒 30 条免费额度的每条广播消息将产生 0.1 Stars/条 的费用，该费用从机器人账户的 Telegram Stars 余额中扣除。使用此功能前，机器人账户余额需至少持有 *10,000 Stars*。

> 提升限额的机器人仅对成功广播的消息计费。

#### forwardMessage
> **转发消息**

使用此方法可转发任何类型的消息。服务消息及受保护内容的消息无法被转发。操作成功后，将返回已发送的 [Message](#message)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将被转发的私信话题标识符；若转发到私信聊天则必需 |
| from_chat_id | Integer or String | 是 | 原始消息发送的聊天唯一标识符（或频道用户名，格式为 `@channelusername`） |
| video_start_timestamp | Integer | 否 | 消息中转发视频的新起始时间戳 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护转发消息的内容不被转发和保存 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个包含建议发送帖子参数的 JSON 序列化对象；仅适用于私信聊天 |
| message_id | Integer | 是 | 在 *from_chat_id* 指定的聊天中的消息标识符 |

#### forwardMessages
> **批量转发消息**

使用此方法可转发任意类型的多条消息。如果某些指定消息无法找到或转发，它们将被跳过。服务消息和受保护内容的消息无法被转发。转发消息时会保持相册分组。成功时，将返回已发送消息的 [MessageId](#messageid) 数组。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将被转发的私聊话题标识符；若转发到私信聊天则必需 |
| from_chat_id | Integer or String | 是 | 原始消息发送的聊天唯一标识符（或频道用户名，格式为 `@channelusername`） |
| message_ids | Array of Integer | 是 | 一个 JSON 序列化的列表，包含 1 到 100 个来自 *from_chat_id* 的消息标识符用于转发。必须严格递增顺序 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护转发消息的内容不被转发和保存 |

#### copyMessage
> **复制消息**

使用此方法可复制任何类型的消息。服务消息、付费媒体消息、抽奖消息、抽奖获胜者消息和发票消息无法被复制。只有当机器人知晓字段 *correct_option_id* 的值时，才能复制测验 [poll](#poll)。此方法类似于 [forwardMessage](#forwardmessage)，但复制的消息不会链接到原始消息。成功时返回已发送消息的 [MessageId](#messageid)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| from_chat_id | Integer or String | 是 | 原始消息发送的聊天唯一标识符（或频道用户名，格式为 `@channelusername`） |
| message_id | Integer | 是 | 在 *from_chat_id* 指定的聊天中的消息标识符 |
| video_start_timestamp | Integer | 否 | 消息中复制视频的新起始时间戳 |
| caption | String | 否 | 媒体新字幕，实体解析后 0-1024 个字符。如未指定，则保留原字幕 |
| parse_mode | String | 否 | 用于解析新字幕中实体的模式。详情参阅 [formatting options](#formatting-options) |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 新字幕中的特殊实体列表；可用于替代 *parse_mode* |
| show_caption_above_media | Boolean | 否 | 若标题必须显示在消息媒体上方，请传递 True；未指定新标题时忽略 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息的内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以允许每秒最多 1000 条消息，忽略广播限制，每条消息费用 0.1 Telegram Stars；从机器人余额扣除 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个包含建议发送帖子参数的 JSON 序列化对象；仅适用于私信聊天。若作为对另一建议帖子的回复发送，则该建议帖子将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 回复消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) 或 [ReplyKeyboardMarkup](#replykeyboardmarkup) 或 [ReplyKeyboardRemove](#replykeyboardremove) 或 [ForceReply](#forcereply) | 否 | 附加界面选项。内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### copyMessages
> **批量复制消息**

使用此方法可复制任何类型的消息。如果某些指定消息无法找到或复制，它们将被跳过。服务消息、付费媒体消息、抽奖消息、抽奖获奖者消息和发票消息无法被复制。只有当机器人知晓字段 *correct_option_id* 的值时，才能复制测验 [投票](#poll) 。此方法类似于 [forwardMessages](#forwardmessages) 方法，但复制的消息不会链接到原始消息。对于复制的消息，相册分组将被保留。成功时，将返回已发送消息的 [MessageId](#messageid) 数组。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的唯一标识符（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将被发送到的私聊话题标识符；若消息发送到私信会话则必需 |
| from_chat_id | Integer or String | 是 | 原始消息发送的聊天的唯一标识符（或频道用户名，格式为 `@channelusername`） |
| message_ids | Array of Integer | 是 | 一个 JSON 序列化的列表，包含 1 到 100 个来自 *from_chat_id* 的消息标识符用于复制。必须严格递增顺序 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息的内容不被转发和保存 |
| remove_caption | Boolean | 否 | 传递 True 以复制消息时不包含其说明文字 |

#### sendPhoto
> **发送照片**

使用此方法发送照片。成功后，将返回已发送的 [消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| photo | [InputFile](#inputfile) or String | 是 | 要发送的照片。传递 *file_id* 作为字符串以发送 Telegram 服务器上已有的照片（推荐），传递 HTTP URL 让 Telegram 从互联网获取照片，或使用 multipart/form-data 上传新照片。照片最大 10 MB；宽度与高度之和不超过 10000；宽高比不超过 20。[更多关于发送文件 »](#sending-files) |
| caption | String | 否 | 照片说明（通过 *file_id* 重新发送时也可使用），实体解析后 0-1024 个字符 |
| parse_mode | String | 否 | 解析照片说明中实体的模式。详见 [formatting options](#formatting-options) |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在说明文字中，可替代 *parse_mode* 指定 |
| show_caption_above_media | Boolean | 否 | 若标题必须显示在消息媒体上方，请传递 True |
| has_spoiler | Boolean | 否 | 若照片需要剧透动画覆盖，请传递 True |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendAudio
> **发送音频**

使用此方法发送音频文件，如果您希望 Telegram 客户端在音乐播放器中显示它们。您的音频必须是.MP3 或.M4A 格式。成功后，返回发送的[消息](#message) 。机器人目前可以发送大小不超过 50 MB 的音频文件，此限制未来可能会更改。

如需发送语音消息，请改用 [sendVoice](#sendvoice) 方法。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| audio | [InputFile](#inputfile) or String | 是 | 要发送的音频文件。传递 *file_id* 作为字符串以发送 Telegram 服务器上已有的音频（推荐），传递 HTTP URL 让 Telegram 从互联网获取音频，或使用 multipart/form-data 上传新文件。[更多关于发送文件 »](#sending-files) |
| caption | String | 否 | 音频说明，实体解析后 0-1024 个字符 |
| parse_mode | String | 否 | 解析音频说明中实体的模式。详见 [formatting options](#formatting-options) |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在说明文字中，可替代 *parse_mode* 指定 |
| duration | Integer | 否 | 音频时长（秒） |
| performer | String | 否 | 表演者 |
| title | String | 否 | 曲目名称 |
| thumbnail | [InputFile](#inputfile) or String | 否 | 文件缩略图；若服务器端支持缩略图生成可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。仅对 multipart/form-data 上传有效；不可复用，仅可作为新文件上传，可使用“attach://<file_attach_name>”。[更多关于发送文件 »](#sending-files) |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendDocument
> **发送文档**

使用此方法发送普通文件。成功时，返回已发送的[消息](#message) 。目前，机器人可以发送大小不超过 50 MB 的任何类型的文件，此限制未来可能会更改。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| document | [InputFile](#inputfile) or String | 是 | 要发送的文件。传递 *file_id* 作为字符串以发送 Telegram 服务器上已有的文件（推荐），传递 HTTP URL 让 Telegram 从互联网获取文件，或使用 multipart/form-data 上传新文件。[更多关于发送文件 »](#sending-files) |
| thumbnail | [InputFile](#inputfile) or String | 否 | 文件缩略图；若服务器端支持缩略图生成可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。仅对 multipart/form-data 上传有效；不可复用，仅可作为新文件上传，可使用“attach://<file_attach_name>”。[更多关于发送文件 »](#sending-files) |
| caption | String | 否 | 文档说明（通过 *file_id* 重新发送时也可使用），实体解析后 0-1024 个字符 |
| parse_mode | String | 否 | 解析文档说明中实体的模式。详见 [formatting options](#formatting-options) |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在说明文字中，可替代 *parse_mode* 指定 |
| disable_content_type_detection | Boolean | 否 | 禁用对通过 multipart/form-data 上传文件的服务器端内容类型自动检测 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendVideo
> **发送视频**

使用此方法发送视频文件，Telegram 客户端支持 MPEG4 格式的视频（其他格式可能以[文档](#document)形式发送）。成功后，将返回已发送的[消息](#message) 。目前，机器人可发送大小不超过 50 MB 的视频文件，此限制未来可能调整。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| video | [InputFile](#inputfile) or String | 是 | 要发送的视频。传递 *file_id* 作为字符串以发送 Telegram 服务器上已有的视频（推荐），传递 HTTP URL 让 Telegram 从互联网获取视频，或使用 multipart/form-data 上传新视频。[更多关于发送文件 »](#sending-files) |
| duration | Integer | 否 | 已发送视频的时长（秒） |
| width | Integer | 否 | 视频宽度 |
| height | Integer | 否 | 视频高度 |
| thumbnail | [InputFile](#inputfile) or String | 否 | 文件缩略图；若服务器端支持缩略图生成可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。仅对 multipart/form-data 上传有效；不可复用，仅可作为新文件上传，可使用“attach://<file_attach_name>”。[更多关于发送文件 »](#sending-files) |
| cover | [InputFile](#inputfile) or String | 否 | 消息中的视频封面。可传递 *file_id*、HTTP URL，或使用“attach://<file_attach_name>”通过 multipart/form-data 上传新文件。[更多关于发送文件 »](#sending-files) |
| start_timestamp | Integer | 否 | 消息中视频的开始时间戳 |
| caption | String | 否 | 视频说明（通过 *file_id* 重新发送时也可使用），实体解析后 0-1024 个字符 |
| parse_mode | String | 否 | 解析视频说明中实体的模式。详见 [formatting options](#formatting-options) |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在说明文字中，可替代 *parse_mode* 指定 |
| show_caption_above_media | Boolean | 否 | 若标题必须显示在消息媒体上方，请传递 True |
| has_spoiler | Boolean | 否 | 若视频需要剧透动画覆盖，请传递 True |
| supports_streaming | Boolean | 否 | 若上传的视频适合流式播放，请传递 True |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendAnimation
> **发送动画**

使用此方法发送动画文件（GIF 或无声的 H.264/MPEG-4 AVC 视频）。成功时，返回发送的[消息](#message) 。目前，机器人可以发送大小不超过 50 MB 的动画文件，此限制未来可能会更改。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| animation | [InputFile](#inputfile) or String | 是 | 要发送的动画。传递 *file_id* 作为字符串以发送 Telegram 服务器上已有的动画（推荐），传递 HTTP URL 让 Telegram 从互联网获取动画，或使用 multipart/form-data 上传新动画。[更多关于发送文件 »](#sending-files) |
| duration | Integer | 否 | 发送动画的时长（秒） |
| width | Integer | 否 | 动画宽度 |
| height | Integer | 否 | 动画高度 |
| thumbnail | [InputFile](#inputfile) or String | 否 | 文件缩略图；若服务器端支持缩略图生成可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。仅对 multipart/form-data 上传有效；不可复用，仅可作为新文件上传，可使用“attach://<file_attach_name>”。[更多关于发送文件 »](#sending-files) |
| caption | String | 否 | 动画说明（通过 *file_id* 重新发送时也可使用），实体解析后 0-1024 个字符 |
| parse_mode | String | 否 | 解析动画说明中实体的模式。详见 [formatting options](#formatting-options) |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在说明文字中，可替代 *parse_mode* 指定 |
| show_caption_above_media | Boolean | 否 | 若标题必须显示在消息媒体上方，请传递 True |
| has_spoiler | Boolean | 否 | 若动画需要剧透动画覆盖，请传递 True |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendVoice
> **发送语音**

若希望 Telegram 客户端将音频文件显示为可播放的语音消息，请使用此方法发送音频文件。为此，您的音频文件必须是采用 OPUS 编码的 .OGG 文件、.MP3 格式或 .M4A 格式（其他格式的文件可能会作为 [音频](#audio) 或 [文档](#document) 发送）。成功后，将返回已发送的 [消息](#message) 。目前，机器人可以发送大小不超过 50 MB 的语音消息，此限制未来可能会更改。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| voice | [InputFile](#inputfile) or String | 是 | 要发送的音频文件。传递 *file_id* 作为字符串以发送 Telegram 服务器上已有的文件（推荐），传递 HTTP URL 让 Telegram 从互联网获取文件，或使用 multipart/form-data 上传新文件。[更多关于发送文件 »](#sending-files) |
| caption | String | 否 | 语音消息说明文字，实体解析后 0-1024 个字符 |
| parse_mode | String | 否 | 解析语音消息说明中实体的模式。详见 [formatting options](#formatting-options) |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在说明文字中，可替代 *parse_mode* 指定 |
| duration | Integer | 否 | 语音消息的持续时间（秒） |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendVideoNote
> **发送视频笔记**

自 [v.4.0](https://telegram.org/blog/video-messages-and-telescope) 版本起，Telegram 客户端支持发送最长 1 分钟的方形圆角 MPEG4 视频。使用此方法发送视频消息。成功时，返回已发送的 [Message](#message)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| video_note | [InputFile](#inputfile) or String | 是 | 要发送的视频笔记。传递 *file_id* 作为字符串以发送 Telegram 服务器上已有的视频笔记（推荐），或使用 multipart/form-data 上传新视频。[更多关于发送文件 »](#sending-files)。目前不支持通过 URL 发送视频笔记 |
| duration | Integer | 否 | 已发送视频的时长（秒） |
| length | Integer | 否 | 视频的宽度和高度，即视频消息的直径 |
| thumbnail | [InputFile](#inputfile) or String | 否 | 文件缩略图；若服务器端支持缩略图生成可忽略。JPEG 格式，小于 200 kB，宽高不超过 320。仅对 multipart/form-data 上传有效；不可复用，仅可作为新文件上传，可使用“attach://<file_attach_name>”。[更多关于发送文件 »](#sending-files) |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendPaidMedia
> **发送付费媒体**

使用此方法发送付费媒体。成功后，将返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的唯一标识符（格式为 `@channelusername`）。若聊天为频道，此媒体的所有 Telegram Stars 收益计入该聊天余额，否则计入机器人的余额 |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| star_count | Integer | 是 | 购买媒体访问需支付的 Telegram Stars 数量；1-10000 |
| media | Array of [InputPaidMedia](#inputpaidmedia) | 是 | 描述待发送媒体的 JSON 序列化数组；最多 10 项 |
| payload | String | 否 | 机器人定义的付费媒体载荷，0-128 字节；不对用户显示，可用于内部处理 |
| caption | String | 否 | 媒体说明，实体解析后 0-1024 个字符 |
| parse_mode | String | 否 | 解析媒体说明中实体的模式。详见 [formatting options](#formatting-options) |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在说明文字中，可替代 *parse_mode* 指定 |
| show_caption_above_media | Boolean | 否 | 若标题必须显示在消息媒体上方，请传递 True |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendMediaGroup
> **发送媒体组**

使用此方法可将一组照片、视频、文档或音频作为相册发送。文档和音频文件只能与同类型消息组合成相册。成功时，将返回已发送的[消息](#message)对象数组。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 将发送消息的私信话题标识符；若消息发送至私信聊天则必需 |
| media | Array of [InputMediaAudio](#inputmediaaudio), [InputMediaDocument](#inputmediadocument), [InputMediaPhoto](#inputmediaphoto) and [InputMediaVideo](#inputmediavideo) | 是 | 描述待发送消息的 JSON 序列化数组，必须包含 2–10 项 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护发送消息的内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |

#### sendLocation
> **发送位置**

使用此方法发送地图上的点。成功时，返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名唯一标识符（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| latitude | Float | 是 | 位置的纬度 |
| longitude | Float | 是 | 位置的经度 |
| horizontal_accuracy | Float | 否 | 位置不确定半径（米）；0-1500 |
| live_period | Integer | 否 | 位置更新周期（秒）；60-86400，或 0x7FFFFFFF 表示可无限期编辑的实时位置 |
| heading | Integer | 否 | 实时位置下，用户移动方向（度）；如指定需在 1-360 之间 |
| proximity_alert_radius | Integer | 否 | 实时位置下，接近其他成员的接近警报最大距离（米）；如指定需在 1-100000 之间 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendVenue
> **发送场所**

使用此方法发送场馆信息。成功后，将返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名唯一标识符（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| latitude | Float | 是 | 场馆纬度 |
| longitude | Float | 是 | 场馆经度 |
| title | String | 是 | 场馆名称 |
| address | String | 是 | 场馆地址 |
| foursquare_id | String | 否 | 场馆的 Foursquare 标识符 |
| foursquare_type | String | 否 | 场馆的 Foursquare 类型（例如“arts_entertainment/default”、“arts_entertainment/aquarium”或“food/icecream”） |
| google_place_id | String | 否 | 场馆的 Google Places 标识符 |
| google_place_type | String | 否 | 场馆的 Google Places 类型（参见支持的类型） |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendContact
> **发送联系人**

使用此方法发送手机联系人。成功时，返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名唯一标识符（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 论坛目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| phone_number | String | 是 | 联系人的电话号码 |
| first_name | String | 是 | 联系人的名字 |
| last_name | String | 否 | 联系人的姓氏 |
| vcard | String | 否 | 以 vCard 形式提供的联系人附加数据，0-2048 字节 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendPoll
> **发送投票**

使用此方法发送原生投票。成功时，将返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`）。投票无法发送至频道私信聊天 |
| message_thread_id | Integer | 否 | 目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| question | String | 是 | 投票问题，1-300 个字符 |
| question_parse_mode | String | 否 | 问题中解析实体的模式。详见 [formatting options](#formatting-options)。目前仅允许自定义表情实体 |
| question_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在投票问题中；可替代 *question_parse_mode* 指定 |
| options | Array of [InputPollOption](#inputpolloption) | 是 | 一个包含 2–12 个答案选项的 JSON 序列化列表 |
| is_anonymous | Boolean | 否 | 若投票需要匿名，请传递 True；默认 True |
| type | String | 否 | 投票类型，“quiz”或“regular”，默认为“regular” |
| allows_multiple_answers | Boolean | 否 | 若允许选择多个答案请传递 True；测验模式下忽略；默认 False |
| correct_option_id | Integer | 否 | 正确答案选项的从 0 开始的标识符；测验模式必需 |
| explanation | String | 否 | 当用户选择错误答案或点击灯泡图标时显示的文本，实体解析后 0–200 字符，最多 2 个换行 |
| explanation_parse_mode | String | 否 | 解析说明中实体的模式。详见 [formatting options](#formatting-options) |
| explanation_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在说明中；可替代 *explanation_parse_mode* 指定 |
| open_period | Integer | 否 | 投票创建后活跃的秒数，5–600；不可与 *close_date* 同时使用 |
| close_date | Integer | 否 | 投票自动关闭的时间点（Unix 时间戳）；至少未来 5 秒且不超过 600 秒；不可与 *open_period* 同时使用 |
| is_closed | Boolean | 否 | 若投票需立即关闭，请传递 True（适用于预览） |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息的内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendChecklist
> **发送清单**

使用此方法代表已关联的企业账户发送核对清单。成功时，将返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer | 是 | 目标聊天的唯一标识符 |
| checklist | [InputChecklist](#inputchecklist) | 是 | 待发送清单的 JSON 序列化对象 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 用于内联键盘的 JSON 序列化对象 |

#### sendDice
> **发送骰子**

使用此方法发送一个会显示随机值的动画表情。成功时，将返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 目标消息线程（主题）的唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 消息将发送到的私信主题标识符；若消息发送到私信聊天则必需 |
| emoji | String | 否 | 骰子投掷动画所基于的表情符号；必须为“🎲”“🎯”“🏀”“⚽”“🎳”或“🎰”之一；不同表情的取值范围见描述；默认为“🎲” |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息的内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 *True* 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效的唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 一个 JSON 序列化对象，包含建议发布的参数；仅限私信聊天。若作为回复发送至另一条建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项。用于内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### sendChatAction
> **发送聊天动作**

当您需要告知用户机器人端正在处理某些操作时，请使用此方法。状态将持续显示 5 秒或更短时间（当用户收到来自您机器人的消息时，Telegram 客户端会清除其输入状态）。成功时返回 *True*。

> 示例：[ImageBot](https://t.me/imagebot) 需要一些时间来处理请求并上传图片。机器人无需发送“正在获取图片，请稍候…”之类的文本消息，而是可以使用 [sendChatAction](#sendchataction) 并设置 *action* = *upload_photo*。用户将看到机器人显示“正在发送照片”的状态。

我们仅建议在机器人的响应需要**显著**时间才能到达时使用此方法。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表其发送操作的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标超级群的用户名（格式为 `@supergroupusername`）；不支持频道聊天与频道私信聊天 |
| message_thread_id | Integer | 否 | 目标消息主题的唯一标识符；仅适用于超级群组 |
| action | String | 是 | 要广播的动作类型：typing、upload_photo、record_video/upload_video、record_voice/upload_voice、upload_document、choose_sticker、find_location、record_video_note/upload_video_note |

#### setMessageReaction
> **设置消息反应**

使用此方法可更改消息上已选定的回应。某些类型的服务消息无法被回应。从频道自动转发至其讨论群组的消息，其可用回应与频道内消息相同。机器人无法使用付费回应。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| message_id | Integer | 是 | 目标消息的标识符；若消息属于媒体组，反应将设置到组中第一个未删除的消息 |
| reaction | Array of [ReactionType](#reactiontype) | 否 | 要设置在消息上的反应类型列表；机器人作为非高级用户每条消息最多可设置一个；付费反应不可用 |
| is_big | Boolean | 否 | 若需以大动画设置反应，请传递 True |

#### getUserProfilePhotos
> **获取用户个人资料照片**

使用此方法获取用户的个人资料图片列表。返回一个 [UserProfilePhotos](#userprofilephotos) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 目标用户的唯一标识符 |
| offset | Integer | 否 | 要返回的第一张照片的序号；默认返回所有照片 |
| limit | Integer | 否 | 要检索的照片数量，1–100；默认 100 |

#### setUserEmojiStatus
> **设置用户 Emoji 状态**

更改指定用户的 emoji 状态，该用户先前已通过 Mini App 方法 [requestEmojiStatusAccess](https://core.telegram.org/bots/webapps#initializing-mini-apps) 授权机器人管理其 emoji 状态。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 目标用户的唯一标识符 |
| emoji_status_custom_emoji_id | String | 否 | 要设置的 emoji 状态的自定义 emoji 标识符；传递空字符串以移除状态 |
| emoji_status_expiration_date | Integer | 否 | emoji 状态的过期日期（如有） |

#### getFile
> **获取文件**

使用此方法获取文件的基本信息并准备下载。目前，机器人可以下载大小不超过 20MB 的文件。成功时，将返回一个 [File](#file) 对象。随后可以通过链接 `https://api.telegram.org/file/bot<token>/<file_path>` 下载该文件，其中 `<file_path>` 取自响应。保证该链接至少 1 小时内有效。链接过期后，可通过再次调用 [getFile](#getfile) 来请求新的链接。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| file_id | String | 是 | 用于获取文件信息的文件标识符 |

**注意：** 此函数可能不会保留原始的文件名和 MIME 类型。您应在接收到 [File](#file) 对象时，保存文件的 MIME 类型和名称（如果可用）。

#### banChatMember
> **封禁聊天成员**

使用此方法可在群组、超级群组或频道中封禁用户。对于超级群组和频道，用户将无法通过邀请链接等方式自行返回聊天，除非先被[解除封禁](#unbanchatmember) 。机器人必须是聊天中的管理员，并且拥有相应的管理员权限才能执行此操作。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标群组的唯一标识符或目标超级群组或频道的用户名（格式为 `@channelusername`） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |
| until_date | Integer | 否 | 用户解除封禁的日期；Unix 时间。超过 366 天或少于 30 秒视为永久封禁；仅适用于超级群组与频道 |
| revoke_messages | Boolean | 否 | 传递 True 以删除该用户在聊天中的所有消息；若为 False，该用户仍可看到其被移除前的群组消息；对超级群组与频道始终为 True |

#### unbanChatMember
> **解封聊天成员**

使用此方法可在超级群组或频道中解禁先前被封禁的用户。该用户将**不会**自动返回群组或频道，但能够通过链接等方式加入。机器人必须是管理员才能执行此操作。默认情况下，此方法确保调用后该用户不再是聊天成员，但能够加入聊天。因此，如果该用户是聊天成员，他们也将被**移除**出聊天。如果不希望如此，请使用参数 *only_if_banned*。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标群组的唯一标识符或目标超级群组或频道的用户名（格式为 `@channelusername`） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |
| only_if_banned | Boolean | 否 | 若用户未被封禁则不执行任何操作 |

#### restrictChatMember
> **限制聊天成员**

使用此方法可限制超级群组中的用户。机器人必须是该超级群组的管理员，且拥有相应的管理员权限，此方法才能生效。将所有权限参数设为 *True* 可解除对用户的限制。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |
| permissions | [ChatPermissions](#chatpermissions) | 是 | 新用户权限的 JSON 序列化对象 |
| use_independent_chat_permissions | Boolean | 否 | 若聊天权限独立设置，请传递 True；否则部分权限将隐含其他发送权限 |
| until_date | Integer | 否 | 限制解除日期；Unix 时间。超过 366 天或少于 30 秒视为永久限制 |

#### promoteChatMember
> **提升聊天成员权限**

使用此方法可在超级群组或频道中提升或降级用户。机器人必须是聊天中的管理员，并且拥有相应的管理员权限，此操作才能生效。将所有布尔参数设为 *False* 可降级用户。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名或唯一标识符（格式为 `@channelusername`） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |
| is_anonymous | Boolean | 否 | 若管理员在聊天中的存在被隐藏，请传递 True |
| can_manage_chat | Boolean | 否 | 若管理员可访问聊天事件日志、获取超级会员列表、查看隐藏的超级群组和频道成员、举报垃圾信息、无视慢速模式，以及无需支付 Telegram Stars 即可向聊天发送消息，则传递 True。此权限隐含于任何其他管理员特权中。 |
| can_delete_messages | Boolean | 否 | 若管理员可以删除其他用户的消息，则传递 True |
| can_manage_video_chats | Boolean | 否 | 如果管理员可以管理视频聊天，则传递 True |
| can_restrict_members | Boolean | 否 | 若管理员可以限制、封禁或解封聊天成员，或访问超级群组统计信息，则传递 True |
| can_promote_members | Boolean | 否 | 传递 True 表示管理员可以添加拥有其自身部分权限的新管理员，或降级由其直接或间接（由他任命的被任命管理员所提升）提升的管理员。 |
| can_change_info | Boolean | 否 | 传递 True 表示管理员可以更改聊天标题、照片及其他设置 |
| can_invite_users | Boolean | 否 | 如果管理员可以邀请新用户加入聊天，则传递 True |
| can_post_stories | Boolean | 否 | 如果管理员可以向聊天中发布故事，则传递 True |
| can_edit_stories | Boolean | 否 | 如果管理员可以编辑其他用户发布的故事、将故事发布到聊天页面、置顶聊天故事以及访问聊天故事存档，则传递 True |
| can_delete_stories | Boolean | 否 | 传递 True 表示管理员可以删除其他用户发布的故事 |
| can_post_messages | Boolean | 否 | 若管理员能在频道中发布消息、批准建议的帖子或访问频道统计数据，则传递 True；仅适用于频道 |
| can_edit_messages | Boolean | 否 | 如果管理员可以编辑其他用户的消息并且可以置顶消息，则传递 True；仅适用于频道 |
| can_pin_messages | Boolean | 否 | 如果管理员可以置顶消息，则传递 True；仅适用于超级群组 |
| can_manage_topics | Boolean | 否 | 如果允许用户创建、重命名、关闭和重新打开论坛主题，则传递 True；仅适用于超级群组 |
| can_manage_direct_messages | Boolean | 否 | 如果管理员可以管理频道内的直接消息并拒绝建议的帖子，则传递 True；仅适用于频道 |

#### setChatAdministratorCustomTitle
> **设置聊天管理员自定义头衔**

使用此方法为机器人所提升的超级群组中的管理员设置自定义头衔。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |
| custom_title | String | 是 | 管理员的新自定义头衔；0-16 个字符，不允许使用 emoji |

#### banChatSenderChat
> **封禁聊天发送者聊天**

使用此方法可在超级群组或频道中封禁一个频道聊天。在被封禁的聊天[解封](#unbanchatsenderchat)之前，被封禁聊天的所有者将无法代表**其任何频道**发送消息。机器人必须是超级群组或频道的管理员，并且拥有相应的管理员权限，此方法才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| sender_chat_id | Integer | 是 | 目标发送者聊天的唯一标识符 |

#### unbanChatSenderChat
> **解封聊天发送者聊天**

使用此方法可解除超级群组或频道中先前被禁言的频道聊天。机器人必须是管理员且拥有相应的管理员权限才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| sender_chat_id | Integer | 是 | 目标发送者聊天的唯一标识符 |

#### setChatPermissions
> **设置聊天权限**

使用此方法为所有成员设置默认聊天权限。机器人必须是群组或超级群组中的管理员，并且必须拥有 *can_restrict_members* 管理员权限才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标超级群组的用户名（格式为 `@supergroupusername`） |
| permissions | [ChatPermissions](#chatpermissions) | 是 | 新默认聊天权限的 JSON 序列化对象 |
| use_independent_chat_permissions | Boolean | 否 | 若聊天权限独立设置，请传递 True；否则部分权限将隐含其他发送权限 |

#### exportChatInviteLink
> **导出聊天邀请链接**

使用此方法为聊天生成一个新的主要邀请链接；任何先前生成的主要链接将被撤销。机器人必须是聊天中的管理员，并且必须拥有适当的管理员权限才能生效。成功时返回新的邀请链接作为 *String*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |

> 注意：聊天中的每位管理员都会生成自己的邀请链接。机器人无法使用其他管理员生成的邀请链接。如果你希望你的机器人能够使用邀请链接，它需要通过 [exportChatInviteLink](#exportchatinvitelink) 或调用 [getChat](#getchat) 方法来生成自己的链接。如果你的机器人需要生成一个新的主邀请链接以替换之前的链接，请再次使用 [exportChatInviteLink](#exportchatinvitelink)。

#### createChatInviteLink
> **创建聊天邀请链接**

使用此方法为聊天创建额外的邀请链接。机器人必须是聊天中的管理员，并且拥有相应的管理员权限，此方法才能生效。链接可以通过 [revokeChatInviteLink](#revokechatinvitelink) 方法撤销。返回新的邀请链接作为 [ChatInviteLink](#chatinvitelink) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| name | String | 否 | 邀请链接名称；0-32 个字符 |
| expire_date | Integer | 否 | 链接失效的时间点（Unix 时间戳） |
| member_limit | Integer | 否 | 通过此邀请链接加入聊天后可同时成为聊天成员的最大用户数；1–99999 |
| creates_join_request | Boolean | 否 | True 表示通过该链接加入需管理员批准；为 True 时不可指定 member_limit |

#### editChatInviteLink
> **编辑聊天邀请链接**

使用此方法编辑由机器人创建的非主要邀请链接。机器人必须是聊天中的管理员，并且拥有相应的管理员权限，此操作才能生效。返回编辑后的邀请链接，作为 [ChatInviteLink](#chatinvitelink) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名或唯一标识符（格式为 `@channelusername`） |
| invite_link | String | 是 | 要编辑的邀请链接 |
| name | String | 否 | 邀请链接名称；0-32 个字符 |
| expire_date | Integer | 否 | 链接失效的时间点（Unix 时间戳） |
| member_limit | Integer | 否 | 通过该邀请链接加入后可同时成为聊天成员的最大用户数；1–99999 |
| creates_join_request | Boolean | 否 | True 表示通过该链接加入需管理员批准；为 True 时不可指定 member_limit |

#### createChatSubscriptionInviteLink
> **创建聊天订阅邀请链接**

使用此方法为频道聊天创建[订阅邀请链接](https://telegram.org/blog/superchannels-star-reactions-subscriptions#star-subscriptions) 。机器人必须拥有 *can_invite_users* 管理员权限。该链接可通过 [editChatSubscriptionInviteLink](#editchatsubscriptioninvitelink) 方法进行编辑，或通过 [revokeChatInviteLink](#revokechatinvitelink) 方法撤销。返回新的邀请链接作为 [ChatInviteLink](#chatinvitelink) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标频道聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| name | String | 否 | 邀请链接名称；0-32 个字符 |
| subscription_period | Integer | 是 | 订阅在下次付款前保持有效的秒数；当前必须为 2592000（30 天） |
| subscription_price | Integer | 是 | 用户成为聊天成员需支付的 Telegram Stars 数量（初次及每个订阅周期）；1–10000 |

#### editChatSubscriptionInviteLink
> **编辑聊天订阅邀请链接**

使用此方法编辑由机器人创建的订阅邀请链接。机器人必须拥有 *can_invite_users* 管理员权限。返回编辑后的邀请链接作为 [ChatInviteLink](#chatinvitelink) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名或唯一标识符（格式为 `@channelusername`） |
| invite_link | String | 是 | 要编辑的邀请链接 |
| name | String | 否 | 邀请链接名称；0-32 个字符 |

#### revokeChatInviteLink
> **撤销聊天邀请链接**

使用此方法可撤销由机器人创建的邀请链接。若主链接被撤销，系统将自动生成新链接。机器人必须是聊天群组的管理员，并拥有相应的管理员权限，此操作方可生效。返回被撤销的邀请链接，以 [ChatInviteLink](#chatinvitelink) 对象形式呈现。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名或唯一标识符（格式为 `@channelusername`） |
| invite_link | String | 是 | 要撤销的邀请链接 |

#### approveChatJoinRequest
> **批准聊天加入请求**

使用此方法来批准一个聊天加入请求。机器人必须是该聊天的管理员，并且拥有 *can_invite_users* 管理员权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |

#### declineChatJoinRequest
> **拒绝聊天加入请求**

使用此方法拒绝用户加入群组的请求。机器人必须是该群组的管理员，并且拥有 *can_invite_users* 管理员权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |

#### setChatPhoto
> **设置聊天照片**

使用此方法为群组设置新的头像照片。私聊无法更改头像。机器人必须是该群组的管理员，并且拥有相应的管理员权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| photo | [InputFile](#inputfile) | 是 | 新聊天照片，通过 multipart/form-data 上传 |

#### deleteChatPhoto
> **删除聊天照片**

使用此方法删除聊天照片。私聊的聊天照片无法更改。机器人必须是聊天中的管理员，并且拥有相应的管理员权限才能执行此操作。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |

#### setChatTitle
> **设置聊天标题**

使用此方法更改聊天标题。私聊的标题无法更改。机器人必须是聊天中的管理员，并且拥有相应的管理员权限，此操作才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标频道的用户名（格式为 `@channelusername`） |
| title | String | 是 | 新聊天标题，1-128 个字符 |

#### setChatDescription
> **设置聊天描述**

使用此方法可更改群组、超级群组或频道的描述。机器人必须是聊天中的管理员，并拥有相应的管理员权限才能执行此操作。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名或唯一标识符（格式为 `@channelusername`） |
| description | String | 否 | 新聊天描述，0-255 个字符 |

#### pinChatMessage
> **置顶聊天消息**

使用此方法将消息添加到聊天置顶消息列表中。在私聊和频道私信聊天中，所有非服务消息均可被置顶。反之，在群组和频道中，机器人必须分别是拥有'can_pin_messages'权限或'can_edit_messages'权限的管理员才能置顶消息。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表其置顶消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名或唯一标识符（格式为 `@channelusername`） |
| message_id | Integer | 是 | 要置顶的消息标识符 |
| disable_notification | Boolean | 否 | 若无需向所有成员发送关于新置顶消息的通知，请传递 True；频道与私聊中通知始终禁用 |

#### unpinChatMessage
> **取消置顶聊天消息**

使用此方法从聊天置顶消息列表中移除一条消息。在私聊和频道私信聊天中，所有消息均可取消置顶。反之，在群组和频道中，机器人必须分别具备'can_pin_messages'权限或'can_edit_messages'权限的管理员身份才能取消消息置顶。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表其取消置顶的业务连接唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名或唯一标识符（格式为 `@channelusername`） |
| message_id | Integer | 否 | 要取消置顶的消息标识符；指定了 *business_connection_id* 时必需；未指定则取消最近置顶的消息 |

#### unpinAllChatMessages
> **取消置顶所有聊天消息**

使用此方法可清除聊天中所有已置顶的消息列表。在私聊和频道私信聊天中，取消所有置顶消息无需额外权限。相反，在群组和频道中，机器人必须分别是拥有“can_pin_messages”权限或“can_edit_messages”权限的管理员，才能取消所有置顶消息。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的用户名或唯一标识符（格式为 `@channelusername`） |

#### leaveChat
> **离开聊天**

使用此方法让您的机器人离开群组、超级群组或频道。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组/频道的用户名或唯一标识符（格式为 `@channelusername`）；不支持频道私信聊天 |

#### getChat
> **获取聊天信息**

使用此方法获取聊天的最新信息。成功时返回一个 [ChatFullInfo](#chatfullinfo) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符或目标超级群组/频道的用户名（格式为 `@channelusername`） |

#### getChatAdministrators
> **获取聊天管理员列表**

使用此方法获取聊天中非机器人的管理员列表。返回一个由 [ChatMember](#chatmember) 对象组成的数组。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组/频道的唯一标识符或用户名（格式为 `@channelusername`） |

#### getChatMemberCount
> **获取聊天成员数量**

使用此方法获取聊天中的成员数量。成功时返回 *Int*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组/频道的唯一标识符或用户名（格式为 `@channelusername`） |

#### getChatMember
> **获取聊天成员信息**

使用此方法获取聊天成员的信息。只有当机器人是聊天管理员时，此方法才能保证对其他用户有效。成功时返回一个 [ChatMember](#chatmember) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天的唯一标识符，或目标超级群组/频道的用户名（格式为 @channelusername） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |

#### setChatStickerSet
> **设置聊天贴纸集**

使用此方法为超级群组设置新的群组贴纸集。机器人必须是聊天中的管理员，并且拥有相应的管理员权限才能生效。可通过 [getChat](#getchat) 请求中可选返回的 *can_set_sticker_set* 字段来检查机器人是否可以使用此方法。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| sticker_set_name | String | 是 | 要设置为群组贴纸集的贴纸集名称 |

#### deleteChatStickerSet
> **删除聊天贴纸集**

使用此方法从超级群组中删除群组贴纸集。机器人必须是聊天中的管理员，并且必须拥有相应的管理员权限。使用 [getChat](#getchat) 请求中可选返回的 *can_set_sticker_set* 字段来检查机器人是否可以使用此方法。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |

#### getForumTopicIconStickers
> **获取论坛主题图标贴纸**

使用此方法获取自定义表情贴纸，任何用户均可将其用作论坛话题图标。无需参数。返回一个 [Sticker](#sticker) 对象数组。

#### createForumTopic
> **创建论坛主题**

使用此方法在论坛超级群组聊天中创建一个话题。机器人必须是该聊天中的管理员，并且必须拥有 *can_manage_topics* 管理员权限。返回关于所创建话题的信息，作为一个 [ForumTopic](#forumtopic) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| name | String | 是 | 话题名称，1-128 个字符 |
| icon_color | Integer | 否 | 话题图标颜色（RGB）；目前必须为 7322096 (0x6FB9F0)、16766590 (0xFFD67E)、13338331 (0xCB86DB)、9367192 (0x8EEE98)、16749490 (0xFF93B2)、16478047 (0xFB6F5F) 之一 |
| icon_custom_emoji_id | String | 否 | 作为话题图标显示的自定义表情的唯一标识符；使用 [getForumTopicIconStickers](#getforumtopiciconstickers) 获取允许的标识符 |

#### editForumTopic
> **编辑论坛主题**

使用此方法编辑论坛超级群组聊天中话题的名称和图标。机器人必须是聊天中的管理员，并且必须拥有 *can_manage_topics* 管理员权限，除非它是话题的创建者。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| message_thread_id | Integer | 是 | 论坛话题目标消息线程的唯一标识符 |
| name | String | 否 | 新话题名称，0-128 个字符；未指定或为空则保留当前名称 |
| icon_custom_emoji_id | String | 否 | 显示为话题图标的自定义表情的新唯一标识符；传递空字符串以移除图标；未指定则保留当前图标 |

#### closeForumTopic
> **关闭论坛主题**

使用此方法来关闭论坛超级群聊中一个开放的话题。机器人必须是聊天中的管理员，并且必须拥有 *can_manage_topics* 管理员权限，除非它是话题的创建者。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| message_thread_id | Integer | 是 | 论坛话题目标消息线程的唯一标识符 |

#### reopenForumTopic
> **重新开启论坛主题**

使用此方法可在论坛超级群组聊天中重新打开已关闭的话题。机器人必须是聊天中的管理员，并且必须拥有 *can_manage_topics* 管理员权限，除非它是话题的创建者。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| message_thread_id | Integer | 是 | 论坛话题目标消息线程的唯一标识符 |

#### deleteForumTopic
> **删除论坛主题**

使用此方法可删除论坛超级群组聊天中的论坛主题及其所有消息。机器人必须是聊天中的管理员，并且必须拥有 *can_delete_messages* 管理员权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| message_thread_id | Integer | 是 | 论坛话题目标消息线程的唯一标识符 |

#### unpinAllForumTopicMessages
> **取消置顶所有论坛主题消息**

使用此方法可清除论坛话题中置顶消息的列表。机器人必须是聊天中的管理员，并且在超级群组中拥有 *can_pin_messages* 管理员权限才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| message_thread_id | Integer | 是 | 目标论坛话题消息线程的唯一标识符 |

#### editGeneralForumTopic
> **编辑通用论坛主题**

使用此方法编辑论坛超级群组聊天中“通用”话题的名称。机器人必须是聊天中的管理员，并且拥有 *can_manage_topics* 管理员权限才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |
| name | String | 是 | 新话题名称，1-128 个字符 |

#### closeGeneralForumTopic
> **关闭通用论坛主题**

使用此方法关闭论坛超级群组聊天中已开启的“通用”话题。机器人必须是聊天中的管理员，并且拥有 *can_manage_topics* 管理员权限才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |

#### reopenGeneralForumTopic
> **重新开启通用论坛主题**

使用此方法可重新开启论坛超级群聊中已关闭的“常规”话题。机器人必须是该聊天中的管理员，且拥有 *can_manage_topics* 管理员权限方可生效。若话题曾被隐藏，将自动取消隐藏。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |

#### hideGeneralForumTopic
> **隐藏通用论坛主题**

使用此方法可隐藏论坛超级群聊中的“常规”话题。机器人必须是该聊天中的管理员，且拥有 *can_manage_topics* 管理员权限方可生效。若话题处于开启状态，将自动关闭。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |

#### unhideGeneralForumTopic
> **取消隐藏通用论坛主题**

使用此方法可在论坛超级群组聊天中取消隐藏“通用”话题。机器人必须是聊天中的管理员，并且拥有 *can_manage_topics* 管理员权限才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |

#### unpinAllGeneralForumTopicMessages
> **取消置顶所有通用论坛主题消息**

使用此方法可清除通用论坛话题中所有已置顶的消息列表。机器人必须是聊天中的管理员，并且在超级群组中拥有 *can_pin_messages* 管理员权限才能生效。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标超级群组的唯一标识符（格式为 `@supergroupusername`） |

#### answerCallbackQuery
> **回应回调查询**

使用此方法来回应来自[内联键盘](https://core.telegram.org/bots/features#inline-keyboards)的回调查询。答案将以通知形式显示在聊天屏幕顶部，或以警告框形式展示给用户。成功后，返回 *True*。

> 或者，可以将用户重定向到指定的游戏 URL。要使此选项生效，你必须首先通过 [@BotFather](https://t.me/botfather) 为你的机器人创建一个游戏并接受相关条款。否则，你可以使用像 `t.me/your_bot?start=XXXX` 这样的链接，该链接将带参数打开你的机器人。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| callback_query_id | String | 是 | 待应答查询的唯一标识符 |
| text | String | 否 | 通知文本；未指定则不显示；0-200 个字符 |
| show_alert | Boolean | 否 | 为 True 时，客户端显示警告弹窗而非顶部通知；默认 false |
| url | String | 否 | 用户客户端将打开的 URL；如通过 @BotFather 创建并接受条款的游戏，指定打开游戏的 URL；否则可使用 `t.me/your_bot?start=XXXX` 打开你的机器人 |
| cache_time | Integer | 否 | 回调查询结果在客户端缓存的最大秒数；默认 0 |

#### getUserChatBoosts
> **获取用户聊天助力**

使用此方法获取用户为聊天添加的助力列表。需要管理员权限。返回一个 [UserChatBoosts](#userchatboosts) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 聊天或频道的用户名或唯一标识符（格式为 `@channelusername`） |
| user_id | Integer | 是 | 目标用户的唯一标识符 |

#### getBusinessConnection
> **获取业务连接**

使用此方法获取机器人与企业账户的连接信息。成功时返回一个 [BusinessConnection](#businessconnection) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |

#### setMyCommands
> **设置我的指令**

使用此方法来更改机器人的命令列表。有关机器人命令的更多详细信息，请参阅[此手册](https://core.telegram.org/bots/features#commands) 。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| commands | Array of [BotCommand](#botcommand) | 是 | 机器人命令列表的 JSON 序列化；最多 100 条命令 |
| scope | [BotCommandScope](#botcommandscope) | 否 | 命令适用用户范围的 JSON 序列化对象；默认为 [BotCommandScopeDefault](#botcommandscopedefault) |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码；为空则应用于给定范围中语言无专用命令的用户 |

#### deleteMyCommands
> **删除我的指令**

使用此方法删除机器人在给定范围和用户语言下的命令列表。删除后， [更高层级的命令](#determining-list-of-commands)将显示给受影响的用户。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| scope | [BotCommandScope](#botcommandscope) | 否 | 命令适用用户范围的 JSON 序列化对象；默认为 [BotCommandScopeDefault](#botcommandscopedefault) |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码；为空则应用于给定范围语言无专用命令的用户 |

#### getMyCommands
> **获取我的指令**

使用此方法获取指定范围和用户语言下机器人的当前命令列表。返回一个由 [BotCommand](#botcommand) 对象组成的数组。如果未设置命令，则返回空列表。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| scope | [BotCommandScope](#botcommandscope) | 否 | 描述用户范围的 JSON 序列化对象；默认为 [BotCommandScopeDefault](#botcommandscopedefault) |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码或空字符串 |

#### setMyName
> **设置我的名称**

使用此方法更改机器人的名称。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| name | String | 否 | 新机器人名称；0-64 个字符；传递空字符串移除指定语言的专用名称 |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码；为空则显示给无专用名称语言的所有用户 |

#### getMyName
> **获取我的名称**

使用此方法获取给定用户语言的当前机器人名称。成功时返回 [BotName](#botname)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码或空字符串 |

#### setMyDescription
> **设置我的描述**

使用此方法来更改机器人的描述，当与机器人的聊天为空时，该描述会显示在聊天中。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| description | String | 否 | 新机器人描述；0-512 个字符；传递空字符串移除指定语言的专用描述 |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码；为空则应用于所有语言无专用描述的用户 |

#### getMyDescription
> **获取我的描述**

使用此方法获取给定用户语言的当前机器人描述。成功时返回 [BotDescription](#botdescription)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码或空字符串 |

#### setMyShortDescription
> **设置我的简短描述**

使用此方法更改机器人的简短描述，该描述会显示在机器人的个人资料页面，并在用户分享机器人时与链接一同发送。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| short_description | String | 否 | 新简短描述；0-120 个字符；传递空字符串移除指定语言的专用简短描述 |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码；为空则应用于所有语言无专用简短描述的用户 |

#### getMyShortDescription
> **获取我的简短描述**

使用此方法获取指定用户语言的当前机器人简短描述。成功时返回 [BotShortDescription](#botshortdescription)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| language_code | String | 否 | 双字母 ISO 639-1 语言代码或空字符串 |

#### setChatMenuButton
> **设置聊天菜单按钮**

使用此方法可更改机器人在私聊中的菜单按钮，或默认菜单按钮。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer | 否 | 目标私聊的唯一标识符；未指定则更改默认机器人的菜单按钮 |
| menu_button | [MenuButton](#menubutton) | 否 | 机器人新菜单按钮的 JSON 序列化对象；默认为 [MenuButtonDefault](#menubuttondefault) |

#### getChatMenuButton
> **获取聊天菜单按钮**

使用此方法获取私聊中机器人菜单按钮的当前值或默认菜单按钮。成功时返回 [MenuButton](#menubutton)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer | 否 | 目标私聊的唯一标识符；未指定则返回机器人的默认菜单按钮 |

#### setMyDefaultAdministratorRights
> **设置我的默认管理员权限**

使用此方法来更改机器人被添加为群组或频道管理员时请求的默认管理员权限。这些权限将建议给用户，但用户在添加机器人前可自由修改列表。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| rights | [ChatAdministratorRights](#chatadministratorrights) | 否 | 新默认管理员权限的 JSON 序列化对象；未指定则清除默认管理员权限 |
| for_channels | Boolean | 否 | True 表示更改机器人在频道中的默认管理员权限；否则更改在群组和超级群组中的默认权限 |

#### getMyDefaultAdministratorRights
> **获取我的默认管理员权限**

使用此方法获取机器人当前的默认管理员权限。成功时返回 [ChatAdministratorRights](#chatadministratorrights)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| for_channels | Boolean | 否 | 传递 True 以获取机器人在频道中的默认管理员权限。否则，将返回机器人在群组和超级群组中的默认管理员权限。 |

#### getAvailableGifts
> **获取可用礼物**

返回机器人可向用户和频道聊天发送的礼物列表。无需参数。返回一个[礼物](#gifts)对象。

#### sendGift
> **发送礼物**

向指定用户或频道聊天发送礼物。接收方无法将此礼物兑换为 Telegram Stars。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 否 | 如果未指定 chat_id，则此项为必填。接收礼物的目标用户的唯一标识符。 |
| chat_id | Integer or String | 否 | 如果未指定 user_id，则此项为必填。接收礼物的聊天或频道的唯一标识符或用户名（格式为 @channelusername）。 |
| gift_id | String | 是 | 礼物的标识符 |
| pay_for_upgrade | Boolean | 否 | 传递 True 以使用机器人的余额支付礼物升级费用，从而使接收者免费获得升级 |
| text | String | 否 | 将随礼物一同显示的文本；0-128 个字符 |
| text_parse_mode | String | 否 | 文本中实体解析的模式。更多详情请参阅格式化选项。除“粗体”、“斜体”、“下划线”、“删除线”、“剧透”和“自定义表情符号”外的其他实体将被忽略。 |
| text_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，这些实体出现在礼物文本中。它可以用来替代 text_parse_mode。除了“粗体”、“斜体”、“下划线”、“删除线”、“剧透”和“自定义表情符号”之外的实体将被忽略。 |

#### giftPremiumSubscription
> **赠送 Premium 订阅**

向指定用户赠送 Telegram 高级订阅。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 目标用户的唯一标识符，该用户将收到 Telegram 高级订阅 |
| month_count | Integer | 是 | Telegram Premium 订阅为用户激活的月数；必须是 3、6 或 12 个月之一 |
| star_count | Integer | 是 | 支付 Telegram Premium 订阅所需的 Telegram Stars 数量；3 个月需 1000 颗，6 个月需 1500 颗，12 个月需 2500 颗 |
| text | String | 否 | 订阅服务消息旁显示的文本；0-128 个字符 |
| text_parse_mode | String | 否 | 用于解析文本中实体的模式。更多详情请参阅格式设置选项。除“粗体”、“斜体”、“下划线”、“删除线”、“剧透”和“自定义表情符号”外的其他实体将被忽略。 |
| text_entities | Array of [MessageEntity](#messageentity) | 否 | 礼物文本中出现的特殊实体的 JSON 序列化列表。可以指定此参数以替代 text_parse_mode。除“粗体”、“斜体”、“下划线”、“删除线”、“剧透”和“自定义表情符号”外的其他实体将被忽略。 |

#### verifyUser
> **验证用户**

代表机器人所属组织[验证用户](https://telegram.org/verify#third-party-verification) 。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 目标用户的唯一标识符 |
| custom_description | String | 否 | 验证的自定义描述；0-70 个字符。如果组织不允许提供自定义验证描述，则必须为空。 |

#### verifyChat
> **验证聊天**

代表由机器人代表的组织[验证聊天](https://telegram.org/verify#third-party-verification) 。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的唯一标识符（格式为 @channelusername）。频道私聊会话无法进行验证。 |
| custom_description | String | 否 | 验证的自定义描述；0-70 个字符。如果组织不允许提供自定义验证描述，则必须为空。 |

#### removeUserVerification
> **移除用户验证**

移除机器人所代表的[组织](https://telegram.org/verify#third-party-verification)当前已验证用户的验证。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 目标用户的唯一标识符 |

#### removeChatVerification
> **移除聊天验证**

移除机器人所代表的[组织](https://telegram.org/verify#third-party-verification)当前已验证聊天的验证状态。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或目标频道的唯一标识符（格式为 @channelusername） |

#### readBusinessMessage
> **已读业务消息**

以企业账户身份将接收到的消息标记为已读。需要具备 *can_read_messages* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 代表其读取消息的企业连接唯一标识符 |
| chat_id | Integer | 是 | 接收消息的聊天会话的唯一标识符。该聊天会话必须在过去 24 小时内处于活跃状态。 |
| message_id | Integer | 是 | 标记为已读消息的唯一标识符 |

#### deleteBusinessMessages
> **删除业务消息**

代表企业账户删除消息。需要具备 *can_delete_sent_messages* 企业机器人权限以删除机器人自身发送的消息，或需要 *can_delete_all_messages* 企业机器人权限以删除任意消息。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 代表其删除消息的业务连接的唯一标识符 |
| message_ids | Array of Integer | 是 | 一个 JSON 序列化的列表，包含 1 到 100 条待删除消息的标识符。所有消息必须来自同一聊天。关于哪些消息可以被删除的限制，请参见 deleteMessage |

#### setBusinessAccountName
> **设置业务账户名称**

更改托管企业账户的名字和姓氏。需要具备 *can_change_name* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| first_name | String | 是 | 企业账户名字的新值；1-64 个字符 |
| last_name | String | 否 | 企业账户姓氏的新值；0-64 个字符 |

#### setBusinessAccountUsername
> **设置业务账户用户名**

更改托管企业账户的用户名。需要具备 *can_change_username* 商业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| username | String | 否 | 业务账户用户名的新的值；0-32 个字符 |

#### setBusinessAccountBio
> **设置业务账户简介**

更改托管企业账户的个人简介。需要具备 *can_change_bio* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| bio | String | 否 | 企业账户简介的新值；0-140 个字符 |

#### setBusinessAccountProfilePhoto
> **设置业务账户个人资料照片**

更改托管企业账户的个人资料照片。需要具备 *can_edit_profile_photo* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| photo | [InputProfilePhoto](#inputprofilephoto) | 是 | 要设置的新个人资料照片 |
| is_public | Boolean | 否 | 传递 True 以设置公开照片，即使企业账户的隐私设置隐藏了主照片，该公开照片仍可见。一个账号只能有一张公开照片。 |

#### removeBusinessAccountProfilePhoto
> **移除业务账户个人资料照片**

移除托管企业账户的当前个人资料照片。需要具备 *can_edit_profile_photo* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| is_public | Boolean | 否 | 传递 True 以移除公开照片，即使企业账户的隐私设置隐藏了主照片，该公开照片仍然可见。移除主照片后，之前的个人资料照片（如果存在）将成为主照片。 |

#### setBusinessAccountGiftSettings
> **设置业务账户礼物设置**

更改托管企业账户中有关接收礼物的隐私设置。需要具备 *can_change_gift_settings* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| show_gift_button | Boolean | 是 | 如果必须始终在输入字段中显示向用户或由企业账户发送礼物的按钮，则传递 True |
| accepted_gift_types | [AcceptedGiftTypes](#acceptedgifttypes) | 是 | 企业账户接受的礼物类型 |

#### getBusinessAccountStarBalance
> **获取业务账户 Star 余额**

返回托管企业账户拥有的 Telegram Stars 数量。需要 *can_view_gifts_and_stars* 企业机器人权限。成功时返回 [StarAmount](#staramount)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |

#### transferBusinessAccountStars
> **转移业务账户 Stars**

将企业账户余额中的 Telegram Stars 转移到机器人余额中。需要具备 *can_transfer_stars* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| star_count | Integer | 是 | 要转移的 Telegram Stars 数量；范围为 1 至 10000 |

#### getBusinessAccountGifts
> **获取业务账户礼物**

返回受管理的企业账户收到和拥有的礼物。需要具备 *can_view_gifts_and_stars* 企业机器人权限。成功时返回 [OwnedGifts](#ownedgifts)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| exclude_unsaved | Boolean | 否 | 传递 True 以排除未保存到账户个人资料页面的礼物 |
| exclude_saved | Boolean | 否 | 传递 True 以排除已保存到账户个人资料页面的礼物 |
| exclude_unlimited | Boolean | 否 | 传递 True 以排除可以无限次购买的礼物 |
| exclude_limited | Boolean | 否 | 传递 True 以排除只能有限次购买的礼物 |
| exclude_unique | Boolean | 否 | 传递 True 以排除独特的礼物 |
| sort_by_price | Boolean | 否 | 传递 True 以按礼物价格而非发送日期对结果进行排序。排序在分页之前应用。 |
| offset | String | 否 | 从前一个请求中收到的第一个条目的偏移量；使用空字符串以获取第一批结果 |
| limit | Integer | 否 | 要返回的礼物最大数量；范围为 1-100。默认为 100 |

#### convertGiftToStars
> **将礼物转换为 Stars**

将指定的常规礼物转换为 Telegram Stars。需要具备 *can_convert_gifts_to_stars* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| owned_gift_id | String | 是 | 应转换为 Telegram Stars 的常规礼物的唯一标识符 |

#### upgradeGift
> **升级礼物**

将指定的常规礼物升级为独特礼物。需要具备 *can_transfer_and_upgrade_gifts* 企业机器人权限。若升级为付费项目，则还需具备 *can_transfer_stars* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| owned_gift_id | String | 是 | 待升级为独特礼物的常规礼物唯一标识符 |
| keep_original_details | Boolean | 否 | 传递 True 可在升级后的礼物中保留原始礼物文本、发送者与接收者信息 |
| star_count | Integer | 否 | 从企业账户余额升级所需支付的 Telegram Stars 数量。如果为 gift.prepaid_upgrade_star_count > 0，则传递 0；否则，需要具备 can_transfer_stars 企业机器人权限，并且必须传递 gift.upgrade_star_count 参数。 |

#### transferGift
> **转移礼物**

将拥有的独特礼物转移给其他用户。需要具备 *can_transfer_and_upgrade_gifts* 企业机器人权限。若转移需付费，则还需具备 *can_transfer_stars* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| owned_gift_id | String | 是 | 应转移的常规礼物的唯一标识符 |
| new_owner_chat_id | Integer | 是 | 将拥有该礼物的聊天唯一标识符。该聊天必须在过去 24 小时内处于活跃状态。 |
| star_count | Integer | 否 | 从企业账户余额中支付转移所需的 Telegram Stars 数量。如果为正数，则需要具备 can_transfer_stars 企业机器人权限。 |

#### postStory
> **发布快拍**

代表受管理的企业账户发布故事。需要具备 *can_manage_stories* 企业机器人权限。成功时返回 [Story](#story)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| content | [InputStoryContent](#inputstorycontent) | 是 | 故事内容 |
| active_period | Integer | 是 | 故事移至存档前的时长，以秒为单位；必须是 6 * 3600、12 * 3600、86400 或 2 * 86400 中的一个 |
| caption | String | 否 | 故事的字幕，实体解析后 0-2048 个字符 |
| parse_mode | String | 否 | 用于解析故事标题中实体的模式。更多详情请参阅格式化选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，用于描述出现在标题中的特殊格式，可以替代 parse_mode 参数使用 |
| areas | Array of [StoryArea](#storyarea) | 否 | 一个 JSON 序列化的可点击区域列表，将在故事中显示 |
| post_to_chat_page | Boolean | 否 | 传递 True 以在故事过期后仍保持可访问 |
| protect_content | Boolean | 否 | 如果故事内容必须防止被转发和截图，请传递 True |

#### editStory
> **编辑快拍**

编辑由机器人代表托管企业账户先前发布的故事。需要 *can_manage_stories* 企业机器人权限。成功时返回 [Story](#story)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| story_id | Integer | 是 | 要编辑故事的唯一标识符 |
| content | [InputStoryContent](#inputstorycontent) | 是 | 故事内容 |
| caption | String | 否 | 故事标题，实体解析后 0-2048 个字符 |
| parse_mode | String | 否 | 故事标题中解析实体的模式。更多详情请参阅格式选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 一个 JSON 序列化的特殊实体列表，出现在字幕中，可以替代 parse_mode 指定 |
| areas | Array of [StoryArea](#storyarea) | 否 | 一个 JSON 序列化的可点击区域列表，将在故事中显示 |

#### deleteStory
> **删除快拍**

删除由机器人代表托管企业账户先前发布的故事。需要 *can_manage_stories* 企业机器人权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 业务连接的唯一标识符 |
| story_id | Integer | 是 | 要删除的故事的唯一标识符 |

#### Inline mode methods
> **内联模式方法**

行内模式中使用的方法和对象在[行内模式章节](#inline-mode)中有详细说明。

### 更新消息

以下方法允许您修改消息历史中的现有消息，而不是发送包含操作结果的新消息。这对于使用回调查询的[行内键盘](https://core.telegram.org/bots/features#inline-keyboards)消息尤为实用，同时也有助于减少与常规聊天机器人对话中的杂乱信息。

请注意，目前仅能编辑不包含*reply_markup*或带有[行内键盘](https://core.telegram.org/bots/features#inline-keyboards)的消息。

#### editMessageText
> **编辑消息文本**

使用此方法来编辑文本和[游戏](#games)消息。成功后，如果被编辑的消息不是内联消息，则返回编辑后的[消息](#message) ，否则返回 *True*。请注意，非机器人发送且不包含内联键盘的商业消息，只能在发送后的 **48 小时** 内进行编辑。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送待编辑消息的业务连接的唯一标识符 |
| chat_id | Integer or String | 否 | 若未指定 inline_message_id 则必需。目标聊天的唯一标识符或目标频道的用户名（格式为 @channelusername） |
| message_id | Integer | 否 | 若未指定 inline_message_id 则必需。待编辑消息的标识符 |
| inline_message_id | String | 否 | 若未指定 chat_id 与 message_id 则必需。内联消息的标识符 |
| text | String | 是 | 消息的新文本，实体解析后长度为 1-4096 个字符 |
| parse_mode | String | 否 | 用于解析消息文本中实体的模式。详见格式化选项。 |
| entities | Array of [MessageEntity](#messageentity) | 否 | 出现在消息文本中的特殊实体列表，可替代 parse_mode 指定 |
| link_preview_options | [LinkPreviewOptions](#linkpreviewoptions) | 否 | 消息的链接预览生成选项 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 内联键盘的 JSON 序列化对象 |

#### editMessageCaption
> **编辑消息说明**

使用此方法编辑消息的说明文字。成功时，如果被编辑的消息不是内联消息，则返回编辑后的[消息](#message) ，否则返回 *True*。请注意，非由机器人发送且不包含内联键盘的商业消息，只能在发送后的 **48 小时**内进行编辑。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表其发送待编辑消息的商业连接的唯一标识符 |
| chat_id | Integer or String | 否 | 若未指定 inline_message_id 则必需。目标聊天的唯一标识符或目标频道的用户名（格式为 @channelusername） |
| message_id | Integer | 否 | 若未指定 inline_message_id 则必需。待编辑消息的标识符 |
| inline_message_id | String | 否 | 若未指定 chat_id 与 message_id 则必需。内联消息的标识符 |
| caption | String | 否 | 消息的新标题，实体解析后长度为 0-1024 个字符 |
| parse_mode | String | 否 | 消息标题中实体的解析模式。详见格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | 否 | 出现在标题中的特殊实体列表，可替代 parse_mode 指定 |
| show_caption_above_media | Boolean | 否 | 若标题必须显示在消息媒体上方请传递 True。仅支持动画、照片和视频消息。 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 用于内联键盘的 JSON 序列化对象 |

#### editMessageMedia
> **编辑消息媒体**

使用此方法来编辑动画、音频、文档、照片或视频消息，或为文本消息添加媒体。如果消息是消息专辑的一部分，则只能将其编辑为音频专辑的音频、文档专辑的文档，否则只能编辑为照片或视频。编辑内联消息时，无法上传新文件；请使用先前通过其 file_id 上传的文件或指定 URL。成功时，如果编辑后的消息不是内联消息，则返回编辑后的 [消息](#message) ，否则返回 *True*。请注意，非机器人发送且不包含内联键盘的商业消息只能在发送后 **48 小时**内编辑。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送待编辑消息的商业连接的唯一标识符 |
| chat_id | Integer or String | 否 | 若未指定 inline_message_id 则必需。目标聊天的唯一标识符或目标频道的用户名（格式为 @channelusername） |
| message_id | Integer | 否 | 若未指定 inline_message_id 则必需。待编辑消息的标识符 |
| inline_message_id | String | 否 | 若未指定 chat_id 与 message_id 则必需。内联消息的标识符 |
| media | [InputMedia](#inputmedia) | 是 | 用于消息的新媒体内容的 JSON 序列化对象 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 新的内联键盘的 JSON 序列化对象 |

#### editMessageLiveLocation
> **编辑消息实时位置**

使用此方法来编辑实时位置消息。在 *live_period* 到期或通过调用 [stopMessageLiveLocation](#stopmessagelivelocation) 明确禁用编辑之前，可以编辑位置。成功时，如果被编辑的消息不是内联消息，则返回编辑后的 [Message](#message)，否则返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送待编辑消息的业务连接唯一标识符 |
| chat_id | Integer or String | 否 | 若未指定 *inline_message_id* 则必需；目标聊天唯一标识符或频道用户名（格式为 `@channelusername`） |
| message_id | Integer | 否 | 若未指定 *inline_message_id* 则必需；待编辑消息的标识符 |
| inline_message_id | String | 否 | 若未指定 *chat_id* 与 *message_id* 则必需；内联消息的标识符 |
| latitude | Float | 是 | 新位置的纬度 |
| longitude | Float | 是 | 新位置的经度 |
| live_period | Integer | 否 | 自消息发送日起可更新位置的新周期（秒）；0x7FFFFFFF 表示可永久更新；否则新值不得超过当前周期 1 天，且过期日期需在未来 90 天内；未指定则保持不变 |
| horizontal_accuracy | Float | 否 | 位置不确定半径（米）；0-1500 |
| heading | Integer | 否 | 用户移动方向（度）；如指定需在 1-360 之间 |
| proximity_alert_radius | Integer | 否 | 接近其他聊天成员时的临近提醒最大距离（米）；如指定需在 1-100000 之间 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 新的内联键盘的 JSON 序列化对象 |

#### stopMessageLiveLocation
> **停止消息实时位置**

使用此方法在 *live_period* 到期前停止更新实时位置消息。成功时，如果消息不是内联消息，则返回编辑后的 [消息](#message) ，否则返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送待编辑消息的业务连接唯一标识符 |
| chat_id | Integer or String | 否 | 若未指定 *inline_message_id* 则必需；目标聊天唯一标识符或频道用户名（格式为 `@channelusername`） |
| message_id | Integer | 否 | 若未指定 *inline_message_id* 则必需；待停止实时位置消息的标识符 |
| inline_message_id | String | 否 | 若未指定 *chat_id* 与 *message_id* 则必需；内联消息的标识符 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 新的内联键盘的 JSON 序列化对象 |

#### editMessageChecklist
> **编辑消息清单**

使用此方法代表关联的商业账户编辑清单。成功时，将返回编辑后的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 是 | 代表发送消息的业务连接唯一标识符 |
| chat_id | Integer | 是 | 目标聊天的唯一标识符 |
| message_id | Integer | 是 | 目标消息的唯一标识符 |
| checklist | [InputChecklist](#inputchecklist) | 是 | 新清单的 JSON 序列化对象 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 新的内联键盘的 JSON 序列化对象 |

#### editMessageReplyMarkup
> **编辑消息回复标记**

使用此方法仅编辑消息的回复标记。成功时，如果被编辑的消息不是内联消息，则返回编辑后的[消息](#message) ，否则返回 *True*。请注意，非由机器人发送且不包含内联键盘的商业消息，只能在发送后的 **48 小时**内进行编辑。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表待编辑消息发送的业务连接唯一标识符 |
| chat_id | Integer or String | 否 | 若未指定 *inline_message_id* 则必需；目标聊天唯一标识符或频道用户名（格式为 `@channelusername`） |
| message_id | Integer | 否 | 若未指定 *inline_message_id* 则必需；待编辑消息的标识符 |
| inline_message_id | String | 否 | 若未指定 *chat_id* 与 *message_id* 则必需；内联消息的标识符 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 内联键盘的 JSON 序列化对象 |

#### stopPoll
> **停止投票**

使用此方法来停止由机器人发送的投票。成功后，将返回已停止的[投票](#poll) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送待编辑消息的业务连接唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或频道的用户名或唯一标识符（格式为 `@channelusername`） |
| message_id | Integer | 是 | 原始消息的标识符 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 新消息的内联键盘的 JSON 序列化对象 |

#### approveSuggestedPost
> **批准建议帖子**

使用此方法批准私信聊天中的推荐帖子。机器人在对应的频道聊天中必须拥有 'can_post_messages' 管理员权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer | 是 | 目标私信聊天的唯一标识符 |
| message_id | Integer | 是 | 待批准推荐帖子的标识符 |
| send_date | Integer | 否 | 帖子预计发布的时刻（Unix 时间戳）；若创建推荐帖子时已指定日期，则此项可省略。若指定，则日期不得超过未来 2678400 秒（30 天） |

#### declineSuggestedPost
> **拒绝建议帖子**

使用此方法可拒绝私信聊天中的推荐帖子。机器人在对应频道聊天中需具备 'can_manage_direct_messages' 管理员权限。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer | 是 | 目标私聊的唯一标识符 |
| message_id | Integer | 是 | 建议拒绝的帖子消息标识符 |
| comment | String | 否 | 给建议帖子创建者的评论；0-128 个字符 |

#### deleteMessage
> **删除消息**

使用此方法删除消息（包括服务消息），但有以下限制：- 仅能删除发送时间少于 48 小时的消息。- 关于超级群组、频道或论坛主题创建的服务消息无法删除。- 私聊中的骰子消息仅能在发送超过 24 小时后删除。- 机器人可以删除私聊、群组和超级群组中的发出消息。- 机器人可以删除私聊中的接收消息。- 被授予 *can_post_messages* 权限的机器人可以删除频道中的发出消息。- 如果机器人是群组的管理员，它可以删除该群组中的任何消息。- 如果机器人在超级群组或频道中拥有 *can_delete_messages* 管理员权限，它可以删除该处的任何消息。- 如果机器人在频道中拥有 *can_manage_direct_messages* 管理员权限，它可以删除相应私聊会话中的任何消息。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或频道的用户名或唯一标识符（格式为 `@channelusername`） |
| message_id | Integer | 是 | 要删除的消息标识符 |

#### deleteMessages
> **批量删除消息**

使用此方法可同时删除多条消息。如果找不到部分指定消息，则跳过这些消息。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或频道的用户名或唯一标识符（格式为 `@channelusername`） |
| message_ids | Array of Integer | 是 | 1 到 100 条待删除消息标识符的 JSON 序列化列表；删除限制参见 deleteMessage |

### 贴纸

以下方法和对象允许你的机器人处理贴纸和贴纸集。

#### Sticker
> **贴纸对象**

此对象表示一个贴纸。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 文件标识符，用于下载或重复使用该文件 |
| file_unique_id | String | 文件唯一标识符；在不同时间和不同机器人之间保持一致；不可用于下载或复用 |
| type | String | 贴纸类型：“regular”“mask”“custom_emoji”；与格式无关，格式由 is_animated 与 is_video 决定 |
| width | Integer | 贴纸宽度 |
| height | Integer | 贴纸高度 |
| is_animated | Boolean | True 表示动画贴纸 |
| is_video | Boolean | True 表示视频贴纸 |
| thumbnail | [PhotoSize](#photosize) | *可选*。贴纸缩略图（.WEBP 或 .JPG） |
| emoji | String | *可选*。与贴纸相关的表情符号 |
| set_name | String | *可选*。贴纸所属贴纸集名称 |
| premium_animation | [File](#file) | *可选*。适用于高级常规贴纸的高级动画 |
| mask_position | [MaskPosition](#maskposition) | *可选*。遮罩贴纸的遮罩位置 |
| custom_emoji_id | String | *可选*。自定义表情贴纸的自定义表情唯一标识符 |
| needs_repainting | Boolean | *可选*。True 表示在消息/表情状态/聊天照片等场景下需按上下文重绘配色 |
| file_size | Integer | *可选*。文件大小（字节） |

#### StickerSet
> **贴纸集对象**

此对象表示一个贴纸包。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| name | String | 贴纸集名称 |
| title | String | 贴纸集标题 |
| sticker_type | String | 贴纸类型：“regular”“mask”“custom_emoji” |
| stickers | Array of [Sticker](#sticker) | 贴纸集中的贴纸列表 |
| thumbnail | [PhotoSize](#photosize) | *可选*。贴纸集缩略图（.WEBP/.TGS/.WEBM） |

#### MaskPosition
> **面具位置对象**

此对象描述了默认情况下面具应放置在面部的位置。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| point | String | 面具在面部的相对位置：“forehead”“eyes”“mouth”“chin” |
| x_shift | Float | X 轴位移（按面部尺寸缩放后的面具宽度为单位，左→右）；如 -1.0 表示位于默认位置左侧 |
| y_shift | Float | Y 轴位移（按面部尺寸缩放后的面具高度为单位，上→下）；如 1.0 表示位于默认位置下方 |
| scale | Float | 面具缩放系数；如 2.0 表示双倍大小 |

#### InputSticker
> **输入贴纸对象**

此对象描述要添加到贴纸集中的贴纸。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| sticker | String | 要添加的贴纸：传递 file_id（推荐）、HTTP URL（仅 .WEBP），或使用“attach://<file_attach_name>”通过 multipart/form-data 上传新文件；动画与视频贴纸不可通过 URL 上传。[更多关于发送文件 »](#sending-files) |
| format | String | 贴纸格式：“static”（.WEBP/.PNG）、“animated”（.TGS）、“video”（.WEBM） |
| emoji_list | Array of String | 与贴纸关联的 1–20 个表情符号列表 |
| mask_position | [MaskPosition](#maskposition) | *可选*。面具位置；仅适用于“mask”贴纸 |
| keywords | Array of String | *可选*。贴纸搜索关键词列表（0–20 个，合计不超过 64 字符）；仅适用于“regular”与“custom_emoji”贴纸 |

#### sendSticker
> **发送贴纸**

使用此方法发送静态 .WEBP、 [动态](https://telegram.org/blog/animated-stickers) .TGS 或 [视频](https://telegram.org/blog/video-stickers-better-reactions) .WEBM 贴纸。成功后，返回已发送的 [消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接唯一标识符 |
| chat_id | Integer or String | 是 | 目标聊天或频道的用户名或唯一标识符（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 目标消息线程（主题）唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 私聊主题标识符；若消息发送至私聊聊天则必需 |
| sticker | [InputFile](#inputfile) or String | 是 | 要发送的贴纸：传递 *file_id*（推荐）或 HTTP URL（仅 .WEBP），或使用 multipart/form-data 上传新的 .WEBP/.TGS/.WEBM；动画/视频贴纸不可通过 URL 发送。[更多关于发送文件 »](#sending-files) |
| emoji | String | 否 | 与贴纸关联的表情符号；仅适用于刚上传的贴纸 |
| disable_notification | Boolean | 否 | 静默发送消息。用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 传递 True 以付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 将从机器人余额扣除 |
| message_effect_id | String | 否 | 要添加到消息的消息特效唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 建议发布的参数；仅限私聊聊天；若作为回复发送至另一建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) or [ReplyKeyboardMarkup](#replykeyboardmarkup) or [ReplyKeyboardRemove](#replykeyboardremove) or [ForceReply](#forcereply) | 否 | 附加界面选项：内联键盘、自定义回复键盘、移除回复键盘或强制回复的 JSON 序列化对象 |

#### getStickerSet
> **获取贴纸集**

使用此方法获取贴纸集。成功时，将返回一个 [StickerSet](#stickerset) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| name | String | 是 | 贴纸集名称 |

#### getCustomEmojiStickers
> **获取自定义 Emoji 贴纸**

使用此方法通过自定义表情符号标识符获取相关信息。返回一个由 [Sticker](#sticker) 对象组成的数组。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| custom_emoji_ids | Array of String | 是 | 自定义表情符号标识符的 JSON 序列化列表；最多 200 项 |

#### uploadStickerFile
> **上传贴纸文件**

使用此方法上传一个包含贴纸的文件，以便后续在 [createNewStickerSet](#createnewstickerset)、[addStickerToSet](#addstickertoset) 或 [replaceStickerInSet](#replacestickerinset) 方法中使用（该文件可多次使用）。成功时返回上传的 [File](#file)。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 贴纸文件所有者的用户标识符 |
| sticker | [InputFile](#inputfile) | 是 | 包含 .WEBP/.PNG/.TGS/.WEBM 的贴纸文件；技术规格见 https://core.telegram.org/stickers；[更多关于发送文件 »](#sending-files) |
| sticker_format | String | 是 | 贴纸格式：“static”“animated”“video” |

#### createNewStickerSet
> **创建新贴纸集**

使用此方法创建一个属于用户的新贴纸集。机器人将能够编辑由此创建的贴纸集。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 贴纸集所有者的用户标识符 |
| name | String | 是 | 贴纸集短名称，用于 t.me/addstickers/ 链接（如 animals）；只能包含英文字母、数字和下划线；以字母开头；不允许连续下划线；必须以“*by*”结尾；不区分大小写；1-64 字符 |
| title | String | 是 | 贴纸集标题，1-64 字符 |
| stickers | Array of [InputSticker](#inputsticker) | 是 | 初始贴纸列表（1–50 项），将添加到贴纸集中 |
| sticker_type | String | 否 | 贴纸类型：“regular”“mask”“custom_emoji”；默认创建常规贴纸集 |
| needs_repainting | Boolean | 否 | True 表示贴纸在消息/表情状态/聊天照片等场景需重绘配色；仅适用于自定义表情贴纸集 |

#### addStickerToSet
> **添加贴纸到集**

使用此方法向机器人创建的贴纸集中添加新贴纸。表情贴纸集最多可包含 200 个贴纸。其他贴纸集最多可包含 120 个贴纸。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 贴纸集所有者的用户标识符 |
| name | String | 是 | 贴纸集名称 |
| sticker | [InputSticker](#inputsticker) | 是 | 新贴纸信息的 JSON 序列化对象；若完全相同的贴纸已存在则不变更 |

#### setStickerPositionInSet
> **设置贴纸在集中的位置**

使用此方法可将机器人创建的贴纸集中的贴纸移动到指定位置。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| sticker | String | 是 | 贴纸的文件标识符 |
| position | Integer | 是 | 贴纸在集合中的新位置（从 0 开始） |

#### deleteStickerFromSet
> **从集中删除贴纸**

使用此方法删除机器人创建的贴纸集中的贴纸。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| sticker | String | 是 | 贴纸的文件标识符 |

#### replaceStickerInSet
> **替换集中的贴纸**

使用此方法将贴纸集中的现有贴纸替换为新贴纸。该方法等同于依次调用 [deleteStickerFromSet](#deletestickerfromset)、[addStickerToSet](#addstickertoset) 和 [setStickerPositionInSet](#setstickerpositioninset)。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 贴纸集所有者的用户标识符 |
| name | String | 是 | 贴纸集名称 |
| old_sticker | String | 是 | 被替换贴纸的文件标识符 |
| sticker | [InputSticker](#inputsticker) | 是 | 新贴纸信息；若完全相同的贴纸已存在则集合保持不变 |

#### setStickerEmojiList
> **设置贴纸 Emoji 列表**

使用此方法可更改分配给常规或自定义表情符号贴纸的表情符号列表。该贴纸必须属于由机器人创建的贴纸集。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| sticker | String | 是 | 贴纸的文件标识符 |
| emoji_list | Array of String | 是 | 与贴纸关联的 1–20 个表情符号列表的 JSON 序列化 |

#### setStickerKeywords
> **设置贴纸关键词**

使用此方法可更改分配给常规或自定义表情贴纸的搜索关键词。该贴纸必须属于由机器人创建的贴纸集。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| sticker | String | 是 | 贴纸的文件标识符 |
| keywords | Array of String | 否 | 贴纸搜索关键词列表（0–20 个，合计不超过 64 字符）的 JSON 序列化 |

#### setStickerMaskPosition
> **设置贴纸面具位置**

使用此方法来更改遮罩贴纸的[遮罩位置](#maskposition) 。该贴纸必须属于由机器人创建的贴纸集。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| sticker | String | 是 | 贴纸的文件标识符 |
| mask_position | [MaskPosition](#maskposition) | 否 | 面部上的面具位置；省略则移除面具位置设置 |

#### setStickerSetTitle
> **设置贴纸集标题**

使用此方法为已创建的贴纸集设置标题。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| name | String | 是 | 贴纸集名称 |
| title | String | 是 | 贴纸集标题，1-64 字符 |

#### setStickerSetThumbnail
> **设置贴纸集缩略图**

使用此方法设置普通或遮罩贴纸集的缩略图。缩略图文件的格式必须与贴纸集中贴纸的格式一致。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| name | String | 是 | 贴纸集名称 |
| user_id | Integer | 是 | 贴纸集所有者的用户标识符 |
| thumbnail | [InputFile](#inputfile) or String | 否 | .WEBP 或 .PNG 缩略图（≤128 KB，宽高恰为 100px），或 .TGS 动画缩略图（≤32 KB），或 .WEBM 视频缩略图（≤32 KB）；可传递 *file_id*、HTTP URL，或通过 multipart/form-data 上传新文件。[更多关于发送文件 »](#sending-files)；动画/视频贴纸集缩略图不可通过 URL 上传；省略则使用第一张贴纸作为缩略图 |
| format | String | 是 | 缩略图格式：“static”（.WEBP/.PNG）、“animated”（.TGS）、“video”（.WEBM） |

#### setCustomEmojiStickerSetThumbnail
> **设置自定义 Emoji 贴纸集缩略图**

使用此方法设置自定义表情贴纸集的缩略图。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| name | String | 是 | 贴纸集名称 |
| custom_emoji_id | String | 否 | 集合中贴纸的自定义表情符号标识符；传递空字符串以删除缩略图并使用第一张贴纸作为缩略图 |

#### deleteStickerSet
> **删除贴纸集**

使用此方法删除由机器人创建的贴纸集。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| name | String | 是 | 贴纸集名称 |

### 内联模式

以下方法和对象允许您的机器人在[内联模式](https://core.telegram.org/bots/inline)下工作。更多详情请参阅我们的[内联机器人介绍](https://core.telegram.org/bots/inline) 。

要启用此选项，请向 [@BotFather](https://t.me/botfather) 发送 `/setinline` 命令，并提供用户输入你的机器人名称后将在输入框中看到的占位符文本。

#### InlineQuery
> **内联查询对象**

此对象表示一个传入的内联查询。当用户发送空查询时，你的机器人可以返回一些默认或热门结果。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 此查询的唯一标识符 |
| from | [User](#user) | 发件人 |
| query | String | 查询文本（最多 256 个字符） |
| offset | String | 待返回结果的偏移量，可由机器人控制 |
| chat_type | String | *可选*。发送内联查询的聊天类型：sender/private/group/supergroup/channel |
| location | [Location](#location) | *可选*。发送者位置，仅适用于请求用户位置的机器人 |

#### answerInlineQuery
> **回应内联查询**

使用此方法发送内联查询的答案。成功后，将返回 *True*。每个查询最多允许 **50** 个结果。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| inline_query_id | String | 是 | 已答复查询的唯一标识符 |
| results | Array of [InlineQueryResult](#inlinequeryresult) | 是 | 内联查询结果的 JSON 序列化数组 |
| cache_time | Integer | 否 | 结果在服务器端可缓存的最大秒数；默认 300 |
| is_personal | Boolean | 否 | 若仅为发送查询的用户在服务器端缓存结果，请传递 True |
| next_offset | String | 否 | 客户端在下一次同文本查询时应发送的偏移量；无更多结果或不支持分页则传递空字符串；最长 64 字节 |
| button | [InlineQueryResultsButton](#inlinequeryresultsbutton) | 否 | 描述显示在结果上方的按钮的 JSON 序列化对象 |

#### InlineQueryResultsButton
> **内联查询结果按钮**

此对象表示要显示在内联查询结果上方的按钮。您**必须**且只能使用可选字段中的一个。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| text | String | 按钮标签文本 |
| web_app | [WebAppInfo](#webappinfo) | *可选*。用户按下按钮时启动的 Web App；可使用其内部的 switchInlineQuery 方法切换回内联模式 |
| start_parameter | String | *可选*。/start 深度链接参数；1-64 字符，允许 A-Z、a-z、0-9、_、- |

#### InlineQueryResult
> **内联查询结果对象**

此对象表示一个内联查询的结果。Telegram 客户端目前支持以下 20 种类型的结果：

* [InlineQueryResultCachedAudio](#inlinequeryresultcachedaudio)
* [InlineQueryResultCachedDocument](#inlinequeryresultcacheddocument)
* [InlineQueryResultCachedGif](#inlinequeryresultcachedgif)
* [InlineQueryResultCachedMpeg4Gif](#inlinequeryresultcachedmpeg4gif)
* [InlineQueryResultCachedPhoto](#inlinequeryresultcachedphoto)
* [InlineQueryResultCachedSticker](#inlinequeryresultcachedsticker)
* [InlineQueryResultCachedVideo](#inlinequeryresultcachedvideo)
* [InlineQueryResultCachedVoice](#inlinequeryresultcachedvoice)
* [InlineQueryResultArticle](#inlinequeryresultarticle)
* [InlineQueryResultAudio](#inlinequeryresultaudio)
* [InlineQueryResultContact](#inlinequeryresultcontact)
* [InlineQueryResultGame](#inlinequeryresultgame)
* [InlineQueryResultDocument](#inlinequeryresultdocument)
* [InlineQueryResultGif](#inlinequeryresultgif)
* [InlineQueryResultLocation](#inlinequeryresultlocation)
* [InlineQueryResultMpeg4Gif](#inlinequeryresultmpeg4gif)
* [InlineQueryResultPhoto](#inlinequeryresultphoto)
* [InlineQueryResultVenue](#inlinequeryresultvenue)
* [InlineQueryResultVideo](#inlinequeryresultvideo)
* [InlineQueryResultVoice](#inlinequeryresultvoice)

**注意：** 内联查询结果中传递的所有 URL 都将对最终用户可见，因此必须假定为**公开** 。

#### InlineQueryResultArticle
> **文章内联查询结果**

代表指向文章或网页的链接。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须是 article |
| id | String | 此结果的唯一标识符，1-64 字节 |
| title | String | 结果的标题 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | 待发送消息的内容 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| url | String | *可选*。结果的 URL |
| description | String | *可选*。结果的简短描述 |
| thumbnail_url | String | *可选*。结果的缩略图链接 |
| thumbnail_width | Integer | *可选*。缩略图宽度 |
| thumbnail_height | Integer | *可选*。缩略图高度 |

#### InlineQueryResultPhoto
> **照片内联查询结果**

表示指向照片的链接。默认情况下，此照片将由用户发送，并可选择添加说明文字。或者，您可以使用 *input_message_content* 发送包含指定内容的消息，而不是照片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 photo |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| photo_url | String | 照片的有效 URL。照片必须为 JPEG 格式，且大小不得超过 5MB |
| thumbnail_url | String | 照片缩略图的 URL |
| photo_width | Integer | *可选*。照片的宽度 |
| photo_height | Integer | *可选*。照片的高度 |
| title | String | *可选*。结果的标题 |
| description | String | *可选*。结果的简短描述 |
| caption | String | *可选*。要发送的照片的说明文字，实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。用于解析照片说明中实体的模式。更多详情请参阅格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| show_caption_above_media | Boolean | *可选*。如果标题必须显示在消息媒体上方，请传递 True |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，而非照片 |

#### InlineQueryResultGif
> **GIF 内联查询结果**

表示指向动画 GIF 文件的链接。默认情况下，用户将发送此动画 GIF 文件，并可选择添加说明文字。或者，您可以使用 *input_message_content* 来发送包含指定内容的消息，而不是动画。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须为 gif |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| gif_url | String | GIF 文件的有效 URL |
| gif_width | Integer | *可选*。GIF 的宽度 |
| gif_height | Integer | *可选*。GIF 的高度 |
| gif_duration | Integer | *可选*。GIF 的持续时间（以秒为单位） |
| thumbnail_url | String | 结果的静态（JPEG 或 GIF）或动态（MPEG4）缩略图的 URL |
| thumbnail_mime_type | String | *可选*。缩略图的 MIME 类型，必须是“image/jpeg”、“image/gif”或“video/mp4”之一。默认为“image/jpeg” |
| title | String | *可选*。结果的标题 |
| caption | String | *可选*。待发送 GIF 文件的说明文字，实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。说明文字中实体的解析模式。详见格式设置选项获取更多信息。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| show_caption_above_media | Boolean | *可选*。如果标题必须显示在消息媒体上方，请传递 True |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。用于替代 GIF 动画发送的消息内容 |

#### InlineQueryResultMpeg4Gif
> **MPEG4 GIF 内联查询结果**

表示一个指向视频动画（无声音的 H.264/MPEG-4 AVC 视频）的链接。默认情况下，用户将发送这个动画 MPEG-4 文件，并可选择添加标题。或者，您可以使用 *input_message_content* 来发送包含指定内容的消息，而不是动画。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须是 mpeg4_gif |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| mpeg4_url | String | MPEG4 文件的有效 URL |
| mpeg4_width | Integer | *可选*。视频宽度 |
| mpeg4_height | Integer | *可选*。视频高度 |
| mpeg4_duration | Integer | *可选*。视频时长（秒） |
| thumbnail_url | String | 结果的静态（JPEG 或 GIF）或动态（MPEG4）缩略图的 URL |
| thumbnail_mime_type | String | *可选*。缩略图的 MIME 类型，必须是 "image/jpeg"、"image/gif" 或 "video/mp4" 之一。默认为 "image/jpeg"。 |
| title | String | *可选*。结果的标题 |
| caption | String | *可选*。待发送的 MPEG-4 文件说明文字，实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。说明文字中解析实体的模式。更多详情请参阅格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| show_caption_above_media | Boolean | *可选*。如果标题必须显示在消息媒体上方，请传递 True |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，用于替代视频动画 |

#### InlineQueryResultVideo
> **视频内联查询结果**

表示指向包含嵌入式视频播放器或视频文件的页面的链接。默认情况下，此视频文件将由用户发送，并可附带可选说明。或者，您可以使用 *input_message_content* 发送包含指定内容的消息，而不是视频。

> 如果 [InlineQueryResultVideo](#inlinequeryresultvideo) 消息包含嵌入式视频（例如 YouTube），您**必须**使用 *input_message_content* 替换其内容。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须为 video |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| video_url | String | 嵌入式视频播放器或视频文件的有效 URL |
| mime_type | String | 视频 URL 内容的 MIME 类型，如“text/html”或“video/mp4” |
| thumbnail_url | String | 视频缩略图的 URL（仅限 JPEG 格式） |
| title | String | 结果的标题 |
| caption | String | *可选*。待发送视频的说明文字，在实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。视频说明文字中实体的解析模式。详情请参阅格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| show_caption_above_media | Boolean | *可选*。如果标题必须显示在消息媒体上方，请传递 True |
| video_width | Integer | *可选*。视频宽度 |
| video_height | Integer | *可选*。视频高度 |
| video_duration | Integer | *可选*。视频时长（秒） |
| description | String | *可选*。结果的简短描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。用于替代视频发送的消息内容。如果使用 [InlineQueryResultVideo](#inlinequeryresultvideo) 发送 HTML 页面作为结果（例如 YouTube 视频），则此字段为必填项。 |

#### InlineQueryResultAudio
> **音频内联查询结果**

表示指向 MP3 音频文件的链接。默认情况下，此音频文件将由用户发送。或者，您可以使用 *input_message_content* 发送包含指定内容的消息来替代音频。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 audio |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| audio_url | String | 音频文件的有效 URL |
| title | String | 标题 |
| caption | String | *可选*。字幕，实体解析后 0-1024 个字符 |
| parse_mode | String | *可选*。音频说明文字中解析实体的模式。更多详情请参阅格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| performer | String | *可选*。执行者 |
| audio_duration | Integer | *可选*。音频时长（秒） |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。用于替代音频发送的消息内容 |

#### InlineQueryResultVoice
> **语音内联查询结果**

表示指向使用 OPUS 编码的.OGG 容器中的语音录制文件的链接。默认情况下，此语音录制将由用户发送。或者，您可以使用 *input_message_content* 发送包含指定内容的消息，以替代语音消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须为 voice |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| voice_url | String | 语音录音的有效 URL |
| title | String | 录音标题 |
| caption | String | *可选*。字幕，在实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。语音消息字幕中解析实体的模式。更多详情请参阅格式选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| voice_duration | Integer | *可选*。录音时长，单位为秒 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，用于替代语音录音 |

#### InlineQueryResultDocument
> **文档内联查询结果**

表示一个文件链接。默认情况下，用户将发送此文件，并可选择添加说明文字。或者，您可以使用 *input_message_content* 来发送包含指定内容的消息，而非文件本身。目前，只有 **.PDF** 和 **.ZIP** 文件可以通过此方法发送。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须为 document |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| title | String | 结果标题 |
| caption | String | *可选*。待发送文档的说明文字，在实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。文档说明文字中解析实体的模式。更多详情请参阅格式选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| document_url | String | 文件的有效网址 |
| mime_type | String | 文件内容的 MIME 类型，可以是“application/pdf”或“application/zip” |
| description | String | *可选*。结果的简短描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，用于替代文件 |
| thumbnail_url | String | *可选*。文件的缩略图 URL（仅限 JPEG 格式） |
| thumbnail_width | Integer | *可选*。缩略图宽度 |
| thumbnail_height | Integer | *可选*。缩略图高度 |

#### InlineQueryResultLocation
> **位置内联查询结果**

表示地图上的一个位置。默认情况下，该位置将由用户发送。或者，您可以使用 *input_message_content* 发送一条包含指定内容的消息，而不是位置信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 location |
| id | String | 此结果的唯一标识符，1-64 字节 |
| latitude | Float | 位置纬度（度） |
| longitude | Float | 位置经度（度） |
| title | String | 位置标题 |
| horizontal_accuracy | Float | *可选*。位置的不确定半径，以米为单位；范围 0-1500 |
| live_period | Integer | *可选*。位置可更新的时间间隔（秒），应在 60 至 86400 之间，若为可无限期编辑的实时位置则设为 0x7FFFFFFF。 |
| heading | Integer | *可选*。针对实时位置，用户移动方向（以度为单位）。若指定则必须介于 1 至 360 之间。 |
| proximity_alert_radius | Integer | *可选*。针对实时位置，接近其他聊天成员时的临近提醒最大距离（米）。若指定则必须介于 1 至 100000 之间。 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。替代位置信息发送的消息内容 |
| thumbnail_url | String | *可选*。结果的缩略图链接 |
| thumbnail_width | Integer | *可选*。缩略图宽度 |
| thumbnail_height | Integer | *可选*。缩略图高度 |

#### InlineQueryResultVenue
> **场所内联查询结果**

表示一个地点。默认情况下，该地点将由用户发送。或者，您可以使用 *input_message_content* 发送指定内容的消息，而不是地点。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须是 venue |
| id | String | 此结果的唯一标识符，1-64 字节 |
| latitude | Float | 地点位置的纬度（度） |
| longitude | Float | 场地位置的经度（度） |
| title | String | 场地名称 |
| address | String | 场地地址 |
| foursquare_id | String | *可选*。若已知，场地的 Foursquare 标识符 |
| foursquare_type | String | *可选*。若已知，场地的 Foursquare 类型。（例如，“arts_entertainment/default”、“arts_entertainment/aquarium”或“food/icecream”。） |
| google_place_id | String | *可选*。场地的 Google Places 标识符 |
| google_place_type | String | *可选*。场所的 Google Places 类型。（请参阅支持的类型。） |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，用于替代地点信息 |
| thumbnail_url | String | *可选*。结果的缩略图链接 |
| thumbnail_width | Integer | *可选*。缩略图宽度 |
| thumbnail_height | Integer | *可选*。缩略图高度 |

#### InlineQueryResultContact
> **联系人内联查询结果**

表示一个带有电话号码的联系人。默认情况下，此联系人将由用户发送。或者，您可以使用 *input_message_content* 来发送指定内容的消息，而不是发送联系人。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须是 contact |
| id | String | 此结果的唯一标识符，1-64 字节 |
| phone_number | String | 联系人的电话号码 |
| first_name | String | 联系人的名字 |
| last_name | String | *可选*。联系人的姓氏 |
| vcard | String | *可选*。关于联系人的附加数据，以 vCard 形式提供，大小为 0-2048 字节。 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，而非联系人信息 |
| thumbnail_url | String | *可选*。结果的缩略图链接 |
| thumbnail_width | Integer | *可选*。缩略图宽度 |
| thumbnail_height | Integer | *可选*。缩略图高度 |

#### InlineQueryResultGame
> **游戏内联查询结果**

代表一个[游戏](#games) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须为 game |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| game_short_name | String | 游戏简称 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |

#### InlineQueryResultCachedPhoto
> **缓存照片内联查询结果**

表示指向存储在 Telegram 服务器上的照片的链接。默认情况下，用户将发送此照片并附带可选标题。或者，您可以使用 *input_message_content* 发送包含指定内容的消息，而不是照片。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 photo |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| photo_file_id | String | 照片的有效文件标识符 |
| title | String | *可选*。结果的标题 |
| description | String | *可选*。结果的简短描述 |
| caption | String | *可选*。要发送的照片的说明文字，实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。用于解析照片说明中实体的模式。更多详情请参阅格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| show_caption_above_media | Boolean | *可选*。如果标题必须显示在消息媒体上方，请传递 True |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，而非照片 |

#### InlineQueryResultCachedGif
> **缓存 GIF 内联查询结果**

表示指向存储在 Telegram 服务器上的动画 GIF 文件的链接。默认情况下，用户将发送此动画 GIF 文件，并可选择添加说明文字。或者，您可以使用 *input_message_content* 来发送指定内容的消息，而不是动画。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须为 gif |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| gif_file_id | String | GIF 文件的有效文件标识符 |
| title | String | *可选*。结果的标题 |
| caption | String | *可选*。待发送 GIF 文件的说明文字，实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。说明文字中实体的解析模式。详见格式设置选项获取更多信息。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| show_caption_above_media | Boolean | *可选*。如果标题必须显示在消息媒体上方，请传递 True |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。用于替代 GIF 动画发送的消息内容 |

#### InlineQueryResultCachedMpeg4Gif
> **缓存 MPEG4 GIF 内联查询结果**

表示指向存储在 Telegram 服务器上的视频动画（H.264/MPEG-4 AVC 视频，无声音）的链接。默认情况下，用户将发送此动画 MPEG-4 文件，并可选择添加标题。或者，您可以使用 *input_message_content* 来发送包含指定内容的消息，而不是动画。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须是 mpeg4_gif |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| mpeg4_file_id | String | MPEG4 文件的有效文件标识符 |
| title | String | *可选*。结果的标题 |
| caption | String | *可选*。要发送的 MPEG-4 文件的标题，在解析实体后为 0-1024 个字符 |
| parse_mode | String | *可选*。说明文字中实体的解析模式。详见格式设置选项获取更多信息。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| show_caption_above_media | Boolean | *可选*。如果标题必须显示在消息媒体上方，请传递 True |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，用于替代视频动画 |

#### InlineQueryResultCachedSticker
> **缓存贴纸内联查询结果**

表示指向存储在 Telegram 服务器上的贴纸的链接。默认情况下，此贴纸将由用户发送。或者，您可以使用 *input_message_content* 发送包含指定内容的消息，而不是贴纸。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须是 sticker |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| sticker_file_id | String | 贴纸的有效文件标识符 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，用于替代贴纸 |

#### InlineQueryResultCachedDocument
> **缓存文档内联查询结果**

表示指向存储在 Telegram 服务器上的文件的链接。默认情况下，用户将发送此文件并附带可选的说明文字。或者，您可以使用 *input_message_content* 发送包含指定内容的消息，而不是发送文件。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 document |
| id | String | 此结果的唯一标识符，1-64 字节 |
| title | String | 结果标题 |
| document_file_id | String | 文件的有效文件标识符 |
| description | String | *可选*。结果简短描述 |
| caption | String | *可选*。发送文档的说明文字，实体解析后 0-1024 字符 |
| parse_mode | String | *可选*。文档说明文字中解析实体的模式。更多详情请参阅格式选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。说明文字中的特殊实体列表 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。用于替代文件的消息内容 |

#### InlineQueryResultCachedVideo
> **缓存视频内联查询结果**

表示指向存储在 Telegram 服务器上的视频文件的链接。默认情况下，用户将发送此视频文件，并可选择添加说明文字。或者，您可以使用 *input_message_content* 发送包含指定内容的消息，而不是视频。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须为 video |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| video_file_id | String | 视频文件的有效文件标识符 |
| title | String | 结果标题 |
| description | String | *可选*。结果的简短描述 |
| caption | String | *可选*。待发送视频的说明文字，在实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。视频说明文字中实体的解析模式。详情请参阅格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| show_caption_above_media | Boolean | *可选*。如果标题必须显示在消息媒体上方，请传递 True |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。用于替代视频发送的消息内容 |

#### InlineQueryResultCachedVoice
> **缓存语音内联查询结果**

表示指向存储在 Telegram 服务器上的语音消息的链接。默认情况下，此语音消息将由用户发送。或者，您可以使用 *input_message_content* 发送指定内容的消息来替代语音消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果的类型，必须为 voice |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| voice_file_id | String | 语音消息的有效文件标识符 |
| title | String | 语音消息标题 |
| caption | String | *可选*。字幕，在实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。语音消息字幕中解析实体的模式。更多详情请参阅格式选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。要发送的消息内容，而非语音消息 |

#### InlineQueryResultCachedAudio
> **缓存音频内联查询结果**

表示指向存储在 Telegram 服务器上的 MP3 音频文件的链接。默认情况下，此音频文件将由用户发送。或者，您可以使用 *input_message_content* 发送包含指定内容的消息，而不是音频。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 结果类型，必须为 audio |
| id | String | 此结果的唯一标识符，长度为 1-64 字节 |
| audio_file_id | String | 音频文件的有效文件标识符 |
| caption | String | *可选*。字幕，在实体解析后长度为 0-1024 个字符 |
| parse_mode | String | *可选*。音频说明文字中解析实体的模式。更多详情请参阅格式设置选项。 |
| caption_entities | Array of [MessageEntity](#messageentity) | *可选*。出现在说明文字中的特殊实体列表，可以指定此参数以替代 parse_mode |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | *可选*。附加到消息的内联键盘 |
| input_message_content | [InputMessageContent](#inputmessagecontent) | *可选*。用于替代音频发送的消息内容 |

#### InputMessageContent
> **输入消息内容对象**

此对象表示作为内联查询结果发送的消息内容。Telegram 客户端目前支持以下 5 种类型：

* [InputTextMessageContent](#inputtextmessagecontent)
* [InputLocationMessageContent](#inputlocationmessagecontent)
* [InputVenueMessageContent](#inputvenuemessagecontent)
* [InputContactMessageContent](#inputcontactmessagecontent)
* [InputInvoiceMessageContent](#inputinvoicemessagecontent)

#### InputTextMessageContent
> **输入文本消息内容**

表示作为内联查询结果发送的文本消息的[内容](#inputmessagecontent) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| message_text | String | 待发送消息的文本内容，长度为 1-4096 个字符 |
| parse_mode | String | *可选*。用于解析消息文本中实体的模式。更多详情请参阅格式设置选项。 |
| entities | Array of [MessageEntity](#messageentity) | *可选*。消息文本中出现的特殊实体列表，可用来替代 parse_mode 进行指定 |
| link_preview_options | [LinkPreviewOptions](#linkpreviewoptions) | *可选*。消息的链接预览生成选项 |

#### InputLocationMessageContent
> **输入位置消息内容**

表示作为内联查询结果发送的位置消息的[内容](#inputmessagecontent) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| latitude | Float | 位置所在纬度的度数 |
| longitude | Float | 位置所在经度的度数 |
| horizontal_accuracy | Float | *可选*。位置的不确定半径，以米为单位；范围 0-1500 |
| live_period | Integer | *可选*。位置可更新的时间间隔（秒），应在 60 至 86400 之间，若为可无限期编辑的实时位置则设为 0x7FFFFFFF。 |
| heading | Integer | *可选*。针对实时位置，用户移动方向（以度为单位）。若指定则必须介于 1 至 360 之间。 |
| proximity_alert_radius | Integer | *可选*。针对实时位置，接近其他聊天成员时的临近提醒最大距离（米）。若指定则必须介于 1 至 100000 之间。 |

#### InputVenueMessageContent
> **输入场所消息内容**

表示作为内联查询结果发送的场所消息的[内容](#inputmessagecontent) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| latitude | Float | 场所的纬度（度） |
| longitude | Float | 场所的经度（度） |
| title | String | 场馆名称 |
| address | String | 场地地址 |
| foursquare_id | String | *可选*。若已知，请提供场地的 Foursquare 标识符 |
| foursquare_type | String | *可选*。若已知，场地的 Foursquare 类型。（例如，“arts_entertainment/default”、“arts_entertainment/aquarium”或“food/icecream”。） |
| google_place_id | String | *可选*。场地的 Google Places 标识符 |
| google_place_type | String | *可选*。场所的 Google Places 类型。（请参阅支持的类型。） |

#### InputContactMessageContent
> **输入联系人消息内容**

表示作为内联查询结果发送的联系消息的[内容](#inputmessagecontent) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| phone_number | String | 联系人的电话号码 |
| first_name | String | 联系人的名字 |
| last_name | String | *可选*。联系人的姓氏 |
| vcard | String | *可选*。关于联系人的附加数据，以 vCard 形式提供，大小为 0-2048 字节。 |

#### InputInvoiceMessageContent
> **输入发票消息内容**

表示作为内联查询结果发送的发票消息的[内容](#inputmessagecontent) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| title | String | 商品名称，1-32 个字符 |
| description | String | 产品描述，1-255 个字符 |
| payload | String | 机器人定义的有效载荷，1-128 字节。这不会显示给用户，请将其用于您的内部流程。 |
| provider_token | String | *可选*。支付提供商令牌，通过 @BotFather 获取。对于 Telegram Stars 中的支付，请传递空字符串。 |
| currency | String | 三位字母的 ISO 4217 货币代码，详见货币相关说明。若使用 Telegram Stars 支付，请传入“XTR”。 |
| prices | Array of [LabeledPrice](#labeledprice) | 价格明细，一个 JSON 序列化的组件列表（例如：产品价格、税费、折扣、配送费、配送税、奖励等）。使用 Telegram Stars 支付时，必须恰好包含一项。 |
| max_tip_amount | Integer | *可选*。以货币最小单位计的小费最高可接受金额（整数，非浮点数/双精度数）。例如，若最高小费为 1.45 美元，则传递 max_tip_amount = 145。请参阅 currencies.json 中的 exp 参数，它显示了每种货币小数点后的位数（大多数货币为 2 位）。默认为 0。在 Telegram Stars 支付中不受支持。 |
| suggested_tip_amounts | Array of Integer | *可选*。一个 JSON 序列化的数组，包含以货币最小单位计的建议小费金额（整数，非浮点数/双精度数）。最多可指定 4 个建议小费金额。建议的小费金额必须为正数，严格按递增顺序传递，且不得超过 max_tip_amount。 |
| provider_data | String | *可选*。一个 JSON 序列化对象，用于存储与发票相关的数据，这些数据将与支付服务提供商共享。所需字段的详细说明应由支付服务提供商提供。 |
| photo_url | String | *可选*。发票的产品照片 URL。可以是商品照片或服务的营销图片。 |
| photo_size | Integer | *可选*。照片大小（字节） |
| photo_width | Integer | *可选*。照片宽度 |
| photo_height | Integer | *可选*。照片高度 |
| need_name | Boolean | *可选*。如需用户全名来完成订单，请传递 True。对于使用 Telegram Stars 的支付，此参数将被忽略。 |
| need_phone_number | Boolean | *可选*。如需用户电话号码来完成订单，请传递 True。对于使用 Telegram Stars 的支付，此参数将被忽略。 |
| need_email | Boolean | *可选*。若需要用户邮箱地址来完成订单，请传递 True。对于 Telegram Stars 支付方式，此参数将被忽略。 |
| need_shipping_address | Boolean | *可选*。若需要用户收货地址来完成订单，请传递 True。对于 Telegram Stars 支付方式，此参数将被忽略。 |
| send_phone_number_to_provider | Boolean | *可选*。若需向服务商提供用户电话号码，请传递 True。在 Telegram Stars 支付中此参数将被忽略。 |
| send_email_to_provider | Boolean | *可选*。若需向服务商提供用户电子邮箱地址，请传递 True。在 Telegram Stars 支付中此参数将被忽略。 |
| is_flexible | Boolean | *可选*。如果最终价格取决于配送方式，则传递 True。对于使用 Telegram Stars 进行的支付，此参数将被忽略。 |

#### ChosenInlineResult
> **选中的内联结果对象**

表示用户选择并发送给其聊天伙伴的内联查询[结果](#inlinequeryresult) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| result_id | String | 所选结果的唯一标识符 |
| from | [User](#user) | 选择结果的用户 |
| location | [Location](#location) | *可选*。发送者位置，仅适用于需要用户位置的机器人 |
| inline_message_id | String | *可选*。已发送内联消息的标识符。仅当消息附有内联键盘时可用。该标识符也将在回调查询中收到，并可用于编辑消息。 |
| query | String | 用于获取结果的查询 |

**注意：** 必须通过 [@BotFather](https://t.me/botfather) 启用 [内联反馈](https://core.telegram.org/bots/inline#collecting-feedback) ，才能在更新中接收这些对象。

#### answerWebAppQuery
> **回应 Web 应用查询**

使用此方法设置与 [Web App](https://core.telegram.org/bots/webapps) 交互的结果，并代表用户在发起查询的聊天中发送相应消息。成功时，将返回一个 [SentWebAppMessage](#sentwebappmessage) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| web_app_query_id | String | 是 | 待应答查询的唯一标识符 |
| result | [InlineQueryResult](#inlinequeryresult) | 是 | 待发送消息的 JSON 序列化对象 |

#### SentWebAppMessage
> **发送的 Web 应用消息对象**

描述由 [Web App](https://core.telegram.org/bots/webapps) 代表用户发送的内联消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| inline_message_id | String | *可选*。已发送内联消息的标识符；仅当消息附有内联键盘时可用 |

#### savePreparedInlineMessage
> **保存准备好的内联消息**

存储可由小程序用户发送的消息。返回一个 [PreparedInlineMessage](#preparedinlinemessage) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 可使用已准备消息的目标用户的唯一标识符 |
| result | [InlineQueryResult](#inlinequeryresult) | 是 | 待发送消息的 JSON 序列化对象 |
| allow_user_chats | Boolean | 否 | 若消息可发送至与用户的私聊，请传递 True |
| allow_bot_chats | Boolean | 否 | 若消息可发送至与机器人的私聊，请传递 True |
| allow_group_chats | Boolean | 否 | 若消息可发送至群组和超级群组聊天，请传递 True |
| allow_channel_chats | Boolean | 否 | 若消息可发送至频道聊天，请传递 True |

#### PreparedInlineMessage
> **准备好的内联消息对象**

描述由迷你应用用户发送的内联消息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 已准备消息的唯一标识符 |
| expiration_date | Integer | 已准备消息的过期时间（Unix 时间）；过期后不可使用 |

### 付款

您的机器人可以接受 Telegram 用户的付款。有关流程以及如何为您的机器人设置付款的更多详细信息，请参阅[支付介绍](https://core.telegram.org/bots/payments) 。

#### sendInvoice
> **发送发票**

使用此方法发送发票。成功时，返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| chat_id | Integer or String | 是 | 目标聊天或频道的用户名或唯一标识符（格式为 `@channelusername`） |
| message_thread_id | Integer | 否 | 目标消息线程（主题）唯一标识符；仅适用于论坛超级群组 |
| direct_messages_topic_id | Integer | 否 | 私聊主题标识符；若消息发送至私聊聊天则必需 |
| title | String | 是 | 产品名称，1-32 个字符 |
| description | String | 是 | 产品描述，1-255 个字符 |
| payload | String | 是 | 机器人定义的发票载荷，1-128 字节；不显示给用户 |
| provider_token | String | 否 | 支付服务提供商令牌；Telegram Stars 支付传递空字符串 |
| currency | String | 是 | 三字母 ISO 4217 货币代码；Telegram Stars 支付传递“XTR” |
| prices | Array of [LabeledPrice](#labeledprice) | 是 | 价格明细的 JSON 序列化列表；Stars 支付时必须恰好包含一项 |
| max_tip_amount | Integer | 否 | 小费最高可接受金额（以货币最小单位计）；默认 0；Stars 支付不支持 |
| suggested_tip_amounts | Array of Integer | 否 | 建议小费金额数组（以货币最小单位计）；最多 4 项；递增且不超过 max_tip_amount |
| start_parameter | String | 否 | 唯一深度链接参数；为空时转发副本包含支付按钮，非空时包含带机器人深度链接的 URL 按钮 |
| provider_data | String | 否 | 与发票相关的 JSON 序列化数据，将与支付服务提供商共享 |
| photo_url | String | 否 | 发票的产品照片 URL |
| photo_size | Integer | 否 | 照片大小（字节） |
| photo_width | Integer | 否 | 照片宽度 |
| photo_height | Integer | 否 | 照片高度 |
| need_name | Boolean | 否 | 若需要用户全名请传递 True；Stars 支付忽略 |
| need_phone_number | Boolean | 否 | 若需要用户电话号码请传递 True；Stars 支付忽略 |
| need_email | Boolean | 否 | 若需要用户邮箱地址请传递 True；Stars 支付忽略 |
| need_shipping_address | Boolean | 否 | 若需要用户收货地址请传递 True；Stars 支付忽略 |
| send_phone_number_to_provider | Boolean | 否 | 向服务商提供用户电话号码；Stars 支付忽略 |
| send_email_to_provider | Boolean | 否 | 向服务商提供用户邮箱地址；Stars 支付忽略 |
| is_flexible | Boolean | 否 | 若最终价格取决于配送方式请传递 True；Stars 支付忽略 |
| disable_notification | Boolean | 否 | 静默发送消息；用户收到无声音通知 |
| protect_content | Boolean | 否 | 保护消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 从机器人余额扣除 |
| message_effect_id | String | 否 | 添加到消息的消息特效唯一标识符；仅限私聊 |
| suggested_post_parameters | [SuggestedPostParameters](#suggestedpostparameters) | 否 | 建议发布的参数；仅限私聊聊天；若作为回复发送至另一建议发布，则该建议发布将自动被拒绝 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 要回复的消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 内联键盘的 JSON 序列化对象；为空显示“支付 总价”按钮，不为空时第一个按钮必须是支付按钮 |

#### createInvoiceLink
> **创建发票链接**

使用此方法创建发票链接。成功时返回创建的发票链接为*字符串* 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表其创建链接的业务连接唯一标识符；仅适用于 Telegram Stars 支付 |
| title | String | 是 | 产品名称，1-32 个字符 |
| description | String | 是 | 产品描述，1-255 个字符 |
| payload | String | 是 | 机器人定义的发票载荷，1-128 字节；不显示给用户 |
| provider_token | String | 否 | 支付服务提供商令牌；Telegram Stars 支付传递空字符串 |
| currency | String | 是 | 三字母 ISO 4217 货币代码；Telegram Stars 支付传递“XTR” |
| prices | Array of [LabeledPrice](#labeledprice) | 是 | 价格明细的 JSON 序列化列表；Stars 支付时必须恰好包含一项 |
| subscription_period | Integer | 否 | 下次付款前订阅保持有效的秒数；使用该参数时货币须为“XTR”；当前必须为 2592000（30 天）；单机器人可有任意数量并发订阅；价格不得超过 10000 Stars |
| max_tip_amount | Integer | 否 | 小费最高可接受金额（以货币最小单位计）；默认 0；Stars 支付不支持 |
| suggested_tip_amounts | Array of Integer | 否 | 建议小费金额数组（以货币最小单位计）；最多 4 项；递增且不超过 max_tip_amount |
| provider_data | String | 否 | 与发票相关的 JSON 序列化数据，将与支付服务提供商共享 |
| photo_url | String | 否 | 发票的产品照片 URL |
| photo_size | Integer | 否 | 照片大小（字节） |
| photo_width | Integer | 否 | 照片宽度 |
| photo_height | Integer | 否 | 照片高度 |
| need_name | Boolean | 否 | 若需要用户全名请传递 True；Stars 支付忽略 |
| need_phone_number | Boolean | 否 | 若需要用户电话号码请传递 True；Stars 支付忽略 |
| need_email | Boolean | 否 | 若需要用户邮箱地址请传递 True；Stars 支付忽略 |
| need_shipping_address | Boolean | 否 | 若需要用户收货地址请传递 True；Stars 支付忽略 |
| send_phone_number_to_provider | Boolean | 否 | 向服务商提供用户电话号码；Stars 支付忽略 |
| send_email_to_provider | Boolean | 否 | 向服务商提供用户邮箱地址；Stars 支付忽略 |
| is_flexible | Boolean | 否 | 若最终价格取决于配送方式请传递 True；Stars 支付忽略 |

#### answerShippingQuery
> **回应运费查询**

如果您发送的发票要求提供收货地址，并且指定了参数 *is_flexible*，Bot API 将向机器人发送一个包含 *shipping_query* 字段的 [Update](#update)。使用此方法来回复配送查询。成功后，返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| shipping_query_id | String | 是 | 待应答查询的唯一标识符 |
| ok | Boolean | 是 | True 表示可递送到指定地址；False 表示存在问题 |
| shipping_options | Array of [ShippingOption](#shippingoption) | 否 | 当 ok 为 True 时必填；可用配送选项的 JSON 序列化数组 |
| error_message | String | 否 | 当 ok 为 False 时必填；解释无法完成订单原因的人类可读消息，Telegram 将向用户显示 |

#### answerPreCheckoutQuery
> **回应预结账查询**

当用户确认付款和配送信息后，Bot API 会以带有 *pre_checkout_query* 字段的 [Update](#update) 形式发送最终确认。使用此方法来响应此类预结账查询。成功时，返回 *True*。 **注意：**Bot API 必须在预结账查询发送后的 10 秒内收到答复。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| pre_checkout_query_id | String | 是 | 待应答查询的唯一标识符 |
| ok | Boolean | 是 | True 表示一切正常（商品有货等）且机器人准备继续处理订单；否则为 False |
| error_message | String | 否 | 当 ok 为 False 时必填；解释无法继续结账原因的人类可读消息，Telegram 将向用户显示 |

#### getMyStarBalance
> **获取我的 Star 余额**

一个用于获取机器人当前 Telegram Stars 余额的方法。无需参数。成功时，返回一个 [StarAmount](#staramount) 对象。

#### getStarTransactions
> **获取 Star 交易记录**

按时间顺序返回机器人的 Telegram 星币交易记录。成功时返回一个 [StarTransactions](#startransactions) 对象。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| offset | Integer | 否 | 响应中需要跳过的交易记录数量 |
| limit | Integer | 否 | 要获取的最大交易记录数；1–100；默认 100 |

#### refundStarPayment
> **退款 Star 支付**

退还一笔成功的 [Telegram Stars](https://t.me/BotNews/90) 支付。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 待退款用户的标识符 |
| telegram_payment_charge_id | String | 是 | Telegram 支付标识符 |

#### editUserStarSubscription
> **编辑用户 Star 订阅**

允许机器人取消或重新启用通过 Telegram Stars 支付的订阅扩展。成功时返回 *True*。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 待编辑订阅用户的标识符 |
| telegram_payment_charge_id | String | 是 | 订阅的 Telegram 支付标识符 |
| is_canceled | Boolean | 是 | True 取消用户订阅扩展（订阅保持有效至当前周期结束）；False 允许用户重新启用先前被机器人取消的订阅 |

#### LabeledPrice
> **标签价格对象**

此对象表示商品或服务价格的一部分。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| label | String | 价格组成部分的标签 |
| amount | Integer | 价格，以货币最小单位表示（整数）；例如 US$1.45 则 amount=145；参见 currencies.json 的 exp 参数 |

#### Invoice
> **发票对象**

此对象包含关于发票的基本信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| title | String | 产品名称 |
| description | String | 产品描述 |
| start_parameter | String | 可用于生成此发票的唯一机器人深度链接参数 |
| currency | String | 三位字母 ISO 4217 货币代码，或使用“XTR”表示 Telegram Stars 支付 |
| total_amount | Integer | 总价（以该货币的最小单位，整数）；例如 US$1.45 则 amount=145；参见 currencies.json 的 exp 参数 |

#### ShippingAddress
> **收货地址对象**

此对象代表一个邮寄地址。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| country_code | String | 两位字母的 ISO 3166-1 alpha-2 国家代码 |
| state | String | 州/省（如适用） |
| city | String | 城市 |
| street_line1 | String | 地址第一行 |
| street_line2 | String | 地址第二行 |
| post_code | String | 邮政编码 |

#### OrderInfo
> **订单信息对象**

此对象表示有关订单的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| name | String | *可选*。用户名 |
| phone_number | String | *可选*。用户手机号 |
| email | String | *可选*。用户邮箱 |
| shipping_address | [ShippingAddress](#shippingaddress) | *可选*。用户收货地址 |

#### ShippingOption
> **运费选项对象**

此对象代表一个配送选项。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 配送选项标识符 |
| title | String | 选项标题 |
| prices | Array of [LabeledPrice](#labeledprice) | 价格组成部分列表 |

#### SuccessfulPayment
> **支付成功对象**

此对象包含成功支付的基本信息。请注意，如果买家在此次交易后向相关支付提供商发起退款，资金可能会从您的余额中扣除。这超出了 Telegram 的控制范围。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| currency | String | 三位字母的 ISO 4217 货币代码，或 Telegram Stars 支付时的“XTR” |
| total_amount | Integer | 总价（以货币最小单位，整数）；例如 US$1.45 则 amount=145；参见 currencies.json 的 exp 参数 |
| invoice_payload | String | 机器人指定的发票载荷 |
| subscription_expiration_date | Integer | *可选*。订阅到期日期（Unix 时间）；仅适用于定期付款 |
| is_recurring | Boolean | *可选*。True 表示订阅的定期付款 |
| is_first_recurring | Boolean | *可选*。True 表示订阅的首次付款 |
| shipping_option_id | String | *可选*。用户所选配送选项标识符 |
| order_info | [OrderInfo](#orderinfo) | *可选*。用户提供的订单信息 |
| telegram_payment_charge_id | String | Telegram 支付标识符 |
| provider_payment_charge_id | String | 支付服务提供商的标识符 |

#### RefundedPayment
> **已退款支付对象**

此对象包含已退款支付的基本信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| currency | String | 三字母 ISO 4217 货币代码；Telegram Stars 支付为“XTR”（当前始终为“XTR”） |
| total_amount | Integer | 总退款金额（以货币最小单位，整数）；例如 US$1.45 则 total_amount=145；参见 currencies.json 的 exp 参数 |
| invoice_payload | String | 机器人指定的发票载荷 |
| telegram_payment_charge_id | String | Telegram 支付标识符 |
| provider_payment_charge_id | String | *可选*。支付服务提供商标识符 |

#### ShippingQuery
> **运费查询对象**

此对象包含有关传入的运输查询的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 唯一查询标识符 |
| from | [User](#user) | 发送查询的用户 |
| invoice_payload | String | 机器人指定的发票载荷 |
| shipping_address | [ShippingAddress](#shippingaddress) | 用户指定的收货地址 |

#### PreCheckoutQuery
> **预结账查询对象**

此对象包含有关传入预结账查询的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 唯一查询标识符 |
| from | [User](#user) | 发送查询的用户 |
| currency | String | 三位字母的 ISO 4217 货币代码；Telegram Stars 支付为“XTR” |
| total_amount | Integer | 总价（以货币最小单位，整数）；例如 US$1.45 则 amount=145；参见 currencies.json 的 exp 参数 |
| invoice_payload | String | 机器人指定的发票载荷 |
| shipping_option_id | String | *可选*。用户选择的配送选项标识符 |
| order_info | [OrderInfo](#orderinfo) | *可选*。用户提供的订单信息 |

#### PaidMediaPurchased
> **付费媒体已购买对象**

此对象包含有关付费媒体购买的信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| from | [User](#user) | 购买媒体的用户 |
| paid_media_payload | String | 机器人指定的付费媒体载荷 |

#### RevenueWithdrawalState
> **收入提现状态对象**

此对象描述收入提现操作的状态。可能的状态：

* [RevenueWithdrawalStatePending](#revenuewithdrawalstatepending)
* [RevenueWithdrawalStateSucceeded](#revenuewithdrawalstatesucceeded)
* [RevenueWithdrawalStateFailed](#revenuewithdrawalstatefailed)

#### RevenueWithdrawalStatePending
> **待处理提现状态**

提现进行中。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 状态类型，始终为“pending” |

#### RevenueWithdrawalStateSucceeded
> **成功提现状态**

提现成功。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 状态类型，始终为“succeeded” |
| date | Integer | 提现完成日期（Unix 时间） |
| url | String | 查看交易详情的 HTTPS URL |

#### RevenueWithdrawalStateFailed
> **失败提现状态**

提现失败，交易已退款。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 状态类型，始终为“failed” |

#### AffiliateInfo
> **推广联盟信息对象**

包含通过此交易获得佣金的联盟信息。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| affiliate_user | [User](#user) | *可选*。接收佣金的机器人或用户 |
| affiliate_chat | [Chat](#chat) | *可选*。接收佣金的聊天 |
| commission_per_mille | Integer | 每获得 1000 个 Telegram Stars 所对应的收益 |
| amount | Integer | 交易中获得的 Telegram Stars 数量（四舍五入到 0；退款时可能为负值） |
| nanostar_amount | Integer | *可选*。以亿分之一为单位的 Telegram Stars 份额；-999999999 至 999999999；退款时可为负值 |

#### TransactionPartner
> **交易合作伙伴对象**

描述交易来源，或对于转出交易的接收方。可能取值：

* [TransactionPartnerUser](#transactionpartneruser)
* [TransactionPartnerChat](#transactionpartnerchat)
* [TransactionPartnerAffiliateProgram](#transactionpartneraffiliateprogram)
* [TransactionPartnerFragment](#transactionpartnerfragment)
* [TransactionPartnerTelegramAds](#transactionpartnertelegramads)
* [TransactionPartnerTelegramApi](#transactionpartnertelegramapi)
* [TransactionPartnerOther](#transactionpartnerother)

#### TransactionPartnerUser
> **用户合作伙伴**

描述与用户的交易。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 交易对手类型，始终为“user” |
| transaction_type | String | 交易类型：“invoice_payment”“paid_media_payment”“gift_purchase”“premium_purchase”“business_account_transfer” |
| user | [User](#user) | 关于该用户的信息 |
| affiliate | [AffiliateInfo](#affiliateinfo) | *可选*。通过此交易获得佣金的关联方信息；仅适用于“invoice_payment”与“paid_media_payment” |
| invoice_payload | String | *可选*。机器人指定的发票载荷。仅适用于“invoice_payment”交易。 |
| subscription_period | Integer | *可选*。付费订阅的持续时间。仅适用于“invoice_payment”交易。 |
| paid_media | Array of [PaidMedia](#paidmedia) | *可选*。用户购买的付费媒体信息；仅适用于“paid_media_payment”交易 |
| paid_media_payload | String | *可选*。机器人指定的付费媒体负载。仅适用于“paid_media_payment”交易。 |
| gift | [Gift](#gift) | *可选*。由机器人发送给用户的礼物；仅适用于“gift_purchase”交易。 |
| premium_subscription_duration | Integer | *可选*。赠送的 Telegram Premium 订阅将有效的月数；仅适用于“premium_purchase”交易 |

#### TransactionPartnerChat
> **聊天合作伙伴**

描述与聊天相关的交易。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 交易伙伴的类型，始终为“chat” |
| chat | [Chat](#chat) | 关于聊天的信息 |
| gift | [Gift](#gift) | *可选*。机器人发送给聊天的礼物 |

#### TransactionPartnerAffiliateProgram
> **推广联盟合作伙伴**

描述通过此交易收到的联盟佣金的发行联盟计划。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 交易伙伴的类型，始终为“affiliate_program” |
| sponsor_user | [User](#user) | *可选*。关于赞助该联盟计划的机器人的信息 |
| commission_per_mille | Integer | 联盟计划赞助商从推荐用户处每收到 1000 个 Telegram Stars，机器人所获得的 Telegram Stars 数量 |

#### TransactionPartnerFragment
> **Fragment 合作伙伴**

描述通过 Fragment 进行的提款交易。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 交易对手类型，始终为“fragment” |
| withdrawal_state | [RevenueWithdrawalState](#revenuewithdrawalstate) | *可选*。若交易为支出，则显示交易状态 |

#### TransactionPartnerTelegramAds
> **Telegram 广告合作伙伴**

描述向 Telegram 广告平台的提款交易。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 交易伙伴的类型，始终为“telegram_ads” |

#### TransactionPartnerTelegramApi
> **Telegram API 合作伙伴**

描述了一笔涉及[付费广播](#paid-broadcasts)支付的交易。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 交易伙伴类型，始终为“telegram_api” |
| request_count | Integer | 超出常规限制并因此计费的成功请求数量 |

#### TransactionPartnerOther
> **其他合作伙伴**

描述一笔来源或接收方未知的交易。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 交易对手的类型，始终为“other” |

#### StarTransaction
> **Star 交易对象**

描述一笔 Telegram Stars 交易。请注意，如果买家在此次交易后，向购买 Stars 的支付提供商（例如 Apple、Google）发起退款，被退还的 Stars 将从机器人的余额中扣除。这不在 Telegram 的控制范围内。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| id | String | 交易的唯一标识符。对于退款交易，与原始交易的标识符一致。对于用户成功支付的入账款项，与 [SuccessfulPayment](#successfulpayment).telegram_payment_charge_id 一致。 |
| amount | Integer | 交易转移的 Telegram Stars 的整数金额 |
| nanostar_amount | Integer | *可选*。交易转移的 Telegram Stars 份额数量，以十亿分之一为单位；范围从 0 到 999999999 |
| date | Integer | 交易创建的日期，以 Unix 时间表示 |
| source | [TransactionPartner](#transactionpartner) | *可选*。入账交易的来源（例如，用户购买商品或服务，Fragment 退还失败的提现）。仅适用于入账交易 |
| receiver | [TransactionPartner](#transactionpartner) | *可选*。出账交易的接收方（例如，购买退款的用户，提现时的 Fragment）。仅适用于出账交易 |

#### StarTransactions
> **Star 交易列表对象**

包含 Telegram 星币交易列表。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| transactions | Array of [StarTransaction](#startransaction) | 交易列表 |

### Telegram 护照

**Telegram Passport** 是一项用于需要个人身份验证服务的统一授权方法。用户只需上传一次证件，即可立即与需要真实身份证明的服务（金融、ICO 等）共享数据。详情请参阅[手册](https://core.telegram.org/passport) 。

#### PassportData
> **护照数据对象**

描述用户与机器人共享的 Telegram Passport 数据。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| data | Array of [EncryptedPassportElement](#encryptedpassportelement) | 包含与机器人共享的文档和其他 Telegram Passport 元素信息的数组 |
| credentials | [EncryptedCredentials](#encryptedcredentials) | 解密数据所需的加密凭证 |

#### PassportFile
> **护照文件对象**

此对象表示上传至 Telegram Passport 的文件。目前所有 Telegram Passport 文件解密后均为 JPEG 格式，且大小不超过 10MB。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| file_id | String | 此文件的标识符，可用于下载或重复使用该文件 |
| file_unique_id | String | 此文件的唯一标识符，预计在不同时间和不同机器人之间保持一致。无法用于下载或重复使用该文件。 |
| file_size | Integer | 文件大小（字节） |
| file_date | Integer | 文件上传时的 Unix 时间戳 |

#### EncryptedPassportElement
> **加密护照元素对象**

描述用户与机器人共享的文档或其他 Telegram Passport 元素。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| type | String | 元素类型。可选值包括：“personal_details”、“passport”、“driver_license”、“identity_card”、“internal_passport”、“address”、“utility_bill”、“bank_statement”、“rental_agreement”、“passport_registration”、“temporary_registration”、“phone_number”、“email”。 |
| data | String | *可选*。用户提供的 Base64 编码加密 Telegram Passport 元素数据；仅适用于“personal_details”、“passport”、“driver_license”、“identity_card”、“internal_passport”和“address”类型。可使用随附的 [EncryptedCredentials](#encryptedcredentials) 进行解密和验证。 |
| phone_number | String | *可选*。用户的已验证电话号码；仅适用于“phone_number”类型 |
| email | String | *可选*。用户的已验证电子邮件地址；仅适用于“email”类型 |
| files | Array of [PassportFile](#passportfile) | *可选*。用户提供的加密文件数组；仅适用于“utility_bill”、“bank_statement”、“rental_agreement”、“passport_registration”和“temporary_registration”类型。文件可以使用随附的加密凭证进行解密和验证。 |
| front_side | [PassportFile](#passportfile) | *可选*。用户提供的证件正面加密文件；仅适用于“护照”、“驾照”、“身份证”和“内部护照”。该文件可使用随附的加密凭证进行解密和验证。 |
| reverse_side | [PassportFile](#passportfile) | *可选*。用户提供的证件背面加密文件；仅适用于“驾照”和“身份证”。该文件可使用随附的加密凭证进行解密和验证。 |
| selfie | [PassportFile](#passportfile) | *可选*。用户提供的、持有证件的用户自拍的加密文件；如果请求“护照”、“驾驶执照”、“身份证”和“内部护照”，则可用。该文件可以使用随附的加密凭据进行解密和验证。 |
| translation | Array of [PassportFile](#passportfile) | *可选*。包含用户提供的翻译版本文档的加密文件数组；当请求类型为“护照”、“驾照”、“身份证”、“内部护照”、“水电费账单”、“银行对账单”、“租赁协议”、“护照登记”和“临时登记”时可用。文件可使用随附的加密凭证进行解密和验证。 |
| hash | String | Base64 编码的元素哈希值，用于未指定护照元素错误 |

#### EncryptedCredentials
> **加密凭证对象**

描述解密和认证 [EncryptedPassportElement](#encryptedpassportelement) 所需的数据。有关数据解密和认证流程的完整说明，请参阅 [Telegram Passport 文档](https://core.telegram.org/passport#receiving-information) 。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| data | String | 经过 Base64 编码的加密 JSON 序列化数据，包含唯一的用户有效载荷、数据哈希值以及解密和认证 [EncryptedPassportElement](#encryptedpassportelement) 所需的密钥。 |
| hash | String | 用于数据认证的 Base64 编码数据哈希 |
| secret | String | 使用机器人公钥 RSA 加密的 Base64 编码密钥，用于数据解密 |

#### setPassportDataErrors
> **设置护照数据错误**

通知用户，其提供的某些 Telegram Passport 元素包含错误。在错误修复之前（您返回错误的字段内容必须更改），用户将无法重新提交其 Passport。成功时返回 *True*。

如果用户提交的数据因任何原因不符合您服务所需的标准，请使用此功能。例如，如果生日日期似乎无效、提交的文件模糊、扫描件显示有篡改迹象等。请在错误消息中提供一些详细信息，以确保用户知道如何纠正问题。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 用户标识符 |
| errors | Array of [PassportElementError](#passportelementerror) | 是 | 描述错误的 JSON 序列化数组 |

#### PassportElementError
> **护照元素错误对象**

此对象表示用户提交的 Telegram Passport 元素中存在的错误，需要用户自行解决。它应为以下类型之一：

* [PassportElementErrorDataField](#passportelementerrordatafield)
* [PassportElementErrorFrontSide](#passportelementerrorfrontside)
* [PassportElementErrorReverseSide](#passportelementerrorreverseside)
* [PassportElementErrorSelfie](#passportelementerrorselfie)
* [PassportElementErrorFile](#passportelementerrorfile)
* [PassportElementErrorFiles](#passportelementerrorfiles)
* [PassportElementErrorTranslationFile](#passportelementerrortranslationfile)
* [PassportElementErrorTranslationFiles](#passportelementerrortranslationfiles)
* [PassportElementErrorUnspecified](#passportelementerrorunspecified)

#### PassportElementErrorDataField
> **数据字段错误**

表示用户提供的某个数据字段存在问题。当字段的值发生变化时，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源，必须是 data |
| type | String | 用户 Telegram 护照中包含错误的部分，可选值包括“personal_details”、“passport”、“driver_license”、“identity_card”、“internal_passport”、“address” |
| field_name | String | 出现错误的数据字段名称 |
| data_hash | String | Base64 编码的数据哈希 |
| message | String | 错误信息 |

#### PassportElementErrorFrontSide
> **正面照片错误**

表示文档正面存在问题。当包含文档正面的文件发生变化时，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源，必须是 front_side |
| type | String | 用户 Telegram Passport 中出问题的部分，可选值包括“passport”、“driver_license”、“identity_card”、“internal_passport” |
| file_hash | String | 文件正面文档的 Base64 编码哈希值 |
| message | String | 错误信息 |

#### PassportElementErrorReverseSide
> **反面照片错误**

表示文档反面的问题。当文档反面的文件发生变化时，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源，必须是 reverse_side |
| type | String | 用户 Telegram 护照中存在问题部分，可选值为“driver_license”、“identity_card” |
| file_hash | String | 文档反面的文件经过 Base64 编码的哈希值 |
| message | String | 错误信息 |

#### PassportElementErrorSelfie
> **自拍错误**

表示与证件自拍照相关的问题。当包含自拍照的文件发生变化时，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源，必须是 selfie |
| type | String | 用户 Telegram 护照中存在问题的那一部分，可能是“passport”、“driver_license”、“identity_card”或“internal_passport”之一 |
| file_hash | String | 带有自拍文件的 Base64 编码哈希值 |
| message | String | 错误信息 |

#### PassportElementErrorFile
> **文件错误**

表示文档扫描存在问题。当包含文档扫描的文件发生变化时，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源，必须是 file |
| type | String | 用户 Telegram 护照中存在问题的部分，包括“utility_bill”、“bank_statement”、“rental_agreement”、“passport_registration”、“temporary_registration”中的一种。 |
| file_hash | String | Base64 编码的文件哈希 |
| message | String | 错误信息 |

#### PassportElementErrorFiles
> **多个文件错误**

表示扫描列表存在问题。当包含扫描的文件列表发生变化时，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源，必须是 files |
| type | String | 用户 Telegram 护照中存在问题部分，其中之一为“utility_bill”、“bank_statement”、“rental_agreement”、“passport_registration”、“temporary_registration” |
| file_hashes | Array of String | Base64 编码的文件哈希值列表 |
| message | String | 错误信息 |

#### PassportElementErrorTranslationFile
> **翻译文件错误**

表示构成文档翻译的文件之一存在问题。当文件发生变化时，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源，必须是 translation_file |
| type | String | 用户 Telegram 护照中存在问题元素的类型，包括“passport”、“driver_license”、“identity_card”、“internal_passport”、“utility_bill”、“bank_statement”、“rental_agreement”、“passport_registration”、“temporary_registration”之一 |
| file_hash | String | Base64 编码的文件哈希 |
| message | String | 错误信息 |

#### PassportElementErrorTranslationFiles
> **多个翻译文件错误**

表示文档翻译版本存在问题。当包含文档翻译更改的文件上传后，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源必须是 translation_files |
| type | String | 用户 Telegram 护照中存在问题元素的类型，包括“passport”、“driver_license”、“identity_card”、“internal_passport”、“utility_bill”、“bank_statement”、“rental_agreement”、“passport_registration”、“temporary_registration”中的一种 |
| file_hashes | Array of String | Base64 编码的文件哈希值列表 |
| message | String | 错误信息 |

#### PassportElementErrorUnspecified
> **未指定错误**

表示在未指定位置出现的问题。当添加新数据时，该错误被视为已解决。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| source | String | 错误来源，必须为 unspecified |
| type | String | 用户 Telegram 护照中存在问题元素的类型 |
| element_hash | String | Base64 编码的元素哈希 |
| message | String | 错误信息 |

### 游戏

您的机器人可以向用户提供 **HTML5 游戏** ，支持单人游玩或在群组及一对一聊天中进行对战。通过 [@BotFather](https://t.me/botfather) 使用 */newgame* 命令即可创建游戏。请注意，此类功能伴随着责任：您需要接受机器人将提供的每款游戏的条款。

* 游戏是 Telegram 平台上的新型内容形式，由 [Game](#game) 和 [InlineQueryResultGame](#inlinequeryresultgame) 对象实现。
* 当你通过 [BotFather](https://t.me/botfather) 创建游戏后，你可以使用 [sendGame](#sendgame) 方法将游戏作为普通消息发送到聊天中，或者使用 [InlineQueryResultGame](#inlinequeryresultgame) 配合 [inline mode](#inline-mode)。
* 如果你发送的游戏消息没有任何按钮，它会自动带有一个“玩 *游戏名称* ”按钮。当这个按钮被按下时，你的机器人会收到一个包含所请求游戏的 *game_short_name* 的 [CallbackQuery](#callbackquery)。你为该特定用户提供正确的 URL，应用就会在应用内浏览器中打开游戏。
* 你可以手动为游戏消息添加多个按钮。请注意，第一行的第一个按钮**必须始终**用于启动游戏，使用 [InlineKeyboardButton](#inlinekeyboardbutton) 中的 *callback_game* 字段。你可以根据喜好添加额外的按钮：例如，用于说明游戏规则，或打开游戏的官方社区。
* 为了让你的游戏更具吸引力，你可以通过 [BotFather](https://t.me/botfather) 上传一个 GIF 动画向用户展示游戏（例如，可以参考 [Lumberjack](https://t.me/gamebot?game=lumberjack)）。
* 游戏消息还会显示当前聊天中的最高分。使用 [setGameScore](#setgamescore) 可将最高分发布到游戏聊天中，添加 *disable_edit_message* 参数可禁用根据当前积分榜自动更新消息的功能。
* 使用 [getGameHighScores](#getgamehighscores) 可获取游戏内高分榜的数据。
* 您还可以添加一个额外的 [分享按钮](https://core.telegram.org/bots/games#sharing-your-game-to-telegram-chats) ，让用户将他们的最佳成绩分享到不同的聊天中。
* 如需了解使用这些新功能可以实现的效果，请查看 [@gamebot](https://t.me/gamebot) 和 [@gamee](https://t.me/gamee) 机器人。

#### sendGame
> **发送游戏**

使用此方法发送游戏。成功时，返回已发送的[消息](#message) 。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| business_connection_id | String | 否 | 代表发送消息的业务连接唯一标识符 |
| chat_id | Integer | 是 | 目标聊天的唯一标识符；游戏不可发送至频道私聊与频道聊天 |
| message_thread_id | Integer | 否 | 目标消息线程（主题）唯一标识符；仅适用于论坛超级群组 |
| game_short_name | String | 是 | 游戏简称（唯一标识符）；通过 @BotFather 设置 |
| disable_notification | Boolean | 否 | 静默发送消息；用户将收到无声音的通知 |
| protect_content | Boolean | 否 | 保护已发送消息内容不被转发和保存 |
| allow_paid_broadcast | Boolean | 否 | 付费允许每秒最多 1000 条消息，忽略广播限制；相关 Stars 从机器人余额扣除 |
| message_effect_id | String | 否 | 添加到消息的消息特效唯一标识符；仅限私聊 |
| reply_parameters | [ReplyParameters](#replyparameters) | 否 | 回复消息的描述 |
| reply_markup | [InlineKeyboardMarkup](#inlinekeyboardmarkup) | 否 | 内联键盘；为空显示“Play game_title”按钮，不为空时第一个按钮必须启动游戏 |

#### Game
> **游戏对象**

此对象代表一个游戏。使用 BotFather 来创建和编辑游戏，其短名称将作为唯一标识符。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| title | String | 游戏标题 |
| description | String | 游戏描述 |
| photo | Array of [PhotoSize](#photosize) | 将在聊天中游戏消息内显示的图片 |
| text | String | *可选*。游戏简介或高分记录；setGameScore 调用可自动编辑为当前最高分；亦可通过 editMessageText 手动编辑；0-4096 字符 |
| text_entities | Array of [MessageEntity](#messageentity) | *可选*。文本中的特殊实体（用户名、URL、机器人命令等） |
| animation | [Animation](#animation) | *可选*。将在游戏消息中展示的动画；通过 BotFather 上传 |

#### CallbackGame
> **游戏回调对象**

一个占位符，目前不包含任何信息。请使用 [BotFather](https://t.me/botfather) 来设置你的游戏。

#### setGameScore
> **设置游戏分数**

使用此方法来设置指定用户在游戏消息中的分数。成功后，如果该消息不是内联消息，则返回 [Message](#message)，否则返回 *True*。如果新分数不大于用户在聊天中的当前分数且 *force* 为 *False*，则返回错误。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 用户标识符 |
| score | Integer | 是 | 新分数；必须为非负数 |
| force | Boolean | 否 | True 允许高分降低；用于修正错误或封禁作弊者 |
| disable_edit_message | Boolean | 否 | True 表示不自动编辑游戏消息以包含当前积分榜 |
| chat_id | Integer | 否 | 若未指定 *inline_message_id* 则必需；目标聊天唯一标识符 |
| message_id | Integer | 否 | 若未指定 *inline_message_id* 则必需；已发送消息的标识符 |
| inline_message_id | String | 否 | 若未指定 *chat_id* 与 *message_id* 则必需；内联消息的标识符 |

#### getGameHighScores
> **获取游戏高分榜**

使用此方法获取高分榜数据。将返回指定用户在游戏中的分数及其若干邻近玩家的分数。返回一个由 [GameHighScore](#gamehighscore) 对象组成的数组。

> 此方法当前将返回目标用户的分数，以及其两侧各两位最接近的邻近玩家的分数。如果目标用户及其邻近玩家未进入前三名，则同时返回前三名用户。请注意，此行为可能发生变更。

| 参数 | 类型 | 必需 | 描述 |
| :--- | :--- | :--- | :--- |
| user_id | Integer | 是 | 目标用户 ID |
| chat_id | Integer | 否 | 若未指定 *inline_message_id* 则必需；目标聊天唯一标识符 |
| message_id | Integer | 否 | 若未指定 *inline_message_id* 则必需；已发送消息的标识符 |
| inline_message_id | String | 否 | 若未指定 *chat_id* 与 *message_id* 则必需；内联消息的标识符 |

#### GameHighScore
> **游戏高分对象**

此对象表示游戏高分表中的一行数据。

| 字段 | 类型 | 描述 |
| :--- | :--- | :--- |
| position | Integer | 游戏高分榜排名 |
| user | [User](#user) | 用户 |
| score | Integer | 分数 |

* * *

以上就是我们目前所提供的内容。如果您有任何疑问，请查阅我们的[**机器人常见问题解答 »**](https://core.telegram.org/bots/faq)
