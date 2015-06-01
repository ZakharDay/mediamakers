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
