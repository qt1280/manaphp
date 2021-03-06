<?php
namespace ManaPHP;

/**
 * Class ManaPHP\Configure
 *
 * @package configure
 *
 */
class Configure implements ConfigureInterface
{
    /**
     * @var bool
     */
    public $debug = true;

    /**
     * @var string
     */
    public $appID = 'manaphp';

    /**
     * @var string
     */
    protected $_masterKey = 'key';

    /**
     * @return array
     */
    public function __debugInfo()
    {
        $data = [];

        foreach (get_object_vars($this) as $k => $v) {
            if (is_scalar($v) || is_array($v) || $v instanceof \stdClass) {
                $data[$k] = $v;
            }
        }
        return $data;
    }

    /**
     * @param string $type
     *
     * @return string
     */
    public function getSecretKey($type)
    {
        return md5($this->_masterKey . ':' . $type);
    }
}