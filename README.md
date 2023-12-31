# 个人博客

此博客系统是改自FE-个人博客,用于三阶段项目课程设计；原作者地址：

[FE-博客系统](https://gitee.com/gu_jun_mo/fe-blog-system)

具体更改如下（1.0~1.2是数据库课程时写的，不想改了--->一个项目两个课设，咳咳）

## 博客系统更说明   -V1.0

时间: 2023年12月16日20点32分

简单来说就是改框架。

### 后端更改：

- 利用SpringBoot整合了该项目的后端，解决使用当前项目用Tomcat部署时由于war包命名导致找不到网页的问题
- 利用Mybatis Plus简化了该项目后端的部分Mapper层和Services层
- 整合了所有控制层代码，并简化了部分控制层代码
- 改写了有关控制层代码
- 将部分项目配置文件上传至Nacos配置中心统一管理
- 将部分Session存进Redis
- 此项目不再需要打成war包。
- 增加部分控制层异常处理部分

### 前端更改：

- 增加了用户注册功能，采用邮箱发送验证码的方式
- 解决了个人用户信息界面中显示的信息为admin的问题
- 解决了用户上传图像后，只能在个人用户信息界面显示图像而在其它后台只能显示默认头像的问题
- 解决了系统重启后用户头像重置为默认图像的问题
- 开放了图像上传大小的限制，上传的文件大小从原来的1MB扩大到现在的4MB
- 现在用户发布博客的作者不再是“admin"，而是自己的名字
- 现在用户只能编辑由自己发布的博客
- 在未登录的情况下将无法进入后台页面
- 用户无法删除部分默认图片



———————————————————————————————————————————————————

## 博客系统更说明   -V1.1

时间: 2023年12月18日15点36分

此次更新，仅对博客评论部分做出修改

### 后端更改：

更改了所有控制层的返回数据，并简化代码

### 前端更改：

主页博客每页博客数量由原来的8个减少为5个

现在评论博客必须登录后才能品论

现在评论后名字不再是游客名字而是用户名

———————————————————————————————————————————————————

## 博客系统更说明   -V1.2

时间：2023年12月19日15点42分

此次更新修复了博客“分类”页面中已知问题

### 后端更改：

无

### 前端更改：

修复了分类页面图片无法显示的问题

修复了分类页面显示的博客只能显示admin的问题，现在任何人发布的博客都能显示

———————————————————————————————————————————————————

## 博客系统更说明   -V1.3

时间:2023年12月23日14点11分

这次写这段只是说明将系统改成了微服务架构，用于三阶段项目

### 后端更改：

拆分为微服务架构，把发验证码的部分拆成完全独立的模块，并在原模块使用自动配置注解类配置相关请求url。

使用Gateway网关

### 前端更改：

无

———————————————————————————————————————————————————

## 前端技术栈

HTML、CSS、JavaScript、sass、Less、Layui

## 后端技术栈

Java11+Maven 3.9.5+Spring Boot 2.7.16+Spring Cloud 3.1.6+MyBatis Plus+Jakarta  Mail+Sentinel+Gateway+git/github+MySQL8+STDOUT_LOGGING(Mybatis日志工具)+Nacos+Redis+Lombok+fastjson+fastDFS

## 测试工具

Apache Jmeter(~~没有流量就自己创造流量~~),Cpolar(内网穿透方便其他同学测试，访问速度比较慢。~~毕竟是免费的东西，没钱整校园网和云服务器~~。)

## 环境配置

本次更新，需要使用java11运行环境，除此之外还需要Redis和Nacos而外的配置。

由于SpringBoot内置一个Tomcat服务器，故不需要而外配置Tomcat服务器

## 使用说明

除配置数据库外，还需要而外以下操作:

1. Redis(下载链接：[Redis Windos版下载](https://github.com/tporadowski/redis/releases "Redis Windos版下载")),下载完毕后即可打开
2. Nacos(使用文档[Nacos 快速开始](https://nacos.io/zh-cn/docs/quick-start.html "Nacos 使用文档"))，下载完毕后根据官方文档，创建一个命名空间，id号为192099489，名字FE_BLOG,并在配置管理找到相应的命名空间，然后把配置文件（nacos_config_export_20231223113249.zip）导入。
3. Sentinel([Sentinel使用文档](https://github.com/alibaba/Sentinel/wiki/%E4%BB%8B%E7%BB%8D))下载后找到sentinel-dashboard.jar,并启动它
3. 把upload文件放在D盘根目录（如果是Windows环境下）
4. 使用相关工具导入数据库脚本文件

## 注意事项

由于数据库脚本中头像使用的是windosn路径下的文件名（真的只是文件名）但是微服务架构必须在Liunx环境下运行，后续可能需要更改头像地址,因此可能需要Docker模拟该环境（后续再补)









