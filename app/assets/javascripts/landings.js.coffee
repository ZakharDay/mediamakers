@resizeVideo = () ->
  width = $('body').width()

  $('.vplayer').attr('width', width / 100 * 89)
  $('.vplayer').attr('height', (width / 100 * 89) / 1.77)

$ ->
  if $('.vplayer').length
    resizeVideo()

    $(window).resize ->
      resizeVideo()

  $(window).scroll (i) ->
    windowHeight = $(window).height()
    scrollVar = $(window).scrollTop()
    videoBackgroundOpacity = 1 - scrollVar / windowHeight

    $('#topVideoBackground').css('opacity', videoBackgroundOpacity) if videoBackgroundOpacity >= 0.2
    $('#topVideoBackground').css('opacity', 0) if scrollVar / windowHeight >= 4

  $('.chevron').on 'click', ->
    $('html,body').animate
      scrollTop: $('.video').first().offset().top
    , 1000
