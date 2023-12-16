# 项目概述
## 项目简介
*-本项目为图书管理系统-*  
*web端利用HTML5，CSS3-*  
*-后端使用Flask框架，数据库使用MySQL-*
## 设计要求
1. 允许用户输入数据的 Web 表单(包括客户端和服务器端验证)。  
2. 用于存储信息的数据库：利用 MySql 数据库和 Flask-SQLAlchemy 程序设计及扩展，
完成后台数据管理功能，且用户对数据的查询操作，对自己信息的增加、修改、删
除和查询操作。强调：必须有多对多关系的表！
3. Session 和 Cookie 的使用。
4. 身份验证。
5. 使用验证码。
6. 使用蓝图。
Web 应用程序的适当 CSS 样式。
7. 单元测试。
8. 日志记录。
9. 图表功能。
10. HTML5 的高级功能，即地理位置或本地存储。
# 项目目录
```
- app               
  - main 
  - reader            //样式表渲染
  - static            //图标、CSS样式等
  - templates         //网页文件html
  - .py
- venv                //项目虚拟环境
```
# 项目环境
- Python:3.6
- mysql:5.7
- Flask:1.1.2
- PyMySQL:1.0.2
- numpy:1.19.5
# 使用
- 安装相关库
```
pip install Flask
pip install numpy
pip install PyMysql
```

# 部署
请点击项目主页:  
[图书管理系统](http://www.bengbuzu.top)

# 效果图
![登录界面](/app/static/img/login.png "login page")
![天气和地理位置](/app/static/img/map.png "map page")
![系统日志](/app/static/img/log.png "system log page")