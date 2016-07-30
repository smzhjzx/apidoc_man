{% extends 'common/base_layout.volt' %}

{% block css %}
{% endblock %}

{% block content %}
    <div class="panel panel-default">
        <div class="panel-heading">
            项目列表
            <button class="btn btn-primary" data-toggle="modal" data-target="#editProjectModal">
                添加项目
            </button>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>项目</th>
                        <th>描述</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    {% for project in projects %}
                        <tr>
                            <td><a href="project/detail/{{ project.id }}">{{ project.name }}</a></td>
                            <td><p>{{ project.description }}</p></td>
                            <td>
                                <button class="btn btn-primary" data-toggle="modal" data-target="#editProjectModal"
                                        data-projectid="{{ project.id }}" data-projectname="{{ project.name }}"
                                        data-projectdesc="{{ project.description }}">
                                    编辑项目
                                </button>
                            </td>
                        </tr>
                    {% endfor %}
                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /.panel-body -->
    </div>

    <div class="modal fade" id="editProjectModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加项目</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="projectIdInput">
                    <div class="form-group">
                        <label>名称</label>
                        <input id="projectNameInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <textarea id="projectDescInput" class="form-control" rows="3"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="projectModalSubmitBtn">保存</button>
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block js %}
    <script src="public/js/project/list.js"></script>
{% endblock %}