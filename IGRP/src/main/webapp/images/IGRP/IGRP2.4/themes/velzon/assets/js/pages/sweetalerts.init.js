document.getElementById("sa-basic") &&
  document.getElementById("sa-basic").addEventListener("click", function () {
    Swal.fire({
      title: "Any fool can use a computer",
      confirmButtonClass: "btn btn-primary w-xs mt-2",
      buttonsStyling: !1,
      showCloseButton: !0,
    });
  }),
  document.getElementById("sa-title") &&
    document.getElementById("sa-title").addEventListener("click", function () {
      Swal.fire({
        title: "The Internet?",
        text: "That thing is still around?",
        icon: "question",
        confirmButtonClass: "btn btn-primary w-xs mt-2",
        buttonsStyling: !1,
        showCloseButton: !0,
      });
    }),
  document.getElementById("sa-success") &&
    document
      .getElementById("sa-success")
      .addEventListener("click", function () {
        Swal.fire({
          title: "Good job!",
          text: "You clicked the button!",
          icon: "success",
          showCancelButton: !0,
          confirmButtonClass: "btn btn-primary w-xs me-2 mt-2",
          cancelButtonClass: "btn btn-danger w-xs mt-2",
          buttonsStyling: !1,
          showCloseButton: !0,
        });
      }),
  document.getElementById("sa-error") &&
    document.getElementById("sa-error").addEventListener("click", function () {
      Swal.fire({
        title: "Oops...",
        text: "Something went wrong!",
        icon: "error",
        confirmButtonClass: "btn btn-primary w-xs mt-2",
        buttonsStyling: !1,
        footer: '<a href="">Why do I have this issue?</a>',
        showCloseButton: !0,
      });
    }),
  document.getElementById("sa-longcontent") &&
    document
      .getElementById("sa-longcontent")
      .addEventListener("click", function () {
        Swal.fire({
          imageUrl: "https://placeholder.pics/svg/300x1500",
          imageHeight: 1500,
          imageAlt: "A tall image",
          confirmButtonClass: "btn btn-primary w-xs mt-2",
          buttonsStyling: !1,
          showCloseButton: !0,
        });
      }),
  document.getElementById("sa-warning") &&
    document
      .getElementById("sa-warning")
      .addEventListener("click", function () {
        Swal.fire({
          title: "Are you sure?",
          text: "You won't be able to revert this!",
          icon: "warning",
          showCancelButton: !0,
          confirmButtonClass: "btn btn-primary w-xs me-2 mt-2",
          cancelButtonClass: "btn btn-danger w-xs mt-2",
          confirmButtonText: "Yes, delete it!",
          buttonsStyling: !1,
          showCloseButton: !0,
        }).then(function (t) {
          t.value &&
            Swal.fire({
              title: "Deleted!",
              text: "Your file has been deleted.",
              icon: "success",
              confirmButtonClass: "btn btn-primary w-xs mt-2",
              buttonsStyling: !1,
            });
        });
      }),
  document.getElementById("sa-params") &&
    document.getElementById("sa-params").addEventListener("click", function () {
      Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: !0,
        confirmButtonText: "Yes, delete it!",
        cancelButtonText: "No, cancel!",
        confirmButtonClass: "btn btn-primary w-xs me-2 mt-2",
        cancelButtonClass: "btn btn-danger w-xs mt-2",
        buttonsStyling: !1,
        showCloseButton: !0,
      }).then(function (t) {
        t.value
          ? Swal.fire({
              title: "Deleted!",
              text: "Your file has been deleted.",
              icon: "success",
              confirmButtonClass: "btn btn-primary w-xs mt-2",
              buttonsStyling: !1,
            })
          : t.dismiss === Swal.DismissReason.cancel &&
            Swal.fire({
              title: "Cancelled",
              text: "Your imaginary file is safe :)",
              icon: "error",
              confirmButtonClass: "btn btn-primary mt-2",
              buttonsStyling: !1,
            });
      });
    }),
  document.getElementById("sa-image") &&
    document.getElementById("sa-image").addEventListener("click", function () {
      Swal.fire({
        title: "Sweet!",
        text: "Modal with a custom image.",
        imageUrl: "assets/images/logo-sm.png",
        imageHeight: 40,
        confirmButtonClass: "btn btn-primary w-xs mt-2",
        buttonsStyling: !1,
        animation: !1,
        showCloseButton: !0,
      });
    }),
  document.getElementById("sa-close") &&
    document.getElementById("sa-close").addEventListener("click", function () {
      var t;
      Swal.fire({
        title: "Auto close alert!",
        html: "I will close in <strong></strong> seconds.",
        timer: 2e3,
        timerProgressBar: !0,
        showCloseButton: !0,
        didOpen: function () {
          Swal.showLoading(),
            (t = setInterval(function () {
              var t = Swal.getHtmlContainer();
              t &&
                (t = t.querySelector("b")) &&
                (t.textContent = Swal.getTimerLeft());
            }, 100));
        },
        onClose: function () {
          clearInterval(t);
        },
      }).then(function (t) {
        t.dismiss === Swal.DismissReason.timer &&
          console.log("I was closed by the timer");
      });
    }),
  document.getElementById("custom-html-alert") &&
    document
      .getElementById("custom-html-alert")
      .addEventListener("click", function () {
        Swal.fire({
          title: "<i>HTML</i> <u>example</u>",
          icon: "info",
          html: 'You can use <b>bold text</b>, <a href="//Themesbrand.in/">links</a> and other HTML tags',
          showCloseButton: !0,
          showCancelButton: !0,
          confirmButtonClass: "btn btn-success me-2",
          cancelButtonClass: "btn btn-danger",
          buttonsStyling: !1,
          confirmButtonText:
            '<i class="ri-thumb-up-fill align-bottom me-1"></i> Great!',
          cancelButtonText: '<i class="ri-thumb-down-fill align-bottom"></i>',
        });
      }),
  document.getElementById("sa-dialog-three-btn") &&
    document
      .getElementById("sa-dialog-three-btn")
      .addEventListener("click", function () {
        Swal.fire({
          title: "Do you want to save the changes?",
          showDenyButton: !0,
          showCancelButton: !0,
          confirmButtonText: "Save",
          confirmButtonClass: "btn btn-success w-xs me-2",
          cancelButtonClass: "btn btn-danger w-xs",
          denyButtonClass: "btn btn-info w-xs me-2",
          buttonsStyling: !1,
          denyButtonText: "Don't save",
          showCloseButton: !0,
        }).then(function (t) {
          t.isConfirmed
            ? Swal.fire({
                title: "Saved!",
                icon: "success",
                confirmButtonClass: "btn btn-primary w-xs",
                buttonsStyling: !1,
              })
            : t.isDenied &&
              Swal.fire({
                title: "Changes are not saved",
                icon: "info",
                confirmButtonClass: "btn btn-primary w-xs",
                buttonsStyling: !1,
              });
        });
      }),
  document.getElementById("sa-position") &&
    document
      .getElementById("sa-position")
      .addEventListener("click", function () {
        Swal.fire({
          position: "top-end",
          icon: "success",
          title: "Your work has been saved",
          showConfirmButton: !1,
          timer: 1500,
          showCloseButton: !0,
        });
      }),
  document.getElementById("custom-padding-width-alert") &&
    document
      .getElementById("custom-padding-width-alert")
      .addEventListener("click", function () {
        Swal.fire({
          title: "Custom width, padding, background.",
          width: 600,
          padding: 100,
          confirmButtonClass: "btn btn-primary w-xs",
          buttonsStyling: !1,
          background: "#fff url(assets/images/chat-bg-pattern.png)",
        });
      }),
  document.getElementById("ajax-alert") &&
    document
      .getElementById("ajax-alert")
      .addEventListener("click", function () {
        Swal.fire({
          title: "Submit email to run ajax request",
          input: "email",
          showCancelButton: !0,
          confirmButtonText: "Submit",
          showLoaderOnConfirm: !0,
          confirmButtonClass: "btn btn-primary w-xs me-2",
          cancelButtonClass: "btn btn-danger w-xs",
          buttonsStyling: !1,
          showCloseButton: !0,
          preConfirm: function (n) {
            return new Promise(function (t, e) {
              setTimeout(function () {
                "taken@example.com" === n
                  ? e("This email is already taken.")
                  : t();
              }, 2e3);
            });
          },
          allowOutsideClick: !1,
        }).then(function (t) {
          Swal.fire({
            icon: "success",
            title: "Ajax request finished!",
            confirmButtonClass: "btn btn-primary w-xs",
            buttonsStyling: !1,
            html: "Submitted email: " + t,
          });
        });
      }),
  document.getElementById("custom-sa-success") &&
    document
      .getElementById("custom-sa-success")
      .addEventListener("click", function () {
        Swal.fire({
          html: '<div class="mt-3"><lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon><div class="mt-4 pt-2 fs-15"><h4>Well done !</h4><p class="text-muted mx-4 mb-0">Aww yeah, you successfully read this important message.</p></div></div>',
          showCancelButton: !0,
          showConfirmButton: !1,
          cancelButtonClass: "btn btn-primary w-xs mb-1",
          cancelButtonText: "Back",
          buttonsStyling: !1,
          showCloseButton: !0,
        });
      }),
  document.getElementById("custom-sa-error") &&
    document
      .getElementById("custom-sa-error")
      .addEventListener("click", function () {
        Swal.fire({
          html: '<div class="mt-3"><lord-icon src="https://cdn.lordicon.com/tdrtiskw.json" trigger="loop" colors="primary:#f06548,secondary:#f7b84b" style="width:120px;height:120px"></lord-icon><div class="mt-4 pt-2 fs-15"><h4>Oops...! Something went Wrong !</h4><p class="text-muted mx-4 mb-0">Your email Address is invalid</p></div></div>',
          showCancelButton: !0,
          showConfirmButton: !1,
          cancelButtonClass: "btn btn-primary w-xs mb-1",
          cancelButtonText: "Dismiss",
          buttonsStyling: !1,
          showCloseButton: !0,
        });
      }),
  document.getElementById("custom-sa-warning") &&
    document
      .getElementById("custom-sa-warning")
      .addEventListener("click", function () {
        Swal.fire({
          html: '<div class="mt-3"><lord-icon src="https://cdn.lordicon.com/gsqxdxog.json" trigger="loop" colors="primary:#f7b84b,secondary:#f06548" style="width:100px;height:100px"></lord-icon><div class="mt-4 pt-2 fs-15 mx-5"><h4>Are you Sure ?</h4><p class="text-muted mx-4 mb-0">Are you Sure You want to Delete this Account ?</p></div></div>',
          showCancelButton: !0,
          confirmButtonClass: "btn btn-primary w-xs me-2 mb-1",
          confirmButtonText: "Yes, Delete It!",
          cancelButtonClass: "btn btn-danger w-xs mb-1",
          buttonsStyling: !1,
          showCloseButton: !0,
        });
      }),
  document.getElementById("custom-sa-community") &&
    document
      .getElementById("custom-sa-community")
      .addEventListener("click", function () {
        Swal.fire({
          title: "Join Our Community",
          html: '<div class="mt-3 text-start"><label for="input-email" class="form-label fs-13">Email</label><input type="email" class="form-control" id="input-email" placeholder="Enter Email Address"></div>',
          imageUrl: "assets/images/logo-sm.png",
          footer:
            '<p class="fs-13 text-muted mb-0">Already have an account ? <a href="#" class="fw-semibold text-decoration-underline"> Signin </a> </p>',
          imageHeight: 40,
          confirmButtonClass: "btn btn-primary w-xs mb-2",
          confirmButtonText:
            'Register <i class="ri-arrow-right-line ms-1 align-bottom"></i>',
          buttonsStyling: !1,
          showCloseButton: !0,
        });
      }),
  document.getElementById("custom-sa-email-verify") &&
    document
      .getElementById("custom-sa-email-verify")
      .addEventListener("click", function () {
        Swal.fire({
          html: '<div class="mt-3"><div class="avatar-lg mx-auto"><div class="avatar-title bg-light text-success display-5 rounded-circle"><i class="ri-mail-send-fill"></i></div></div><div class="mt-4 pt-2 fs-15"><h4 class="fs-20 fw-semibold">Verify Your Email</h4><p class="text-muted mb-0 mt-3 fs-13">We have sent you verification email <span class="fw-medium text-dark">example@abc.com</span>, <br/> Please check it.</p></div></div>',
          showCancelButton: !1,
          confirmButtonClass: "btn btn-primary mb-1",
          confirmButtonText: "Verify Email",
          buttonsStyling: !1,
          footer:
            '<p class="fs-14 text-muted mb-0">Didn\'t receive an email ? <a href="#" class="fw-semibold text-decoration-underline">Resend</a></p>',
          showCloseButton: !0,
        });
      }),
  document.getElementById("custom-sa-notification") &&
    document
      .getElementById("custom-sa-notification")
      .addEventListener("click", function () {
        Swal.fire({
          html: '<div class="mt-3"><div class="avatar-lg mx-auto"><img src="assets/images/users/avatar-2.jpg" class="rounded-circle img-thumbnail" alt="thumbnail"></div><div class="mt-4 pt-2 fs-15"><h4 class="fs-18 fw-semibold">Welcome <span class="fw-semibold">Mike Mayer</span></h4><p class="text-muted mb-0 fs-13">You have <span class="fw-semibold text-success">2</span> Notifications</p></div></div>',
          showCancelButton: !1,
          confirmButtonClass: "btn btn-primary mb-1",
          confirmButtonText:
            'Show Me <i class="ri-arrow-right-line ms-1 align-bottom"></i>',
          buttonsStyling: !1,
          showCloseButton: !0,
        });
      });
