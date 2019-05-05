from django.shortcuts import render
from urllib import request, parse

try:
    import json
except ImportError:
    import simplejson as json
from django.shortcuts import render
from urllib.parse import urljoin

# Create your views here.

PAGESIZE = 5
category_url = 'http://127.0.0.1:8005/category/'
articles_url = 'http://127.0.0.1:8005/articleList/'
hotarticles_url = 'http://127.0.0.1:8005/hot_articleList/'
ad_url = 'http://127.0.0.1:8005/ad/'
items_url = 'http://127.0.0.1:8005/item/'


# 读取api数据
def getdata(url, data=None):
    # url = r'http://xxx/xxx/xxxx?'
    headers = {
        'User-Agent': r'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) '
                      r'Chrome/45.0.2454.85 Safari/537.36 115Browser/6.0.3',
        'Referer': r'',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
    }
    # data = {
    #     'first': 'true',
    #     'pn': 1,
    #     'kd': 'Python'
    #     }
    # urlencode（）主要作用就是将url附上要提交的数据。
    # 经过urlencode（）转换后的data数据为?first=true?pn=1?kd=Python，最后提交的url为
    # http://xxxxx/xx/xx?first=true?pn=1?kd=Python
    try:
        if data:
            # data = parse.urlencode(data).encode('utf8')
            # data 参数如果要传必须传 bytes （字节流）类型的，如果是一个字典，可以先用 urllib.parse.urlencode() 编码。
            # data = bytes(parse.urlencode(data), encoding="utf8")
            data = '?' + parse.urlencode(data)
            # 使用request（）来包装请求，再通过urlopen（）获取页面。
            url = urljoin(url, data)
            req = request.Request(url=url, headers=headers, method='GET')
        else:
            req = request.Request(url=url, headers=headers)

        reponsedata = request.urlopen(req, timeout=10).read()
        reponsedata = reponsedata.decode('utf-8')
        returndata = json.loads(reponsedata)
    except Exception as e:
        print(e)
        returndata = {'result': e, 'code': e, 'msg': '请求api数据错误！', 'data': '{}', 'redirect_url': ''}
    return returndata


# 实现全局变量
def globl_init(request):
    # 取新闻分类
    # #category_list = Category.objects.all()
    category_list = getdata(category_url)
    # 取热门新闻
    # hot_articles = Article.objects.filter(is_active=True)[0:5]
    hot_articles = getdata(hotarticles_url)
    # 取广告数据
    ad_list = getdata(ad_url)
    user = request.user
    return locals()


def index(request):
    data = {
        "ordering": '-id',
    }
    article_data = getdata(articles_url, data)
    article_list = article_data["results"]

    user = []
    return render(request, 'index.html', locals())


# 文章详情页
def article(request):
    id = request.GET.get('id')
    articles_url = 'http://127.0.0.1:8005/articleList/'
    # 构造url http://127.0.0.1:8000/article/id/
    articles_url = urljoin(articles_url, id)
    article = getdata(articles_url)
    return render(request, 'article.html', locals())


# 搜索
def search(request):
    strquery = request.GET.get('query')
    page = int(request.GET.get('page', 1))
    data = {
        "search": strquery,
        "page": page,
        "ordering": '-id',
    }
    article_data = getdata(articles_url, data)
    article_list = article_data["results"]
    # 总记录数
    count = article_data["count"]
    # 下一页
    next = article_data["next"]
    nextpage = page + 1
    # 上一页
    previous = article_data["previous"]
    previouspage = page - 1
    # 总页数
    num_pages = int(count / PAGESIZE)
    curr_url = request.get_full_path()
    nPos = curr_url.find('&page')
    if nPos > 0:
        curr_url = request.get_full_path()[0:nPos]
    else:
        curr_url = request.get_full_path()

    return render(request, 'searchlist.html', locals())


# 按标签查询对应的文章列表
def tag(request):
    tagid = request.GET.get('tagid')
    page = int(request.GET.get('page', 1))
    data = {
        "tags": tagid,
        "page": page,
        "ordering": '-id',
    }
    article_data = getdata(articles_url, data)
    article_list = article_data["results"]
    # 总记录数
    count = article_data["count"]
    # 下一页
    next = article_data["next"]
    nextpage = page + 1
    # 上一页
    previous = article_data["previous"]
    previouspage = page - 1
    # 总页数
    num_pages = int(count / PAGESIZE)
    curr_url = request.get_full_path()
    nPos = curr_url.find('&page')
    if nPos > 0:
        curr_url = request.get_full_path()[0:nPos]
    else:
        curr_url = request.get_full_path()
    return render(request, 'tag.html', locals())


# 分类页
def category(request):
    categoryid = request.GET.get('cid')
    print(categoryid)
    currcategoryid = request.GET.get('cid')
    print(currcategoryid)
    page = int(request.GET.get('page', 1))
    # 取二级栏目
    data = {
        "categorys": categoryid,
    }
    ul = "http://127.0.0.1:8005/categoryitems/"
    print(ul)
    print(data)
    items_list = getdata(ul, data)
    print(99, items_list)
    # for i in items_li:
    #     items_list = (i["items"])
    # 取新闻
    data = {
        "item__categorys": categoryid,
        "page": page,
        "ordering": '-id',
    }
    article_data = getdata(articles_url, data)

    article_list = article_data["results"]

    # 总记录数
    count = article_data["count"]
    # 下一页
    next = article_data["next"]
    nextpage = page + 1
    # 上一页
    previous = article_data["previous"]
    previouspage = page - 1
    # 总页数
    num_pages = int(count / PAGESIZE)
    curr_url = request.get_full_path()
    nPos = curr_url.find('&page')
    if nPos > 0:
        curr_url = request.get_full_path()[0:nPos]
    else:
        curr_url = request.get_full_path()
    return render(request, 'category.html', locals())


# 根据二级栏目类型取新闻列表
def item(request):
    categoryid = request.GET.get('cid')
    itemid = request.GET.get('itemid')
    page = int(request.GET.get('page', 1))
    # 取二级栏目
    data = {
        "categorys": categoryid,
    }
    items_data = getdata(items_url, data)
    items_list = items_data
    # 取新闻
    data = {
        "item": itemid,
        "page": page,
        "ordering": '-id',
    }
    article_data = getdata(articles_url, data)
    article_list = article_data["results"]

    # 总记录数
    count = article_data["count"]
    # 下一页
    next = article_data["next"]
    nextpage = page + 1
    # 上一页
    previous = article_data["previous"]
    previouspage = page - 1
    # 总页数
    num_pages = int(count / PAGESIZE)
    curr_url = request.get_full_path()
    nPos = curr_url.find('&page')
    if nPos > 0:
        curr_url = request.get_full_path()[0:nPos]
    else:
        curr_url = request.get_full_path()
    return render(request, 'category.html', locals())
