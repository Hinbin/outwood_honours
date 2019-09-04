$(document).on('turbolinks:load', () => {
  $('.btn-request').off('click')

  $('.btn-request').click( (event) => {

    const id = event.target.dataset.id
    const status = event.target.dataset.status
    const comment = $(`input.awarder-comment[data-id="${id}"]`)[0].value

    // Disable all buttons for this id
    $(`[data-id="${id}"]`).attr('disabled', true)

    $.ajax({
      type: 'put',
      url: `${window.location.pathname}\\${id}`,      
      data: { badge_request: { status: status, awarder_comment: comment } },
      beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
      success: function (data) {
        $(`td.approved-cell[data-id="${id}"]`)[0].innerHTML = '<i class="fas fa-check fa-lg text-success"></i>' 
        $(`input.btn[data-id="${id}"]`).remove()
      }
    })
  })
})

if (!Turbolinks) {
  location.reload();
}

Turbolinks.dispatch("turbolinks:load");