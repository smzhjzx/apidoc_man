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
use Phalcon\Config;

try {
    $baseUri = '/apidoc_man/site/';

    // Register an autoloader
    $loader = new Loader();
    $loader->registerDirs(array(
        '../app/controllers/',
        '../app/models/',
        '../../common/app/models/',
        '../../common/app/utils/',
    ))->register();

    $loader->registerNamespaces([
        'common\\services' => '../../common/app/services/',
        'common\\models' => '../../common/app/models/',
        'common\\utils' => '../../common/app/utils/',
    ]);

    // Create a DI
    $di = new FactoryDefault();

    // Setup the database service
    $di->set('db', function () {
        return new DbAdapter([
            'host' => 'localhost',
            'username' => 'root',
            'password' => 'root',
            'dbname' => 'apidoc_man'
        ]);
    });

    // Setup the volt component
    $di->set('volt', function ($view, $di) {
        $volt = new Volt($view, $di);
        $volt->setOptions([
            'compiledPath' => 'D:/xampp/htdocs/apidoc_man/site/app/cache/',
            'stat' => true,
            'compileAlways' => true
        ]);
        $compiler = $volt->getCompiler();
        $compiler->addFunction('json_encode', 'json_encode');
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
    $di->set('url', function () use ($baseUri) {
        $url = new UrlProvider();
        $url->setBaseUri($baseUri);
        return $url;
    });

    $di->setShared('config', new Config(['baseUri' => $baseUri]));

    $application = new Application($di);

    // Handle the request
    $response = $application->handle();

    $response->send();

} catch (\Exception $e) {
    echo "Exception: ", $e->getMessage();
}