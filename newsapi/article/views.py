from rest_framework import viewsets
from .models import Category, Item, Tag, Article, Ad, UserFav, User
from .serilaizes import UserRegSerializer, UserDetailSerializer, UserLoginSerializer, UserSetPasswordSerializer
from .serilaizes import UserFavSerializer, UserFavDetailSerializer, CategoryStringSerializer, \
    CategoryPrimaryKeySerializer, CategorySlugSerializer
from .serilaizes import CategorySerializer, ItemSerializer, TagSerializer, AdSerializer, ArticleSerializer, \
    Hot_articleSerializer, CategoryitemsSerializer
from rest_framework.decorators import api_view
from rest_framework import mixins
from rest_framework.pagination import PageNumberPagination
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters
from .myfilter import ArticleFilter
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from rest_framework import permissions
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST, HTTP_201_CREATED
from rest_framework.decorators import action
from rest_framework.views import APIView


# class CategoryViewset(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
class CategoryViewset(viewsets.ModelViewSet):
    """
    list:
       GET url: /category/   分类列表数据
    creat:
       POST url: /category/  创建分类详情
    retrieve:
       GET url: /category/1/  获取分类详情
    update:
       PUT url: /category/1/  修改分类详情
    delete:
       DELETE url: /category/1/  删除分类详情
    """
    # 查询对象集
    queryset = Category.objects.all()
    # 序列化的类名
    serializer_class = CategorySerializer
    lookup_field = "id"


# class CategoryitemsViewset(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
class CategoryitemsViewset(viewsets.ReadOnlyModelViewSet):
    """
    list:
        分类列表数据
    retrieve:
        获取分类详情
    """
    # 查询对象集
    queryset = Category.objects.all()
    # 序列化的类名
    serializer_class = CategoryitemsSerializer
    lookup_field = "id"


class CategoryStringitemsViewset(viewsets.ReadOnlyModelViewSet):
    """
    list:
        分类列表数据
    retrieve:
        获取分类详情
    """
    # 查询对象集
    queryset = Category.objects.all()
    # 序列化的类名
    serializer_class = CategoryStringSerializer
    lookup_field = "id"


class CategoryPrimaryKeyitemsViewset(viewsets.ReadOnlyModelViewSet):
    """
    list:
        分类列表数据
    retrieve:
        获取分类详情
    """
    # 查询对象集
    queryset = Category.objects.all()
    # 序列化的类名
    serializer_class = CategoryPrimaryKeySerializer
    lookup_field = "id"


class CategorySlugitemsViewset(viewsets.ReadOnlyModelViewSet):
    """
    list:
        分类列表数据
    retrieve:
        获取分类详情
    """
    # 查询对象集
    queryset = Category.objects.all()
    # 序列化的类名
    serializer_class = CategorySlugSerializer
    lookup_field = "id"


class ItemViewset(viewsets.ModelViewSet):
    """
    list:
       GET url: /item/   子类列表数据
    creat:
       POST url: /item/  创建子类详情，返回新生成的子类对像
    retrieve:
       GET url: /item/1/  获取子类详情，返回子类对像
    update:
       PUT url: /item/1/  修改子类详情，返回子类对像
    delete:
       DELETE url: /item/1/  删除子类详情，返回空对像
    """
    # 用于从此视图返回对象的查询器集。

    queryset = Item.objects.all()

    # filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    # 查询
    # filter_class = ItemFilter
    # SearchFilter对应search_fields，对应模糊查询,也可用关连表的字段进行查询，但需要二个下划线连接，如categorys__title
    search_fields = ('title', 'categorys__title')
    # 用于验证和反序列化输入以及序列化输出的serializer类。通常，您必须设置此属性，或覆盖该get_serializer_class()方法。
    serializer_class = ItemSerializer
    # 应用于执行单个模型实例的对象查找的模型字段。默认为’pk’。
    lookup_field = "id"


class TagViewset(viewsets.ModelViewSet):
    """
    list:
       GET url: /tag/   标签列表数据
    creat:
       POST url: /tag/  创建标签详情，返回新生成的标签对像
    retrieve:
       GET url: /tag/1/  获取标签详情，返回标签对像
    update:
       PUT url: /tag/1/  修改标签详情，返回标签对像
    delete:
       DELETE url: /tag/1/  删除标签详情，返回空对像
    """
    # 用于从此视图返回对象的查询器集。
    queryset = Tag.objects.all()

    # filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    # 查询
    # filter_class =
    # SearchFilter对应search_fields，对应模糊查询,也可用关连表的字段进行查询，但需要二个下划线连接，如categorys__title
    search_fields = ('name')
    # 用于验证和反序列化输入以及序列化输出的serializer类。通常，您必须设置此属性，或覆盖该get_serializer_class()方法。
    serializer_class = TagSerializer
    # 应用于执行单个模型实例的对象查找的模型字段。默认为’pk’。
    lookup_field = "id"


class AdViewset(viewsets.ModelViewSet):
    """
    list:
       GET url: /ad/   广告列表数据
    creat:
       POST url: /ad/  创建广告详情，返回新生成的广告对像
    retrieve:
       GET url: /ad/1/  获取广告详情，返回广告对像
    update:
       PUT url: /ad/1/  修改广告详情，返回广告对像
    delete:
       DELETE url: /ad/1/  删除广告详情，返回空对像
    """
    # 用于从此视图返回对象的查询器集。
    queryset = Ad.objects.all()

    # filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    # 查询
    # filter_class =
    # SearchFilter对应search_fields，对应模糊查询,也可用关连表的字段进行查询，但需要二个下划线连接，如categorys__title
    search_fields = ('title')
    # 用于验证和反序列化输入以及序列化输出的serializer类。通常，您必须设置此属性，或覆盖该get_serializer_class()方法。
    serializer_class = AdSerializer
    # 应用于执行单个模型实例的对象查找的模型字段。默认为’pk’。
    lookup_field = "id"


class ArticlePagination(PageNumberPagination):
    page_size = 5
    page_size_query_param = 'page_size'
    page_query_param = "page"
    max_page_size = 20


class ArticleListViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    文章列表页, 分页， 搜索， 过滤， 排序
    可根据'author', 'status', 'publish_date', 'is_active', 'item', 'tags' 查询
    """
    # throttle_classes = (UserRateThrottle, )
    # 查询对象集
    queryset = Article.objects.all()
    # 序列化的类名
    serializer_class = ArticleSerializer
    # 分页，有分页列表结果时应使用的分页类。
    pagination_class = ArticlePagination
    # authentication_classes = (TokenAuthentication, )
    # 过滤、查询类
    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    # DjangoFilterBackend对应filter_fields属性，做相等查询
    # 过滤字段类
    filter_class = ArticleFilter
    # SearchFilter对应search_fields，对应模糊查询
    search_fields = ('title', 'item__title', 'tags__name')
    # 排序
    ordering_fields = ('id', 'publish_date')
    lookup_field = "id"

    # 重写retrieve方法，取出数据后，将浏览数加一，重新取回数据
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.read_num += 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class Hot_articleListViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    热门新闻

    """
    # throttle_classes = (UserRateThrottle, )
    # 查询对象集
    queryset = Article.objects.filter(is_active='True')[:10]
    # 序列化的类名
    serializer_class = ArticleSerializer
    # 排序
    ordering_fields = ('-id',)
    lookup_field = "id"


class UserViewset(viewsets.ModelViewSet):
    """
    用户查询和注册
    list:
       GET url: /user/   用户列表数据
    creat:
       POST url: /user/  创建用户详情
    retrieve:
       GET url: /user/1/  获取用户详情
    update:
       PUT url: /user/1/  修改用户详情
    delete:
       DELETE url: /user/1/  删除用户详情

    """

    # queryset = User.objects.all()
    # serializer_class = UserDetailSerializer

    def get_serializer_class(self):
        if self.action == "retrieve":
            return UserDetailSerializer
        elif self.action == "create":
            return UserRegSerializer

        return UserDetailSerializer

    # 认证策略属性
    authentication_classes = (TokenAuthentication, SessionAuthentication)

    def get_queryset(self):
        users = User.objects.filter(id=self.request.user.id)
        if users:
            for user in users:
                issuperuser = user.is_superuser
            if issuperuser:
                queryset = User.objects.all()
            else:
                queryset = users
        else:
            queryset = users
        return queryset

    permission_classes = (permissions.IsAuthenticated,)

    def get_permissions(self):
        if self.action == "retrieve":
            return [permissions.IsAuthenticated()]
        elif self.action == "create":
            return []

        return []

    # 重写create方法,给密码加密，并查询和创建token
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        passwd = request.data['password']
        user = self.perform_create(serializer)
        # 给密码加密
        user.set_password(passwd)
        user.save()
        re_dict = serializer.data
        # 查询和创建token
        token = Token.objects.get_or_create(user=user)

        serializer = UserRegSerializer({'id': user.id, 'username': user.username, 'token': token[0]})
        serializer.data["status"] = HTTP_201_CREATED
        # headers = self.get_success_headers(serializer.data)
        return Response(serializer.data)

    def perform_create(self, serializer):
        return serializer.save()


class UserLoginViewset(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
     实现用户登录
     返回用户名、ID、token
    """
    serializer_class = UserLoginSerializer

    # 因登录只需post方法，可重写create方法，取消原有保存对象逻辑，加入登录逻辑
    def create(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        if serializer.is_valid(raise_exception=True):
            user = serializer.validated_data['user']
            # 登录时，创建新的token
            tokenobj = Token.objects.update_or_create(user=user)
            token = Token.objects.get(user=user)
            # 重构返回数据
            serializer = UserLoginSerializer(
                {'username': user.username, 'id': user.id, 'password': '', 'token': token.key})
            return Response(serializer.data, status=HTTP_200_OK)
        return Response(serializer.errors, status=HTTP_400_BAD_REQUEST)

    def get_object(self):
        return self.request.user


class UserSetPasswordViewset(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
        实现用户修改密码
        输入username、password，验证正确返回password 修改成功，否则返回HTTP_400_BAD_REQUEST
    """

    serializer_class = UserSetPasswordSerializer
    # 设置对象集
    queryset = User.objects.all()

    # 因修改密码只需post方法，可重写create方法，取消原有保存对象逻辑，加入修改密码逻辑
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            # 取出已验证的用户对象
            instance = serializer.validated_data['user']
            # 设置加密密码
            instance.set_password(request.data['newpassword'])
            # 保存
            instance.save()
            return Response({'status': 'password 修改成功'})
        else:
            return Response(serializer.errors,
                            status=HTTP_400_BAD_REQUEST)


class UserFavViewset(mixins.CreateModelMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin,
                     mixins.DestroyModelMixin, viewsets.GenericViewSet):
    """
    list:
        获取用户收藏列表
    retrieve:
        判断某文章是否已经收藏
    create:
        收藏文章
    """
    # permission_classes = (permissions.IsAuthenticated, )
    # 加入认证
    authentication_classes = (TokenAuthentication, SessionAuthentication)
    lookup_field = "articles_id"
    serializer_class = UserFavSerializer

    # 重写get_queryset
    def get_queryset(self):
        if self.request.user:
            queryset = UserFav.objects.filter(user=self.request.user)
        else:
            queryset = []
        return queryset

    # 重写create
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        articleid = request.data['articles']
        userid = request.data['user']
        userfav = UserFav.objects.get_or_create(articles_id=articleid, user_id=userid)

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=HTTP_201_CREATED, headers=headers)


# 通过apiview来实现登录功能
class UserLogin(APIView):
    """
     实现用户登录
     输入username、password，验证正确返回用户名、ID、token 和HTTP_200_OK，否则返回HTTP_400_BAD_REQUEST
    """
    serializer_class = UserLoginSerializer

    def post(self, request, format=None):
        serializer = UserLoginSerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            user = serializer.validated_data['user']
            # 登录时，创建新的token
            tokenobj = Token.objects.update_or_create(user=user)
            token = Token.objects.get(user=user)

            serializer = UserLoginSerializer(
                {'username': user.username, 'password': '', 'id': user.id, 'token': token.key})

            return Response(serializer.data, status=HTTP_200_OK)
        return Response(serializer.errors, status=HTTP_400_BAD_REQUEST)
