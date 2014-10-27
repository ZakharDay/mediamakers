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
  $('.preloader').hide()

$ ->
  window.videosLoaded = 0
  loaded = window.videosLoaded

  spinnerOn($('.preloader'))

  $('video').each ->
    $(@).preload(
      () ->
        window.videosLoaded += 1
        console.log window.videosLoaded
        showSite() if window.videosLoaded is 2
    )
