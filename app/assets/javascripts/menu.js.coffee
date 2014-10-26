$ ->
  $('menu i').on 'click', ->
    $(this).parent().toggleClass('opened')

  $('.scrollTo').each ->
    $(this).on 'click', (e) ->
      e.preventDefault()

      scrollTo = $(this).attr('href')

      if scrollTo is '#video'
        $('.video').height('100%')
        $('iframe').fadeIn().css('visibility', 'visible')

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
      $('menu').toggleClass('opened')
