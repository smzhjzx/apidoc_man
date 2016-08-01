<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>apidoc</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <base href="{{ baseUri }}">

    <link href="public/vendor/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="public/css/prettify.css" rel="stylesheet" media="screen">
    <link href="public/css/style.css" rel="stylesheet" media="screen, print">
    <link href="public/img/favicon.ico" rel="icon" type="image/x-icon">
    {#<script src="public/js/polyfill.js"></script>#}

    {% block css %}{% endblock %}

</head>
<body>

{% block content %}{% endblock %}

{#<script data-main="main.js" src="public/js/require.min.js"></script>#}

<script src="public/vendor/jquery/dist/jquery.min.js"></script>
<script src="public/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="public/vendor/lodash/dist/lodash.min.js"></script>
<script src="public/vendor/avalon/dist/avalon.js"></script>

<script src="public/js/main.js"></script>
{% block js %}{% endblock %}

</body>
</html>