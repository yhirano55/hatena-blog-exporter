# hatena-blog-exporter

Export your hatena-blog articles to Another Blog Format (Hugo)

## Usage

```
$ git clone https://github.com/yhirano55/hatena-blog-exporter
$ cd hatena-blog-exporter
$ mv config.yml.sample config.yml # edit config file
```

### Config file

```yaml
---
consumer_key:        <Hatena application consumer key>
consumer_secret:     <Hatena application consumer secret>
access_token:        <Hatena application access token>
access_token_secret: <Hatena application access token secret>
user_id:             <Hatena user ID>
blog_id:             <Hatenablog ID>
```

### Export via container

```
$ docker build -t exporter:latest .
$ docker run -it --rm exporter:latest get_access_token <consumer_key> <consumer_secret>
$ docker run --rm exporter:latest rake hatena-blog-exporter:hugo
```

### Export on local

```
$ bundle install
$ bundle exec get_access_token <consumer_key> <consumer_secret>
$ bundle exec rake hatena-blog-exporter:hugo
```

You can generate markdown files: `post/{entry-id}.md`

## License

[MIT License](http://opensource.org/licenses/MIT)
