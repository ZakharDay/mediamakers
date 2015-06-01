$ ->
  $('menu i').on 'click', ->
    $(this).parent().toggleClass('opened')

  $('.scrollTo').each ->
    $(this).on 'click', (e) ->
      e.preventDefault()

      scrollTo = $(this).attr('href')

      $('html,body').animate
        scrollTop: $(scrollTo).offset().top
      , 1000

  $(document).on 'keydown', ->
    if event.which is 27
      $('menu').removeClass('opened')

  $('body').on 'click', (e) ->
    if $(e.target).parents('menu').length
      e.preventDefault()
    else if $(e.target).is('menu')
      e.preventDefault()
    else
      $('menu').removeClass('opened')

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

spinOnce = (current) ->
  if current.next().length
    next = current.next()
  else
    next = current.parent().find('li').first()

  current.toggleClass('current')
  next.toggleClass('current')

spinnerOn = (spinner) ->
  current = spinner.find('.current')

  setTimeout (->
    spinOnce current
    spinnerOn($('.preloader'))
  ), 60

showSite = () ->
  $('body').removeClass('preloader')
  $('section.preloader').hide()

oneVideoLoaded = () ->
  window.videosLoaded += 1
  showSite() if window.videosLoaded == 2

checkLoading = (videoId) ->
  if $(videoId)[0].readyState == 4
    oneVideoLoaded()
  else
    setTimeout ->
      checkLoading(videoId)
    , 100

$ ->
  if $('body').hasClass('preloader')
    window.videosLoaded = 0
    spinnerOn($('.preloader'))
    checkLoading('#topVideoBackground')
    checkLoading('#registrationVideoBackground')

