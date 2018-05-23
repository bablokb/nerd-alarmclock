<!--
# ----------------------------------------------------------------------------
# Webinterface for the nerd-clock.
#
# This file defines the navigation-menu
#
# Author: Bernhard Bablok
# License: GPL3
#
# Website: https://github.com/bablokb/nerd-alarmclock
#
# ----------------------------------------------------------------------------
-->

<!-- helper scripts   ------------------------------------------------   -->

<script  type="text/javascript">
  var selected_tab = null;
  function openTab(button,tabName) {

    $(".tab").css("display","none");          // hide all tabs ...
    $(tabName).css("display","block");        // and show selected tab
    $(".detail").removeClass("w3-blue-gray"); // reset button color
    $(button).addClass("w3-blue-gray");       // active button is different
    selected_tab = button;

    // execute load-hook (remove #id_)
    hookFunc = "on_select_"+tabName.substring(4);
    this[hookFunc]();
  };

  function openDefaultTab() {
    if (!selected_tab) {
      // select alarm-tab as default
      $("#id_btn_alarm").click();
    }
  };

  $(document).ready(function() {
    openDefaultTab();
  });
</script>

<!-- the menu   ------------------------------------------------------   -->

<div id="id_bar_menu" class="w3-bar w3-border w3-card-4 w3-blue">
  <button id="id_btn_global" class="detail w3-bar-item w3-button"
          onclick="openTab(this,'#id_tab_global')">Global</button>
  <button id="id_btn_alarm" class="detail w3-bar-item w3-button"
          onclick="openTab(this,'#id_tab_alarm')">Alarm</button>
  <button id="id_btn_radio" class="detail w3-bar-item w3-button"
          onclick="openTab(this,'#id_tab_radio')">Radio</button>

  <a id="id_btn_reboot" href="#" class="w3-bar-item w3-button w3-border-right
                 w3-mobile" onclick="doReboot()">Reboot</a>
  <a id="id_btn_shutdown" href="#" class="w3-bar-item w3-button w3-border-right
                 w3-mobile" onclick="doShutdown()">Shutdown</a>

  <a id="id_btn_project" href="https://github.com/bablokb/nerd-alarmclock"
                     target="_blank"
                     class="w3-bar-item w3-button w3-border-right
                            w3-mobile w3-light-blue">Project</a>
  <a id="id_btn_author" href="#" class="w3-bar-item w3-button w3-border-right
                w3-mobile w3-light-blue" onclick="onAuthor()">Author</a>
  <a id="id_btn_icense" href="#" class="w3-bar-item w3-button w3-border-right
                w3-mobile w3-light-blue" onclick="onLicense()">License</a>
  <div id="id_ msgarea" class="w3-bar-item w3-margin-left"></div>
</div>

<!-- content-area   --------------------------------------------------   -->

<div id="id_content" class="content">
  <div id="id_tab_global" class="tab" style="display:none">
    %include('content_global.tpl')
  </div>
  <div id="id_tab_alarm" class="tab" style="display:none">
    %include('content_alarm.tpl')
  </div>
  <div id="id_tab_radio" class="tab" style="display:none">
    %include('content_radio.tpl')
  </div>
</div>
