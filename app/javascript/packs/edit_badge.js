$(document).on('turbolinks:load', () => {
  $('[data-badge]').off('change')
  $('[data-badge]').off('keyup')
  
  $('[data-badge]').on('change', addBadgeListener )
  $('[data-badge]').on('keyup', addBadgeListener )
})

const addBadgeListener = (event) => {
  const changedItem = $(event.target)
  const badgeTarget = changedItem.data('badge')
  const badgeValue = changedItem.val()

  if (badgeTarget === 'inner_colour' ) {
    $('div#innerColour').attr( 'class', ('inner-circle ') + badgeValue )
  } else if ( badgeTarget ==='icon' || badgeTarget == 'icon_colour' ) {
    const badgeIcon = $('#badge_icon').val()
    const badgeIconColour = $('#badge_icon_colour').val()
    $('i').attr( 'class', ('fa fa-' + badgeIcon + ' ' + badgeIconColour + '-icon') )
  } else if ( badgeTarget === 'banner') {
    if (badgeValue === "" ) {
      $('.badge-preview div.banner').remove()
    } else {
      if ($('.badge-preview div.banner').length === 0) {
        $('.badge-preview .honours-badge').append('<div class="banner"></div>')
      }
      $('.badge-preview div.banner').text( badgeValue )
    }
  } else if (badgeTarget == 'level') {
    const badgeTypes = ['circle-badge', 'square-badge', 'hex-badge']
    const badgeClass = badgeTypes[ (badgeValue - 1) % 3 ]
    $('.badge-preview div.honours-badge').removeClass(badgeTypes)
    $('.badge-preview div.honours-badge').addClass(badgeClass)
  }
}