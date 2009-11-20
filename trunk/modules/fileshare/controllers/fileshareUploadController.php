<?php
/**
 * $URL: svn://svn.subversion.ru/usr/local/svn/mzz/trunk/system/codegenerator/templates/controller.tpl $
 *
 * MZZ Content Management System (c) 2009
 * Website : http://www.mzz.ru
 *
 * This program is free software and released under
 * the GNU Lesser General Public License (See /docs/LGPL.txt).
 *
 * @link http://www.mzz.ru
 * @version $Id: controller.tpl 2200 2007-12-06 06:52:05Z zerkms $
 */

/**
 * fileshareUploadController
 *
 * @package modules
 * @subpackage fileshare
 * @version 0.1
 */
class fileshareUploadController extends simpleController
{
    protected function getView()
    {
		/* об€зательные пол€ */
		$validator = new formValidator();
		$validator->add('uploaded', 'uploadfile', '¬ыберите файл!');
		
		/* указываем директорию */
		$fileManagerFolderMapper = $this->toolkit->getMapper('fileManager', 'folder');
		$folder = $fileManagerFolderMapper->searchByPath('root/fileshare');
		if (!$folder) {
			return $this->forward404($fileManagerFolderMapper);
		}
		
		/* проверка данных */
		if($validator->validate()) {
			$data = new arrayDataspace($this->request->getArray('file', SC_POST));
			
			/* загрузка файла */
			$file = $folder->upload('uploadfile');
			$fileMapper = $this->toolkit->getMapper('fileManager', 'file');
			$fileMapper->save($file);
			
			/* запись в таблицу */
			$FileshareFileMapper = $this->toolkit->getMapper('fileshare', 'fileshareFile');
			$realname = $this->request->getArray('uploadfile', SC_FILES);
			$realname = $realname['name'];
			$upfile = $FileshareFileMapper->create();
			$upfile->setFileId($file);
			$upfile->setFormat($realname);
			$upfile->setTitle($data['title']);
			$upfile->setDescription($data['description']);
			$FileshareFileMapper->save($upfile);
			
			$this->smarty->assign('realname', $realname);
		}
		$this->smarty->assign('form_action', '/upload');
		
		$url = new url('default2');
		$url->setModule('fileshare');
		$url->setAction('upload');

        return $this->smarty->fetch('fileshare/upload.tpl');
    }
}
?>