

function getNewNumber()
{
    var n = 0;

    $('#divContentLesson .inp-lesson-number').each(function () {
        var currentNumber = parseInt($(this).val());
        if (currentNumber > n)
        { n = currentNumber; }
    });

    return (n + 1);



}

function btnAddClick(e)
{
    
    var lessonTitle = $('.inp-add-lesson');
    
    var pageNumber = getNewNumber();

    if (lessonTitle.val().trim() != '') {

        $('#divContentLesson').append('<input type=\"text\" class=\"inp-lesson-number\" value=' + pageNumber.toString() + ' /><div class=\"div-title-lesson\" onclick=\"SetActiveLessonPart(this)\">' + lessonTitle.val() + '</div>');
        $('.inp-add-lesson').val('').css('display', 'none').fadeIn();

    }
    else {
        lessonTitle.css('background-color', 'aliceblue').focus();
        setTimeout(function () { lessonTitle.css('background-color', 'white') }, 3000);
    }

}






function ClearValues()
{

    $('.inp-add-lesson').val('');
    $('#divContentLesson').empty();
  
}

function SetActiveLessonPart(e)
{
    $('.div-title-lesson').removeClass('div-title-lesson-active');
    $(e).addClass('div-title-lesson-active');
}

