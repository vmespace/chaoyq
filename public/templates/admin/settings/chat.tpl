<div class="settings">
	<div class="row">
		<div class="col-sm-2 col-xs-12 content-header">
			Contents
		</div>
		<div class="col-sm-10 col-xs-12">
			<nav class="section-content">
				<ul></ul>
			</nav>
		</div>
	</div>


<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Chat Settings</div>
	<div class="col-sm-10 col-xs-12">
		<div class="form-group">
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" id="showSiteTitle" data-field="disableChat">
					<span class="mdl-switch__label"><strong>Disable chat</strong></span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<strong>Chat Message Inbox Size</strong><br /> <input type="text" class="form-control" value="250" data-field="chatMessageInboxSize">
		</div>

		<div class="form-group">
			<label>Maximum length of chat messages</label>
			<input type="text" class="form-control" value="1000" data-field="maximumChatMessageLength">
		</div>
	</div>
</div>

</div>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">save</i>
</button>

<script>
	require(['admin/settings'], function(Settings) {
		Settings.init();
		Settings.populateTOC();
	});
</script>
