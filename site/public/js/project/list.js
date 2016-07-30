/**
 * Created by jzx on 2016/7/29.
 */
$(document).ready(function () {
    var projectModalSelector$ = $('#editProjectModal');
    var projectIdSelector$ = $('#projectIdInput');
    var projectNameSelector$ = $('#projectNameInput');
    var projectDescSelector$ = $('#projectDescInput');

    projectModalSelector$.on('shown.bs.modal', function (event) {
        var target = $(event.relatedTarget);
        var projectId = target.data('projectid');
        var projectName = target.data('projectname');
        var projectDesc = target.data('projectdesc');
        projectIdSelector$.val(projectId);
        projectNameSelector$.val(projectName);
        projectDescSelector$.val(projectDesc);
    });

    projectModalSelector$.on('hidden.bs.modal', function () {
        projectDescSelector$.val('');
        projectNameSelector$.val('');
        projectIdSelector$.val('');
    });

    $('#projectModalSubmitBtn').click(function () {
        var url = 'project/create';
        var projectId = projectIdSelector$.val();
        if (!!projectId) {
            url = 'project/update/' + projectId;
        }
        $.post(url, {
            name: projectNameSelector$.val(),
            description: projectDescSelector$.val()
        }, function (data) {
            if (data.success) {
                location.reload();
            }
        });
    });
});