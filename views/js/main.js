function ajaxlogin() {
  var login = document.getElementById("login");
  var pass = document.getElementById("pass");
  var button = document.getElementById("ajaxlogin");
  var error = document.querySelector(".error");
  var ajax = jQuery.ajax({
    async: true,
    type: "POST",
    data: {
      login: login.value,
      pass: pass.value,
      method: "ajaxlogin",
    },
    url: "/ajax",
    dataType: "json",
    success: function (data) {
      if (data.info == "success") {
        window.location.href = "/";
      } else {
        error.innerHTML = "На этом сайте таких не знают";
      }
    },
    error: function (errorThrown) {
      console.log(errorThrown);
    },
  });
}

function ajaxlogout() {
  var button = document.getElementById("ajaxlogin");
  var error = document.querySelector(".error");
  var ajax = jQuery.ajax({
    async: true,
    type: "POST",
    data: {
      method: "ajaxlogout",
    },
    url: "/ajax",
    dataType: "json",
    success: function (data) {
      if (data.info == "success") {
        window.location.href = "/";
      }
    },
    error: function (errorThrown) {
      console.log(errorThrown);
    },
  });
}

function ajaxaddlink() {
  var url = document.getElementById("link_url");
  var pbutton = document.getElementById("ajaxaddlink");
  var perror = document.querySelector(".post .error");
  var ajax = jQuery.ajax({
    async: true,
    type: "POST",
    data: {
      url: url.value,
      method: "ajaxaddlink",
    },
    url: "/ajax",
    dataType: "json",
    success: function (data) {
      if (data.info == "success") {
        perror.innerHTML =
          'ваша ссылка: <a href="' + data.data + '">' + data.data + "</a>";
      } else {
        perror.innerHTML = "ошибка: " + data.info;
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log(textStatus + " " + errorThrown);
      console.warn(jqXHR.responseText);
      perror.innerHTML = "ошибка: Неизвестная ошибка";
    },
  });
}
