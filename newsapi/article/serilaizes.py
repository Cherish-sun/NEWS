# -*- coding: utf-8 -*-
"""
@version: v1.0
@author: wyq
@license: Apache Licence
@contact: 976367613@qq.com
@site:
@software: PyCharm
@file: serilaizes.py
@time: 2019/3/1 16:48
"""
from rest_framework import serializers
from django.contrib.auth.models import User, Group
from .models import Category, Item, Tag, Article, Ad, UserFav
from rest_framework.validators import UniqueValidator, UniqueTogetherValidator  # 序列化验证
from rest_framework.compat import authenticate  # 权限验证


# user序列化类 继承ModelSerializer
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        # 指定模型名称
        model = User
        # 指定需要字段，全部用"__all__"
        fields = "__all__"
    # fields = ('url', 'username', 'email', 'groups')


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')


# 分类
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = "__all__"


# 实现新闻类别增加类别下面的栏目数据，采用自定义字段方法实现
class CategoryitemsSerializer(serializers.ModelSerializer):
    # 通过SerializerMethodField增加新字段值
    items = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = "__all__"

    # 在序列化对象里添加自定义内容 函数名为：# 方法写法：get_ + 字段
    def get_items(self, obj):
        items = Item.objects.filter(categorys=obj.id)
        if items:
            items_serializer = ItemnocateSerializer(items, many=True, context={'request': self.context['request']})
            return items_serializer.data


class CategoryStringSerializer(serializers.ModelSerializer):
    # 用__str__方法表示只读关系 items 为外键关系中的related_name
    items = serializers.StringRelatedField(many=True)

    class Meta:
        model = Category
        # fields = ('id', 'title','items')
        fields = "__all__"


class CategoryPrimaryKeySerializer(serializers.ModelSerializer):
    # 用主键表示关系
    items = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

    class Meta:
        model = Category
        fields = "__all__"


class CategorySlugSerializer(serializers.ModelSerializer):
    # 选取关系对象中任意一个字段（唯一标识）表示关系
    items = serializers.SlugRelatedField(
        many=True,
        read_only=True,
        slug_field='title'
    )

    class Meta:
        model = Category
        fields = "__all__"


# 子栏目
class ItemSerializer(serializers.ModelSerializer):
    # 正向嵌套
    categorys = CategorySerializer()

    class Meta:
        model = Item
        fields = "__all__"


class ItemnocateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = "__all__"


# 按serializers来序列化新闻标签
class TagSerializer(serializers.ModelSerializer):
    # id = serializers.Field()
    name = serializers.CharField(required=True, max_length=100)
    slug = serializers.CharField(required=True, max_length=100)

    class Meta:
        model = Tag
        fields = ('id', 'name', 'slug')


# 广告
class AdSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ad
        fields = "__all__"


# 新闻文章
class ArticleSerializer(serializers.ModelSerializer):
    # 外键相关对象
    item = ItemSerializer()
    author = UserSerializer()
    tags = TagSerializer(many=True)

    class Meta:
        model = Article
        fields = "__all__"


# 热门文章
class Hot_articleSerializer(serializers.ModelSerializer):
    item = ItemSerializer()
    author = UserSerializer()
    tags = TagSerializer(many=True)

    class Meta:
        model = Article
        fields = "__all__"


class ArticlemodelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = "__all__"


class UserDetailSerializer(serializers.ModelSerializer):
    """
    用户详情序列化类
    """
    token = serializers.CharField(required=False, max_length=1024)

    class Meta:
        model = User
        fields = "__all__"


# 用户注册
class UserRegSerializer(serializers.ModelSerializer):
    username = serializers.CharField(label="用户名", help_text="用户名", required=True, allow_blank=False,
                                     validators=[UniqueValidator(queryset=User.objects.all(), message="用户已经存在")])

    password = serializers.CharField(
        style={'input_type': 'password'}, help_text="密码", label="密码", write_only=True,
    )

    # token = serializers.CharField(required=False, max_length=1024)

    class Meta:
        model = User
        fields = ('username', 'password')


# 用户登陆
class UserLoginSerializer(serializers.ModelSerializer):
    """
    用户登录序列化类
    """
    username = serializers.CharField(required=True, max_length=100)
    password = serializers.CharField(required=True, max_length=100)
    token = serializers.CharField(required=False, max_length=1024)

    # attrs 为封装后的request
    def validate(self, attrs):
        username = attrs.get('username')
        password = attrs.get('password')

        if username and password:
            # 用户名称、密码登录验证
            user = authenticate(request=self.context.get('request'),
                                username=username, password=password)
            # The authenticate call simply returns None for is_active=False
            # users. (Assuming the default ModelBackend authentication
            # backend.)

            if not user:
                msg = '不能登录'
                raise serializers.ValidationError(msg, code='authorization')
        else:
            msg = '必须输入同时输入名称和密码'
            raise serializers.ValidationError(msg, code='authorization')

        attrs['user'] = user
        return attrs

    class Meta:
        model = User
        fields = ('id', 'username', 'password', 'token')


# 重置密码
class UserSetPasswordSerializer(serializers.ModelSerializer):
    username = serializers.CharField(label="用户名", help_text="用户名", required=True, allow_blank=False)

    password = serializers.CharField(
        style={'input_type': 'password'}, help_text="密码", label="密码", write_only=True,
    )
    newpassword = serializers.CharField(
        style={'input_type': 'password'}, help_text="新密码", label="新密码", write_only=True,
    )

    # 验证用户名、密码是否正确
    def validate(self, attrs):
        username = attrs.get('username')
        password = attrs.get('password')

        if username and password:
            # 用户名称、密码登录验证
            user = authenticate(request=self.context.get('request'),
                                username=username, password=password)
            # The authenticate call simply returns None for is_active=False
            # users. (Assuming the default ModelBackend authentication
            # backend.)

            if not user:
                msg = '不能修改'
                raise serializers.ValidationError(msg, code='authorization')
        else:
            msg = '必须输入同时输入名称和密码'
            raise serializers.ValidationError(msg, code='authorization')

        attrs['user'] = user
        return attrs

    class Meta:
        model = User
        fields = ('username', 'password', 'newpassword')


# 用户收藏详情页
class UserFavDetailSerializer(serializers.ModelSerializer):
    articles = ArticleSerializer()

    class Meta:
        model = UserFav
        fields = ('articles', 'id')


# 用户收藏
class UserFavSerializer(serializers.ModelSerializer):
    # 隐藏字段
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )

    class Meta:
        model = UserFav
        validators = [
            UniqueTogetherValidator(
                queryset=UserFav.objects.all(),
                fields=('articles', 'user'),
                message="已经收藏"
            )
        ]

        fields = ('user', 'articles', 'id')
