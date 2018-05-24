<!--
# ----------------------------------------------------------------------------
# Webinterface for the nerd-alarmclock.
#
# This file defines the content area for the alarm-configuration.
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

  // add event-listeners
  $(document).ready(function() {
    $('#id_alarm_state').on('click',on_toggle_alarm_state);
  });

  // read alarm-data from server
  function read_alarm_settings() {
    $.ajax({
      url: "/alarms/read"
    }).then(function(data) {
      console.error("data: ",data);
      nclock.alarms = data;
      on_alarm_nr_select();
    });
  };

  // hook to run when tab is selected
  function on_select_tab_alarm() {
    console.error("on_select_tab_alarm()");
    if (!nclock.hasOwnProperty("alarms")) {
      nclock.alarm_nr = 1;
      read_alarm_settings();
    } else {
      on_alarm_nr_select();
    }
  };

  // set value of an element
  // TODO: support checkbox, radiobox, select
  function set_value(data,prefix='') {
    for (var key in data) {
      var name = (prefix ? prefix+'_':'') + key.replace(/\./g,'_');
      var value = data[key];
      if (typeof value === 'object') {
        set_value(value,name);            // recurse
      } else {
        $('#id_'+name).val(data[key]);    // set value directly
      }
    }
  };

  // event-handler if alarm-number changes
  function on_alarm_nr_select(event) {
    if (event) {
      console.error("event:", event);
      // nclock.alarm_nr = ... ;
    }
    // update values in form
    var data = nclock.alarms[nclock.alarm_nr-1];
    set_value(data);
  };

  // event-handler to change alarm-state
  function on_toggle_alarm_state(event) {
    console.error("event:", event);
    if ($(event.target).val() === 'enabled') {
      $(event.target).val('disabled');
      $(event.target).removeClass("w3-border-blue w3-text-blue");
      $(event.target).addClass("w3-border-red w3-text-red");
    } else {
      $(event.target).val('enabled');
      $(event.target).addClass("w3-border-blue w3-text-blue");
      $(event.target).removeClass("w3-border-red w3-text-red");
    }
  };
</script>

<!-- form for alarm settings   -----------------------------------------   -->

<div id="id_content_alarm" class="content">
  <form id="id_form_alarm" method="post"
        class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
    <fieldset>

      <!-- alarm-selection ----------------------------------------------- -->
      <div class="w3-row-padding w3-section">
        <label for="id_alarm_nr" class="w3-col l1">Nr</label>
        <!-- TODO: implement on_alarm_nr_select() -->
        <select class="w3-select w3-col l1" id="id_alarm_nr"
                onselect="on_alarm_nr_select()"></select>
        <label for="id_alarm_name" class="w3-col l1">Name</label>
        <input class="w3-input w3-col l4" id="id_alarm_name" type="text"/>
      </div>

      <!-- state --------------------------------------------------------- -->
      <div class="w3-row-padding w3-section">
        <label for="id_alarm_state" class="w3-col l1">State</label>
        <input id="id_alarm_state"
               class="w3-col l1 w3-button w3-round-xxlarge
               w3-border w3-border-blue"
               type="button" value="enabled" name="alarm_state"/>
      </div>

      <!-- time ---------------------------------------------------------- -->
      <div class="">
        <label for="id_alarm_time" class="w3-col l1">Time</label>
        <input class="w3-input" id="id_alarm_time" type="time"/>
      </div>

      <!-- snooze -------------------------------------------------------- -->
      <div class="">
        <label for="id_alarm_snooze" class="w3-col l1">Snooze</label>
        <input class="w3-input" id="id_alarm_snooze" type="time"/>
      </div>

      <!-- days ---------------------------------------------------------- -->
      <div class="">
        <label for="id_alarm_days" class="w3-col l1">Days</label>
        <!-- TODO: fill select for days -->
        <select class="w3-select" id="id_alarm_days"></select>
      </div>

      <!-- LED (name, duration, delay) ----------------------------------- -->
      <fieldset>
        <legend>LED-Alarm</legend>
        <div class="">
          <label for="id_alarm_led_name" class="w3-col l1">Name</label>
          <!-- TODO: fill select for alarm-LED -->
          <select class="w3-select" id="id_alarm_led_name"></select>
        </div>
        <div class="">
          <label for="id_alarm_led_duration" class="w3-col l1">Duration</label>
          <input class="w3-input" id="id_alarm_led_duration" type="time"/>
        </div>
        <div class="">
          <label for="id_alarm_led_delay" class="w3-col l1">Delay</label>
          <input class="w3-input" id="id_alarm_led_delay" type="time"/>
        </div>
      </fieldset>

      <!-- display (name, text, duration, delay) ------------------------- -->
      <fieldset>
        <legend>Display-Alarm</legend>
        <div class="">
          <label for="id_alarm_display_name" class="w3-col l1">Name</label>
          <!-- TODO: fill select for alarm-DISPLAY -->
          <select class="w3-select" id="id_alarm_display_name"></select>
        </div>
        <div class="">
          <label for="id_alarm_display_text" class="w3-col l1">Text</label>
          <input class="w3-input" id="id_alarm_display_text"/>
        </div>
        <div class="">
          <label for="id_alarm_display_duration" class="w3-col l1">Duration</label>
          <input class="w3-input" id="id_alarm_display_duration" type="time"/>
        </div>
        <div class="">
          <label for="id_alarm_display_delay" class="w3-col l1">Delay</label>
          <input class="w3-input" id="id_alarm_display_delay" type="time"/>
        </div>
      </fieldset>

      <!-- sound (name, duration, delay, volume) ------------------------- -->
      <fieldset>
        <legend>Sound-Alarm</legend>
        <div class="">
          <label for="id_alarm_sound_name" class="w3-col l1">Name</label>
          <!-- TODO: fill select for alarm-SOUND -->
          <select class="w3-select" id="id_alarm_sound_name"></select>
        </div>
        <div class="">
          <label for="id_alarm_sound_duration" class="w3-col l1">Duration</label>
          <input class="w3-input" id="id_alarm_sound_duration" type="time"/>
        </div>
        <div class="">
          <label for="id_alarm_sound_delay" class="w3-col l1">Delay</label>
          <input class="w3-input" id="id_alarm_sound_delay" type="time"/>
        </div>
        <div class="">
          <label for="id_alarm_sound_fadein" class="w3-col l1">Fadein</label>
          <input class="w3-input" id="id_alarm_sound_fadein" type="time"/>
        </div>
        <div class="">
          <label for="id_alarm_sound_volume" class="w3-col l1">Volume</label>
          <input class="w3-input" id="id_alarm_sound_volume"/>
        </div>
      </fieldset>

       <div class="">
         <button type="submit"
                class="">Save</button>
       </div>
    </fieldset>
  </form>
</div>

<!--

<div id="content_alarm" class="content">
  <div class="list">
      <input class="time-light" id="alarm_time" type="time" onblur="saveSettings()"/>
    <li class="list-item">
      <input class="tgl tgl-light" id="alarm_state" type="checkbox" onclick="saveSettings()"/>
      <label class="tgl-btn" for="alarm_state"></label>
    </li>
  </div>
  <div class="list">
    <li class="list-item">
      <input class="tgl tgl-dow" id="monday" type="checkbox" onclick="saveSettings()"/>
      <label class="tgl-btn" data-tg="M" for="monday"></label>
    </li>
    <li class="list-item">
      <input class="tgl tgl-dow" id="tuesday" type="checkbox" onclick="saveSettings()"/>
      <label class="tgl-btn" data-tg="T" for="tuesday"></label>
    </li>
    <li class="list-item">
      <input class="tgl tgl-dow" id="wednesday" type="checkbox" onclick="saveSettings()"/>
      <label class="tgl-btn" data-tg="W" for="wednesday"></label>
    </li>
    <li class="list-item">
      <input class="tgl tgl-dow" id="thursday" type="checkbox" onclick="saveSettings()"/>
      <label class="tgl-btn" data-tg="T" for="thursday"></label>
    </li>
    <li class="list-item">
      <input class="tgl tgl-dow" id="friday" type="checkbox" onclick="saveSettings()"/>
      <label class="tgl-btn" data-tg="F" for="friday"></label>
    </li>
    <li class="list-item">
      <input class="tgl tgl-dow" id="saturday" type="checkbox" onclick="saveSettings()"/>
      <label class="tgl-btn" data-tg="S" for="saturday"></label>
    </li>
    <li class="list-item">
      <input class="tgl tgl-dow" id="sunday" type="checkbox" onclick="saveSettings()"/>
      <label class="tgl-btn" data-tg="S" for="sunday"></label>
    </li>
  </div>
  <div class="list">
    <li class="list-item">
      <img style="width:2em; height:2em;"  src="/pic/alarm.png" alt="Alarm Clock">
    </li>
    <li class="list-item"
    <div class="dropdown">
      <select class="dropbtn" id="select_sound" onblur="saveSettings()"></select>
    </div>
    </li>
  </div>
</div>

-->