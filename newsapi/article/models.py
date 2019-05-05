# Create your models here.
from django.db import models
import datetime
from django.contrib.auth.models import User
from DjangoUeditor.models import UEditorField
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token


class Category(models.Model):
    title = models.CharField(max_length=20, verbose_name='名称', help_text="大类")

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['title']
        verbose_name = '新闻类别'
        verbose_name_plural = verbose_name


class Item(models.Model):
    title = models.CharField(max_length=20, verbose_name='名称', help_text="名称")
    created_date = models.DateTimeField(default=datetime.datetime.now, verbose_name='创建时间', help_text="创建时间")
    completed = models.BooleanField(default=False, verbose_name='是否完成', help_text="是否完成")
    categorys = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='items', help_text="大类")

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['title']
        verbose_name = '新闻子栏目'
        verbose_name_plural = verbose_name


class Tag(models.Model):
    name = models.CharField(max_length=50, verbose_name=u'名称', help_text="名称")
    slug = models.SlugField(max_length=50, verbose_name=u'描述')

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['id']
        verbose_name = '标签'
        verbose_name_plural = verbose_name


class Article(models.Model):
    title = models.CharField(max_length=100, verbose_name='标题', help_text="名称")
    slug = models.SlugField(unique_for_year='publish_date', verbose_name='描述')
    # author = models.CharField(max_length=100, verbose_name='作者', help_text="作者")
    author = models.ForeignKey(User, related_name='author', on_delete=models.CASCADE, verbose_name='作者', help_text="作者")
    # content = models.TextField(verbose_name='内容')
    content = UEditorField(u'内容', height=400, width=600, default='', imagePath="upload/",
                           toolbars='mini', filePath='upload/', blank=True)
    status = models.CharField(max_length=2, verbose_name='状态', help_text="状态")
    tags = models.ManyToManyField(Tag, related_name='tags', blank=True, help_text="标签")
    publish_date = models.DateTimeField(default=datetime.datetime.now(), verbose_name='发布日期', help_text="发布日期")
    expiration_date = models.DateTimeField(blank=True, null=True, verbose_name='有效日期', help_text="有效日期")
    is_active = models.BooleanField(default=True, blank=True, verbose_name='是否热门', help_text="是否热门")
    item = models.ForeignKey(Item, related_name='item', on_delete=models.CASCADE, verbose_name='类别名称', help_text="类别名称")
    pic = models.ImageField(upload_to='uploads', verbose_name='图片', help_text="图片")
    praise_num = models.IntegerField(default=0, verbose_name='点赞', help_text="点赞")
    read_num = models.IntegerField(default=0, verbose_name='浏览数', help_text="浏览数")
    fav_num = models.IntegerField(default=0, verbose_name='收藏数', help_text="收藏数")

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '新闻文章'
        verbose_name_plural = verbose_name


class Ad(models.Model):
    title = models.CharField(max_length=50, verbose_name='标题', help_text="标题")
    pic = models.ImageField(upload_to='uploads', verbose_name='广告图', help_text="广告图")
    adurl = models.URLField(verbose_name='地址', help_text="地址")
    adlocation = models.CharField(max_length=2, verbose_name='位置', help_text="位置")  # a1,a2,a3,b1,b2,b3....
    status = models.CharField(max_length=1, default=1, verbose_name='状态', help_text="状态")


class UserFav(models.Model):
    """
    用户收藏
    """
    user = models.ForeignKey(User, related_name='user', on_delete=models.CASCADE, verbose_name="用户")
    articles = models.ForeignKey(Article, related_name='articles', on_delete=models.CASCADE, verbose_name="文章",
                                 help_text="文章id")
    add_time = models.DateTimeField(default=datetime.datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = '用户收藏'
        verbose_name_plural = verbose_name
        unique_together = ("user", "articles")

    def __str__(self):
        return self.user.username
