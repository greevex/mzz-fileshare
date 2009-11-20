{if isset($realname)}Файл {$realname} успешно загружен!{/if}
{form action=$form_action enctype="multipart/form-data" method="post"}
<table width="90%" border="0" cellpadding="5" cellspacing="0">
	<tr>
        <td style='width: 50%;'>{form->caption name="uploadfile" value="Выберите файл"}</td>
        <td style='width: 50%;'>{form->file name="uploadfile" style="width:250px;"}</td>
    </tr>
    <tr>
        <td style='width: 50%;'>{form->caption name="file[title]" value="Название"}</td>
        <td style='width: 50%;'>{form->text name="file[title]" value="" style="width:250px;"}</td>
    </tr>
    <tr>
        <td style='width: 50%;'>{form->caption name="file[description]" value="Описание"}</td>
        <td style='width: 50%;'>{form->textarea name="file[description]" style="width:250px;height:50px;" value=""}</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>{form->submit name="submit" value="Загрузить"} {form->reset name="reset" value="Отмена"}</td>
    </tr>
</table>
</form>