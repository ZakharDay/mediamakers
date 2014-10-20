@resizeVideo = () ->
  width = $('body').width()

  $('.vplayer').attr('width', width / 100 * 90)
  $('.vplayer').attr('height', (width / 100 * 90) / 1.77)

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

  $(window).scroll (i) ->
    windowHeight = $(window).height()
    scrollVar = $(window).scrollTop()
    videoBackgroundOpacity = 1 - scrollVar / windowHeight

    $('#topVideoBackground').css('opacity', videoBackgroundOpacity) if videoBackgroundOpacity >= 0.2

  $('.chevron').on 'click', ->
    $('html,body').animate
      scrollTop: $('.promo').offset().top
    , 1000
