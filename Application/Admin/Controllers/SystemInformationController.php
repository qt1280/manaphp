<?php
namespace Application\Admin\Controllers;

use ManaPHP\Version;

class SystemInformationController extends ControllerBase
{
    public function indexAction()
    {
        $data = [];

        $data['framework_version'] = Version::get();
        $data['php_version'] = PHP_VERSION;
        $data['sapi'] = PHP_SAPI;

        if (function_exists('apache_get_version')) {
            $data['apache_version'] = apache_get_version();
        }

        $data['operating_system'] = php_uname();
        $data['system_time'] = date('Y-m-d H:i:s');
        $data['loaded_ini'] = '';
        $data['server_ip'] = $_SERVER['SERVER_ADDR'];
        $data['client_ip'] = $_SERVER['REMOTE_ADDR'];
        $data['upload_max_filesize'] = ini_get('upload_max_filesize');
        $data['post_max_size'] = ini_get('post_max_size');
        $data['loaded_ini'] = php_ini_loaded_file();
        $loaded_extensions = get_loaded_extensions();
        sort($loaded_extensions);
        $data['loaded_extensions'] = implode(', ', $loaded_extensions);

        $this->view->setVar('data', $data);
    }
}