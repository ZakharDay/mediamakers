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
  # $('#topVideoBackground').html('<video autoplay="autoplay" loop="loop" src="' + video_file_1 + '"></video>')
  # $('#registrationVideoBackground').html('<video autoplay="autoplay" loop="loop" src="' + video_file_2 + '"></video>')
  $('body').removeClass('preloader')
  $('section.preloader').hide()

oneVideoLoaded = () ->
  window.videosLoaded += 1
  showSite() if window.videosLoaded == 2

checkLoading = (videoId) ->

  if $(videoId)[0].readyState == 4
    console.log 'ready state 4'
    oneVideoLoaded()
  else
    console.log 'not loaded'
    setTimeout ->
      checkLoading(videoId)
    , 1000

$ ->
  window.videosLoaded = 0
  spinnerOn($('.preloader'))
  checkLoading('#topVideoBackground')
  checkLoading('#registrationVideoBackground')
