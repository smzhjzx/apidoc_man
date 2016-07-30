<article id="api-{{ group.id }}-{{ unit.id }}" data-group="{{ group.id }}" data-name="{{ group.name }}">
    <div class="pull-left">
        <h1>{{ group.name }} - {{ unit.name }}</h1>
    </div>
    <div class="clearfix"></div>

    {% if unit.description is true %}
        <p>{{ unit.description }}</p>
    {% endif %}

    <pre class="prettyprint language-html" data-type="{{ unit.type }}"><code>{{ unit.url }}</code></pre>

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


    <h2>Success 200</h2>
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
            <a href="#success-examples-User-GetUser-0_0_0-0">返回示例：</a>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="success-examples-User-GetUser-0_0_0-0">
            <pre style="" class="prettyprint language-json prettyprinted"
                 data-type="json"><code>{{ unit.success_response }}</code></pre>
        </div>
    </div>
</article>