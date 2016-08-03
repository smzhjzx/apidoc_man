/**
 * Created by jzx on 2016/8/1.
 */
$(document).ready(function () {
    alert('ss');
    zeta.ns('zeta.unit.params', function (vmId, params) {
        params = params || [];
        var vm = avalon.define({
            $id: vmId,
            params: params,
            addParam: function () {
                vm.params.push({field: '', type: '', description: ''});
            },
            removeParam: function (index) {
                vm.params.removeAt(index);
            }
        });

        return vm;
    });
});