#!/usr/bin/python2.6

import disqusapi as disqus

api = disqus.DisqusAPI(open("key").read().strip())
for t in api.threads.list(forum='magicmisteryforum', limit=100):
    api.threads.remove(thread=t['id'])
for t in api.posts.list(forum='magicmisteryforum', limit=100):
    api.posts.remove(post=t['id'])

t = "Feel free to create threads or post comments here."
api.threads.create(forum="magicmisteryforum", title=t, identifier=t)
