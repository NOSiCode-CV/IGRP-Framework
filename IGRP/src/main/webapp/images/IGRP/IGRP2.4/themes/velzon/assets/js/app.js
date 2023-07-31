!(function () {
  var a,
    o,
    s,
    d,
    t,
    n,
    e,
    i,
    l,
    r,
    m,
    c,
    u = document.querySelector(".navbar-menu")?.innerHTML,
    g = 7,
    b = "en",
    y = localStorage.getItem("language");
  function p(e) {
    document.getElementById("header-lang-img") &&
      ("en" == e
        ? (document.getElementById("header-lang-img").src =
            theme_path + "/assets/images/flags/us.svg")
        : "sp" == e
        ? (document.getElementById("header-lang-img").src =
            theme_path + "/assets/images/flags/spain.svg")
        : "gr" == e
        ? (document.getElementById("header-lang-img").src =
            theme_path + "/assets/images/flags/germany.svg")
        : "it" == e
        ? (document.getElementById("header-lang-img").src =
            theme_path + "/assets/images/flags/italy.svg")
        : "ru" == e
        ? (document.getElementById("header-lang-img").src =
            theme_path + "/assets/images/flags/russia.svg")
        : "ch" == e
        ? (document.getElementById("header-lang-img").src =
            theme_path + "/assets/images/flags/china.svg")
        : "fr" == e &&
          (document.getElementById("header-lang-img").src =
            theme_path + "/assets/images/flags/french.svg"),
      localStorage.setItem("language", e),
      null == (y = localStorage.getItem("language")) && p(b),
      (e = new XMLHttpRequest()).open(
        "GET",
        theme_path+ "/assets/lang/" + y + ".json"
      ),
      (e.onreadystatechange = function () {
        var a;
        4 === this.readyState &&
          200 === this.status &&
          ((a = JSON.parse(this.responseText)),
          Object.keys(a).forEach(function (t) {
            var e = document.querySelectorAll("[data-key='" + t + "']");
            Array.from(e).forEach(function (e) {
              e.textContent = a[t];
            });
          }));
      }),
      e.send());
  }
  function E() {
    var e;
    document.querySelectorAll(".navbar-nav .collapse") &&
      ((e = document.querySelectorAll(".navbar-nav .collapse")),
      Array.from(e).forEach(function (t) {
        var a = new bootstrap.Collapse(t, {toggle: !1});
        t.addEventListener("show.bs.collapse", function (e) {
          e.stopPropagation();
          var e = t.parentElement.closest(".collapse");
          e
            ? ((e = e.querySelectorAll(".collapse")),
              Array.from(e).forEach(function (e) {
                e = bootstrap.Collapse.getInstance(e);
                e !== a && e.hide();
              }))
            : ((e = (function (e) {
                for (var t = [], a = e.parentNode.firstChild; a; )
                  1 === a.nodeType && a !== e && t.push(a), (a = a.nextSibling);
                return t;
              })(t.parentElement)),
              Array.from(e).forEach(function (e) {
                2 < e.childNodes.length &&
                  e.firstElementChild.setAttribute("aria-expanded", "false");
                e = e.querySelectorAll("*[id]");
                Array.from(e).forEach(function (e) {
                  e.classList.remove("show"),
                    2 < e.childNodes.length &&
                      ((e = e.querySelectorAll("ul li a")),
                      Array.from(e).forEach(function (e) {
                        e.hasAttribute("aria-expanded") &&
                          e.setAttribute("aria-expanded", "false");
                      }));
                });
              }));
        }),
          t.addEventListener("hide.bs.collapse", function (e) {
            e.stopPropagation();
            e = t.querySelectorAll(".collapse");
            Array.from(e).forEach(function (e) {
              (childCollapseInstance =
                bootstrap.Collapse.getInstance(e)).hide();
            });
          });
      }));
  }
  function f() {
    var o,
      e = document.documentElement.getAttribute("data-layout"),
      t = sessionStorage.getItem("defaultAttribute"),
      t = JSON.parse(t);
    !t ||
      ("twocolumn" != e && "twocolumn" != t["data-layout"]) ||
      ((document.querySelector(".navbar-menu").innerHTML = u),
      ((o = document.createElement("ul")).innerHTML =
        '<a href="#" class="logo"><img src="'+theme_path+'"assets/images/logo-sm.png" alt="" height="22"></a>'),
      Array.from(
        document.getElementById("navbar-nav").querySelectorAll(".menu-link")
      ).forEach(function (e) {
        o.className = "twocolumn-iconview";
        var t = document.createElement("li"),
          a = e;
        a.querySelectorAll("span").forEach(function (e) {
          e.classList.add("d-none");
        }),
          e.parentElement.classList.contains("twocolumn-item-show") &&
            e.classList.add("active"),
          t.appendChild(a),
          o.appendChild(t),
          a.classList.contains("nav-link") &&
            a.classList.replace("nav-link", "nav-icon"),
          a.classList.remove("collapsed", "menu-link");
      }),
      (e = (e =
        "/" == location.pathname
          ? "index.html"
          : location.pathname.substring(1)).substring(
        e.lastIndexOf("/") + 1
      )) &&
        (t = document
          .getElementById("navbar-nav")
          .querySelector('[href="' + e + '"]')) &&
        (e = t.closest(".collapse.menu-dropdown")) &&
        (e.classList.add("show"),
        e.parentElement.children[0].classList.add("active"),
        e.parentElement.children[0].setAttribute("aria-expanded", "true"),
        e.parentElement.closest(".collapse.menu-dropdown") &&
          (e.parentElement.closest(".collapse").classList.add("show"),
          e.parentElement.closest(".collapse").previousElementSibling &&
            e.parentElement
              .closest(".collapse")
              .previousElementSibling.classList.add("active"),
          e.parentElement.parentElement.parentElement.parentElement.closest(
            ".collapse.menu-dropdown"
          ) &&
            (e.parentElement.parentElement.parentElement.parentElement
              .closest(".collapse")
              .classList.add("show"),
            e.parentElement.parentElement.parentElement.parentElement.closest(
              ".collapse"
            ).previousElementSibling &&
              e.parentElement.parentElement.parentElement.parentElement
                .closest(".collapse")
                .previousElementSibling.classList.add("active")))),
      (document.getElementById("two-column-menu").innerHTML = o.outerHTML),
      Array.from(
        document.querySelector("#two-column-menu ul").querySelectorAll("li a")
      ).forEach(function (a) {
        var o = (o =
          "/" == location.pathname
            ? "index.html"
            : location.pathname.substring(1)).substring(o.lastIndexOf("/") + 1);
        a.addEventListener("click", function (e) {
          var t;
          (o != "/" + a.getAttribute("href") ||
            a.getAttribute("data-bs-toggle")) &&
            document.body.classList.contains("twocolumn-panel") &&
            document.body.classList.remove("twocolumn-panel"),
            document
              .getElementById("navbar-nav")
              .classList.remove("twocolumn-nav-hide"),
            document.querySelector(".hamburger-icon").classList.remove("open"),
            ((e.target && e.target.matches("a.nav-icon")) ||
              (e.target && e.target.matches("i"))) &&
              (null !==
                document.querySelector(
                  "#two-column-menu ul .nav-icon.active"
                ) &&
                document
                  .querySelector("#two-column-menu ul .nav-icon.active")
                  .classList.remove("active"),
              (e.target.matches("i")
                ? e.target.closest("a")
                : e.target
              ).classList.add("active"),
              0 <
                (t = document.getElementsByClassName("twocolumn-item-show"))
                  .length && t[0].classList.remove("twocolumn-item-show"),
              (t = (e.target.matches("i") ? e.target.closest("a") : e.target)
                .getAttribute("href")
                .slice(1)),
              document.getElementById(t) &&
                document
                  .getElementById(t)
                  .parentElement.classList.add("twocolumn-item-show"));
        }),
          o != "/" + a.getAttribute("href") ||
            a.getAttribute("data-bs-toggle") ||
            (a.classList.add("active"),
            document
              .getElementById("navbar-nav")
              .classList.add("twocolumn-nav-hide"),
            document.querySelector(".hamburger-icon") &&
              document.querySelector(".hamburger-icon").classList.add("open"));
      }),
      "horizontal" !== document.documentElement.getAttribute("data-layout") &&
        ((t = new SimpleBar(document.getElementById("navbar-nav"))) &&
          t.getContentElement(),
        (e = new SimpleBar(
          document.getElementsByClassName("twocolumn-iconview")[0]
        )) && e.getContentElement()));
  }
  function h(e) {
    if (e) {
      var t = e.offsetTop,
        a = e.offsetLeft,
        o = e.offsetWidth,
        n = e.offsetHeight;
      if (e.offsetParent)
        for (; e.offsetParent; )
          (t += (e = e.offsetParent).offsetTop), (a += e.offsetLeft);
      return (
        t >= window.pageYOffset &&
        a >= window.pageXOffset &&
        t + n <= window.pageYOffset + window.innerHeight &&
        a + o <= window.pageXOffset + window.innerWidth
      );
    }
  }
  function v() {
    "vertical" == document.documentElement.getAttribute("data-layout") &&
      ((document.getElementById("two-column-menu").innerHTML = ""),
      (document.querySelector(".navbar-menu").innerHTML = u),
      document.getElementById("scrollbar").setAttribute("data-simplebar", ""),
      document.getElementById("navbar-nav").setAttribute("data-simplebar", ""),
      document.getElementById("scrollbar").classList.add("h-100")),
      "twocolumn" == document.documentElement.getAttribute("data-layout") &&
        (document.getElementById("scrollbar").removeAttribute("data-simplebar"),
        document.getElementById("scrollbar").classList.remove("h-100")),
      "horizontal" == document.documentElement.getAttribute("data-layout") &&
        k();
  }
  function S() {
    feather.replace();
    var e = document.documentElement.clientWidth,
      e =
        (e < 1025 && 767 < e
          ? (document.body.classList.remove("twocolumn-panel"),
            "twocolumn" == sessionStorage.getItem("data-layout") &&
              (document.documentElement.setAttribute(
                "data-layout",
                "twocolumn"
              ),
              document.getElementById("customizer-layout03") &&
                document.getElementById("customizer-layout03").click(),
              f(),
              L(),
              E()),
            "vertical" == sessionStorage.getItem("data-layout") &&
              document.documentElement.setAttribute("data-sidebar-size", "sm"),
            document.querySelector(".hamburger-icon") &&
              document.querySelector(".hamburger-icon").classList.add("open"))
          : 1025 <= e
          ? (document.body.classList.remove("twocolumn-panel"),
            "twocolumn" == sessionStorage.getItem("data-layout") &&
              (document.documentElement.setAttribute(
                "data-layout",
                "twocolumn"
              ),
              document.getElementById("customizer-layout03") &&
                document.getElementById("customizer-layout03").click(),
              f(),
              L(),
              E()),
            "vertical" == sessionStorage.getItem("data-layout") &&
              document.documentElement.setAttribute(
                "data-sidebar-size",
                sessionStorage.getItem("data-sidebar-size")
              ),
            document.querySelector(".hamburger-icon") &&
              document
                .querySelector(".hamburger-icon")
                .classList.remove("open"))
          : e <= 767 &&
            (document.body.classList.remove("vertical-sidebar-enable"),
            document.body.classList.add("twocolumn-panel"),
            "twocolumn" == sessionStorage.getItem("data-layout") &&
              (document.documentElement.setAttribute("data-layout", "vertical"),
              z("vertical"),
              E()),
            "horizontal" != sessionStorage.getItem("data-layout") &&
              document.documentElement.setAttribute("data-sidebar-size", "lg"),
            document.querySelector(".hamburger-icon") &&
              document.querySelector(".hamburger-icon").classList.add("open")),
        document.querySelectorAll("#navbar-nav > li.nav-item"));
    Array.from(e).forEach(function (e) {
      e.addEventListener("click", I.bind(this), !1),
        e.addEventListener("mouseover", I.bind(this), !1);
    });
  }
  function I(e) {
    if (e.target && e.target.matches("a.nav-link span"))
      if (0 == h(e.target.parentElement.nextElementSibling)) {
        e.target.parentElement.nextElementSibling.classList.add(
          "dropdown-custom-right"
        ),
          e.target.parentElement.parentElement.parentElement.parentElement.classList.add(
            "dropdown-custom-right"
          );
        var t = e.target.parentElement.nextElementSibling;
        Array.from(t.querySelectorAll(".menu-dropdown")).forEach(function (e) {
          e.classList.add("dropdown-custom-right");
        });
      } else if (
        1 == h(e.target.parentElement.nextElementSibling) &&
        1848 <= window.innerWidth
      )
        for (
          var a = document.getElementsByClassName("dropdown-custom-right");
          0 < a.length;

        )
          a[0].classList.remove("dropdown-custom-right");
    if (e.target && e.target.matches("a.nav-link"))
      if (0 == h(e.target.nextElementSibling)) {
        e.target.nextElementSibling.classList.add("dropdown-custom-right"),
          e.target.parentElement.parentElement.parentElement.classList.add(
            "dropdown-custom-right"
          );
        t = e.target.nextElementSibling;
        Array.from(t.querySelectorAll(".menu-dropdown")).forEach(function (e) {
          e.classList.add("dropdown-custom-right");
        });
      } else if (
        1 == h(e.target.nextElementSibling) &&
        1848 <= window.innerWidth
      )
        for (
          a = document.getElementsByClassName("dropdown-custom-right");
          0 < a.length;

        )
          a[0].classList.remove("dropdown-custom-right");
  }
  function w() {
    var e = document.documentElement.clientWidth;
    767 < e &&
      document.querySelector(".hamburger-icon").classList.toggle("open"),
      "horizontal" === document.documentElement.getAttribute("data-layout") &&
        (document.body.classList.contains("menu")
          ? document.body.classList.remove("menu")
          : document.body.classList.add("menu")),
      "vertical" === document.documentElement.getAttribute("data-layout") &&
        (e < 1025 && 767 < e
          ? (document.body.classList.remove("vertical-sidebar-enable"),
            "sm" == document.documentElement.getAttribute("data-sidebar-size")
              ? document.documentElement.setAttribute("data-sidebar-size", "")
              : document.documentElement.setAttribute(
                  "data-sidebar-size",
                  "sm"
                ))
          : 1025 < e
          ? (document.body.classList.remove("vertical-sidebar-enable"),
            "lg" == document.documentElement.getAttribute("data-sidebar-size")
              ? document.documentElement.setAttribute("data-sidebar-size", "sm")
              : document.documentElement.setAttribute(
                  "data-sidebar-size",
                  "lg"
                ))
          : e <= 767 &&
            (document.body.classList.add("vertical-sidebar-enable"),
            document.documentElement.setAttribute("data-sidebar-size", "lg"))),
      "twocolumn" == document.documentElement.getAttribute("data-layout") &&
        (document.body.classList.contains("twocolumn-panel")
          ? document.body.classList.remove("twocolumn-panel")
          : document.body.classList.add("twocolumn-panel"));
  }
  function A() {
    document.addEventListener("DOMContentLoaded", function () {
      var e = document.getElementsByClassName("code-switcher");
      Array.from(e).forEach(function (a) {
        a.addEventListener("change", function () {
          var e = a.closest(".card"),
            t = e.querySelector(".live-preview"),
            e = e.querySelector(".code-view");
          a.checked
            ? (t.classList.add("d-none"), e.classList.remove("d-none"))
            : (t.classList.remove("d-none"), e.classList.add("d-none"));
        });
      }),
        feather.replace();
    }),
      window.addEventListener("resize", S),
      S(),
      Waves.init(),
      document.addEventListener("scroll", function () {
        var e;
        (e = document.getElementById("page-topbar")) &&
          (50 <= document.body.scrollTop ||
          50 <= document.documentElement.scrollTop
            ? e.classList.add("topbar-shadow")
            : e.classList.remove("topbar-shadow"));
      }),
      window.addEventListener("load", function () {
        var e;
        ("twocolumn" == document.documentElement.getAttribute("data-layout")
          ? L
          : B)(),
          (e = document.getElementsByClassName("vertical-overlay")) &&
            Array.from(e).forEach(function (e) {
              e.addEventListener("click", function () {
                document.body.classList.remove("vertical-sidebar-enable"),
                  "twocolumn" == sessionStorage.getItem("data-layout")
                    ? document.body.classList.add("twocolumn-panel")
                    : document.documentElement.setAttribute(
                        "data-sidebar-size",
                        sessionStorage.getItem("data-sidebar-size")
                      );
              });
            }),
          q();
      }),
      document.getElementById("topnav-hamburger-icon") &&
        document
          .getElementById("topnav-hamburger-icon")
          .addEventListener("click", w);
    var e = sessionStorage.getItem("defaultAttribute"),
      e = JSON.parse(e),
      t = document.documentElement.clientWidth;
    "twocolumn" == e["data-layout"] &&
      t < 767 &&
      Array.from(
        document.getElementById("two-column-menu").querySelectorAll("li")
      ).forEach(function (e) {
        e.addEventListener("click", function (e) {
          document.body.classList.remove("twocolumn-panel");
        });
      });
  }
  function L() {
    feather.replace();
    var e,
      t,
      a =
        "/" == location.pathname
          ? "index.html"
          : location.pathname.substring(1);
    (a = a.substring(a.lastIndexOf("/") + 1)) &&
      ("twocolumn-panel" == document.body.className &&
        document
          .getElementById("two-column-menu")
          .querySelector('[href="' + a + '"]')
          .classList.add("active"),
      (a = document
        .getElementById("navbar-nav")
        .querySelector('[href="' + a + '"]'))
        ? (a.classList.add("active"),
          (t =
            (e = a.closest(".collapse.menu-dropdown")) &&
            e.parentElement.closest(".collapse.menu-dropdown")
              ? (e.classList.add("show"),
                e.parentElement.children[0].classList.add("active"),
                e.parentElement
                  .closest(".collapse.menu-dropdown")
                  .parentElement.classList.add("twocolumn-item-show"),
                e.parentElement.parentElement.parentElement.parentElement.closest(
                  ".collapse.menu-dropdown"
                ) &&
                  ((t =
                    e.parentElement.parentElement.parentElement.parentElement
                      .closest(".collapse.menu-dropdown")
                      .getAttribute("id")),
                  e.parentElement.parentElement.parentElement.parentElement
                    .closest(".collapse.menu-dropdown")
                    .parentElement.classList.add("twocolumn-item-show"),
                  e.parentElement
                    .closest(".collapse.menu-dropdown")
                    .parentElement.classList.remove("twocolumn-item-show"),
                  document
                    .getElementById("two-column-menu")
                    .querySelector('[href="#' + t + '"]') &&
                    document
                      .getElementById("two-column-menu")
                      .querySelector('[href="#' + t + '"]')
                      .classList.add("active")),
                e.parentElement
                  .closest(".collapse.menu-dropdown")
                  .getAttribute("id"))
              : (a
                  .closest(".collapse.menu-dropdown")
                  .parentElement.classList.add("twocolumn-item-show"),
                e.getAttribute("id"))),
          document
            .getElementById("two-column-menu")
            .querySelector('[href="#' + t + '"]') &&
            document
              .getElementById("two-column-menu")
              .querySelector('[href="#' + t + '"]')
              .classList.add("active"))
        : document.body.classList.add("twocolumn-panel"));
  }
  function B() {
    var e =
      "/" == location.pathname ? "index.html" : location.pathname.substring(1);
    (e = e.substring(e.lastIndexOf("/") + 1)) &&
      (e = document
        .getElementById("navbar-nav")
        .querySelector('[href="' + e + '"]')) &&
      (e.classList.add("active"),
      (e = e.closest(".collapse.menu-dropdown")) &&
        (e.classList.add("show"),
        e.parentElement.children[0].classList.add("active"),
        e.parentElement.children[0].setAttribute("aria-expanded", "true"),
        e.parentElement.closest(".collapse.menu-dropdown") &&
          (e.parentElement.closest(".collapse").classList.add("show"),
          e.parentElement.closest(".collapse").previousElementSibling &&
            e.parentElement
              .closest(".collapse")
              .previousElementSibling.classList.add("active"),
          e.parentElement.parentElement.parentElement.parentElement.closest(
            ".collapse.menu-dropdown"
          ) &&
            (e.parentElement.parentElement.parentElement.parentElement
              .closest(".collapse")
              .classList.add("show"),
            e.parentElement.parentElement.parentElement.parentElement.closest(
              ".collapse"
            ).previousElementSibling &&
              (console.log("parentCollapseDiv", e),
              e.parentElement.parentElement.parentElement.parentElement
                .closest(".collapse")
                .previousElementSibling.classList.add("active"),
              "horizontal" ==
                document.documentElement.getAttribute("data-layout") &&
                e.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.closest(
                  ".collapse"
                ) &&
                e.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement
                  .closest(".collapse")
                  .previousElementSibling.classList.add("active"))))));
  }
  function h(e) {
    if (e) {
      var t = e.offsetTop,
        a = e.offsetLeft,
        o = e.offsetWidth,
        n = e.offsetHeight;
      if (e.offsetParent)
        for (; e.offsetParent; )
          (t += (e = e.offsetParent).offsetTop), (a += e.offsetLeft);
      return (
        t >= window.pageYOffset &&
        a >= window.pageXOffset &&
        t + n <= window.pageYOffset + window.innerHeight &&
        a + o <= window.pageXOffset + window.innerWidth
      );
    }
  }
  function M() {
    var e = document.querySelectorAll(".counter-value");
    function s(e) {
      return e.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    e &&
      Array.from(e).forEach(function (n) {
        !(function e() {
          var t = +n.getAttribute("data-target"),
            a = +n.innerText,
            o = t / 250;
          o < 1 && (o = 1),
            a < t
              ? ((n.innerText = (a + o).toFixed(0)), setTimeout(e, 1))
              : (n.innerText = s(t)),
            s(n.innerText);
        })();
      });
  }
  function k() {
    (document.getElementById("two-column-menu").innerHTML = ""),
      (document.querySelector(".navbar-menu").innerHTML = u),
      document.getElementById("scrollbar").removeAttribute("data-simplebar"),
      document.getElementById("navbar-nav").removeAttribute("data-simplebar"),
      document.getElementById("scrollbar").classList.remove("h-100");
    var a = g,
      o = document.querySelectorAll("ul.navbar-nav > li.nav-item"),
      n = "",
      s = "";
    Array.from(o).forEach(function (e, t) {
      t + 1 === a && (s = e),
        a < t + 1 && ((n += e.outerHTML), e.remove()),
        t + 1 === o.length &&
          s.insertAdjacentHTML &&
          s.insertAdjacentHTML(
            "afterend",
            '<li class="nav-item">\t\t\t\t\t\t<a class="nav-link" href="#sidebarMore" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarMore">\t\t\t\t\t\t\t<i class="ri-briefcase-2-line"></i> More\t\t\t\t\t\t</a>\t\t\t\t\t\t<div class="collapse menu-dropdown" id="sidebarMore"><ul class="nav nav-sm flex-column">' +
              n +
              "</ul></div>\t\t\t\t\t</li>"
          );
    });
  }
  function z(e) {
    "vertical" == e
      ? ((document.getElementById("two-column-menu").innerHTML = ""),
        (document.querySelector(".navbar-menu").innerHTML = u),
        document.getElementById("theme-settings-offcanvas") &&
          ((document.getElementById("sidebar-size").style.display = "block"),
          (document.getElementById("sidebar-view").style.display = "block"),
          (document.getElementById("sidebar-color").style.display = "block"),
          document.getElementById("sidebar-img") &&
            (document.getElementById("sidebar-img").style.display = "block"),
          (document.getElementById("layout-position").style.display = "block"),
          (document.getElementById("layout-width").style.display = "block")),
        v(),
        B(),
        q(),
        T())
      : "horizontal" == e
      ? (k(),
        document.getElementById("theme-settings-offcanvas") &&
          ((document.getElementById("sidebar-size").style.display = "none"),
          (document.getElementById("sidebar-view").style.display = "none"),
          (document.getElementById("sidebar-color").style.display = "none"),
          document.getElementById("sidebar-img") &&
            (document.getElementById("sidebar-img").style.display = "none"),
          (document.getElementById("layout-position").style.display = "block"),
          (document.getElementById("layout-width").style.display = "block")),
        B())
      : "twocolumn" == e &&
        (document.getElementById("scrollbar").removeAttribute("data-simplebar"),
        document.getElementById("scrollbar").classList.remove("h-100"),
        document.getElementById("theme-settings-offcanvas") &&
          ((document.getElementById("sidebar-size").style.display = "none"),
          (document.getElementById("sidebar-view").style.display = "none"),
          (document.getElementById("sidebar-color").style.display = "block"),
          document.getElementById("sidebar-img") &&
            (document.getElementById("sidebar-img").style.display = "block"),
          (document.getElementById("layout-position").style.display = "none"),
          (document.getElementById("layout-width").style.display = "none")));
  }
  function q() {
    document
      .getElementById("vertical-hover")
      .addEventListener("click", function () {
        "sm-hover" ===
        document.documentElement.getAttribute("data-sidebar-size")
          ? document.documentElement.setAttribute(
              "data-sidebar-size",
              "sm-hover-active"
            )
          : (document.documentElement.getAttribute("data-sidebar-size"),
            document.documentElement.setAttribute(
              "data-sidebar-size",
              "sm-hover"
            ));
      });
  }
  function x(e) {
    if (e == e) {
      switch (e["data-layout"]) {
        case "vertical":
          C("data-layout", "vertical"),
            sessionStorage.setItem("data-layout", "vertical"),
            document.documentElement.setAttribute("data-layout", "vertical"),
            z("vertical"),
            E();
          break;
        case "horizontal":
          C("data-layout", "horizontal"),
            sessionStorage.setItem("data-layout", "horizontal"),
            document.documentElement.setAttribute("data-layout", "horizontal"),
            z("horizontal");
          break;
        case "twocolumn":
          C("data-layout", "twocolumn"),
            sessionStorage.setItem("data-layout", "twocolumn"),
            document.documentElement.setAttribute("data-layout", "twocolumn"),
            z("twocolumn");
          break;
        default:
          "vertical" == sessionStorage.getItem("data-layout") &&
          sessionStorage.getItem("data-layout")
            ? (C("data-layout", "vertical"),
              sessionStorage.setItem("data-layout", "vertical"),
              document.documentElement.setAttribute("data-layout", "vertical"),
              z("vertical"),
              E())
            : "horizontal" == sessionStorage.getItem("data-layout")
            ? (C("data-layout", "horizontal"),
              sessionStorage.setItem("data-layout", "horizontal"),
              document.documentElement.setAttribute(
                "data-layout",
                "horizontal"
              ),
              z("horizontal"))
            : "twocolumn" == sessionStorage.getItem("data-layout") &&
              (C("data-layout", "twocolumn"),
              sessionStorage.setItem("data-layout", "twocolumn"),
              document.documentElement.setAttribute("data-layout", "twocolumn"),
              z("twocolumn"));
      }
      switch (e["data-topbar"]) {
        case "light":
          C("data-topbar", "light"),
            sessionStorage.setItem("data-topbar", "light"),
            document.documentElement.setAttribute("data-topbar", "light");
          break;
        case "dark":
          C("data-topbar", "dark"),
            sessionStorage.setItem("data-topbar", "dark"),
            document.documentElement.setAttribute("data-topbar", "dark");
          break;
        default:
          "dark" == sessionStorage.getItem("data-topbar")
            ? (C("data-topbar", "dark"),
              sessionStorage.setItem("data-topbar", "dark"),
              document.documentElement.setAttribute("data-topbar", "dark"))
            : (C("data-topbar", "light"),
              sessionStorage.setItem("data-topbar", "light"),
              document.documentElement.setAttribute("data-topbar", "light"));
      }
      switch (e["data-layout-style"]) {
        case "default":
          C("data-layout-style", "default"),
            sessionStorage.setItem("data-layout-style", "default"),
            document.documentElement.setAttribute(
              "data-layout-style",
              "default"
            );
          break;
        case "detached":
          C("data-layout-style", "detached"),
            sessionStorage.setItem("data-layout-style", "detached"),
            document.documentElement.setAttribute(
              "data-layout-style",
              "detached"
            );
          break;
        default:
          "detached" == sessionStorage.getItem("data-layout-style")
            ? (C("data-layout-style", "detached"),
              sessionStorage.setItem("data-layout-style", "detached"),
              document.documentElement.setAttribute(
                "data-layout-style",
                "detached"
              ))
            : (C("data-layout-style", "default"),
              sessionStorage.setItem("data-layout-style", "default"),
              document.documentElement.setAttribute(
                "data-layout-style",
                "default"
              ));
      }
      switch (e["data-sidebar-size"]) {
        case "lg":
          C("data-sidebar-size", "lg"),
            document.documentElement.setAttribute("data-sidebar-size", "lg"),
            sessionStorage.setItem("data-sidebar-size", "lg");
          break;
        case "sm":
          C("data-sidebar-size", "sm"),
            document.documentElement.setAttribute("data-sidebar-size", "sm"),
            sessionStorage.setItem("data-sidebar-size", "sm");
          break;
        case "md":
          C("data-sidebar-size", "md"),
            document.documentElement.setAttribute("data-sidebar-size", "md"),
            sessionStorage.setItem("data-sidebar-size", "md");
          break;
        case "sm-hover":
          C("data-sidebar-size", "sm-hover"),
            document.documentElement.setAttribute(
              "data-sidebar-size",
              "sm-hover"
            ),
            sessionStorage.setItem("data-sidebar-size", "sm-hover");
          break;
        default:
          "sm" == sessionStorage.getItem("data-sidebar-size")
            ? (document.documentElement.setAttribute("data-sidebar-size", "sm"),
              C("data-sidebar-size", "sm"),
              sessionStorage.setItem("data-sidebar-size", "sm"))
            : "md" == sessionStorage.getItem("data-sidebar-size")
            ? (document.documentElement.setAttribute("data-sidebar-size", "md"),
              C("data-sidebar-size", "md"),
              sessionStorage.setItem("data-sidebar-size", "md"))
            : "sm-hover" == sessionStorage.getItem("data-sidebar-size")
            ? (document.documentElement.setAttribute(
                "data-sidebar-size",
                "sm-hover"
              ),
              C("data-sidebar-size", "sm-hover"),
              sessionStorage.setItem("data-sidebar-size", "sm-hover"))
            : (document.documentElement.setAttribute("data-sidebar-size", "lg"),
              C("data-sidebar-size", "lg"),
              sessionStorage.setItem("data-sidebar-size", "lg"));
      }
      switch (e["data-layout-mode"]) {
        case "light":
          C("data-layout-mode", "light"),
            document.documentElement.setAttribute("data-layout-mode", "light"),
            sessionStorage.setItem("data-layout-mode", "light");
          break;
        case "dark":
          C("data-layout-mode", "dark"),
            document.documentElement.setAttribute("data-layout-mode", "dark"),
            sessionStorage.setItem("data-layout-mode", "dark");
          break;
        default:
          sessionStorage.getItem("data-layout-mode") &&
          "dark" == sessionStorage.getItem("data-layout-mode")
            ? (sessionStorage.setItem("data-layout-mode", "dark"),
              document.documentElement.setAttribute("data-layout-mode", "dark"),
              C("data-layout-mode", "dark"))
            : (sessionStorage.setItem("data-layout-mode", "light"),
              document.documentElement.setAttribute(
                "data-layout-mode",
                "light"
              ),
              C("data-layout-mode", "light"));
      }
      switch (e["data-layout-width"]) {
        case "fluid":
          C("data-layout-width", "fluid"),
            document.documentElement.setAttribute("data-layout-width", "fluid"),
            sessionStorage.setItem("data-layout-width", "fluid");
          break;
        case "boxed":
          C("data-layout-width", "boxed"),
            document.documentElement.setAttribute("data-layout-width", "boxed"),
            sessionStorage.setItem("data-layout-width", "boxed");
          break;
        default:
          "boxed" == sessionStorage.getItem("data-layout-width")
            ? (sessionStorage.setItem("data-layout-width", "boxed"),
              document.documentElement.setAttribute(
                "data-layout-width",
                "boxed"
              ),
              C("data-layout-width", "boxed"))
            : (sessionStorage.setItem("data-layout-width", "fluid"),
              document.documentElement.setAttribute(
                "data-layout-width",
                "fluid"
              ),
              C("data-layout-width", "fluid"));
      }
      switch (e["data-sidebar"]) {
        case "light":
          C("data-sidebar", "light"),
            sessionStorage.setItem("data-sidebar", "light"),
            document.documentElement.setAttribute("data-sidebar", "light");
          break;
        case "dark":
          C("data-sidebar", "dark"),
            sessionStorage.setItem("data-sidebar", "dark"),
            document.documentElement.setAttribute("data-sidebar", "dark");
          break;
        case "gradient":
          C("data-sidebar", "gradient"),
            sessionStorage.setItem("data-sidebar", "gradient"),
            document.documentElement.setAttribute("data-sidebar", "gradient");
          break;
        case "gradient-2":
          C("data-sidebar", "gradient-2"),
            sessionStorage.setItem("data-sidebar", "gradient-2"),
            document.documentElement.setAttribute("data-sidebar", "gradient-2");
          break;
        case "gradient-3":
          C("data-sidebar", "gradient-3"),
            sessionStorage.setItem("data-sidebar", "gradient-3"),
            document.documentElement.setAttribute("data-sidebar", "gradient-3");
          break;
        case "gradient-4":
          C("data-sidebar", "gradient-4"),
            sessionStorage.setItem("data-sidebar", "gradient-4"),
            document.documentElement.setAttribute("data-sidebar", "gradient-4");
          break;
        default:
          sessionStorage.getItem("data-sidebar") &&
          "light" == sessionStorage.getItem("data-sidebar")
            ? (sessionStorage.setItem("data-sidebar", "light"),
              C("data-sidebar", "light"),
              document.documentElement.setAttribute("data-sidebar", "light"))
            : "dark" == sessionStorage.getItem("data-sidebar")
            ? (sessionStorage.setItem("data-sidebar", "dark"),
              C("data-sidebar", "dark"),
              document.documentElement.setAttribute("data-sidebar", "dark"))
            : "gradient" == sessionStorage.getItem("data-sidebar")
            ? (sessionStorage.setItem("data-sidebar", "gradient"),
              C("data-sidebar", "gradient"),
              document.documentElement.setAttribute("data-sidebar", "gradient"))
            : "gradient-2" == sessionStorage.getItem("data-sidebar")
            ? (sessionStorage.setItem("data-sidebar", "gradient-2"),
              C("data-sidebar", "gradient-2"),
              document.documentElement.setAttribute(
                "data-sidebar",
                "gradient-2"
              ))
            : "gradient-3" == sessionStorage.getItem("data-sidebar")
            ? (sessionStorage.setItem("data-sidebar", "gradient-3"),
              C("data-sidebar", "gradient-3"),
              document.documentElement.setAttribute(
                "data-sidebar",
                "gradient-3"
              ))
            : "gradient-4" == sessionStorage.getItem("data-sidebar") &&
              (sessionStorage.setItem("data-sidebar", "gradient-4"),
              C("data-sidebar", "gradient-4"),
              document.documentElement.setAttribute(
                "data-sidebar",
                "gradient-4"
              ));
      }
      switch (e["data-sidebar-image"]) {
        case "none":
          C("data-sidebar-image", "none"),
            sessionStorage.setItem("data-sidebar-image", "none"),
            document.documentElement.setAttribute("data-sidebar-image", "none");
          break;
        case "img-1":
          C("data-sidebar-image", "img-1"),
            sessionStorage.setItem("data-sidebar-image", "img-1"),
            document.documentElement.setAttribute(
              "data-sidebar-image",
              "img-1"
            );
          break;
        case "img-2":
          C("data-sidebar-image", "img-2"),
            sessionStorage.setItem("data-sidebar-image", "img-2"),
            document.documentElement.setAttribute(
              "data-sidebar-image",
              "img-2"
            );
          break;
        case "img-3":
          C("data-sidebar-image", "img-3"),
            sessionStorage.setItem("data-sidebar-image", "img-3"),
            document.documentElement.setAttribute(
              "data-sidebar-image",
              "img-3"
            );
          break;
        case "img-4":
          C("data-sidebar-image", "img-4"),
            sessionStorage.setItem("data-sidebar-image", "img-4"),
            document.documentElement.setAttribute(
              "data-sidebar-image",
              "img-4"
            );
          break;
        default:
          sessionStorage.getItem("data-sidebar-image") &&
          "none" == sessionStorage.getItem("data-sidebar-image")
            ? (sessionStorage.setItem("data-sidebar-image", "none"),
              C("data-sidebar-image", "none"),
              document.documentElement.setAttribute(
                "data-sidebar-image",
                "none"
              ))
            : "img-1" == sessionStorage.getItem("data-sidebar-image")
            ? (sessionStorage.setItem("data-sidebar-image", "img-1"),
              C("data-sidebar-image", "img-1"),
              document.documentElement.setAttribute(
                "data-sidebar-image",
                "img-2"
              ))
            : "img-2" == sessionStorage.getItem("data-sidebar-image")
            ? (sessionStorage.setItem("data-sidebar-image", "img-2"),
              C("data-sidebar-image", "img-2"),
              document.documentElement.setAttribute(
                "data-sidebar-image",
                "img-2"
              ))
            : "img-3" == sessionStorage.getItem("data-sidebar-image")
            ? (sessionStorage.setItem("data-sidebar-image", "img-3"),
              C("data-sidebar-image", "img-3"),
              document.documentElement.setAttribute(
                "data-sidebar-image",
                "img-3"
              ))
            : "img-4" == sessionStorage.getItem("data-sidebar-image") &&
              (sessionStorage.setItem("data-sidebar-image", "img-4"),
              C("data-sidebar-image", "img-4"),
              document.documentElement.setAttribute(
                "data-sidebar-image",
                "img-4"
              ));
      }
      switch (e["data-layout-position"]) {
        case "fixed":
          C("data-layout-position", "fixed"),
            sessionStorage.setItem("data-layout-position", "fixed"),
            document.documentElement.setAttribute(
              "data-layout-position",
              "fixed"
            );
          break;
        case "scrollable":
          C("data-layout-position", "scrollable"),
            sessionStorage.setItem("data-layout-position", "scrollable"),
            document.documentElement.setAttribute(
              "data-layout-position",
              "scrollable"
            );
          break;
        default:
          sessionStorage.getItem("data-layout-position") &&
          "scrollable" == sessionStorage.getItem("data-layout-position")
            ? (C("data-layout-position", "scrollable"),
              sessionStorage.setItem("data-layout-position", "scrollable"),
              document.documentElement.setAttribute(
                "data-layout-position",
                "scrollable"
              ))
            : (C("data-layout-position", "fixed"),
              sessionStorage.setItem("data-layout-position", "fixed"),
              document.documentElement.setAttribute(
                "data-layout-position",
                "fixed"
              ));
      }
      switch (e["data-preloader"]) {
        case "disable":
          C("data-preloader", "disable"),
            sessionStorage.setItem("data-preloader", "disable"),
            document.documentElement.setAttribute("data-preloader", "disable");
          break;
        case "enable":
          C("data-preloader", "enable"),
            sessionStorage.setItem("data-preloader", "enable"),
            document.documentElement.setAttribute("data-preloader", "enable"),
            (t = document.getElementById("preloader")) &&
              window.addEventListener("load", function () {
                (t.style.opacity = "0"), (t.style.visibility = "hidden");
              });
          break;
        default:
          var t;
          sessionStorage.getItem("data-preloader") &&
          "disable" == sessionStorage.getItem("data-preloader")
            ? (C("data-preloader", "disable"),
              sessionStorage.setItem("data-preloader", "disable"),
              document.documentElement.setAttribute(
                "data-preloader",
                "disable"
              ))
            : "enable" == sessionStorage.getItem("data-preloader")
            ? (C("data-preloader", "enable"),
              sessionStorage.setItem("data-preloader", "enable"),
              document.documentElement.setAttribute("data-preloader", "enable"),
              (t = document.getElementById("preloader")) &&
                window.addEventListener("load", function () {
                  (t.style.opacity = "0"), (t.style.visibility = "hidden");
                }))
            : document.documentElement.setAttribute(
                "data-preloader",
                "disable"
              );
      }
      switch (e["data-body-image"]) {
        case "img-1":
          C("data-body-image", "img-1"),
            sessionStorage.setItem("data-sidebabodyr-image", "img-1"),
            document.documentElement.setAttribute("data-body-image", "img-1"),
            document.getElementById("theme-settings-offcanvas") &&
              document.documentElement.removeAttribute("data-sidebar-image");
          break;
        case "img-2":
          C("data-body-image", "img-2"),
            sessionStorage.setItem("data-body-image", "img-2"),
            document.documentElement.setAttribute("data-body-image", "img-2");
          break;
        case "img-3":
          C("data-body-image", "img-3"),
            sessionStorage.setItem("data-body-image", "img-3"),
            document.documentElement.setAttribute("data-body-image", "img-3");
          break;
        case "none":
          C("data-body-image", "none"),
            sessionStorage.setItem("data-body-image", "none"),
            document.documentElement.setAttribute("data-body-image", "none");
          break;
        default:
          sessionStorage.getItem("data-body-image") &&
          "img-1" == sessionStorage.getItem("data-body-image")
            ? (sessionStorage.setItem("data-body-image", "img-1"),
              C("data-body-image", "img-1"),
              document.documentElement.setAttribute("data-body-image", "img-1"),
              document.getElementById("theme-settings-offcanvas") &&
                ((document.getElementById("sidebar-img").style.display =
                  "none"),
                document.documentElement.removeAttribute("data-sidebar-image")))
            : "img-2" == sessionStorage.getItem("data-body-image")
            ? (sessionStorage.setItem("data-body-image", "img-2"),
              C("data-body-image", "img-2"),
              document.documentElement.setAttribute("data-body-image", "img-2"))
            : "img-3" == sessionStorage.getItem("data-body-image")
            ? (sessionStorage.setItem("data-body-image", "img-3"),
              C("data-body-image", "img-3"),
              document.documentElement.setAttribute("data-body-image", "img-3"))
            : "none" == sessionStorage.getItem("data-body-image") &&
              (sessionStorage.setItem("data-body-image", "none"),
              C("data-body-image", "none"),
              document.documentElement.setAttribute("data-body-image", "none"));
      }
    }
  }
  function T() {
    setTimeout(function () {
      var e,
        t,
        a = document.getElementById("navbar-nav");
      a &&
        ((a = a.querySelector(".nav-item .active")),
        300 < (e = a ? a.offsetTop : 0) &&
          (t = document.getElementsByClassName("app-menu")
            ? document.getElementsByClassName("app-menu")[0]
            : "") &&
          t.querySelector(".simplebar-content-wrapper") &&
          setTimeout(function () {
            t.querySelector(".simplebar-content-wrapper").scrollTop =
              330 == e ? e + 85 : e;
          }, 0));
    }, 250);
  }
  function C(a, e) {
    Array.from(document.querySelectorAll("input[name=" + a + "]")).forEach(
      function (t) {
        e == t.value ? (t.checked = !0) : (t.checked = !1),
          t.addEventListener("change", function () {
            var e;
            document.documentElement.setAttribute(a, t.value),
              sessionStorage.setItem(a, t.value),
              "data-layout-width" == a && "boxed" == t.value
                ? (document.documentElement.setAttribute(
                    "data-sidebar-size",
                    "sm-hover"
                  ),
                  sessionStorage.setItem("data-sidebar-size", "sm-hover"),
                  (document.getElementById("sidebar-size-small-hover").checked =
                    !0))
                : "data-layout-width" == a &&
                  "fluid" == t.value &&
                  (document.documentElement.setAttribute(
                    "data-sidebar-size",
                    "lg"
                  ),
                  sessionStorage.setItem("data-sidebar-size", "lg"),
                  (document.getElementById("sidebar-size-default").checked =
                    !0)),
              "data-layout" == a &&
                ("vertical" == t.value
                  ? (z("vertical"), E(), feather.replace())
                  : "horizontal" == t.value
                  ? (document.getElementById("sidebarimg-none") &&
                      document.getElementById("sidebarimg-none").click(),
                    z("horizontal"),
                    feather.replace())
                  : "twocolumn" == t.value &&
                    (z("twocolumn"),
                    document.documentElement.setAttribute(
                      "data-layout-width",
                      "fluid"
                    ),
                    document.getElementById("layout-width-fluid").click(),
                    f(),
                    L(),
                    E(),
                    feather.replace())),
              "data-preloader" == a && "enable" == t.value
                ? (document.documentElement.setAttribute(
                    "data-preloader",
                    "enable"
                  ),
                  (e = document.getElementById("preloader")) &&
                    setTimeout(function () {
                      (e.style.opacity = "0"), (e.style.visibility = "hidden");
                    }, 1e3),
                  document.getElementById("customizerclose-btn").click())
                : "data-preloader" == a &&
                  "disable" == t.value &&
                  (document.documentElement.setAttribute(
                    "data-preloader",
                    "disable"
                  ),
                  document.getElementById("customizerclose-btn").click());
          });
      }
    ),
      document.getElementById("collapseBgGradient") &&
        Array.from(
          document.querySelectorAll("#collapseBgGradient .form-check input")
        ).forEach(function (e) {
          var t = document.getElementById("collapseBgGradient");
          1 == e.checked && new bootstrap.Collapse(t, {toggle: !1}).show(),
            document.querySelector("[data-bs-target='#collapseBgGradient']") &&
              document
                .querySelector("[data-bs-target='#collapseBgGradient']")
                .addEventListener("click", function (e) {
                  document.getElementById("sidebar-color-gradient").click();
                });
        }),
      Array.from(document.querySelectorAll("[name='data-sidebar']")).forEach(
        function (e) {
          document.querySelector("[data-bs-target='#collapseBgGradient']") &&
            (document.querySelector(
              "#collapseBgGradient .form-check input:checked"
            )
              ? document
                  .querySelector("[data-bs-target='#collapseBgGradient']")
                  .classList.add("active")
              : document
                  .querySelector("[data-bs-target='#collapseBgGradient']")
                  .classList.remove("active"),
            e.addEventListener("change", function () {
              document.querySelector(
                "#collapseBgGradient .form-check input:checked"
              )
                ? document
                    .querySelector("[data-bs-target='#collapseBgGradient']")
                    .classList.add("active")
                : document
                    .querySelector("[data-bs-target='#collapseBgGradient']")
                    .classList.remove("active");
            }));
        }
      );
  }
  function F(e, t, a, o) {
    var n = document.getElementById(a);
    o.setAttribute(e, t), n && document.getElementById(a).click();
  }
  function N() {
    document.webkitIsFullScreen ||
      document.mozFullScreen ||
      document.msFullscreenElement ||
      document.body.classList.remove("fullscreen-enable");
  }
  function H() {
    var t = 0;
    Array.from(document.getElementsByClassName("cart-item-price")).forEach(
      function (e) {
        t += parseFloat(e.innerHTML);
      }
    ),
      document.getElementById("cart-item-total") &&
        (document.getElementById("cart-item-total").innerHTML =
          "$" + t.toFixed(2));
  }
  function O() {
    var e;
    "horizontal" !== document.documentElement.getAttribute("data-layout") &&
      (document.getElementById("navbar-nav") &&
        (e = new SimpleBar(document.getElementById("navbar-nav"))) &&
        e.getContentElement(),
      document.getElementsByClassName("twocolumn-iconview")[0] &&
        (e = new SimpleBar(
          document.getElementsByClassName("twocolumn-iconview")[0]
        )) &&
        e.getContentElement(),
      clearTimeout(c));
  }
  sessionStorage.getItem("defaultAttribute")
    ? (((a = {})["data-layout"] = sessionStorage.getItem("data-layout")),
      (a["data-sidebar-size"] = sessionStorage.getItem("data-sidebar-size")),
      (a["data-layout-mode"] = sessionStorage.getItem("data-layout-mode")),
      (a["data-layout-width"] = sessionStorage.getItem("data-layout-width")),
      (a["data-sidebar"] = sessionStorage.getItem("data-sidebar")),
      (a["data-sidebar-image"] = sessionStorage.getItem("data-sidebar-image")),
      (a["data-layout-position"] = sessionStorage.getItem(
        "data-layout-position"
      )),
      (a["data-layout-style"] = sessionStorage.getItem("data-layout-style")),
      (a["data-topbar"] = sessionStorage.getItem("data-topbar")),
      (a["data-preloader"] = sessionStorage.getItem("data-preloader")),
      (a["data-body-image"] = sessionStorage.getItem("data-body-image")),
      x(a))
    : ((i = document.documentElement.attributes),
      (a = {}),
      Array.from(i).forEach(function (e) {
        var t;
        e &&
          e.nodeName &&
          "undefined" != e.nodeName &&
          ((t = e.nodeName),
          (a[t] = e.nodeValue),
          sessionStorage.setItem(t, e.nodeValue));
      }),
      sessionStorage.setItem("defaultAttribute", JSON.stringify(a)),
      x(a),
      (i = document.querySelector(
        '.btn[data-bs-target="#theme-settings-offcanvas"]'
      )) && i.click()),
    f(),
    (o = document.getElementById("search-close-options")),
    (s = document.getElementById("search-dropdown")),
    (d = document.getElementById("search-options")) &&
      (d.addEventListener("focus", function () {
        0 < d.value.length
          ? (s.classList.add("show"), o.classList.remove("d-none"))
          : (s.classList.remove("show"), o.classList.add("d-none"));
      }),
      d.addEventListener("keyup", function (e) {
        var n, t;
        0 < d.value.length
          ? (s.classList.add("show"),
            o.classList.remove("d-none"),
            (n = d.value.toLowerCase()),
            (t = document.getElementsByClassName("notify-item")),
            Array.from(t).forEach(function (e) {
              var t,
                a,
                o = "";
              e.querySelector("h6")
                ? ((t = e
                    .getElementsByTagName("span")[0]
                    .innerText.toLowerCase()),
                  (o = (a = e
                    .querySelector("h6")
                    .innerText.toLowerCase()).includes(n)
                    ? a
                    : t))
                : e.getElementsByTagName("span") &&
                  (o = e
                    .getElementsByTagName("span")[0]
                    .innerText.toLowerCase()),
                o && (e.style.display = o.includes(n) ? "block" : "none");
            }))
          : (s.classList.remove("show"), o.classList.add("d-none"));
      }),
      o.addEventListener("click", function () {
        (d.value = ""), s.classList.remove("show"), o.classList.add("d-none");
      }),
      document.body.addEventListener("click", function (e) {
        "search-options" !== e.target.getAttribute("id") &&
          (s.classList.remove("show"), o.classList.add("d-none"));
      })),
    (t = document.getElementById("search-close-options")),
    (n = document.getElementById("search-dropdown-reponsive")),
    (e = document.getElementById("search-options-reponsive")),
    t &&
      n &&
      e &&
      (e.addEventListener("focus", function () {
        0 < e.value.length
          ? (n.classList.add("show"), t.classList.remove("d-none"))
          : (n.classList.remove("show"), t.classList.add("d-none"));
      }),
      e.addEventListener("keyup", function () {
        0 < e.value.length
          ? (n.classList.add("show"), t.classList.remove("d-none"))
          : (n.classList.remove("show"), t.classList.add("d-none"));
      }),
      t.addEventListener("click", function () {
        (e.value = ""), n.classList.remove("show"), t.classList.add("d-none");
      }),
      document.body.addEventListener("click", function (e) {
        "search-options" !== e.target.getAttribute("id") &&
          (n.classList.remove("show"), t.classList.add("d-none"));
      })),
    (i = document.querySelector('[data-toggle="fullscreen"]')) &&
      i.addEventListener("click", function (e) {
        e.preventDefault(),
          document.body.classList.toggle("fullscreen-enable"),
          document.fullscreenElement ||
          document.mozFullScreenElement ||
          document.webkitFullscreenElement
            ? document.cancelFullScreen
              ? document.cancelFullScreen()
              : document.mozCancelFullScreen
              ? document.mozCancelFullScreen()
              : document.webkitCancelFullScreen &&
                document.webkitCancelFullScreen()
            : document.documentElement.requestFullscreen
            ? document.documentElement.requestFullscreen()
            : document.documentElement.mozRequestFullScreen
            ? document.documentElement.mozRequestFullScreen()
            : document.documentElement.webkitRequestFullscreen &&
              document.documentElement.webkitRequestFullscreen(
                Element.ALLOW_KEYBOARD_INPUT
              );
      }),
    document.addEventListener("fullscreenchange", N),
    document.addEventListener("webkitfullscreenchange", N),
    document.addEventListener("mozfullscreenchange", N),
    (l = document.getElementsByTagName("HTML")[0]),
    (m = document.querySelectorAll(".light-dark-mode")) &&
      m.length &&
      m[0].addEventListener("click", function (e) {
        l.hasAttribute("data-layout-mode") &&
        "dark" == l.getAttribute("data-layout-mode")
          ? F("data-layout-mode", "light", "layout-mode-light", l)
          : F("data-layout-mode", "dark", "layout-mode-dark", l);
      }),
    A(),
    M(),
    v(),
    document.getElementsByClassName("dropdown-item-cart") &&
      ((r = document.querySelectorAll(".dropdown-item-cart").length),
      Array.from(
        document.querySelectorAll(
          "#page-topbar .dropdown-menu-cart .remove-item-btn"
        )
      ).forEach(function (e) {
        e.addEventListener("click", function (e) {
          r--,
            this.closest(".dropdown-item-cart").remove(),
            Array.from(
              document.getElementsByClassName("cartitem-badge")
            ).forEach(function (e) {
              e.innerHTML = r;
            }),
            H(),
            document.getElementById("empty-cart") &&
              (document.getElementById("empty-cart").style.display =
                0 == r ? "block" : "none"),
            document.getElementById("checkout-elem") &&
              (document.getElementById("checkout-elem").style.display =
                0 == r ? "none" : "block");
        });
      }),
      Array.from(document.getElementsByClassName("cartitem-badge")).forEach(
        function (e) {
          e.innerHTML = r;
        }
      ),
      document.getElementById("empty-cart") &&
        (document.getElementById("empty-cart").style.display = "none"),
      document.getElementById("checkout-elem") &&
        (document.getElementById("checkout-elem").style.display = "block"),
      H()),
    document.getElementsByClassName("notification-check") &&
      Array.from(
        document.querySelectorAll(".notification-check input")
      ).forEach(function (e) {
        e.addEventListener("click", function (e) {
          e.target.closest(".notification-item").classList.toggle("active");
        });
      }),
    [].slice
      .call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
      .map(function (e) {
        return new bootstrap.Tooltip(e);
      }),
    [].slice
      .call(document.querySelectorAll('[data-bs-toggle="popover"]'))
      .map(function (e) {
        return new bootstrap.Popover(e);
      }),
    document.getElementById("reset-layout") &&
      document
        .getElementById("reset-layout")
        .addEventListener("click", function () {
          sessionStorage.clear(), window.location.reload();
        }),
    (m = document.querySelectorAll("[data-toast]")),
    Array.from(m).forEach(function (a) {
      a.addEventListener("click", function () {
        var e = {},
          t = a.attributes;
        t["data-toast-text"] &&
          (e.text = t["data-toast-text"].value.toString()),
          t["data-toast-gravity"] &&
            (e.gravity = t["data-toast-gravity"].value.toString()),
          t["data-toast-position"] &&
            (e.position = t["data-toast-position"].value.toString()),
          t["data-toast-className"] &&
            (e.className = t["data-toast-className"].value.toString()),
          t["data-toast-duration"] &&
            (e.duration = t["data-toast-duration"].value.toString()),
          t["data-toast-close"] &&
            (e.close = t["data-toast-close"].value.toString()),
          t["data-toast-style"] &&
            (e.style = t["data-toast-style"].value.toString()),
          t["data-toast-offset"] && (e.offset = t["data-toast-offset"]),
          Toastify({
            newWindow: !0,
            text: e.text,
            gravity: e.gravity,
            position: e.position,
            className: "bg-" + e.className,
            stopOnFocus: !0,
            offset: {x: e.offset ? 50 : 0, y: e.offset ? 10 : 0},
            duration: e.duration,
            close: "close" == e.close,
            style:
              "style" == e.style
                ? {background: "linear-gradient(to right, #0AB39C, #405189)"}
                : "",
          }).showToast();
      });
    }),
    (m = document.querySelectorAll("[data-choices]")),
    Array.from(m).forEach(function (e) {
      var t = {},
        a = e.attributes;
      a["data-choices-groups"] &&
        (t.placeholderValue = "This is a placeholder set in the config"),
        a["data-choices-search-false"] && (t.searchEnabled = !1),
        a["data-choices-search-true"] && (t.searchEnabled = !0),
        a["data-choices-removeItem"] && (t.removeItemButton = !0),
        a["data-choices-sorting-false"] && (t.shouldSort = !1),
        a["data-choices-sorting-true"] && (t.shouldSort = !0),
        a["data-choices-multiple-remove"] && (t.removeItemButton = !0),
        a["data-choices-limit"] &&
          (t.maxItemCount = a["data-choices-limit"].value.toString()),
        a["data-choices-limit"] &&
          (t.maxItemCount = a["data-choices-limit"].value.toString()),
        a["data-choices-editItem-true"] && (t.maxItemCount = !0),
        a["data-choices-editItem-false"] && (t.maxItemCount = !1),
        a["data-choices-text-unique-true"] && (t.duplicateItemsAllowed = !1),
        a["data-choices-text-disabled-true"] && (t.addItems = !1),
        a["data-choices-text-disabled-true"]
          ? new Choices(e, t).disable()
          : new Choices(e, t);
    }),
    (m = document.querySelectorAll("[data-provider]")),
    Array.from(m).forEach(function (e) {
      var t, a, o;
      "flatpickr" == e.getAttribute("data-provider")
        ? ((t = {}),
          (o = e.attributes)["data-date-format"] &&
            (t.dateFormat = o["data-date-format"].value.toString()),
          o["data-enable-time"] &&
            ((t.enableTime = !0),
            (t.dateFormat = o["data-date-format"].value.toString() + " H:i")),
          o["data-altFormat"] &&
            ((t.altInput = !0),
            (t.altFormat = o["data-altFormat"].value.toString())),
          o["data-minDate"] &&
            ((t.minDate = o["data-minDate"].value.toString()),
            (t.dateFormat = o["data-date-format"].value.toString())),
          o["data-maxDate"] &&
            ((t.maxDate = o["data-maxDate"].value.toString()),
            (t.dateFormat = o["data-date-format"].value.toString())),
          o["data-deafult-date"] &&
            ((t.defaultDate = o["data-deafult-date"].value.toString()),
            (t.dateFormat = o["data-date-format"].value.toString())),
          o["data-multiple-date"] &&
            ((t.mode = "multiple"),
            (t.dateFormat = o["data-date-format"].value.toString())),
          o["data-range-date"] &&
            ((t.mode = "range"),
            (t.dateFormat = o["data-date-format"].value.toString())),
          o["data-inline-date"] &&
            ((t.inline = !0),
            (t.defaultDate = o["data-deafult-date"].value.toString()),
            (t.dateFormat = o["data-date-format"].value.toString())),
          o["data-disable-date"] &&
            ((a = []).push(o["data-disable-date"].value),
            (t.disable = a.toString().split(","))),
          o["data-week-number"] &&
            ((a = []).push(o["data-week-number"].value), (t.weekNumbers = !0)),
          flatpickr(e, t))
        : "timepickr" == e.getAttribute("data-provider") &&
          ((a = {}),
          (o = e.attributes)["data-time-basic"] &&
            ((a.enableTime = !0), (a.noCalendar = !0), (a.dateFormat = "H:i")),
          o["data-time-hrs"] &&
            ((a.enableTime = !0),
            (a.noCalendar = !0),
            (a.dateFormat = "H:i"),
            (a.time_24hr = !0)),
          o["data-min-time"] &&
            ((a.enableTime = !0),
            (a.noCalendar = !0),
            (a.dateFormat = "H:i"),
            (a.minTime = o["data-min-time"].value.toString())),
          o["data-max-time"] &&
            ((a.enableTime = !0),
            (a.noCalendar = !0),
            (a.dateFormat = "H:i"),
            (a.minTime = o["data-max-time"].value.toString())),
          o["data-default-time"] &&
            ((a.enableTime = !0),
            (a.noCalendar = !0),
            (a.dateFormat = "H:i"),
            (a.defaultDate = o["data-default-time"].value.toString())),
          o["data-time-inline"] &&
            ((a.enableTime = !0),
            (a.noCalendar = !0),
            (a.defaultDate = o["data-time-inline"].value.toString()),
            (a.inline = !0)),
          flatpickr(e, a));
    }),
    Array.from(
      document.querySelectorAll('.dropdown-menu a[data-bs-toggle="tab"]')
    ).forEach(function (e) {
      e.addEventListener("click", function (e) {
        e.stopPropagation(), bootstrap.Tab.getInstance(e.target).show();
      });
    }),
    p(null === y ? b : y),
    (m = document.getElementsByClassName("language")) &&
      Array.from(m).forEach(function (t) {
        t.addEventListener("click", function (e) {
          p(t.getAttribute("data-lang"));
        });
      }),
    E(),
    T(),
    window.addEventListener("resize", function () {
      c && clearTimeout(c), (c = setTimeout(O, 2e3));
    });
})();
var mybutton = document.getElementById("back-to-top");
function scrollFunction() {
  100 < document.body.scrollTop || 100 < document.documentElement.scrollTop
    ? (mybutton.style.display = "block")
    : (mybutton.style.display = "none");
}
function topFunction() {
  (document.body.scrollTop = 0), (document.documentElement.scrollTop = 0);
}
mybutton &&
  (window.onscroll = function () {
    scrollFunction();
  });
