import bottle
import disqusapi as disqus
import time
shortname = 'magicmisteryforum'
url = "http://foro.netmanagers.com.ar"
api = disqus.DisqusAPI(open("key").read().strip())

@bottle.route('/', method='GET')
def index():
    message = bottle.request.GET.get('msg', None)
    threads = api.threads.list(forum=shortname, limit=25)
    return bottle.template('main.tpl', threads=threads, shortname=shortname, message=message, url=url)

@bottle.route('/new', method='POST')
def new():
    title = bottle.request.forms.get('title', None)
    if not title:
        bottle.redirect('/?msg=Missing%20Thread%20Name')
        return
    thread = api.threads.create(forum=shortname, title = title, identifier = title)
    print "THREAD", thread
    thread_id = thread['id']
    api.posts.create(thread=thread_id, message="Post about %s here!"%title)
    bottle.redirect('/thread/%s'%thread_id)

@bottle.route('/thread/:id')
def thread(id):
    t = api.threads.details(thread=id)
    return bottle.template('thread.tpl', shortname=shortname, id=id, thread=t)

@bottle.route('/static/:path#.+#')
def server_static(path):
    return bottle.static_file(path, root='./static')

app = bottle.app()
app.catchall = False #Now most exceptions are re-raised within bottle.
bottle.run(host='0.0.0.0', port=8000, app=app)
