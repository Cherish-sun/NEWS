# NEWS
基于Django前后端分离开发-新闻管理系统


## 一、开发目的
通过新闻系统前后端分离开发，在后端开发web api的过程中让你快速熟练掌握django rest framework框架的开发，让你要项目实战中掌握rest 标准api的开发技术。在前端开发让你快捷简便的掌握django模板调用api的过程。

## 二、开发环境
•开发工具:Pycharm

•开发环境为: Windows10、Python3.6.8、Django2.0.3、djangorestframework(3.8.2)

•数据库：Mysql5.6

•前端：Div+Css 、ajax 、 Django2.0.3

•后端：Django2.0.3、djangorestframework(3.8.2)

## 三、创建项目和应用
```
django-admin.py startproject newsapi
python manage.py startapp article
```
## 四、安装项目所需依赖包
```
pip install django==2.0.3
pip install djangorestframework==3.8.2
pip install pymysql
pip install Markdown
pip install django-filter
pip install django-crispy-forms
pip install django-cors-headers
pip install django-rest-swagger
```
## 五、配置setting.py
###### 注册app
```
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'article', # 我们的app
    'rest_framework', # 前后端分离框架
    'crispy_forms',  # 展示表单
    'django_filters', # 查询
    'rest_framework.authtoken',  # 认证
    ]
```
###### 连接mysql数据库
```
DATABASES = {
'default': {
    'NAME': 'news',  # 数据库名
    'ENGINE': 'django.db.backends.mysql',
    'USER': 'root',  # 用户名
    'PASSWORD': 'test',  # 密码
    'HOST': '127.0.0.1',  # 主机IP
    'PORT': '3306',  # 端口
    'useSSL': 'false',
  }
}
```
项目详解可参考：https://www.jianshu.com/nb/34691463
