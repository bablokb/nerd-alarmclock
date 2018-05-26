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

