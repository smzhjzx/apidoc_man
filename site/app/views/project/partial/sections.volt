<section id="api-{{ group.id }}">
    <h1>{{ group.name }}</h1>

    {% if group.description is true %}
        <p>{{ group.description }}</p>
    {% endif %}

    {% for unit in group.units %}
        <div id="api-{{ group.id }}-{{ unit.id }}">
            {{ partial('project/partial/article') }}
        </div>
    {% endfor %}
</section>