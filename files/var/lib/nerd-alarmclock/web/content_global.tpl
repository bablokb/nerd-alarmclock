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
      nclock.globals = data;
      set_value(data);
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
    read_global_settings();
  };
</script>

<!-- form for global settings   ----------------------------------------   -->

<div id="id_content_global" class="content">
  <form id="id_form_global" method="post"
         class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
    <fieldset class="">
      <legend>Day/Night</legend>
      <div class="w3-row-padding w3-section">
        <label for="id_day_start" class="w3-col l1">Day start</label>
        <input class="w3-input w3-col l1" id="id_day_start" type="time"></input>
      </div>

      <div class="w3-row-padding w3-section">
        <label for="id_day_end" class="w3-col l1">Day end</label>
        <input class="w3-input w3-col l1" id="id_day_end" type="time"></input>
      </div>
    </fieldset>

    <!-- display-settings   --------------------------------------------- -->

    <fieldset>
      <legend>Display</legend>
      <div class="w3-row-padding w3-section">
        <label for="id_display_mode" class="w3-col l1">Display mode</label>
        <select class="w3-select w3-col l1" id="id_display_mode"></select>
      </div>

      <div class="w3-row-padding w3-section">
        <label for="id_display_brightness_day" class="w3-col l1">Brightness day</label>
        <input class="w3-input w3-col l1" id="id_display_brightness_day"></input>
      </div>

      <div class="w3-row-padding w3-section">
        <label for="id_display_brightness_night" class="w3-col l1">Brightness night</label>
        <input class="w3-input w3-col l1" id="id_display_brightness_night"></input>
      </div>
    </fieldset>

    <!-- LED-settings   ----------------------------------------------- -->

    <fieldset>
      <legend>LED</legend>
      <div class="w3-row-padding w3-section">
        <label for="id_led_mode" class="w3-col l1">LED mode</label>
        <select class="w3-select w3-col l1" id="id_led_mode"></select>
      </div>

      <div class="w3-row-padding w3-section">
        <label for="id_led_brightness_day" class="w3-col l1">Brightness day</label>
        <input class="w3-input w3-col l1" id="id_led_brightness_day"></input>
      </div>

      <div class="w3-row-padding w3-section">
        <label for="id_led_brightness_night" class="w3-col l1">Brightness night</label>
        <input class="w3-input w3-col l1" id="id_led_brightness_night"></input>
      </div>
    </fieldset>

    <!-- lamp-settings   --------------------------------------------- -->

    <fieldset>
      <legend>Lamp</legend>
      <div class="w3-row-padding w3-section">
        <label for="id_led_lamp_rgb" class="w3-col l1">LED-lamp RGB</label>
        <input type="color" class="w3-input w3-col l1" id="id_led_lamp_rgb"></input>
      </div>

      <div class="w3-row-padding w3-section">
        <label for="id_led_lamp_brightness" class="w3-col l1">LED-lamp brightness</label>
        <input class="w3-input w3-col l1" id="id_led_lamp_brightness"></input>
      </div>
    </fieldset>

    <div class="w3-section padding-top">
      <button type="submit" class="w3-button w3-round-xxlarge
               w3-border w3-border-blue">Save</button>
    </div>
  </form>
</div>

