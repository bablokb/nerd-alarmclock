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
      // TODO: nclock.lists might not be available at this point
      index = data.hasOwnProperty("radio.current.list") ?
                nclock.lists.channel_lists.findIndex(function(name) {
                   return name === data["radio.current.list"];
                }) : 0;
      fill_list(nclock.lists.channels[index],$('#id_channels'),
                             function(element) {return element.name;}
                );
      for (var key in data) {
        var name = '#id_' + key.replace(/\./g,'_');
        $(name).val(data[key]);
      }
    });
  };

  // fill select-tag with options (triggered from main.tpl)
  function radio_fill_lists(data) {
    fill_list(data.channel_lists,$('#id_channel_lists'));
  };

  // hook to run when tab is selected
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
        <!-- TODO: implement on_channel_lists_select() -->
        <select class="" id="id_channel_lists"></select>
      </div>

      <div class="">
        <label for="id_channels">Channels</label>
        <select class="" id="id_channels"></select>
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

