$(document).ready(function () {
  $(document).on('click', '#delete-question', function () {
    var id = $(this).parent().parent().data().id
    $.ajax({
      url: '/students/' + id,
      method: 'DELETE'
    }).done(function () {
      var row = $("[data-id='" + id + "'");
      row.parent().remove('tr');
    })

    location.reload();
  })
})