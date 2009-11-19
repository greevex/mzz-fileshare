<ul>
{foreach from=$allfiles item="file"}
 <li>
  <ul>
   <li>{$file->getTitle()}</li>
   <li>{$file->getDescription()}</li>
   <li>----------------------------</li>
  </ul>
 </li>
{/foreach}
</ul>