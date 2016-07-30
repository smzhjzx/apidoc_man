<?php

class Unit extends \common\models\ModelBase
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var integer
     */
    public $group_id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $description;

    /**
     *
     * @var string
     */
    public $request_parameter;

    /**
     *
     * @var string
     */
    public $error_response;

    /**
     *
     * @var string
     */
    public $success_parameter;

    /**
     *
     * @var string
     */
    public $success_response;

    /**
     *
     * @var string
     */
    public $url;

    /**
     *
     * @var string
     */
    public $type;

    /**
     *
     * @var string
     */
    public $create_date;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'unit';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Unit[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Unit
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }
}
