<form id="emoji-settings" class="form-horizontal">
  <div class="row">
    <div class="col-lg-9">
      <div class="panel panel-default">
        <div class="panel-heading">
          Emoji Extended Settings
        </div>

        <div class="panel-body">
          <div class="form-group">
            <label class="col-xs-12 col-sm-6 control-label">Amount of characters to show text-completion</label>
            <div class="col-xs-12 col-sm-6">
              <input class="form-control" type="number" data-key="completion.minChars" title="Minimum characters">
            </div>
          </div>

          <div class="form-group">
            <label class="col-xs-12 col-sm-6 control-label">Text-Completion entries</label>
            <div class="col-xs-12 col-sm-6">
              <input class="form-control" type="number" data-key="completion.maxCount" title="Maximum entries">
            </div>
          </div>

          <div class="form-group">
            <label class="col-xs-12 col-sm-6 control-label">Enable emoji-shortcuts like <code>:-)</code></label>
            <div class="col-xs-12 col-sm-6">
              <input type="checkbox" data-key="mapping.enabled" title="Enable Mapping">
            </div>
          </div>

          <div class="form-group">
            <label class="col-xs-12 col-sm-6 control-label">Zoom-size of emoji on hover (0 to disable)</label>
            <div class="col-xs-12 col-sm-6">
              <input class="form-control input-sm" type="number" max="512" data-key="zoom" title="Zoom-size (in px)">
            </div>
          </div>

          <div class="form-group">
            <label class="col-xs-12 col-sm-6 control-label">Regular Expression to show text-completion</label>
            <div class="col-xs-12 col-sm-6">
              <div class="input-group input-group-sm">
                <div class="input-group-addon">
                  <code class="text-right" style="border:none;box-shadow:none;">/^[\s\S]*(</code>
                </div>
                <input class="form-control" type="text" data-key="completion.prefix" title="RegExp prefix"
                       style="font-family:'Courier New',monospace;">
                <div class="input-group-addon">
                  <code style="border:none;box-shadow:none;">):/i</code>
                </div>
              </div>
            </div>
          </div>

          <div>
            <label class="col-xs-12 col-sm-6 control-label">
              Use Emoji Cheat Sheet Images
            </label>
            <div class="col-xs-12 col-sm-6">
              <input type="checkbox" data-key="fileSystemAccess" title="Emoji Cheat Sheet Images"><br />
              <small>
                Note: The Feature of custom images isn't implemented (yet).<br />
                By disabling above checkbox you ensure no automatic changes within the
                <i>node_modules/nodebb-plugin-emoji-extended/emoji/</i> directory.
                Therefor you may change the images located there and the !index.list file in order to setup your own
                images.<br />
                This will disable the categorization of emoji within the composer-dialog.</br >
                Take care not to update this plugin afterwards without a backup.
              </small>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3">
      <div class="panel panel-default">
        <div class="panel-heading">
          Action Panel
        </div>

        <div class="panel-body">
          <button type="button" class="btn btn-danger form-control" id="reset">
            <i class="fa fa-fw fa-history"></i> Reset Settings
          </button>
          <button type="button" class="btn btn-warning form-control" id="update">
            <i class="fa fa-fw fa-download"></i> Update Images
          </button>
          <button type="submit" class="btn btn-primary form-control" accesskey="s" id="save">
            <i class="fa fa-fw fa-save"></i> Save Settings
          </button>
        </div>
      </div>
    </div>
  </div>
</form>

<script>
  $('#update').click(function(event) {
    event.preventDefault();
    socket.emit('admin.settings.updateEmojiExtended');
  });
  require(['settings'], function(settings) {
    function settingsChanged () {
      var s = settings.get();
      if (s.fileSystemAccess) {
        $('#update').removeClass('disabled');
      } else {
        $('#update').addClass('disabled');
      }
    }
    var wrapper = $("#emoji-settings");
    settings.sync('emoji-extended', wrapper, settingsChanged);
    $('#save').click(function(event) {
      event.preventDefault();
      settings.persist('emoji-extended', wrapper, function() {
        socket.emit('admin.settings.syncEmojiExtended');
        settingsChanged();
      });
    });
    $('#reset').click(function(event) {
      event.preventDefault();
      socket.emit('admin.settings.getEmojiExtendedDefaults', null, function (err, data) {
        settings.set('emoji-extended', data, wrapper, function() {
          socket.emit('admin.settings.syncEmojiExtended');
          settingsChanged();
        });
      });
    });
  });
</script>
