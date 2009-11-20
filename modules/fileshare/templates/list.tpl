<ul>
{foreach from=$allfiles item="file"}
 <li>
  <a href="{$file->getFileId()->getDownloadLink()}">{$file->getFormat()} | {$file->getDescription()} | Скачали: {$file->getFileid()->getDownloads()}</a>
 </li>
{/foreach}
</ul>