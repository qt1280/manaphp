<?php
namespace ManaPHP\Meter\Linear;

/**
 * Class ManaPHP\Meter\Linear\Model
 *
 * @package linearMeter
 */
class Model extends \ManaPHP\Mvc\Model
{
    /**
     * @var string
     */
    public $hash;

    /**
     * @var string
     */
    public $type;

    /**
     * @var string
     */
    public $id;

    /**
     * @var int
     */
    public $count;

    /**
     * @var int
     */
    public $created_time;

    /**
     * @return string
     */
    public function getSource()
    {
        return 'manaphp_linear_meter';
    }
}
