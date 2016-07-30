<?php

/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 9:17
 */

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;

abstract class ControllerBase extends Controller
{
    protected $config;

    // Call this func to set json response enabled
    public function setJsonResponse()
    {
        $this->view->disable();
        $this->response->setContentType('application/json', 'UTF-8');
    }

    // After route execute event
    public function afterExecuteRoute(Dispatcher $dispatcher)
    {
        $data = $dispatcher->getReturnedValue();
        if (!$data) {
            return;
        }
        $this->setJsonResponse();
        $this->response->setContent($data);
        $this->response->send();
        die();
    }

    protected function initialize()
    {
        $this->config = $this->di->getShared('config');

        $this->view->baseUri = $this->config->baseUri;
    }
}