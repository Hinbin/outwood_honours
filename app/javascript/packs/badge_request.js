;(function () {
  var $doc = $(document)

  $doc.on('ajax:send', 'form[data-remote=true]', function () {
    const $form = $(this)
    const $id= $form.find('[data-id]').data().id
    const $button = $doc.find('[data-id="' + $id + '"]')
    if (!$button.length) return

    $button.attr("disabled", true)
  })
})()