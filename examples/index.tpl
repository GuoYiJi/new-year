<!DOCTYPE html>
<html lang="cn">
<head>
  <meta charset="UTF-8">
  <title>新春段子</title>
  <script type="text/javascript">
    (function(win, doc) {
      var UA = navigator.userAgent,
        isAndroid = /android|adr/gi.test(UA),
        isIos = /iphone|ipod|ipad/gi.test(UA) && !isAndroid, // 据说某些国产机的UA会同时包含 android iphone 字符
        isMobile = isAndroid || isIos  // 粗略的判断

      return {
        isAndroid: isAndroid,
        isIos: isIos,
        isMobile: isMobile,

            isNewsApp: /NewsApp\/[\d\.]+/gi.test(UA),
        isWeixin: /MicroMessenger/gi.test(UA),
        isQQ: /QQ\/\d/gi.test(UA),
        isYixin: /YiXin/gi.test(UA),
        isWeibo: /Weibo/gi.test(UA),
        isTXWeibo: /T(?:X|encent)MicroBlog/gi.test(UA),

        tapEvent: isMobile ? 'tap' : 'click',

        /**
         * 缩放页面
         */
        fixScreen: function() {
          let scale
          var metaEl = doc.querySelector('meta[name="viewport"]'),
              metaCtt = metaEl ? metaEl.content : '',
              matchScale = metaCtt.match(/initial\-scale=([\d\.]+)/),
              matchWidth = metaCtt.match(/width=([^,\s]+)/)

          if ( !metaEl ) { // REM
              var docEl = doc.documentElement,
                  maxwidth = docEl.dataset.mw || 750, // 每 dpr 最大页面宽度
                  dpr = isIos ? Math.min(win.devicePixelRatio, 3) : 1,
                  tid
              scale = 1 / dpr
              docEl.removeAttribute('data-mw')
              docEl.dataset.dpr = dpr
              metaEl = doc.createElement('meta')
              metaEl.name = 'viewport'
              metaEl.content = fillScale(1)
              docEl.firstElementChild.appendChild(metaEl)

              var refreshRem = function() {
                  var width = docEl.getBoundingClientRect().width
                  if (width / dpr > maxwidth) {
                      width = maxwidth * dpr
                  }
                  var rem = width / 10
                  docEl.style.fontSize = rem + 'px'
              }

              win.addEventListener('resize', function() {
                  clearTimeout(tid)
                  tid = setTimeout(refreshRem, 300)
              }, false)
              win.addEventListener('pageshow', function(e) {
                  if (e.persisted) {
                      clearTimeout(tid)
                      tid = setTimeout(refreshRem, 300)
                  }
              }, false)

              refreshRem()
          } else if ( isMobile && !matchScale && ( matchWidth && matchWidth[1] != 'device-width' ) ) { // 定宽
              var width = parseInt(matchWidth[1]),
                  iw = win.innerWidth || width,
                  ow = win.outerWidth || iw,
                  sw = win.screen.width || iw,
                  saw = win.screen.availWidth || iw,
                  ih = win.innerHeight || width,
                  oh = win.outerHeight || ih,
                  ish = win.screen.height || ih,
                  sah = win.screen.availHeight || ih,
                  w = Math.min(iw,ow,sw,saw,ih,oh,ish,sah)
              scale = w / width
              if ( scale < 1 ) {
                  metaEl.content = metaCtt + ',' + fillScale(scale)
              }
          }

          function fillScale(scale) {
              return 'initial-scale=' + scale + ',maximum-scale=' + scale + ',minimum-scale=' + scale
          }
        },

        /**
         * 转href参数成键值对
         * @param href {string} 指定的href，默认为当前页href
         * @returns {object} 键值对
         */
        getSearch: function(href) {
          let data, reg
          href = href || win.location.search
          data = {}
          reg = new RegExp('([^?=&]+)(=([^&]*))?', 'g')
          href && href.replace(reg,function( $0, $1, $2, $3 ){
            data[ $1 ] = $3
          })
          return data
        }
      }
    })(window, document).fixScreen()
  </script>
</head>
<body>
  <div id="app"></div>

  <script>
    !function(){
        var analytics = window.analytics = window.analytics || []
        if (!analytics.initialize) if(analytics.invoked) window.console&&console.error&&console.error('inSegment snippetcluded twice.')
        else {
            analytics.invoked = !0
            analytics.methods = ['trackSubmit', 'trackClick', 'trackLink', 'trackForm', 'pageview', 'identify', 'reset', 'group', 'track', 'ready', 'alias', 'page', 'once', 'off', 'on']
            analytics.factory = function(t){
                return function(){
                    var e=Array.prototype.slice.call(arguments)
                    e.unshift(t);analytics.push(e)
                    return analytics
                }
            }
            for (var t = 0; t < analytics.methods.length; t++){
                var e = analytics.methods[t]
                analytics[e] = analytics.factory(e)
            }
            analytics.load = function(t){
                var e = document.createElement('script')
                e.type = 'text/javascript'
                e.async = !0
                e.src=('https:' === document.location.protocol ? 'https://' : 'http://') + 'cdn.segment.com/analytics.js/v1/' + t + '/analytics.min.js'
                var n = document.getElementsByTagName('script')[0]
                n.parentNode.insertBefore(e,n)
            }
        analytics.SNIPPET_VERSION = '3.1.0'
        analytics.load('Pe4unTXYWkc2MfTD6ox18jkcNXUfNG0v')
    }}()
  </script>
</body>
</html>
