<?php
/**
 * $URL: svn://svn.subversion.ru/usr/local/svn/mzz/tags/0.3_rc2/system/modules/admin/templates/generator/mapper.tpl $
 *
 * MZZ Content Management System (c) 2009
 * Website : http://www.mzz.ru
 *
 * This program is free software and released under
 * the GNU Lesser General Public License (See /docs/LGPL.txt).
 *
 * @link http://www.mzz.ru
 * @version $Id: mapper.tpl 3620 2009-08-15 23:51:48Z striker $
 */

fileLoader::load('fileshare/fileshareFormat');

/**
 * fileshareFormatMapper
 *
 * @package modules
 * @subpackage fileshare
 * @version 0.1
 */

class fileshareFormatMapper extends mapper
{
    /**
     * Module name
     *
     * @var string
     */
    protected $module = 'fileshare';

    /**
     * DomainObject class name
     *
     * @var string
     */
    protected $class = 'fileshareFormat';

    /**
     * Table name
     *
     * @var string
     */
    protected $table = 'fileshare_format';

    /**
     * Map
     *
     * @var array
     */
    protected $map = array (
        'id' => 
        array (
            'type' => 'int',
            'range' => 
            array (
                0 => -2147483647,
                1 => 2147483648,
            ),
            'options' => 
            array (
                0 => 'pk',
                1 => 'once',
            ),
            'accessor' => 'getId',
            'mutator' => 'setId',
        ),
        'string_id' => 
        array (
            'type' => 'varchar',
            'maxlength' => 255,
            'accessor' => 'getStringId',
            'mutator' => 'setStringId',
        ),
        'ext' => 
        array (
            'type' => 'varchar',
            'maxlength' => 255,
            'accessor' => 'getExt',
            'mutator' => 'setExt',
        ),
        'title' => 
        array (
            'type' => 'varchar',
            'maxlength' => 255,
            'accessor' => 'getTitle',
            'mutator' => 'setTitle',
        ),
        'description' => 
        array (
            'type' => 'varchar',
            'maxlength' => 255,
            'accessor' => 'getDescription',
            'mutator' => 'setDescription',
        ),
    );
}

?>