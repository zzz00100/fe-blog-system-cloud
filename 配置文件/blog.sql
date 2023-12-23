/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : db_mybatis

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 19/12/2023 12:56:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `blog_id` int NOT NULL AUTO_INCREMENT COMMENT '博客主键',
  `title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创造类型（原创，转载，二创）',
  `deleted` int NOT NULL DEFAULT 0 COMMENT '逻辑删除字段 0-未删除 1-删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` int NULL DEFAULT NULL COMMENT '状态(1,草稿，2已发布，3已过时（已删除）)',
  `user_id` int NULL DEFAULT NULL COMMENT '作者id',
  `field_id` int NULL DEFAULT NULL COMMENT '领域id',
  `author` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '作者名字',
  PRIMARY KEY (`blog_id`) USING BTREE,
  UNIQUE INDEX `index_id`(`blog_id` ASC) USING BTREE,
  INDEX `fieldID`(`field_id` ASC) USING BTREE,
  CONSTRAINT `FIELD_ID` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, '博客系统更新说明', '<h1 id=\"h1-fe-blog-system\"><a name=\"fe-blog-system\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>fe-blog-system</h1><h2 id=\"h2--v1-0\"><a name=\"博客系统更说明   -V1.0\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>博客系统更说明   -V1.0</h2><p>时间: 2023年12月16日20点32分</p>\n<hr>\n<p>为了更好的提升用户体验，对该博客系统进行了一次更新。</p>\n<h3 id=\"h3--\"><a name=\"后端更改：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>后端更改：</h3><ul>\n<li>利用SpringBoot整合了该项目的后端，解决使用当前项目用Tomcat部署时由于war包命名导致找不到网页的问题</li><li>利用Mybatis Plus简化了该项目后端的部分Mapper层和Services层</li><li>整合了所有控制层代码，并简化了部分控制层代码</li><li>改写了有关控制层代码</li><li>将部分项目配置文件上传至Nacos配置中心统一管理</li><li>将部分Session存进Redis</li><li>此项目不再需要打成war包。</li><li>增加部分控制层异常处理部分</li></ul>\n<h3 id=\"h3--\"><a name=\"前端更改：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>前端更改：</h3><ul>\n<li>增加了用户注册功能，采用邮箱发送验证码的方式</li><li>解决了个人用户信息界面中显示的信息为admin的问题</li><li>解决了用户上传图像后，只能在个人用户信息界面显示图像而在其它后台只能显示默认头像的问题</li><li>解决了系统重启后用户头像重置为默认图像的问题</li><li>开放了图像上传大小的限制，上传的文件大小从原来的1MB扩大到现在的4MB</li><li>现在用户发布博客的作者不再是“admin”，而是自己的名字</li><li>现在用户只能编辑经自己发布的博客</li><li>在未登录的情况下将无法进入后台页面</li><li>用户无法删除部分默认图片</li></ul>\n<h3 id=\"h3-u524Du7AEFu6280u672Fu6808\"><a name=\"前端技术栈\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>前端技术栈</h3><p>HTML、CSS、JavaScript、sass、Less、Layui</p>\n<h3 id=\"h3-u540Eu7AEFu6280u672Fu6808\"><a name=\"后端技术栈\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>后端技术栈</h3><p>Java11+Maven3.6.3+Spring Boot+MyBatis Plus+DevTools+Jakarta Mail+MySQL8+STDOUT_LOGGING(Mybatis日志工具)+Nacos+Redis+Lombok+Junit+fastjson</p>\n<h3 id=\"h3-u6D4Bu8BD5u5DE5u5177\"><a name=\"测试工具\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>测试工具</h3><p>Apache Jmeter(<del>没有流量就自己创造流量</del>),Cpolar(内网穿透方便其他同学测试，访问速度比较慢。<del>毕竟是免费的东西，没钱整校园网和云服务器</del>。<br>)</p>\n<h3 id=\"h3-u73B0u5DF2u77E5u95EEu9898\"><a name=\"现已知问题\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>现已知问题</h3><ul>\n<li>部分代码会出现运行时异常，而这些异常还没有被捕获</li><li>控制层返回的数据不统一</li><li>新建博客时博客没选也能提交</li><li>媒体库管理中音乐管理无法使用（后续不考虑使用）</li><li>分页功能没有起作用</li><li>由于这个项目是改造别人的，所以暂时不会使用Git.(不放在公共的代码仓库)</li></ul>\n<h2 id=\"h2-u73AFu5883u914Du7F6E\"><a name=\"环境配置\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>环境配置</h2><p>本次更新，需要使用java11运行环境，除此之外还需要Redis和Nacos而外的配置。</p>\n<p>由于SpringBoot内置一个Tomcat服务器，故不需要而外配置Tomcat服务器</p>\n<h2 id=\"h2-u4F7Fu7528u8BF4u660E\"><a name=\"使用说明\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>使用说明</h2><p>除配置数据库外，还需要而外以下操作:</p>\n<ol>\n<li>Redis(下载链接：<a href=\"https://github.com/tporadowski/redis/releases\" title=\"Redis Windos版下载\">Redis Windos版下载</a>),下载完毕后即可打开</li><li>Nacos(使用文档<a href=\"https://nacos.io/zh-cn/docs/quick-start.html\" title=\"Nacos 使用文档\">Nacos 快速开始</a>)，下载完毕后将配置导入即可（记得修改数据库配置）</li></ol>\n￥# fe-blog-system\n\n\n\n## 博客系统更说明   -V1.0\n\n时间: 2023年12月16日20点32分\n\n------------\n\n为了更好的提升用户体验，对该博客系统进行了一次更新。\n\n### 后端更改：\n\n- 利用SpringBoot整合了该项目的后端，解决使用当前项目用Tomcat部署时由于war包命名导致找不到网页的问题\n- 利用Mybatis Plus简化了该项目后端的部分Mapper层和Services层\n- 整合了所有控制层代码，并简化了部分控制层代码\n- 改写了有关控制层代码\n- 将部分项目配置文件上传至Nacos配置中心统一管理\n- 将部分Session存进Redis\n- 此项目不再需要打成war包。\n- 增加部分控制层异常处理部分\n\n### 前端更改：\n\n- 增加了用户注册功能，采用邮箱发送验证码的方式\n- 解决了个人用户信息界面中显示的信息为admin的问题\n- 解决了用户上传图像后，只能在个人用户信息界面显示图像而在其它后台只能显示默认头像的问题\n- 解决了系统重启后用户头像重置为默认图像的问题\n- 开放了图像上传大小的限制，上传的文件大小从原来的1MB扩大到现在的4MB\n- 现在用户发布博客的作者不再是“admin\"，而是自己的名字\n- 现在用户只能编辑经自己发布的博客\n- 在未登录的情况下将无法进入后台页面\n- 用户无法删除部分默认图片\n\n### 前端技术栈\n\nHTML、CSS、JavaScript、sass、Less、Layui\n\n### 后端技术栈\n\nJava11+Maven3.6.3+Spring Boot+MyBatis Plus+DevTools+Jakarta Mail+MySQL8+STDOUT_LOGGING(Mybatis日志工具)+Nacos+Redis+Lombok+Junit+fastjson\n\n### 测试工具\n\nApache Jmeter(~~没有流量就自己创造流量~~),Cpolar(内网穿透方便其他同学测试，访问速度比较慢。~~毕竟是免费的东西，没钱整校园网和云服务器~~。\n)\n\n### 现已知问题\n\n- 部分代码会出现运行时异常，而这些异常还没有被捕获\n- 控制层返回的数据不统一\n- 新建博客时博客没选也能提交\n- 媒体库管理中音乐管理无法使用（后续不考虑使用）\n- 分页功能没有起作用\n- 由于这个项目是改造别人的，所以暂时不会使用Git.(不放在公共的代码仓库)\n\n## 环境配置\n\n本次更新，需要使用java11运行环境，除此之外还需要Redis和Nacos而外的配置。\n\n由于SpringBoot内置一个Tomcat服务器，故不需要而外配置Tomcat服务器\n\n## 使用说明\n\n除配置数据库外，还需要而外以下操作:\n\n1. Redis(下载链接：[Redis Windos版下载](https://github.com/tporadowski/redis/releases \"Redis Windos版下载\")),下载完毕后即可打开\n2. Nacos(使用文档[Nacos 快速开始](https://nacos.io/zh-cn/docs/quick-start.html \"Nacos 使用文档\"))，下载完毕后将配置导入即可（记得修改数据库配置）\n\n\n\n\n\n\n\n', '这是关于此博客的更新说明 ', '原创', 0, '2023-12-12 16:55:58', '2023-12-17 21:11:14', 0, 11, 61, 'Spauter');
INSERT INTO `blog` VALUES (44, '韬韬博客系统介绍', '<h1 id=\"h1-fe-blog-system\"><a name=\"fe-blog-system\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>fe-blog-system</h1><h4 id=\"h4-u4ECBu7ECD\"><a name=\"介绍\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>介绍</h4><p>FE个人博客管理系统，后端结合Mybatis框架，前端结合Layui的一个JavaWeb项目</p>\n<h3 id=\"h3-u8F6Fu4EF6u67B6u6784\"><a name=\"软件架构\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>软件架构</h3><p>MVC三层架构</p>\n<h3 id=\"h3-u524Du7AEFu6280u672Fu6808\"><a name=\"前端技术栈\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>前端技术栈</h3><p>HTML、CSS、JavaScript、sass、Less、Layui</p>\n<h3 id=\"h3-u540Eu7AEFu6280u672Fu6808\"><a name=\"后端技术栈\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>后端技术栈</h3><p>Java11+Maven+Tomcat+MyBatis+MySQL8+STDOUT_LOGGING+git/gitee+Lombok+Junit+fastjson</p>\n<h3 id=\"h3-u73AFu5883u914Du7F6E\"><a name=\"环境配置\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>环境配置</h3><p>需要本地有Java8或Java11的JDK环境和maven3.5及以上的版本的环境，Tomcat7、8、9均可使用</p>\n<h3 id=\"h3-u4F7Fu7528u8BF4u660E\"><a name=\"使用说明\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>使用说明</h3><p>克隆或下载项目到本地后，配置Tomcat和数据库和数据库的连接源即可使用本博客系统。</p>\n<p>本地数据库运行需要新建一个库，然后在其中执行本项目中的.sql的数据库脚本文件让数据表中存在在本地中</p>\n<p>数据库的连接源配置在resource目录下的database.properties中</p>\n<h3 id=\"h3-u53C2u4E0Eu8D21u732E\"><a name=\"参与贡献\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>参与贡献</h3><table>\n<thead>\n<tr>\n<th>序号</th>\n<th>昵称</th>\n<th></th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>1</td>\n<td>谢得宇</td>\n<td></td>\n</tr>\n<tr>\n<td>2</td>\n<td>金韬</td>\n<td></td>\n</tr>\n<tr>\n<td>3</td>\n<td>易志翔</td>\n<td></td>\n</tr>\n<tr>\n<td>4</td>\n<td>秦陈</td>\n<td></td>\n</tr>\n<tr>\n<td>5</td>\n<td>刘逸</td>\n</tr>\n</tbody>\n</table>\n￥#fe-blog-system\n####介绍\nFE个人博客管理系统，后端结合Mybatis框架，前端结合Layui的一个JavaWeb项目\n\n\n###软件架构\nMVC三层架构\n\n###前端技术栈\n\nHTML、CSS、JavaScript、sass、Less、Layui\n\n\n###后端技术栈\n\nJava11+Maven+Tomcat+MyBatis+MySQL8+STDOUT_LOGGING+git/gitee+Lombok+Junit+fastjson\n\n\n###环境配置\n\n需要本地有Java8或Java11的JDK环境和maven3.5及以上的版本的环境，Tomcat7、8、9均可使用\n\n###使用说明\n\n克隆或下载项目到本地后，配置Tomcat和数据库和数据库的连接源即可使用本博客系统。\n\n本地数据库运行需要新建一个库，然后在其中执行本项目中的.sql的数据库脚本文件让数据表中存在在本地中\n\n数据库的连接源配置在resource目录下的database.properties中\n\n###参与贡献\n\n|  序号 |  昵称 |   |\n| ------------ | ------------ | ------------ |\n|  1 |  谢得宇  |    |\n|  2 |  金韬|    |\n|  3 |  易志翔|   |\n|  4 |  秦陈 |   |\n|  5 |  刘逸 |   |\n\n', '韬韬个人博客管理系统，后端结合Mybatis框架，前端结合Layui的一个JavaWeb项目', '原创', 0, '2021-08-14 11:29:17', '2023-12-17 20:56:02', 3, 11, 1, 'Spauter');
INSERT INTO `blog` VALUES (56, 'CSS+JS实现打字特效', '<h1 id=\"h1-u7279u6548u9884u89C8\"><a name=\"特效预览\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>特效预览</h1><p><img src=\"images/media/dztx.gif\" alt=\"\"></p>\n<h1 id=\"h1-u5236u4F5Cu8981u9886\"><a name=\"制作要领\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>制作要领</h1><p>（1）光标闪烁动画的制作</p>\n<p>（2）文字不停变换</p>\n<p>（3）循环播放</p>\n<h1 id=\"h1-u5F00u59CBu5236u4F5C\"><a name=\"开始制作\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>开始制作</h1><h3 id=\"h3-1-\"><a name=\"1.网页布局\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.网页布局</h3><p>首先，完成页面的基本结构和布局</p>\n<pre><code class=\"lang-html\">&lt;body&gt;\n    &lt;div&gt;\n        &lt;!-- 文本内容 --&gt;\n        &lt;span class=&quot;text&quot;&gt;&lt;/span&gt;\n        &lt;!-- 显示光标 --&gt;\n        &lt;span class=&quot;line&quot;&gt;|&lt;/span&gt;\n    &lt;/div&gt;\n&lt;/body&gt;\n</code></pre>\n<pre><code class=\"lang-css\">        * {\n            margin: 0;\n            padding: 0;\n        }\n\n        body {\n            width: 100vw;\n            height: 100vh;\n            display: flex;\n            justify-content: center;\n            align-items: center;\n            background: radial-gradient(rgb(77, 193, 197), rgb(1, 141, 255))\n        }\n\n        .text {\n            font-size: 40px;\n            color: rgb(231, 216, 79);\n        }\n\n        .line {\n            font-size: 40px;\n        }\n</code></pre>\n<h3 id=\"h3-2-css-\"><a name=\"2.css实现闪烁的光标\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.css实现闪烁的光标</h3><p>使用CSS3 <a href=\"https://github.com/keyframes\" title=\"&#64;keyframes\" class=\"at-link\">@keyframes</a> 制作一个不断循环的闪烁动画来实现这个效果。</p>\n<pre><code class=\"lang-html\">        @keyframes twinkle {\n\n            /* 注意不要使用display */\n            from {\n                opacity: 0;\n            }\n\n            to {\n                opacity: 1;\n            }\n        }\n</code></pre>\n<p>然后为光标设置该动画</p>\n<pre><code class=\"lang-css\">        .line {\n            font-size: 40px;\n            animation: twinkle 0.6s linear infinite;\n        }\n</code></pre>\n<h3 id=\"h3-3-js-\"><a name=\"3.js实现文字变换的基本原理\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3.js实现文字变换的基本原理</h3><p>​        如何实现文字的变换呢？它的基本原理实际上非常简单，利用定时器，我们让0.1s时出现第一个字，让0.2s时出现第二个字…依次类推~~~</p>\n<pre><code class=\"lang-javascript\">//获取相关元素节点\nvar text = document.getElementsByClassName(&#39;text&#39;)[0];\n//设置文本内容\nvar word = &quot;每个不曾起舞的日子，都是对生命的辜负！---Kxs（误）&quot;;\nvar t = true;\n//基本思路\ntext.innerHTML = &quot;我&quot;;\nsetTimeout(function(){\ntext.innerHTML = &quot;我是&quot;;\n},300);\nsetTimeout(function(){\ntext.innerHTML = &quot;我是一&quot;;\n},600);\n</code></pre>\n<h3 id=\"h3-4-\"><a name=\"4.嵌套循环函数实现\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>4.嵌套循环函数实现</h3><p>明白了它实现的基本原理后，我们就可以使用循环来实现它了</p>\n<pre><code class=\"lang-javascript\">for(let i=0;i&lt;=word.length;i++){\n    setTimeout(function(){\n        text.innerHTML=word.substr(0,i);\n},i*100)\n}\n</code></pre>\n<p>以上就已经实现了一个一次性的打字效果了！</p>\n<h3 id=\"h3-5-\"><a name=\"5.如何循环播放？\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>5.如何循环播放？</h3><p>基本效果已经完成了，但是还不够完美，我们想让它实现无限循环！</p>\n<p>起初我使用了递归，但却因为造成了无限递归而导致了js栈内存溢出，从而使网页完全无法加载了。因为还没有学视频中的async函数，我决定寻找另一种方法，在思考过后，最终决定使用定时器来解决无限循环播放！</p>\n<p>具体思路为：</p>\n<p>引入一个temp变量为ture，每调用一次就对temp进行一次取反。</p>\n<p>接着将正着的效果代码和反着的效果代码封装到一个函数中，加入if判断，当temp为true时执行正着的代码，当temp为false执行反着的代码。</p>\n<p>最后我们需要每隔一定的时间反复调用这个方法！</p>\n<h3 id=\"h3-6-\"><a name=\"6.完成升级\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>6.完成升级</h3><p>了解了如何实现循环播放后，我们使用js将它实现！</p>\n<pre><code class=\"lang-javascript\">        let temp=true;\n        let setText = function (temp) {\n            if (temp) {\n                for (let i = 0; i &lt;= word.length; i++) {\n                    setTimeout(function () {\n                        text.innerHTML = word.substr(0, i);\n                    }, i*100);\n                }\n            } else {\n                for (let t = word.length ; t &gt;=0; t--) {\n                    setTimeout(function () {\n                        text.innerHTML = word.substr(0, t);\n                    }, (L-t)*100);\n\n                }\n            }\n        }\n        setText(temp);\n         setInterval(function(){\n             setText(temp=!temp);\n        },L*100+1000);\n</code></pre>\n<blockquote>\n<p>引用视频：[『JS特效』15分钟两种方式实现不一样的打字机效果_哔哩哔哩 (゜-゜)つロ 干杯~-bilibili](</p>\n</blockquote>\n￥# 特效预览\n![](images/media/dztx.gif)\n# 制作要领\n\n（1）光标闪烁动画的制作\n\n（2）文字不停变换\n\n（3）循环播放\n\n# 开始制作\n\n### 1.网页布局\n\n首先，完成页面的基本结构和布局\n\n``` html\n<body>\n    <div>\n        <!-- 文本内容 -->\n        <span class=\"text\"></span>\n        <!-- 显示光标 -->\n        <span class=\"line\">|</span>\n    </div>\n</body>\n```\n\n``` css\n        * {\n            margin: 0;\n            padding: 0;\n        }\n\n        body {\n            width: 100vw;\n            height: 100vh;\n            display: flex;\n            justify-content: center;\n            align-items: center;\n            background: radial-gradient(rgb(77, 193, 197), rgb(1, 141, 255))\n        }\n\n        .text {\n            font-size: 40px;\n            color: rgb(231, 216, 79);\n        }\n\n        .line {\n            font-size: 40px;\n        }\n```\n\n\n\n### 2.css实现闪烁的光标\n\n使用CSS3 @keyframes 制作一个不断循环的闪烁动画来实现这个效果。\n\n``` html\n        @keyframes twinkle {\n\n            /* 注意不要使用display */\n            from {\n                opacity: 0;\n            }\n\n            to {\n                opacity: 1;\n            }\n        }\n```\n\n然后为光标设置该动画\n\n```css\n        .line {\n            font-size: 40px;\n            animation: twinkle 0.6s linear infinite;\n        }\n```\n\n\n\n### 3.js实现文字变换的基本原理\n\n​		如何实现文字的变换呢？它的基本原理实际上非常简单，利用定时器，我们让0.1s时出现第一个字，让0.2s时出现第二个字...依次类推~~~\n\n``` javascript\n//获取相关元素节点\nvar text = document.getElementsByClassName(\'text\')[0];\n//设置文本内容\nvar word = \"每个不曾起舞的日子，都是对生命的辜负！---Kxs（误）\";\nvar t = true;\n//基本思路\ntext.innerHTML = \"我\";\nsetTimeout(function(){\ntext.innerHTML = \"我是\";\n},300);\nsetTimeout(function(){\ntext.innerHTML = \"我是一\";\n},600);\n```\n\n\n\n### 4.嵌套循环函数实现\n\n明白了它实现的基本原理后，我们就可以使用循环来实现它了\n\n``` javascript\nfor(let i=0;i<=word.length;i++){\n	setTimeout(function(){\n		text.innerHTML=word.substr(0,i);\n},i*100)\n}\n```\n\n\n\n以上就已经实现了一个一次性的打字效果了！\n\n### 5.如何循环播放？\n\n基本效果已经完成了，但是还不够完美，我们想让它实现无限循环！\n\n起初我使用了递归，但却因为造成了无限递归而导致了js栈内存溢出，从而使网页完全无法加载了。因为还没有学视频中的async函数，我决定寻找另一种方法，在思考过后，最终决定使用定时器来解决无限循环播放！\n\n具体思路为：\n\n引入一个temp变量为ture，每调用一次就对temp进行一次取反。\n\n接着将正着的效果代码和反着的效果代码封装到一个函数中，加入if判断，当temp为true时执行正着的代码，当temp为false执行反着的代码。\n\n最后我们需要每隔一定的时间反复调用这个方法！\n\n### 6.完成升级\n\n了解了如何实现循环播放后，我们使用js将它实现！\n\n``` javascript\n        let temp=true;\n		let setText = function (temp) {\n            if (temp) {\n                for (let i = 0; i <= word.length; i++) {\n                    setTimeout(function () {\n                        text.innerHTML = word.substr(0, i);\n                    }, i*100);\n                }\n            } else {\n                for (let t = word.length ; t >=0; t--) {\n                    setTimeout(function () {\n                        text.innerHTML = word.substr(0, t);\n                    }, (L-t)*100);\n\n                }\n            }\n        }\n        setText(temp);\n         setInterval(function(){\n             setText(temp=!temp);\n        },L*100+1000);\n```\n\n\n\n> 引用视频：[『JS特效』15分钟两种方式实现不一样的打字机效果_哔哩哔哩 (゜-゜)つロ 干杯~-bilibili](', '使用css+js制作炫酷的打字特效，涉及到了css3 @keyframe的动画效果，以及js操控文字的显示，并且可支持无限循环，但是由于本人还没有学过async，用自己简陋的思路实现，可能会有未知得到bug', '原创', 0, '2021-08-15 10:09:39', '2021-08-16 11:42:18', 2, 1, 60, 'admin');
INSERT INTO `blog` VALUES (57, 'Linux使用Yum安装Java开发环境', '<h1 id=\"h1-linux-yum-java-\"><a name=\"Linux使用Yum安装Java开发环境\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Linux使用Yum安装Java开发环境</h1><h2 id=\"h2-u524Du8A00\"><a name=\"前言\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>前言</h2><p>linux上安装软件，可以用yum非常方便，不需要下载解压，也不需要配置环境变量,一个指令就能用yum安装java。</p>\n<p>一般项目部署的时候,是一个.jar后缀的文件，此文件是是依赖于java环境的，所以本篇文章来介绍一下如何使用Yum在Linux系统(此文用CentOS7来举例)中安装Java开发环境.</p>\n<h4 id=\"h4-u8D44u6E90u51C6u5907\"><a name=\"资源准备\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>资源准备</h4><pre><code>Linux系统(CentOS7)\nYum 3.4.3\n</code></pre><h2 id=\"h2-yum-\"><a name=\"yum环境的安装\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>yum环境的安装</h2><h4 id=\"h4-1-yum-\"><a name=\"1.yum介绍\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.yum介绍</h4><p>yum（全称为 Yellow dog Updater, Modified）是一个在Fedora和RedHat以及CentOS中的Shell前端软件包管理器。<br>基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。</p>\n<h4 id=\"h4-2-java\"><a name=\"2.检查是否已经安装Java\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.检查是否已经安装Java</h4><pre><code class=\"lang-shell\">rpm -qa | grep java\n</code></pre>\n<p>如果没有java环境的话，接着就去查找java-1.8.0的可以使用的安装包：</p>\n<pre><code class=\"lang-shell\">yum list | grep java-1.8.0-openjdk\n</code></pre>\n<p>结果</p>\n<pre><code class=\"lang-shell\">[root@yoyo ~]# yum list | grep java-1.8.0-openjdk\njava-1.8.0-openjdk.i686                  1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk.x86_64                1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-accessibility.i686    1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-accessibility.x86_64  1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-accessibility-debug.i686\njava-1.8.0-openjdk-accessibility-debug.x86_64\njava-1.8.0-openjdk-debug.i686            1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-debug.x86_64          1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-demo.i686             1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-demo.x86_64           1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-demo-debug.i686       1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-demo-debug.x86_64     1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-devel.i686            1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-devel.x86_64          1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-devel-debug.i686      1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-devel-debug.x86_64    1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-headless.i686         1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-headless.x86_64       1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-headless-debug.i686   1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-headless-debug.x86_64 1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-javadoc.noarch        1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-javadoc-debug.noarch  1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-javadoc-zip.noarch    1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-javadoc-zip-debug.noarch\njava-1.8.0-openjdk-src.i686              1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-src.x86_64            1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-src-debug.i686        1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-src-debug.x86_64      1:1.8.0.191.b12-1.el7_6       updates\n</code></pre>\n<p>安装java-1.8.0-openjdk所有的文件</p>\n<pre><code class=\"lang-shell\">yum -y install java-1.8.0-openjdk*\n</code></pre>\n<p>安装过程需要1-2分钟…,安装好之后会自动配置环境变量.<br>查看版本号：</p>\n<pre><code class=\"lang-shell\">java -version\n</code></pre>\n<p>结果</p>\n<pre><code class=\"lang-shell\">[root@yoyo ~]# java -version\nopenjdk version &quot;1.8.0_191&quot;\nOpenJDK Runtime Environment (build 1.8.0_191-b12)\nOpenJDK 64-Bit Server VM (build 25.191-b12, mixed mode)\n[root@yoyo ~]#\n</code></pre>\n<p>如果出现版本号,如上所示,即Java环境安装完毕.</p>\n<p><img src=\"images/media/bg.jpg\" alt=\"\"></p>\n￥# Linux使用Yum安装Java开发环境\n\n##前言\nlinux上安装软件，可以用yum非常方便，不需要下载解压，也不需要配置环境变量,一个指令就能用yum安装java。\n\n一般项目部署的时候,是一个.jar后缀的文件，此文件是是依赖于java环境的，所以本篇文章来介绍一下如何使用Yum在Linux系统(此文用CentOS7来举例)中安装Java开发环境.\n#### 资源准备\n	Linux系统(CentOS7)\n	Yum 3.4.3\n##yum环境的安装\n####1.yum介绍\nyum（全称为 Yellow dog Updater, Modified）是一个在Fedora和RedHat以及CentOS中的Shell前端软件包管理器。\n基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。\n#### 2.检查是否已经安装Java\n```shell\nrpm -qa | grep java\n```\n如果没有java环境的话，接着就去查找java-1.8.0的可以使用的安装包：\n```shell\nyum list | grep java-1.8.0-openjdk\n```\n结果\n```shell\n[root@yoyo ~]# yum list | grep java-1.8.0-openjdk\njava-1.8.0-openjdk.i686                  1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk.x86_64                1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-accessibility.i686    1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-accessibility.x86_64  1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-accessibility-debug.i686\njava-1.8.0-openjdk-accessibility-debug.x86_64\njava-1.8.0-openjdk-debug.i686            1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-debug.x86_64          1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-demo.i686             1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-demo.x86_64           1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-demo-debug.i686       1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-demo-debug.x86_64     1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-devel.i686            1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-devel.x86_64          1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-devel-debug.i686      1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-devel-debug.x86_64    1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-headless.i686         1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-headless.x86_64       1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-headless-debug.i686   1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-headless-debug.x86_64 1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-javadoc.noarch        1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-javadoc-debug.noarch  1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-javadoc-zip.noarch    1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-javadoc-zip-debug.noarch\njava-1.8.0-openjdk-src.i686              1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-src.x86_64            1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-src-debug.i686        1:1.8.0.191.b12-1.el7_6       updates  \njava-1.8.0-openjdk-src-debug.x86_64      1:1.8.0.191.b12-1.el7_6       updates  \n```\n安装java-1.8.0-openjdk所有的文件\n```shell\nyum -y install java-1.8.0-openjdk*\n```\n安装过程需要1-2分钟...,安装好之后会自动配置环境变量.\n查看版本号：\n```shell\njava -version\n```\n结果\n```shell\n[root@yoyo ~]# java -version\nopenjdk version \"1.8.0_191\"\nOpenJDK Runtime Environment (build 1.8.0_191-b12)\nOpenJDK 64-Bit Server VM (build 25.191-b12, mixed mode)\n[root@yoyo ~]# \n```\n如果出现版本号,如上所示,即Java环境安装完毕.\n\n![](images/media/bg.jpg)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n', '在centos下配置Java环境', '原创', 0, '2021-08-16 10:07:44', '2021-08-16 10:45:03', 2, 1, 61, 'admin');
INSERT INTO `blog` VALUES (58, 'CSS实现毛玻璃效果', '<h2 id=\"h2-u6BDBu73BBu7483u6548u679Cu5236u4F5Cu603Bu7ED3\"><a name=\"毛玻璃效果制作总结\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>毛玻璃效果制作总结</h2><h4 id=\"h4-1-\"><a name=\"1.效果展示\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.效果展示</h4><p><img src=\"images/media/glass00.jpg\" alt=\"\"></p>\n<h4 id=\"h4-2-\"><a name=\"2.网页结构\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.网页结构</h4><pre><code class=\"lang-ht\"> &lt;div class=&quot;banner&quot;&gt;\n        &lt;div class=&quot;drop-shadow&quot;&gt;\n            &lt;div class=&quot;glass&quot;&gt;&lt;/div&gt;\n            &lt;span&gt;毛玻璃效果GLASS&lt;/span&gt;\n            &lt;input type=&quot;file&quot;&gt;\n        &lt;/div&gt;\n    &lt;/div&gt;\n</code></pre>\n<p>banner,drop-shadow,glass为大小相同的div<br><img src=\"images/media/glass01.jpg\" alt=\"\"></p>\n<p>banner层用来添加总的背景，drop-shadow用来添加毛玻璃的阴影滤镜，glass用来做毛玻璃</p>\n<h4 id=\"h4-3-\"><a name=\"3.原理与制作\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3.原理与制作</h4><p>为banner于glass添加相同的背景图片，glass区域要保证于与banner区域的背景图相等，需要先将两张背景图叠在一起然后在进行裁切，所以glass与banner等大且具有相同的背景图，之后使用clip-path将glass进行裁切，然后为glass设置模糊滤镜，这样就形成了一个毛玻璃效果</p>\n<pre><code class=\"lang-css\">*{\n        margin: 0;\n        padding: 0;\n        box-sizing: border-box;\n    }\n    html,body{\n        width: 100vw;\n        height: 100vh;\n\n    }\n    .banner{\n        width: 100vw;\n        height: 100vh;\n        background: url(./02.jpg);\n        background-position: center;\n        background-size: cover;\n        display: flex;\n        justify-content: center;\n        align-items: center;\n\n    }\n\n\n    .glass{\n        width: 100%;\n        height: 100%;\n        background: url(./02.jpg);\n        background-size: cover;\n        background-position:center;\n        clip-path: inset(200px 200px);\n        filter: blur(20px);\n        display: flex;\n        justify-content: center;\n        align-items: center; \n\n    } \n    span{\n        position: absolute;\n        color: white;\n        font-size: 40px;\n        letter-spacing: 0.75em;\n        padding-left: 0.375em;\n    }\n</code></pre>\n<p>最后为drop-shadow添加drop-shadow滤镜为毛玻璃添加阴影效果</p>\n<pre><code class=\"lang-css\">  .drop-shadow{\n        height: 100%;\n        width: 100%;\n        filter:  drop-shadow(0px 20px 10px rgba(0, 0, 0, 0.5));  \n        display: flex;\n        justify-content: center;\n        align-items: center;\n    }\n</code></pre>\n<h4 id=\"h4-4-\"><a name=\"4.总结\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>4.总结</h4><p>之前看到别人制作的毛玻璃效果非常漂亮，因此自己也想学习一下，毛玻璃效果中采用了clip-path裁切与filter滤镜，对我来说还比较陌生，没想到还可以使用滤镜添加阴影效果，以上就是毛玻璃效果的一种实现思路了</p>\n￥## 毛玻璃效果制作总结\n\n#### 1.效果展示\n![](images/media/glass00.jpg)\n#### 2.网页结构\n\n``` ht\n <div class=\"banner\">\n        <div class=\"drop-shadow\">\n            <div class=\"glass\"></div>\n            <span>毛玻璃效果GLASS</span>\n            <input type=\"file\">\n        </div>\n    </div>\n```\n\nbanner,drop-shadow,glass为大小相同的div\n![](images/media/glass01.jpg)\n\nbanner层用来添加总的背景，drop-shadow用来添加毛玻璃的阴影滤镜，glass用来做毛玻璃\n\n#### 3.原理与制作\n\n为banner于glass添加相同的背景图片，glass区域要保证于与banner区域的背景图相等，需要先将两张背景图叠在一起然后在进行裁切，所以glass与banner等大且具有相同的背景图，之后使用clip-path将glass进行裁切，然后为glass设置模糊滤镜，这样就形成了一个毛玻璃效果\n\n``` css\n*{\n        margin: 0;\n        padding: 0;\n        box-sizing: border-box;\n    }\n    html,body{\n        width: 100vw;\n        height: 100vh;\n       \n    }\n    .banner{\n        width: 100vw;\n        height: 100vh;\n        background: url(./02.jpg);\n        background-position: center;\n        background-size: cover;\n        display: flex;\n        justify-content: center;\n        align-items: center;\n        \n    }\n\n\n    .glass{\n        width: 100%;\n        height: 100%;\n        background: url(./02.jpg);\n        background-size: cover;\n        background-position:center;\n        clip-path: inset(200px 200px);\n        filter: blur(20px);\n        display: flex;\n        justify-content: center;\n        align-items: center; \n        \n    } \n    span{\n        position: absolute;\n        color: white;\n        font-size: 40px;\n        letter-spacing: 0.75em;\n        padding-left: 0.375em;\n    }\n```\n\n最后为drop-shadow添加drop-shadow滤镜为毛玻璃添加阴影效果\n\n```  css\n  .drop-shadow{\n        height: 100%;\n        width: 100%;\n        filter:  drop-shadow(0px 20px 10px rgba(0, 0, 0, 0.5));  \n        display: flex;\n        justify-content: center;\n        align-items: center;\n    }\n```\n\n#### 4.总结\n\n之前看到别人制作的毛玻璃效果非常漂亮，因此自己也想学习一下，毛玻璃效果中采用了clip-path裁切与filter滤镜，对我来说还比较陌生，没想到还可以使用滤镜添加阴影效果，以上就是毛玻璃效果的一种实现思路了', '之前看到别人制作的毛玻璃效果非常漂亮，因此自己也想学习一下，毛玻璃效果中采用了clip-path裁切与filter滤镜，对我来说还比较陌生，没想到还可以使用滤镜添加阴影效果！', '原创', 0, '2021-08-16 12:37:03', '2021-08-16 12:37:03', 2, 1, 60, 'admin');
INSERT INTO `blog` VALUES (61, '韬门永存', '<h1 id=\"h1--\"><a name=\"韬门永存!!!!!!!!!!!!!\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>韬门永存!!!!!!!!!!!!!</h1><h1 id=\"h1--\"><a name=\"韬韬无敌！！！！！！！\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>韬韬无敌！！！！！！！</h1><p><img src=\"/tao.jpg\" alt=\"韬韬无敌\" title=\"韬韬无敌\"></p>\n￥# 韬门永存!!!!!!!!!!!!!\n# 韬韬无敌！！！！！！！\n![韬韬无敌](/tao.jpg \"韬韬无敌\")', '韬门永存', '原创', 0, '2023-12-16 20:34:29', '2023-12-18 22:25:07', 0, 4, 1, '123');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `blog_id` int NOT NULL COMMENT '博客id',
  `content` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论更新时间',
  `account` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论人员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (64, 44, '登录后的测试评论', '2023-12-18 17:02:16', '2023-12-18 17:02:16', 'Spauter');
INSERT INTO `comment` VALUES (65, 44, '韬韬无敌', '2023-12-18 17:03:05', '2023-12-18 17:03:05', '123');
INSERT INTO `comment` VALUES (67, 1, '测试评论', '2023-12-18 18:16:28', '2023-12-18 18:16:28', 'Spauter');
INSERT INTO `comment` VALUES (68, 44, '韬韬永远爱着主人', '2023-12-19 11:54:44', '2023-12-19 11:54:44', '123');

-- ----------------------------
-- Table structure for field
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field`  (
  `field_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`field_id`) USING BTREE,
  UNIQUE INDEX `field_field_id_uindex`(`field_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of field
-- ----------------------------
INSERT INTO `field` VALUES (1, '其它');
INSERT INTO `field` VALUES (4, 'javaSE');
INSERT INTO `field` VALUES (60, '前端');
INSERT INTO `field` VALUES (61, '后端');

-- ----------------------------
-- Table structure for homepage
-- ----------------------------
DROP TABLE IF EXISTS `homepage`;
CREATE TABLE `homepage`  (
  `homepageid` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '首页标题',
  `welcome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '欢迎语',
  `banner` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '封面图片地址',
  `announcement` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`homepageid`) USING BTREE,
  UNIQUE INDEX `homepage_homepageid_uindex`(`homepageid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of homepage
-- ----------------------------
INSERT INTO `homepage` VALUES (1, '欢迎来到韬韬的个人博客', '韬韬的博客', '欢迎光临！', 'fm5.jpg', '大家好，本博客是由韬韬小组开发的可定制化个人博客系统，还有很多未知的BUG\n小组成员：\n1.金韬\n2.谢徳宇\n3.秦陈\n4.易志翔\n5.刘逸');

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `music` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `media_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`media_id`) USING BTREE,
  UNIQUE INDEX `MEDIA_ID`(`media_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES ('default-banner.jpg', NULL, 64);
INSERT INTO `media` VALUES ('fm1.jpg', NULL, 103);
INSERT INTO `media` VALUES ('fm2.jpg', NULL, 104);
INSERT INTO `media` VALUES ('fm3.jpg', NULL, 105);
INSERT INTO `media` VALUES ('fm4.jpg', NULL, 106);
INSERT INTO `media` VALUES ('fm5.jpg', NULL, 107);
INSERT INTO `media` VALUES ('fm6.jpg', NULL, 108);
INSERT INTO `media` VALUES ('fm7.jpg', NULL, 109);
INSERT INTO `media` VALUES ('fm8.jpg', NULL, 110);
INSERT INTO `media` VALUES ('fm9.jpg', NULL, 111);
INSERT INTO `media` VALUES ('fm10.jpg', NULL, 112);
INSERT INTO `media` VALUES ('fm11.jpg', NULL, 113);
INSERT INTO `media` VALUES ('HT.jpg', NULL, 131);

-- ----------------------------
-- Table structure for media_relation
-- ----------------------------
DROP TABLE IF EXISTS `media_relation`;
CREATE TABLE `media_relation`  (
  `blog_id` int NOT NULL,
  `media_id` int NOT NULL,
  UNIQUE INDEX `MEDIA_ID`(`blog_id` ASC) USING BTREE,
  INDEX `id4`(`media_id` ASC) USING BTREE,
  CONSTRAINT `id3` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `id4` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_relation
-- ----------------------------

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tag_id` int NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标签名',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'javascript');
INSERT INTO `tag` VALUES (3, 'java');
INSERT INTO `tag` VALUES (5, '后端');
INSERT INTO `tag` VALUES (24, 'css');
INSERT INTO `tag` VALUES (25, 'html');
INSERT INTO `tag` VALUES (26, '没用的文章');

-- ----------------------------
-- Table structure for tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `tag_relation`;
CREATE TABLE `tag_relation`  (
  `blog_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `deleted` int NOT NULL DEFAULT 0,
  INDEX `id1`(`blog_id` ASC) USING BTREE,
  INDEX `id2`(`tag_id` ASC) USING BTREE,
  CONSTRAINT `id2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_relation
-- ----------------------------
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (56, 1, 1);
INSERT INTO `tag_relation` VALUES (56, 24, 1);
INSERT INTO `tag_relation` VALUES (56, 25, 1);
INSERT INTO `tag_relation` VALUES (57, 5, 1);
INSERT INTO `tag_relation` VALUES (57, 5, 0);
INSERT INTO `tag_relation` VALUES (56, 1, 1);
INSERT INTO `tag_relation` VALUES (56, 24, 1);
INSERT INTO `tag_relation` VALUES (56, 25, 1);
INSERT INTO `tag_relation` VALUES (56, 1, 1);
INSERT INTO `tag_relation` VALUES (56, 24, 1);
INSERT INTO `tag_relation` VALUES (56, 25, 1);
INSERT INTO `tag_relation` VALUES (56, 1, 1);
INSERT INTO `tag_relation` VALUES (56, 24, 1);
INSERT INTO `tag_relation` VALUES (56, 25, 1);
INSERT INTO `tag_relation` VALUES (56, 1, 0);
INSERT INTO `tag_relation` VALUES (56, 24, 0);
INSERT INTO `tag_relation` VALUES (56, 25, 0);
INSERT INTO `tag_relation` VALUES (58, 24, 0);
INSERT INTO `tag_relation` VALUES (58, 25, 0);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (59, 3, 1);
INSERT INTO `tag_relation` VALUES (59, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (1, 26, 1);
INSERT INTO `tag_relation` VALUES (61, 26, 1);
INSERT INTO `tag_relation` VALUES (44, 26, 1);
INSERT INTO `tag_relation` VALUES (44, 26, 1);
INSERT INTO `tag_relation` VALUES (62, 3, 1);
INSERT INTO `tag_relation` VALUES (61, 26, 1);
INSERT INTO `tag_relation` VALUES (61, 26, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '账户',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `profile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '简介',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `deleted` int NOT NULL DEFAULT 0 COMMENT '逻辑删除字段 逻辑删除字段 0-未删除 1-删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'a', NULL, 'Fantastic Electricity', '生命不息，编码不止！', '/avatar.png', 0, '2021-08-06 19:19:05', '2023-12-07 15:13:21', '女', '2001-09-19 00:00:00');
INSERT INTO `user` VALUES (2, '藤树test', '1234567', '178@qq.com', NULL, NULL, '/tao.jpg', 0, '2021-08-07 17:01:06', '2021-08-07 17:01:06', NULL, NULL);
INSERT INTO `user` VALUES (3, '世纪糕Test1', '123321', NULL, '世纪糕', '111111', '/tao.jpg', 0, '2021-08-09 15:03:59', '2021-08-15 21:36:26', '男', '2001-09-20 00:00:00');
INSERT INTO `user` VALUES (4, '123', '123', NULL, '韬韬无敌', '韬韬永远爱着主人', '/tao.jpg', 0, '2021-08-15 21:51:12', '2021-08-15 21:51:12', '女', '2023-12-01 00:00:00');
INSERT INTO `user` VALUES (11, 'Spauter', 'Spauter', '3230695439@qq.com', 'Bloduc Spauter', 'Touch fish long live!', '/HT.jpg', 0, '2023-12-13 16:57:34', '2023-12-13 16:57:34', '女', '2013-07-17 00:00:00');
INSERT INTO `user` VALUES (25, 'chen', 'chen123', '3108542443@qq.com', 'chen', '系统的默认签名，送给每一个小可爱', '/tao.jpg', 0, '2023-12-17 23:33:13', '2023-12-17 23:33:13', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
