---
title: "MySql 获取每个分组最新10条记录 自定义变量"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Mysql"]
---

```sql

SELECT
    a.*
FROM
    (
    SELECT
        t1.*,
        @curr_cnt := t1.type AS curr_type,
        @rank := IF(
            @prev_cnt = @curr_cnt,
            @rank + 1,
            1
        ) AS rank,
        @prev_cnt := @curr_cnt AS prev_type
    FROM
        `goods` AS t1,
        (
        SELECT
            @curr_cnt := 0,
            @prev_cnt := 0,
            @rank := 0
    ) AS t2
ORDER BY
    t1.type,
    t1.addtime
DESC
) AS a
WHERE
    a.rank <= 10

```

### 查询逻辑

1. 对 `goods` 表进行排序, 先按分类 `type` 正序, 再按上架时间 `addtime` 倒序
```

`goods` AS t1,

...中间省略

ORDER BY
    t1.type,
    t1.addtime

```

2. 初始化变量, 相当于  `SET @curr_cnt := 0, @prev_cnt := 0, @rank := 0; `
```

        SELECT
            @curr_cnt := 0,
            @prev_cnt := 0,
            @rank := 0

```

3. 按分类进行编号, 当type与上一条记录的type相同时编号+1, 不同时编号重置为1
```

        @curr_cnt := t1.type AS curr_type,
        @rank := IF(
            @prev_cnt = @curr_cnt,
            @rank + 1,
            1
        ) AS rank,
        @prev_cnt := @curr_cnt AS prev_type

```

4. 筛选最新上架的10条记录 ( 编号 < 10 )
```

WHERE
    a.rank <= 10

```

