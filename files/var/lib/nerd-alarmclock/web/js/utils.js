// ---------------------------------------------------------------------------
// Webinterface for the Nerd-Alarmclock.
//
// This file contains some generic support functions.
//
// Author: Bernhard Bablok
// License: GPL3
//
// Website: https://github.com/bablokb/nerd-alarmclock
//
// ---------------------------------------------------------------------------

// --- add options to a select-tag   -----------------------------------------

function fill_list(data,element,func) {
  data.forEach(function(opt,index) {
    $(this).append($("<option/>", {
      value: index,
      text:  func ? func(opt) : opt
    }));
  },element);
};

// --- set value of an element   ---------------------------------------------

// TODO: support checkbox, radiobox, select
function set_value(data,prefix='') {
  for (var key in data) {
    var name = (prefix ? prefix+'_':'') + key.replace(/\./g,'_');
    var value = data[key];
    if (typeof value === 'object' && !$.isArray(value)) {
      set_value(value,name);            // recurse
    } else {
      var id = '#id_'+name;
      var node_type = $(id).prop('nodeName');
      if (node_type === 'SELECT') {
         $(id+' option').filter(function() {
           return $(this).text() == value;
         }).prop("selected", true);
      } else if (node_type === 'INPUT') {
        var input_type = $(id).attr('type');
        if (input_type === 'time') {
          if (!value.includes(':')) {
            value = pad(~~(value/60)) + ':' + pad(value%60);
          }
          $(id).val(value);
        } else if (input_type === 'color') {
          $(id).val(rgbToHex(value));
        } else if (input_type === 'checkbox') {
          // this is rather specific :-(
          if (value === 'enabled') {
            $(id).prop('checked',true);
          } else {
            $(id).prop('checked',false);
          }
        } else {
          $(id).val(value);    // set value directly
        }
      }
    }
  }
};

// --- convert RGB-array to hex-notation   -----------------------------------

function rgbToHex(value) {
  var r = value[0]
  var g = value[1]
  var b = value[2]
  return "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
}

// --- convert hex-notation of color to RGB-array   --------------------------

function hexToRgb(value) {
  var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(value);
  return result ? [
    parseInt(result[1], 16),
    parseInt(result[2], 16),
    parseInt(result[3], 16)
                   ] : [0,0,0];
}

// --- pad time values   ----------------------------------------------------

function pad(num) {
  var s = "00" + num;
  return s.substr(s.length-2);
}
