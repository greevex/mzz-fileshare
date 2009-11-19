{* main="header.tpl" placeholder="content" *}
{load module="user" action="login" module="user" onlyForm=true _side="left"}
<!-- header -->
<div id="header">
<span id="siteTitle">Файлообменник</span>
</div>
<!-- middle content -->
<div id="middleline">
	<div id="navMenu">
	  {load module="menu" action="view" name="hmenu" tplPrefix="side/"}
	</div>
	<div id="content">
	<div{if false && $current_section != 'gallery' && $current_section != 'forum'} id="leftMainCol"{/if}>
		<div id="container">
			<!-- center column -->
			<div id="col2">
				{$content}
				<div class="clear"></div>
			</div>
		</div>
	</div>
	{if false && $current_section != 'gallery' && $current_section != 'forum'}
	<!-- right column -->
	<div id="col3">

	</div>
	{/if}
</div>
<!-- footer -->
<div id="footer">
	<p id="legal1">{$smarty.const.MZZ_NAME} v.{$smarty.const.MZZ_VERSION}-{$smarty.const.MZZ_REVISION} &copy; {"Y"|date}.
{$timer->toString()}</p><p id="legal2">Webmaster <a href="http://greevex.ru">GreeveX</a></p>
</div>