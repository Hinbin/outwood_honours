$(document).on('turbolinks:load', () => {
  $('#badgeSearch').off('keyup')
  $('#moduleSelect').off('change')

  $('#badgeSearch').on('keyup', function () {
    searchBadges()
  })
  $('#moduleSelect').on('change', function () {
    searchBadges()
  })



})

function searchBadges() {
  const searchTerm = $('#badgeSearch').val().toLowerCase()
  const moduleSelected = $('#moduleSelect').val().toLowerCase()

  $('div[data-role="badge"]').filter(function () {
    const badgeName = $(this).find('h4').text().toLowerCase()
    const badgeDescription = $(this).find('p').text().toLowerCase()
    const badgeModule = $(this).data('category').toString()   

    if (searchTerm && moduleSelected) {
    $(this).toggle(
      ( (badgeName.indexOf(searchTerm) > -1 || badgeDescription.indexOf(searchTerm) > -1) && badgeModule === moduleSelected)
       )
    } else if (searchTerm) {
      $(this).toggle(
        badgeName.indexOf(searchTerm) > -1 ||
        badgeDescription.indexOf(searchTerm) > -1)
    } else if (moduleSelected) {
      $(this).toggle(badgeModule === moduleSelected)
    } else {
      $(this).toggle(true)
    }
  })
}

