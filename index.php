<?php
// ��� ��� ��������, ������� ���������� ������ ���� � ���
// ���, ��� �� � php.net, ��� � �����, �� ��� � ����
// �� �� ����� �����, ��� ����������) (��� ��� ����� ��� �������� ^_^ )
if(get_magic_quotes_gpc()) {
    function stripallslashes($value) {
        return is_array($value) ? array_map('stripallslashes',$value) : stripslashes($value);
    }
    $_GET=array_map('stripallslashes', $_GET);
    $_POST=array_map('stripallslashes', $_POST);
}

error_reporting(E_ALL);

require_once './configs/config.php';
require_once systemConfig::$pathToSystem . '/index.php';
require_once './application.php';

$application = new application();
$application->run();

?>