
{form action=$form_action enctype="multipart/form-data" method="post"}
<table width="100%" border="0" cellpadding="5" cellspacing="0">
	<tr>
        <td style='width: 15%;'>{form->caption name="uploadfile" value="Выберите фотографию"}</td>
        <td style='width: 85%;'>{form->file name="uploadfile" style="width:250px;"}</td>
    </tr>
    <tr>
        <td style='width: 15%;'>{form->caption name="file[title]" value="Название"}</td>
        <td style='width: 85%;'>{form->text name="file[title]" value="" style="width:250px;"}</td>
    </tr>
    <tr>
        <td style='width: 15%;'>{form->caption name="file[description]" value="Описание"}</td>
        <td style='width: 85%;'>{form->textarea name="file[description]" style="width:250px;height:50px;" value=""}</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>{form->submit name="submit" value="Загрузить"} {form->reset name="reset" value="Отмена"}</td>
    </tr>
</table>
</form>