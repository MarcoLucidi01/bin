#!/bin/sh

DEFAULT_SITE="https://google.com/search?q="

usage()
{
        echo "usage: `basename $0` [4|8|a|g|hn|m|r|s|w|y] [term...]

start web search from command line
first argument determines site to use, default: \"$DEFAULT_SITE\"
if first argument starts with letter 'p' a private window will be used
main purpose is for web searches, but can be also used for rapid access to
favorite web sites like hn (HackerNews)

sites:
  4  4chan.org/
  8  8kun.top/
  a  amazon.it/s/?field-keywords=
  g  google.com/search?q=
  hn news.ycombinator.com/
  m  google.com/maps?q=
  r  old.reddit.com/r/
  s  google.com/search?q=site:stackoverflow.com%20
  w  wikipedia.org/w/index.php?title=Special:Search&search=
  y  youtube.com/results?search_query="
}

[ "$1" = "-h" ] && usage && exit

site="$1"
browser="firefox"
if [ "`echo $site | cut -c 1`" = "p" ]; then
        site="`echo $site | cut -c 2-`"
        browser="$browser --private-window"
fi

[ $# -gt 0 ] && shift

IFS='+'
terms="$*"
IFS=' '

case "$site" in
"4")
        url="https://4chan.org/" ;;
"8")
        url="https://8kun.top/" ;;
"a")
        url="https://amazon.it/s/?field-keywords=" ;;
"g")
        url="https://google.com/search?q=" ;;
"hn")
        url="https://news.ycombinator.com/" ;;
"m")
        url="https://google.com/maps?q=" ;;
"r")
        url="https://old.reddit.com/r/" ;;
"s")
        url="https://google.com/search?q=site:stackoverflow.com%20" ;;
"w")
        url="https://wikipedia.org/w/index.php?title=Special:Search&search=" ;;
"y")
        url="https://youtube.com/results?search_query=" ;;
*)
        url="$DEFAULT_SITE"
        [ -n "$site" ] && terms="$site+$terms"
        ;;
esac

[ -z "$terms" ] && url=`printf "$url" | cut -d '/' -f 1-3`

$browser "$url$terms" > /dev/null 2>&1 &
