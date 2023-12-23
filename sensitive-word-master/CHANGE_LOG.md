# 变更日志

| 类型 | 说明 |
|:----|:----|
| A | 新增 |
| U | 更新 |
| D | 删除 |
| T | 测试 |
| O | 优化 |
| F | 修复BUG |

# release_0.0.1

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 基本功能的实现 | 2020-1-7 21:46:32 | |

# release_0.0.2

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | O | 优化最大长度匹配模式 | 2020-1-8 09:34:35 | |
| 2 | A | 新增替换实现 | 2020-1-8 09:34:35 | 性能优于各种博客的直接正则替换。|
| 3 | O | 优化公共代码到 heaven 项目 | 2020-1-8 09:34:35 | 便于后期统一维护整理。|
| 4 | O | 初步优化 DFA 对应 map 的大小 | 2020-1-8 09:34:35 | |

# release_0.0.3

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | O | 优化敏感词大小 | 2020-1-8 09:34:35 | |

# release_0.0.4

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 支持大小写转换 | 2020-1-9 09:34:35 | |
| 1 | A | 支持半角全角转换 | 2020-1-9 09:34:35 | |

# release_0.0.5

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | D | 移除单个字符 `v` | 2020-1-9 09:34:35 | |
| 2 | D | 移除单个字符 `我` | 2020-1-10 09:34:35 | |
| 3 | O | 责任链模式优化代码实现 | 2020-1-10 09:34:35 | |
| 4 | A | 支持数字格式化转换 | 2020-1-10 09:34:35 | |
| 5 | A | 支持数字敏感词验证 | 2020-1-10 09:34:35 | |
| 6 | O | 优化所有写法的数字为阿拉伯写法 | 2020-1-10 09:34:35 | |

# release_0.0.6

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 添加中文繁简体转换支持 | 2020-1-10 09:34:35 | |
| 2 | A | 添加英文常见写法转换支持 | 2020-1-10 09:34:35 | |
| 3 | A | 新增敏感词 `艹` | 2020-1-10 09:34:35 | |
| 4 | D | 移除单个词 `k买仆办功务动区卖台吨天房本歌滚灾独证踢弓` | 2020-1-10 09:34:35 | |

# release_0.0.7

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 添加忽略重复词支持 | 2020-1-10 09:34:35 | |

# release_0.0.8

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 添加用户自定义敏感词和白名单 | 2020-1-10 09:34:35 | |

# release_0.0.9

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 添加邮箱检测 | 2020-1-11 09:34:35 | |

# release_0.0.10

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | F | 修复依赖包 heaven 版本 | 2020-1-11 09:34:35 | |

# release_0.0.11

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 添加对于数字过滤的可配置型 | 2020-1-14 22:48:12 | |
| 2 | A | 添加部分敏感词 | 2020-1-14 22:48:12 | |

# release_0.0.12

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 添加对于网址的过滤 | 2020-1-16 20:51:58 | |

# release_0.0.13

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 新增 Helper 工具类 | 2021-5-12 20:51:58 | |
| 2 | A | 新增动态词库初始化支持 | 2021-5-12 20:51:58 | |

# release_0.0.14

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 开发样式配置特性 | 2021-5-31 20:51:58 | |

# release_0.0.15

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 优化 init 方式 | 2021-7-16 20:51:58 | |

# release_0.1.0

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 返回敏感词对应的下标范围 | 2021-8-8 20:51:58 | |
| 2 | U | ignoreRepeat 默认为 false | 2021-8-8 20:51:58 | |
| 3 | U | 把测试、系统、买卖、彩票等常用词移出敏感词库 | 2021-8-8 20:51:58 | |

# release_0.1.1

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | F | 自定义敏感词 allow/deny 进行格式化处理 | 2021-12-11 23:51:58 | |

# release_0.2.0

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | A | 允许用户自定义替换策略 | 2022-01-15 23:51:58 | |
| 2 | U | 升级二方数据库依赖 | 2022-01-15 23:51:58 | |

# release_0.2.1

| 序号 | 变更类型 | 说明 | 时间 | 备注 |
|:---|:---|:---|:---|:--|
| 1 | O | 移除日志初始化的控台日志输出 | 2023-02-17 23:51:58 | |
| 2 | A | 支持数字检验的长度指定 | 2022-01-17 23:51:58 | |

# release_0.3.0

| 序号 | 变更类型 | 说明               | 时间                  | 备注 |
|:---|:-----|:-----------------|:--------------------|:--|
| 1  | O    | 移除冗余的耗时统计        | 2023-06-06 23:51:58 | |
| 2  | A    | 优化代码实现方式，添加工具类方法 | 2023-06-06 23:51:58 | |


# release_0.3.1

| 序号 | 变更类型 | 说明    | 时间                  | 备注                                              |
|:---|:-----|:------|:--------------------|:------------------------------------------------|
| 1  | O    | 敏感词添加 | 2023-06-06 23:51:58 | 幸运/幸运儿/17年前/1条/1梯两户/1比1/年检/幸存/幸运/幸运儿/恶搞/游戏机/日/草 |
| 2  | A    | 敏感词添加 | 2023-06-06 23:51:58 | SB  |

# release_0.3.2

| 序号 | 变更类型 | 说明      | 时间                  | 备注     |
|:---|:-----|:--------|:--------------------|:-------|
| 1  | O    | 中文繁简体样式 | 2023-06-07 23:51:58 | 调整实现策略 |
| 2  | A    | 代码结构优化 | 2023-06-07 23:51:58 | 调整实现策略 |

# release_0.4.0

| 序号 | 变更类型 | 说明          | 时间                  | 备注     |
|:---|:-----|:------------|:--------------------|:-------|
| 1  | O    | 优化单词校验逻辑    | 2023-06-08 23:51:58 |  |
| 2  | A    | 新增是否单词校验的开关 | 2023-06-08 23:51:58 |  |


# release_0.5.0

| 序号 | 变更类型 | 说明                          | 时间                  | 备注     |
|:---|:-----|-----------------------------|:--------------------|:-------|
| 1  | A    | 优化单词结果，减少 String 创建         | 2023-06-08 23:51:58 |  |
| 2  | A    | 优化 contains 判断，减少 String 创建 | 2023-06-08 23:51:58 |  |

# release_0.6.0

| 序号 | 变更类型 | 说明                       | 时间                  | 备注     |
|:---|:-----|--------------------------|:--------------------|:-------|
| 1  | O    | 性能优化：字符映射统一处理一遍，而不是每次都处理 | 2023-06-09 23:51:58 |  |
| 2  | D    | 移除废弃的 replaceContext     | 2023-06-09 23:51:58 |  |

# release_0.7.0

| 序号 | 变更类型 | 说明                                          | 时间                  | 备注              |
|:---|:-----|---------------------------------------------|:--------------------|:----------------|
| 1  | A    | IWordMap 命名调整为 IWordData, 添加 Tree 实现。优化内存占用 | 2023-06-09 23:51:58 | 避免过于限制，放开便于后续拓展 |

# release_0.8.0

| 序号 | 变更类型 | 说明                                          | 时间                  | 备注              |
|:---|:-----|---------------------------------------------|:--------------------|:----------------|
| 1  | A    | 添加 ICharFormatCombine | 2023-06-10 23:51:58 | 允许用户自定义格式化组合策略 |
| 2  | A    | 添加 ISensitiveCheckCombine | 2023-06-10 23:51:58 | 允许用户自定义敏感词校验组合策略 |
| 3  | A    | 添加 IWordAllowDenyCombine | 2023-06-10 23:51:58 | 允许用户自定义 allow+deny 的组合策略 |
| 4  | A    | 添加引导类进阶的配置使用说明 | 2023-06-10 23:51:58 |  放在后续，避免内部接口不够稳定 |
| 5  | U    | 内部接口名称统一为 IWordXXX | 2023-06-10 23:51:58 |  |

# release_0.9.0

| 序号 | 变更类型 | 说明              | 时间                  | 备注    |
|:---|:-----|-----------------|:--------------------|:------|
| 1  | O    | 移除单个汉字+部分常用词的脏词 | 2023-11-17 23:51:58 | 降低误判率 |

# release_0.10.0

| 序号 | 变更类型 | 说明               | 时间                  | 备注    |
|:---|:-----|------------------|:--------------------|:------|
| 1  | A    | 添加脏词的标签接口，便于后续拓展 | 2023-12-05 23:51:58 |  |

# release_0.11.0

| 序号 | 变更类型 | 说明                   | 时间                  | 备注    |
|:---|:-----|----------------------|:--------------------|:------|
| 1  | A    | 添加忽略字符接口，便于跳过一些干扰的字符 | 2023-12-08 23:51:58 |  |