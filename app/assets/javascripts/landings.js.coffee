$ ->
  $('#play').on 'click', ->
    height = $('.welcome').height()
    $('.welcome').css('margin-top', -height)
    $('.promo').css('margin-top', -height)
#   console.log 'loaded'
#   $(".videoBackground").videobackground
#     videoSource: [
#       [
#         "videos/welcome.mp4"
#         "video/mp4"
#       ]
#       [
#         "videos/welcome.webm"
#         "video/webm"
#       ]
#       [
#         "videos/welcome.ogg"
#         "video/ogg"
#       ]
#     ]
#     loop: true
#     # poster: "video/big-buck-bunny.jpg"
#     loadedCallback: ->
#       $(this).videobackground "mute"
#
#   $('.videoBackground').videobackground('resize');
