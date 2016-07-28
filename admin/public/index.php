<?php
/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 9:32
 */

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Mvc\Application;
use Phalcon\Di\FactoryDefault;
use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;

try {

    // Register an autoloader
    $loader = new Loader();
    $loader->registerDirs(array(
        '../app/controllers/',
        '../app/models/'
    ))->register();

    // Create a DI
    $di = new FactoryDefault();

    // Setup the volt component
    $di->set('volt', function ($view, $di) {
        $volt = new Volt($view, $di);
        $volt->setOptions([
            'compiledPath' => 'D:/xampp/htdocs/apidoc_man/admin/app/cache/',
        ]);
        return $volt;
    });

    // Setup the view component
    $di->set('view', function () {
        $view = new View();
        $view->setViewsDir('../app/views/');
        $view->registerEngines(array('.volt' => 'volt'));
        return $view;
    });

    // Setup a base URI so that all generated URIs include the "tutorial" folder
    $di->set('url', function () {
        $url = new UrlProvider();
        $url->setBaseUri('/apidoc_man/');
        return $url;
    });

    $application = new Application($di);

    // Handle the request
    $response = $application->handle();

    $response->send();

} catch (\Exception $e) {
    echo "Exception: ", $e->getMessage();
}