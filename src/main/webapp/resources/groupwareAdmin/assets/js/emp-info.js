$(function () {
    const select2ShareProject = $('.share-project-select');

    $('.emp-info').on('shown.bs.modal', function () {
        if (select2ShareProject.length) {
            function renderAvatar(option) {
                if (!option.id) {
                    return option.text;
                }
                var optionEle =
                    '<div class="d-flex align-items-center">' +
                    '<div class="name">' +
                    $(option.element).data('name') +
                    '</div>' +
                    '</div>';
                return optionEle;
            }
  
            function matchCustom(params, data) {
                // If there are no search terms, return all of the data
                if ($.trim(params.term) === '') {
                    return data;
                }
                
                // If the text contains the term, return the data
                if ($(data.element).data('name').toString().includes(params.term)) {
                    return data;
                }
                
                // Return `null` if the term should not be displayed
                return null;
            }
    

            select2ShareProject.select2({
                dropdownParent: $(this),
                templateResult: renderAvatar,
                templateSelection: renderAvatar,
                placeholder: 'Add Project Members',
                escapeMarkup: function (es) {
                    return es;
                },
                matcher: matchCustom
            });
        }
    });
});
