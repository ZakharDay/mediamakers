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
  $('#topVideoBackground').html('<video autoplay="autoplay" loop="loop" src="/assets/' + video_file_1 + '"></video>')
  $('#registrationVideoBackground').html('<video autoplay="autoplay" loop="loop" src="/assets/' + video_file_2 + '"></video>')
  $('body').removeClass('preloader')
  $('section.preloader').hide()

oneVideoLoaded = () ->
  window.videosLoaded += 1
  showSite() if window.videosLoaded == 2

preloadVideo = (video_file) ->
  xhr = new XMLHttpRequest()

  xhr.onreadystatechange = ->
    oneVideoLoaded() if xhr.readyState is 4 and xhr.status is 200

  xhr.open "GET", "http://mediamakers.ru/assets/" + video_file, true
  xhr.send ""

$ ->
  window.videosLoaded = 0
  spinnerOn($('.preloader'))
  preloadVideo(video_file_1)
  preloadVideo(video_file_2)
