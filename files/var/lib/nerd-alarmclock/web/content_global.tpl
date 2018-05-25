<!--
# ----------------------------------------------------------------------------
# Webinterface for the nerd-alarmclock.
#
# This file defines the content area for the configuration of global settings.
#
# Author: Bernhard Bablok
# License: GPL3
#
# Website: https://github.com/bablokb/nerd-alarmclock
#
# ----------------------------------------------------------------------------
-->

<!-- helper scripts   --------------------------------------------------   -->

<script  type="text/javascript">
  function read_global_settings() {
    $.ajax({
      url: "/globals/read"
    }).then(function(data) {
      for (var key in data) {
        var name = '#id_' + key.replace(/\./g,'_');
        $(name).val(data[key]);
      }
    });
  };

  // fill list of options
  // TODO: move to generic functions module
  function fill_list(data,element,func) {
    data.forEach(function(opt,index) {
      $(this).append($("<option/>", {
        value: index,
        text:  func ? func(opt) : opt
      }));
    },element);
  };

  // fill select-tag with options (triggered from main.tpl)
  function global_fill_lists(data) {
    fill_list(data.led_modes,$('#id_led_mode'));
    fill_list(data.display_modes,$('#id_display_mode'));
  };

  // hook function for tab-selection
  function on_select_tab_global() {
    console.error("on_select_tab_global()");
    read_global_settings();
  };
</script>

<!-- form for global settings   ----------------------------------------   -->

<div id="id_content_global" class="content">
  <form id="id_form_global" method="post">
    <fieldset>

      <div class="">
        <label for="id_day_start">Day start</label>
        <input class="" id="id_day_start" type="time"></input>
      </div>

      <div class="">
        <label for="id_day_end">Day end</label>
        <input class="" id="id_day_end" type="time"></input>
      </div>

      <!-- display-settings   ------------------------------------------- -->

      <div class="">
        <label for="id_display_mode">Display mode</label>
        <select class="" id="id_display_mode"></select>
      </div>

      <div class="">
        <label for="id_display_brightness_day">Brightness day</label>
        <input class="" id="id_display_brightness_day"></input>
      </div>

      <div class="">
        <label for="id_display_brightness_night">Brightness night</label>
        <input class="" id="id_display_brightness_night"></input>
      </div>

      <!-- LED-settings   --------------------------------------------- -->

      <div class="">
        <label for="id_led_mode">LED mode</label>
        <select class="" id="id_led_mode"></select>
      </div>

      <div class="">
        <label for="id_led_brightness_day">Brightness day</label>
        <input class="" id="id_led_brightness_day"></input>
      </div>

      <div class="">
        <label for="id_led_brightness_night">Brightness night</label>
        <input class="" id="id_led_brightness_night"></input>
      </div>

      <!-- lamp-settings   ------------------------------------------- -->

      <div class="">
        <label for="id_led_lamp_rgb">LED-lamp RGB</label>
         <!-- TODO: color-picker -->
        <input class="" id="id_led_lamp_rgb"></input>
      </div>

      <div class="">
        <label for="id_led_lamp_brightness">LED-lamp brightness</label>
        <input class="" id="id_led_lamp_brightness"></input>
      </div>

       <div class="">
         <button type="submit"
                class="">Save</button>
       </div>
    </fieldset>
  </form>
</div>

