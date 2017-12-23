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
