$(document).on('click', 'input:checkbox', function () {
  var $this = $(this);
  var $question = $(this).closest('.nested_fields_question');
  var checked = $this.is(':checked');

  if (checked) {
    $question.find('.answer_check_boxes').not(this).removeAttr("checked");
    $question.find('.answer_check_boxes').not(this).closest('.check_and_labels').fadeOut();
  } else {
    $question.find('.check_and_labels').fadeIn();
  }
});