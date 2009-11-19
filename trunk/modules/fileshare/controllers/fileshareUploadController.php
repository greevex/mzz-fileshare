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
		$validator = new formValidator();
		$validator->add('required', 'file[title]', 'Укажите название фотографии!');
		$validator->add('required', 'file[description]', 'Укажите описание фотографии!');
		$validator->add('uploaded', 'uploadfile', 'Укажите файл для загрузки');
		
		/* загрузка файла */
		$fileManagerFolderMapper = $this->toolkit->getMapper('fileManager', 'folder');
		$folder = $fileManagerFolderMapper->searchByPath('root/fileshare');
		if (!$folder) {
			return $this->forward404($fileManagerFolderMapper);
		}
		
		/* проверка данных */
		if($validator->validate()) {
			$data = new arrayDataspace($this->request->getArray('file', SC_POST));
			$active = mzz_trim($data['active']);
			if (!$active) {
				$data['active'] = 0;
			}
			
			/* загрузка файла */
			$file = $folder->upload('uploadfile');

			$fileMapper = $this->toolkit->getMapper('fileManager', 'file');
			$fileMapper->save($file);
			
			$data['file']=$file->getName();		
			
			$this->smarty->assign('file_name', $data['file']);
			$this->smarty->assign('success', true);
			
			/* запись в таблицу */
			$FileshareFileMapper = $this->toolkit->getMapper('fileshare', 'fileshareFile');
			$photo = $galleryPhotoMapper->create();
			$photo->setFile_id($data['title']);
			$photo->setFormat($data['format']);
			$photo->setTitle($data['title']);
			$photo->setDescription($data['description']);
			$photo->setFile($file);
			$this->smarty->assign('data', $data);
			$galleryPhotoMapper->save($photo);
		} else {
			/* дебаг 
			echo "<pre style=\"background-color:#ddd;\">\n<strong>Дебаг:\n_POST:\n\n</strong>";
			print_r($_POST);
			echo"\n<strong>validator::getErrors()::export()</strong>\n\n";
		   var_dump($validator->getErrors()->export());
		   echo "</pre>";
		   */
		}
		
		$url = new url('default2');
		$url->setModule('fileshare');
		$url->setAction('upload');
		
		$this->smarty->assign('form_action', $url->get());

        return $this->smarty->fetch('fileshare/upload.tpl');
    }
}

?>