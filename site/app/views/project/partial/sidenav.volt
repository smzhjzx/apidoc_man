<nav id="scrollingNav">
    <ul class="sidenav nav nav-list">
        <li class="nav-fixed nav-header">
            <button class="btn btn-primary" data-toggle="modal" data-target="#editGroupModal">
                添加组
            </button>
        </li>
        {% for group in groups %}
            <li class="nav-header" data-group="{{ group.id }}">
                <a style="width: 80%" href="javascript:;" class="nav-anchor" data-id="api-{{ group.id }}">
                    {{ group.name }}
                </a>
                <button style="margin-top: -30%;margin-left: 80%;" class="btn btn-primary btn-xs" data-toggle="modal"
                        data-target="#editGroupModal" data-groupid="{{ group.id }}" data-groupname="{{ group.name }}"
                        data-groupdesc="{{ group.description }}">编辑组
                </button>
            </li>
            <li>
                <a>
                    <button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editUnitModal"
                            data-groupid="{{ group.id }}">添加项
                    </button>
                </a>
            </li>
            {% for unit in group.units %}
                <li data-group="{{ unit.id }}" data-name="{{ unit.name }}" data-version="">
                    <a href="javascript:;" class="nav-anchor" style="width: 80%"
                       data-id="api-{{ group.id }}-{{ unit.id }}">{{ unit.name }}</a>
                    <button style="margin-top: -30%;margin-left: 80%;" class="btn btn-primary btn-xs"
                            data-toggle="modal" data-target="#editUnitModal" data-unitid="{{ unit.id }}">编辑项
                    </button>
                </li>
            {% endfor %}
        {% endfor %}
    </ul>
</nav>

<div class="modal fade" id="editGroupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加组</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="groupIdInput">
                <div class="form-group">
                    <label>组名</label>
                    <input id="groupNameInput" class="form-control">
                </div>
                <div class="form-group">
                    <label>描述</label>
                    <textarea id="groupDescInput" class="form-control" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="groupModalSubmitBtn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="editUnitModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" ms-controller="unitModalVM">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加项</h4>
            </div>
            <div class="modal-body">
                <form ms-validate="@validate">
                    <div class="form-group">
                        <label>项名</label>
                        <input ms-duplex="@unit.name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <textarea ms-duplex="@unit.description" class="form-control" rows="3"></textarea>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <label>URL</label>
                            <input ms-duplex="@unit.url" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>TYPE</label>
                            <input ms-duplex="@unit.type" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>请求示例</label>
                        <input ms-duplex="@unit.url_example" class="form-control" required>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">请求参数</div>
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
                                            <button ms-click="@addRequestParameter()" class="btn btn-primary">添加参数
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
                    <div class="form-group">
                        <label>返回数据</label>
                        <textarea ms-duplex="@unit.success_response" class="form-control" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" ms-click="@submit()">保存</button>
            </div>
        </div>
    </div>
</div>
