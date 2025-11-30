---
title: "用Jquery更新vue模型"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Js"]
tags: ["javascript", "jquery", "vue", "前端", "事件处理"]
slug: "update-vue-model-with-jquery"
---

用Jquery更新vue模型

```javascript
$('.button').on('click', function() {
  
  // Find inputs
  const input = $("input[name='title']");

  // Set value
  input.val('some new value');

  // Create native event
  const event = new Event('input', { bubbles: true });

  // Dispatch the event on "native" element
  input.get(0).dispatchEvent(event);
});
```

