{% extends 'common/base_layout.volt' %}

{% block css %}
{% endblock %}

{% block content %}
    <div class="container-fluid">
        <div class="row-fluid">
            <div id="sidenav" class="span2">
                <nav id="scrollingNav">
                    <ul class="sidenav nav nav-list">
                        <li class="nav-header" data-group="User"><a href="#api-User">User</a></li>
                        <li data-group="User" data-name="GetUser" data-version="0.0.0">
                            <a href="#api-User-GetUser">Get User information</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div id="content">
                <div id="project">
                    <div class="pull-left">
                        <h1>example-basic</h1>
                        <h2>apiDoc basic example</h2>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="header"></div>
                <div id="sections">
                    <section id="api-User">
                        <h1>User</h1>
                        <div id="api-User-GetUser">

                            <article id="api-User-GetUser-0.0.0" data-group="User" data-name="GetUser"
                                     data-version="0.0.0">
                                <div class="pull-left">
                                    <h1>User - Get User information</h1>
                                </div>
                                <div class="clearfix"></div>


                                <pre style="" class="prettyprint language-html prettyprinted"
                                     data-type="get"><code><span class="pln">/user/:id</span></code></pre>


                                <h2>Parameter</h2>
                                <table>
                                    <thead>
                                    <tr>
                                        <th style="width: 30%">Field</th>
                                        <th style="width: 10%">Type</th>
                                        <th style="width: 70%">Description</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="code">id</td>
                                        <td>
                                            Number
                                        </td>
                                        <td>
                                            <p>Users unique ID.</p>


                                        </td>
                                    </tr>
                                    </tbody>
                                </table>


                                <h2>Success 200</h2>
                                <table>
                                    <thead>
                                    <tr>
                                        <th style="width: 30%">Field</th>
                                        <th style="width: 10%">Type</th>
                                        <th style="width: 70%">Description</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="code">firstname</td>
                                        <td>
                                            String
                                        </td>
                                        <td>
                                            <p>Firstname of the User.</p>


                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="code">lastname</td>
                                        <td>
                                            String
                                        </td>
                                        <td>
                                            <p>Lastname of the User.</p>


                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <ul class="nav nav-tabs nav-tabs-examples">
                                    <li class="active">
                                        <a href="#success-examples-User-GetUser-0_0_0-0">Success-Response:</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="success-examples-User-GetUser-0_0_0-0">
        <pre style="" class="prettyprint language-json prettyprinted" data-type="json"><code><span
                        class="pln">    HTTP</span><span class="pun">/</span><span class="lit">1.1</span><span
                        class="pln"> </span><span class="lit">200</span><span class="pln"> OK
    </span><span class="pun">{</span><span class="pln">
      </span><span class="str">"firstname"</span><span class="pun">:</span><span class="pln"> </span><span class="str">"John"</span><span
                        class="pun">,</span><span class="pln">
      </span><span class="str">"lastname"</span><span class="pun">:</span><span class="pln"> </span><span class="str">"Doe"</span><span
                        class="pln">
    </span><span class="pun">}</span></code></pre>
                                    </div>
                                </div>


                                <h2>Error 4xx</h2>
                                <table>
                                    <thead>
                                    <tr>
                                        <th style="width: 30%">Field</th>

                                        <th style="width: 70%">Description</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="code">UserNotFound</td>
                                        <td>
                                            <p>The <code>id</code> of the User was not found.</p>


                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <ul class="nav nav-tabs nav-tabs-examples">
                                    <li class="active">
                                        <a href="#error-examples-User-GetUser-0_0_0-0">Error-Response:</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="error-examples-User-GetUser-0_0_0-0">
        <pre style="" class="prettyprint language-json prettyprinted" data-type="json"><code><span
                        class="pln">    HTTP</span><span class="pun">/</span><span class="lit">1.1</span><span
                        class="pln"> </span><span class="lit">404</span><span class="pln"> </span><span
                        class="typ">Not</span><span class="pln"> </span><span class="typ">Found</span><span class="pln">
    </span><span class="pun">{</span><span class="pln">
      </span><span class="str">"error"</span><span class="pun">:</span><span class="pln"> </span><span class="str">"UserNotFound"</span><span
                        class="pln">
    </span><span class="pun">}</span></code></pre>
                                    </div>
                                </div>


                            </article>

                        </div>
                    </section>
                </div>
                <div id="footer"></div>
                <div id="generator">
                    <div class="content">
                        Generated with <a href="http://apidocjs.com">apiDoc</a> 0.9.0 - 2014-11-28T14:54:55.224Z
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block js %}
{% endblock %}