/**
 * Created by jzx on 2016/7/29.
 */
$(document).ready(function () {
    var groupModalSelector$ = $('#editGroupModal');
    var groupIdSelector$ = $('#groupIdInput');
    var groupNameSelector$ = $('#groupNameInput');
    var groupDescSelector$ = $('#groupDescInput');

    groupModalSelector$.on('shown.bs.modal', function (event) {
        var target = $(event.relatedTarget);
        var groupId = target.data('groupid');
        var groupName = target.data('groupname');
        var groupDesc = target.data('groupdesc');
        groupIdSelector$.val(groupId);
        groupNameSelector$.val(groupName);
        groupDescSelector$.val(groupDesc);
    });

    groupModalSelector$.on('hidden.bs.modal', function () {
        groupDescSelector$.val('');
        groupNameSelector$.val('');
        groupIdSelector$.val('');
    });

    $('#groupModalSubmitBtn').click(function () {
        var url = 'group/create';
        var groupId = groupIdSelector$.val();
        if (!!groupId) {
            url = 'group/update/' + groupId;
        }
        $.post(url, {
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

    var unitModalSelector$ = $('#editUnitModal');
    var unitModalVM = avalon.define({
        $id: 'unitModalVM',
        unit: window.emptyUnit,
        request_parameter: window.emptyUnit.request_parameter,
        submit: function () {
            var data = JSON.parse(JSON.stringify(unitModalVM.unit.$model));
            data.request_parameter = JSON.parse(JSON.stringify(unitModalVM.request_parameter));
            var url = 'unit/create';
            if (!!data.id) {
                url = 'unit/update/' + data.id;
            }
            $.post(url, data, function (data) {
                if (data.success) {
                    location.reload();
                }
            });
        },
        addRequestParameter: function () {
            unitModalVM.request_parameter.push({field: '', type: '', description: ''});
        },
        validate: {
            onError: function (reasons) {
                reasons.forEach(function (reason) {
                    // alert(reason.getMessage());
                })
            },
            onValidateAll: function (reasons) {
                if (reasons.length) {
                    // alert('有表单没有通过');
                }
            }
        },
        removeParam: function (index) {
            unitModalVM.request_parameter.removeAt(index);
        }
    });

    var initUnitForUnitModalVM = function (unitId) {
        $.getJSON('unit/get/' + unitId, function (data) {
            unitModalVM.unit = data.data;
            unitModalVM.request_parameter = data.data.request_parameter;
        })
    };

    unitModalSelector$.on('shown.bs.modal', function (event) {
        var target = $(event.relatedTarget);
        var unitId = target.data('unitid');
        unitModalVM.unit.group_id = target.data('groupid');
        if (!!unitId) {
            initUnitForUnitModalVM(unitId);
        }
    });

    unitModalSelector$.on('hidden.bs.modal', function () {
        unitModalVM.unit = window.emptyUnit;
        unitModalVM.request_parameter = [];
    });

    avalon.scan(document.body);
});