<article id="api-{{ group.id }}-{{ unit.id }}" data-group="{{ group.id }}" data-name="{{ group.name }}">
    <div class="pull-left">
        <h1>{{ group.name }} - {{ unit.name }}</h1>
    </div>
    <div class="clearfix"></div>

    {% if unit.description is true %}
        <p>{{ unit.description }}</p>
    {% endif %}

    <pre class="prettyprint lang-html">{{ unit.url }}</pre>

    <ul class="nav nav-tabs nav-tabs-examples">
        <li class="active">
            <a>请求示例</a>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active">
            <pre class="prettyprint lang-html">{{ unit.url_example }}</pre>
        </div>
    </div>

    <h2>请求参数</h2>
    <table>
        <thead>
        <tr>
            <th style="width: 30%">名称</th>
            <th style="width: 10%">类型</th>
            <th style="width: 70%">描述</th>
        </tr>
        </thead>
        <tbody>
        {% for p in unit.request_parameter %}
            <tr>
                <td class="code">{{ p.field }}</td>
                <td>{{ p.type }}</td>
                <td><p>{{ p.description }}</p></td>
            </tr>
        {% endfor %}
        </tbody>
    </table>


    <h2>成功 200</h2>
    <table>
        <thead>
        <tr>
            <th style="width: 30%">名称</th>
            <th style="width: 10%">类型</th>
            <th style="width: 70%">描述</th>
        </tr>
        </thead>
        <tbody>
        {% for p in unit.success_parameter %}
            <tr>
                <td class="code">{{ p.field }}</td>
                <td>{{ p.type }}</td>
                <td><p>{{ p.description }}</p></td>
            </tr>
        {% endfor %}
        </tbody>
    </table>

    <ul class="nav nav-tabs nav-tabs-examples">
        <li class="active">
            <a>返回示例：</a>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active">
            <pre class="prettyprint lang-json">{{ unit.success_response }}</pre>
        </div>
    </div>
</article>