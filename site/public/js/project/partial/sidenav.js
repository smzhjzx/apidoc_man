/**
 * Created by jzx on 2016/7/29.
 */
$(document).ready(function () {
    var group$ = $('#editGroupModal');
    var groupId$ = $('#groupIdInput');
    var groupName$ = $('#groupNameInput');
    var groupDesc$ = $('#groupDescInput');

    group$.on('shown.bs.modal', function (event) {
        var target = $(event.relatedTarget);
        var groupId = target.data('groupid');
        var groupName = target.data('groupname');
        var groupDesc = target.data('groupdesc');
        groupId$.val(groupId);
        groupName$.val(groupName);
        groupDesc$.val(groupDesc);
    });

    group$.on('hidden.bs.modal', function () {
        groupDesc$.val('');
        groupName$.val('');
        groupId$.val('');
    });

    $('#groupModalSubmitBtn').click(function () {
        var url = 'group/create';
        var groupId = groupId$.val();
        if (!!groupId) {
            url = 'group/update/' + groupId;
        }
        $.post(url, {
            name: groupName$.val(),
            description: groupDesc$.val(),
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

    var unit$ = $('#editUnitModal');
    var unitVM = avalon.define({
        $id: 'unitModalVM',
        unit: window.emptyUnit,
        request_parameter: window.emptyUnit.request_parameter,
        success_parameter: window.emptyUnit.success_parameter,
        submit: function () {
            var data = zeta.json.transform(unitVM.unit.$model);
            data.request_parameter = zeta.json.transform(unitVM.request_parameter);
            data.success_parameter = zeta.json.transform(unitVM.success_parameter);
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
        addParam: function (type) {
            if (!type) {
                unitVM.request_parameter.push({field: '', type: '', description: ''});
            }
            if (type == 'success') {
                unitVM.success_parameter.push({field: '', type: '', description: ''});
            }
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
        removeParam: function (index, type) {
            if (!type) {
                unitVM.request_parameter.removeAt(index);
            }
            if (type == 'success') {
                unitVM.success_parameter.removeAt(index);
            }
        }
    });

    var initUnit = function (unitId) {
        $.getJSON('unit/get/' + unitId, function (data) {
            unitVM.unit = data.data;
            unitVM.request_parameter = data.data.request_parameter;
            unitVM.success_parameter = data.data.success_parameter;
        })
    };

    unit$.on('shown.bs.modal', function (event) {
        var target = $(event.relatedTarget);
        var unitId = target.data('unitid');
        unitVM.unit.group_id = target.data('groupid');
        if (!!unitId) {
            initUnit(unitId);
        }
    });

    unit$.on('hidden.bs.modal', function () {
        unitVM.unit = window.emptyUnit;
        unitVM.request_parameter = [];
        unitVM.success_parameter = [];
    });

    avalon.scan(document.body);
});