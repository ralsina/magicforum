<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>
    </title>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
    rel="stylesheet">
  </head>

  <body>
    <ul class="breadcrumb">
      <li>
        <a href="/">Magic Mistery Forum Demo</a>
      </li>
      <li class="active">
        <a href="#">{{thread['title']}}</a>
      </li>
    </ul>
    <div class="container">
      <div class="page-header">
        <h3>
            Magic Mistery Forum Demo
        </h3>
      </div>
      <h3>
        {{thread['title']}}
        <br>
      </h3>
      <div id="disqus_thread">
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"
    >
    </script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"
    >
    </script>
    <script type="text/javascript" >
      var disqus_shortname = '{{shortname}}'; var disqus_identifier = '{{id}}';
      var disqus_url = 'http://184.82.108.14/thread/{{id}}'; (function() { var
      dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async
      = true; dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
      })();
    </script>
    <noscript>
      Please enable JavaScript to view the &lt;a href="http://disqus.com/?ref_noscript"&gt;comments
      powered by Disqus.&lt;/a&gt;
    </noscript>
    <a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
  </body>

</html>
