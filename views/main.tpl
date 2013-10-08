<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>
      Magic Mystery Forum Demo
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="/static/jPages.css" rel="stylesheet">
  </head>

  <body>
    <div class="container">
      <div class="page-header">
        <h3 class="text-center">
          Magic Mystery Forum Demo
        </h3>
      </div>
      %if message is not None:
      <div class="alert">
        <p>
          {{message}}
        </p>
      </div>
      %end
      <div class="row">
        <div class="col-md-6">
          <div>
            <script type="text/javascript" src="http://magicmisteryforum.disqus.com/combination_widget.js?num_items=5&amp;hide_mods=0&amp;color=blue&amp;default_tab=people&amp;excerpt_length=200"
            >
            </script>
            <a href="http://disqus.com/">Powered by Disqus</a>
          </div>
        </div>
        <div class="col-md-6">
          <form action="/new" method="POST" role="form">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="New Thread Title"
                name="title">
            </div>
            <button type="submit" class="btn btn-default"> Create! </button>
          </form>
          <hr>
          <ul class="list-group" id="itemContainer">
            % for t in threads:
                %if not t['identifiers'] or t['identifiers'][0] != t['title']: continue
            <li class="list-group-item">
              <div class="pull-right">
              <span class="label label-success">{{t['likes']}}</span>
              <span class="label label-danger">{{t['dislikes']}}</span>
              </div>
              <a href="/thread/{{t['id']}}">{{t['title']}}</a>
              [
              <a href="/thread/{{t['id']}}#disqus_thread" data-disqus-identifier="{{t['id']}}">#</a>
              ]
              <small>
                <br/>{{t['createdAt']}}
              </small>
            </li>
            % end
          </ul>
          <div class="holder"></div>
        </div>
        <div class="col-md-4" style="display: none;">
          <h3>
            Span 4
          </h3>
          <p>
            Content
          </p>
        </div>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" >
    </script>
    <script src="/static/jPages.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/js/bootstrap.min.js" >
    </script>
    <div class="container">
      <div>
        <center>
          (c) Roberto Alsina --
          <a href="http://magicforum.googlecode.com">http://magicforum.googlecode.com</a>
        </center>
      </div>
    </div>
  </body>
  <script type="text/javascript">
        $(function(){
            $("div.holder").jPages({
                containerID : "itemContainer",
                perPage: 5
            });
        });
            /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
          var disqus_shortname = '{{shortname}}'; // required: replace example with your forum shortname
           /* * * DON'T EDIT BELOW THIS LINE * * */
           (function() {
            var s = document.createElement('script');
            s.async = true;
            s.type = 'text/javascript';
            s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
            (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
          }());
  </script>
</html>
