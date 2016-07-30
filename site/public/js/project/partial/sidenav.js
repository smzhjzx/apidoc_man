/**
 * Created by jzx on 2016/7/29.
 */
$(document).ready(function () {
    var groupModalSelector$ = $('#addGroupModal');
    var groupNameSelector$ = $('#groupNameInput');
    var groupDescSelector$ = $('#groupDescInput');

    groupModalSelector$.on('hidden.bs.modal', function () {
        groupDescSelector$.val('');
        groupNameSelector$.val('');
    });

    $('#groupModalSubmitBtn').click(function () {
        $.post('group/create', {
            name: groupNameSelector$.val(),
            description: groupDescSelector$.val(),
            project_id: window.projectId
        }, function (data) {
            if (data.success) {
                location.reload();
            }
        });
    });

    $('.nav-anchor').click(function () {
        var id = $(this).data('id');

        $('html,body').animate({scrollTop: $('#' + id).offset().top}, 1000)
    });

    var unitModalSelector$ = $('#addUnitModal');
    var unitModalVM = avalon.define({
        $id: 'unitModalVM',
        unit: window.emptyUnit,
        request_parameter: window.emptyUnit.request_parameter,
        submit: function () {
            var data = JSON.parse(JSON.stringify(unitModalVM.unit.$model));
            data.request_parameter = JSON.parse(JSON.stringify(unitModalVM.request_parameter));
            $.post('unit/create', data, function (data) {
                if (data.success) {
                    location.reload();
                }
            });
        },
        addRequestParameter: function () {
            unitModalVM.request_parameter.push({field: '', type: '', description: ''});
            console.log(JSON.parse(JSON.stringify(unitModalVM.request_parameter)))
        }
    });

    unitModalSelector$.on('show.bs.modal', function (event) {
        unitModalVM.unit.group_id = $(event.relatedTarget).data('groupid');
    });

    unitModalSelector$.on('hidden.bs.modal', function () {
        unitModalVM.unit = window.emptyUnit;
        unitModalVM.request_parameter = [];
    });

    avalon.scan(document.body);
});