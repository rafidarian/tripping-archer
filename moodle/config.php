<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'localhost';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'moodle';
$CFG->dbpass = 'ecc31b7afaaf0b1ca7569c2489cc25d4';
$CFG->prefix    = '';
$CFG->dboptions = array (
  'dbpersist' => 0,
);

$protocol='http://';
$hostname='127.0.0.1';
if (isset($_SERVER['HTTPS'])) { $protocol='https://'; }
if (isset($_SERVER['HTTP_HOST'])) { $hostname=$_SERVER['HTTP_HOST']; }
$CFG->wwwroot = $protocol.$hostname;

$CFG->dataroot  = '/var/www/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0750;

$CFG->passwordsaltmain = '8a6da1c958b4072722357193f7e21504';

require_once(dirname(__FILE__) . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
