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
