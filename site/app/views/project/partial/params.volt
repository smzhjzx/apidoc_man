<div class="panel panel-default">
    <div class="panel-heading">{{ title }}</div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th width="23%">名称</th>
                    <th width="17%">类型</th>
                    <th width="50%">描述</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr ms-for="(index,p) in @request_parameter">
                    <td><input ms-duplex="p.field" class="form-control" ms-rules="{required:true}">
                    </td>
                    <td><input ms-duplex="p.type" class="form-control" required></td>
                    <td><input ms-duplex="p.description" class="form-control"></td>
                    <td>
                        <button class="btn btn-primary" ms-click="@removeParam(index)">移除</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button ms-click="@addParam()" class="btn btn-primary">添加参数
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.panel-body -->
</div>

{% do assets.addJs('js/project/partial/params.js') %}