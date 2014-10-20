@resizeVideo = () ->
  width = $('body').width()

  $('.vplayer').attr('width', width / 100 * 80)
  $('.vplayer').attr('height', (width / 100 * 80) / 1.77)

$ ->
  $('#play').on 'click', ->

    $('html,body').animate
      scrollTop: $('.video').offset().top
    , 1000

    $('.video').height('100%')
    $('iframe').fadeIn().css('visibility', 'visible')

  if $('.vplayer').length
    resizeVideo()

    $(window).resize ->
      resizeVideo()
