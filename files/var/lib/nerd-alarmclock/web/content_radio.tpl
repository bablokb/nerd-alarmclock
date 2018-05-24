<!--
# ----------------------------------------------------------------------------
# Webinterface for the nerd-alarmclock.
#
# This file defines the content area for the radio-configuration.
#
# Author: Bernhard Bablok, Benjamin Fuchs
# License: GPL3
#
# Website: https://github.com/bablokb/nerd-alarmclock
#
# ----------------------------------------------------------------------------
-->

<!-- helper scripts   --------------------------------------------------   -->

<script  type="text/javascript">
  function read_radio_settings() {
    $.ajax({
      url: "/radio/read"
    }).then(function(data) {
      for (var key in data) {
        var name = '#id_' + key.replace(/\./g,'_');
        $(name).val(data[key]);
      }
    });
  };

  function on_select_tab_radio() {
    console.error("on_select_tab_radio()");
    read_radio_settings();
  };
</script>

<!-- form for radio settings   -----------------------------------------   -->

<div id="id_content_radio" class="content">
  <form id="id_form_radio" method="post">
    <fieldset>

      <div class="">
        <label for="id_channel_list">Channel list</label>
        <!-- TODO: select-list for channel-lists -->
        <!-- TODO: implement on_channel_list_select() -->
        <select class="" id="id_channel_list"
                         on_select="on_channel_list_select()"></select>
      </div>

      <div class="">
        <label for="id_channels">Channels</label>
        <!-- TODO: select-list for channels -->
        <!-- TODO: implement on_channel_select() -->
        <select class="" id="id_channels"
                         on_select="on_channel_select()"></select>
      </div>

      <div class="">
        <label for="id_speaker_volume_day">Volume day</label>
        <input class="" id="id_speaker_volume_day"></input>
      </div>

      <div class="">
        <label for="id_speaker_volume_night">Volume night</label>
        <input class="" id="id_speaker_volume_night"></input>
      </div>

       <div class="">
         <button type="submit"
                class="">Save</button>
       </div>
    </fieldset>
  </form>
</div>

