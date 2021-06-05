// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require moment
//= require fullcalendar

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


document.addEventListener("turbolinks:load", function() {
  var calendarEl = document.getElementById('calendar')
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prev today',
      center: 'title',
      right: 'next'
    },
    initialDate: '2020-12-01',
    navLinks: false,
    businessHours: true,
    editable: true,
    locale: 'ja',
    dateClick: function(info) {
      info.jsEvent.preventDefault(); // don't let the browser navigate
      window.location.href = '/schedule_detail?date=' + info.dateStr;
    }
  });
  calendar.render()
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()