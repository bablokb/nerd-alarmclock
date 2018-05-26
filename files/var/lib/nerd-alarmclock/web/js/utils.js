// ---------------------------------------------------------------------------
// Webinterface for the Nerd-Alarmclock.

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
    if (typeof value === 'object') {
      set_value(value,name);            // recurse
    } else {
      var id = '#id_'+name;
      var node_type = $(id).prop('nodeName');
      if (node_type === 'select') {
        $(id).find('option[text="'+value+'"]').attr('selected', 'selected');
      } else if (node_type === 'input') {
        var input_type = $(id).attr('type');
        if (input_type === 'text') {
          $(id).val(data[key]);    // set value directly
        }
      }
    }
  }
};
