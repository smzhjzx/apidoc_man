{% extends 'common/base_layout.volt' %}

{% block css %}
{% endblock %}

{% block content %}
    <div class="container-fluid">
        <div class="row-fluid">
            <div id="sidenav" class="span2">{{ partial('project/partial/sidenav') }}</div>
            <div id="content">
                <div id="project">{{ partial('project/partial/project') }}</div>
                <div id="header"></div>
                <div id="sections">
                    {% for group in groups %}
                        {{ partial('project/partial/sections') }}
                    {% endfor %}
                </div>
                <div id="footer"></div>
                <div id="generator"></div>
            </div>
        </div>
    </div>
{% endblock %}

{% block js %}
    <script src="public/js/project/partial/sidenav.js"></script>
    <script>
        window.projectId = '{{ project.id }}';
        window.emptyUnit = {{ json_encode(emptyUnit) }};
    </script>
{% endblock %}