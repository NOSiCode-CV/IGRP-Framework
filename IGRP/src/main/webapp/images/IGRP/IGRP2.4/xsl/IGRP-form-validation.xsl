<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->


        <xsl:call-template name="igrp-head"/>

      </head>
      <body class="">
        <div id="layout-wrapper">
          <xsl:call-template name="igrp-header"/>
          <xsl:call-template name="igrp-sidebar"/>
          <div class="main-content">
            <div class="page-content">
              <div class="container-fluid">
                <xsl:call-template name="igrp-page-title"/>
                <div class="igrp-page-contents">

                  <!-- page content -->
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Browser defaults</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="FormValidationDefault" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="FormValidationDefault"></input>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Not interested in custom validation feedback messages or writing JavaScript to change form behaviors? All good, you can use the browser defaults. Try submitting the form below. Depending on your browser and OS, you’ll see a slightly different style of feedback.While these feedback styles cannot be styled with CSS, you can still customize the feedback text through JavaScript.</p>

                            <div class="live-preview">
                              <form class="row g-3">
                                <div class="col-md-4">
                                  <label for="validationDefault01" class="form-label">First name</label>
                                  <input type="text" class="form-control" id="validationDefault01" value="Mark" required=""/>
                                </div>
                                <div class="col-md-4">
                                  <label for="validationDefault02" class="form-label">Last name</label>
                                  <input type="text" class="form-control" id="validationDefault02" value="Otto" required=""/>
                                </div>
                                <div class="col-md-4">
                                  <label for="validationDefaultUsername" class="form-label">Username</label>
                                  <div class="input-group">
                                    <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                    <input type="text" class="form-control" id="validationDefaultUsername" aria-describedby="inputGroupPrepend2" required=""/>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <label for="validationDefault03" class="form-label">City</label>
                                  <input type="text" class="form-control" id="validationDefault03" required=""/>
                                </div>
                                <div class="col-md-3">
                                  <label for="validationDefault04" class="form-label">State</label>
                                  <select class="form-select" id="validationDefault04" required="">
                                    <option selected="" disabled="" value="">Choose...</option>
                                    <option>...</option>
                                  </select>
                                </div>
                                <div class="col-md-3">
                                  <label for="validationDefault05" class="form-label">Zip</label>
                                  <input type="text" class="form-control" id="validationDefault05" required=""/>
                                </div>
                                <div class="col-12">
                                  <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required=""/>
                                    <label class="form-check-label" for="invalidCheck2">
                                                        Agree to terms and conditions
                                    </label>
                                  </div>
                                </div>
                                <div class="col-12">
                                  <button class="btn btn-primary" type="submit">Submit form</button>
                                </div>
                              </form>
                            </div>


                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 352px">
                                <code>&lt;form class=&quot;row g-3&quot;&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;
        &lt;label for=&quot;validationDefault01&quot; class=&quot;form-label&quot;&gt;First name&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationDefault01&quot; value=&quot;Mark&quot; required&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;
        &lt;label for=&quot;validationDefault02&quot; class=&quot;form-label&quot;&gt;Last name&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationDefault02&quot; value=&quot;Otto&quot; required&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;
        &lt;label for=&quot;validationDefaultUsername&quot; class=&quot;form-label&quot;&gt;Username&lt;/label&gt;
        &lt;div class=&quot;input-group&quot;&gt;
            &lt;span class=&quot;input-group-text&quot; id=&quot;inputGroupPrepend2&quot;&gt;@&lt;/span&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationDefaultUsername&quot; aria-describedby=&quot;inputGroupPrepend2&quot;
                required&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-6&quot;&gt;
        &lt;label for=&quot;validationDefault03&quot; class=&quot;form-label&quot;&gt;City&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationDefault03&quot; required&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-3&quot;&gt;
        &lt;label for=&quot;validationDefault04&quot; class=&quot;form-label&quot;&gt;State&lt;/label&gt;
        &lt;select class=&quot;form-select&quot; id=&quot;validationDefault04&quot; required&gt;
            &lt;option selected disabled value=&quot;&quot;&gt;Choose...&lt;/option&gt;
            &lt;option&gt;...&lt;/option&gt;
        &lt;/select&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-3&quot;&gt;
        &lt;label for=&quot;validationDefault05&quot; class=&quot;form-label&quot;&gt;Zip&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationDefault05&quot; required&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-12&quot;&gt;
        &lt;div class=&quot;form-check&quot;&gt;
            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;invalidCheck2&quot; required&gt;
            &lt;label class=&quot;form-check-label&quot; for=&quot;invalidCheck2&quot;&gt;
                Agree to terms and conditions
            &lt;/label&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-12&quot;&gt;
        &lt;button class=&quot;btn btn-primary&quot; type=&quot;submit&quot;&gt;Submit form&lt;/button&gt;
    &lt;/div&gt;
&lt;/form&gt;</code>
                              </pre>
                            </div>

                          </div>
                        </div>
                      </div>                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Custom Styles</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="FormVaidationCustom" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="FormVaidationCustom"></input>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">For custom Bootstrap form validation messages, you’ll need to add the <code>novalidate</code> boolean attribute to your <code>&lt;form&gt;</code>. This disables the browser default feedback tooltips, but still provides access to the form validation APIs in JavaScript. Try to submit the form below; our JavaScript will intercept the submit button and relay feedback to you. When attempting to submit, you’ll see the <code>:invalid</code> and <code>:valid</code> styles applied to your form controls.</p>

                            <div class="live-preview">
                              <form class="row g-3 needs-validation" novalidate="">
                                <div class="col-md-4">
                                  <label for="validationCustom01" class="form-label">First name</label>
                                  <input type="text" class="form-control" id="validationCustom01" value="Mark" required=""/>
                                  <div class="valid-feedback">
                                                    Looks good!
                                  </div>
                                </div>
                                <div class="col-md-4">
                                  <label for="validationCustom02" class="form-label">Last name</label>
                                  <input type="text" class="form-control" id="validationCustom02" value="Otto" required=""/>
                                  <div class="valid-feedback">
                                                    Looks good!
                                  </div>
                                </div>
                                <div class="col-md-4">
                                  <label for="validationCustomUsername" class="form-label">Username</label>
                                  <div class="input-group has-validation">
                                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                                    <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required=""/>
                                    <div class="invalid-feedback">
                                                        Please choose a username.
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <label for="validationCustom03" class="form-label">City</label>
                                  <input type="text" class="form-control" id="validationCustom03" required=""/>
                                  <div class="invalid-feedback">
                                                    Please provide a valid city.
                                  </div>
                                </div>
                                <div class="col-md-3">
                                  <label for="validationCustom04" class="form-label">State</label>
                                  <select class="form-select" id="validationCustom04" required="">
                                    <option selected="" disabled="" value="">Choose...</option>
                                    <option>...</option>
                                  </select>
                                  <div class="invalid-feedback">
                                                    Please select a valid state.
                                  </div>
                                </div>
                                <div class="col-md-3">
                                  <label for="validationCustom05" class="form-label">Zip</label>
                                  <input type="text" class="form-control" id="validationCustom05" required=""/>
                                  <div class="invalid-feedback">
                                                    Please provide a valid zip.
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required=""/>
                                    <label class="form-check-label" for="invalidCheck">
                                                        Agree to terms and conditions
                                    </label>
                                    <div class="invalid-feedback">
                                                        You must agree before submitting.
                                    </div>
                                  </div>
                                </div>
                                <div class="col-12">
                                  <button class="btn btn-primary" type="submit">Submit form</button>
                                </div>
                              </form>
                            </div>


                            <div class="d-none code-view">
                              <pre class="language-markup">
                                <code>&lt;form class=&quot;row g-3 needs-validation&quot; novalidate&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;
        &lt;label for=&quot;validationCustom01&quot; class=&quot;form-label&quot;&gt;First name&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationCustom01&quot; value=&quot;Mark&quot; required&gt;
        &lt;div class=&quot;valid-feedback&quot;&gt;
            Looks good!
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;
        &lt;label for=&quot;validationCustom02&quot; class=&quot;form-label&quot;&gt;Last name&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationCustom02&quot; value=&quot;Otto&quot; required&gt;
        &lt;div class=&quot;valid-feedback&quot;&gt;
            Looks good!
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;
        &lt;label for=&quot;validationCustomUsername&quot; class=&quot;form-label&quot;&gt;Username&lt;/label&gt;
        &lt;div class=&quot;input-group has-validation&quot;&gt;
            &lt;span class=&quot;input-group-text&quot; id=&quot;inputGroupPrepend&quot;&gt;@&lt;/span&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationCustomUsername&quot; aria-describedby=&quot;inputGroupPrepend&quot;
                required&gt;
            &lt;div class=&quot;invalid-feedback&quot;&gt;
                Please choose a username.
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-6&quot;&gt;
        &lt;label for=&quot;validationCustom03&quot; class=&quot;form-label&quot;&gt;City&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationCustom03&quot; required&gt;
        &lt;div class=&quot;invalid-feedback&quot;&gt;
            Please provide a valid city.
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-3&quot;&gt;
        &lt;label for=&quot;validationCustom04&quot; class=&quot;form-label&quot;&gt;State&lt;/label&gt;
        &lt;select class=&quot;form-select&quot; id=&quot;validationCustom04&quot; required&gt;
            &lt;option selected disabled value=&quot;&quot;&gt;Choose...&lt;/option&gt;
            &lt;option&gt;...&lt;/option&gt;
        &lt;/select&gt;
        &lt;div class=&quot;invalid-feedback&quot;&gt;
            Please select a valid state.
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-3&quot;&gt;
        &lt;label for=&quot;validationCustom05&quot; class=&quot;form-label&quot;&gt;Zip&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationCustom05&quot; required&gt;
        &lt;div class=&quot;invalid-feedback&quot;&gt;
            Please provide a valid zip.
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-12&quot;&gt;
        &lt;div class=&quot;form-check&quot;&gt;
            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;invalidCheck&quot; required&gt;
            &lt;label class=&quot;form-check-label&quot; for=&quot;invalidCheck&quot;&gt;
                Agree to terms and conditions
            &lt;/label&gt;
            &lt;div class=&quot;invalid-feedback&quot;&gt;
                You must agree before submitting.
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-12&quot;&gt;
        &lt;button class=&quot;btn btn-primary&quot; type=&quot;submit&quot;&gt;Submit form&lt;/button&gt;
    &lt;/div&gt;
&lt;/form&gt;</code>
                              </pre>
                            </div>

                          </div>
                        </div>
                      </div>                      <!-- end col -->

                      <div class="row">
                        <div class="col-lg-12">
                          <div class="card">
                            <div class="card-header align-items-center d-flex">
                              <h4 class="card-title mb-0 flex-grow-1">Supported Elements</h4>
                              <div class="flex-shrink-0">
                                <div class="form-check form-switch form-switch-right form-switch-md">
                                  <label for="FormVaidationSupported" class="form-label text-muted">Show Code</label>
                                  <input class="form-check-input code-switcher" type="checkbox" id="FormVaidationSupported"></input>
                                </div>
                              </div>
                            </div>                            <!-- end card header -->

                            <div class="card-body">
                              <p class="text-muted">Block-level or inline-level form text can be created using <code>.form-text</code>.
                              </p>

                              <div class="live-preview">
                                <form class="was-validated">
                                  <div class="mb-3">
                                    <label for="validationTextarea" class="form-label">Textarea</label>
                                    <textarea class="form-control" id="validationTextarea" placeholder="Required example textarea" required=""></textarea>
                                    <div class="invalid-feedback">
                                                        Please enter a message in the textarea.
                                    </div>
                                  </div>

                                  <div class="form-check mb-3">
                                    <input type="checkbox" class="form-check-input" id="validationFormCheck1" required=""/>
                                    <label class="form-check-label" for="validationFormCheck1">Check this checkbox</label>
                                    <div class="invalid-feedback">Example invalid feedback text</div>
                                  </div>

                                  <div class="form-check">
                                    <input type="radio" class="form-check-input" id="validationFormCheck2" name="radio-stacked" required="">
                                      <label class="form-check-label" for="validationFormCheck2">Toggle this radio</label>
                                    </input>
                                  </div>
                                  <div class="form-check mb-3">
                                    <input type="radio" class="form-check-input" id="validationFormCheck3" name="radio-stacked" required="">
                                      <label class="form-check-label" for="validationFormCheck3">Or toggle this other radio</label>
                                      <div class="invalid-feedback">More example invalid feedback text</div>
                                    </input>
                                  </div>

                                  <div class="mb-3">
                                    <select class="form-select" required="" aria-label="select example">
                                      <option value="">Open this select menu</option>
                                      <option value="1">One</option>
                                      <option value="2">Two</option>
                                      <option value="3">Three</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid select feedback</div>
                                  </div>

                                  <div class="mb-3">
                                    <input type="file" class="form-control" aria-label="file example" required=""/>
                                    <div class="invalid-feedback">Example invalid form file feedback</div>
                                  </div>

                                  <div class="mb-0">
                                    <button class="btn btn-primary" type="submit" disabled="">Submit form</button>
                                  </div>
                                </form>
                              </div>


                              <div class="d-none code-view">
                                <pre class="language-markup" style="height: 352px">
                                  <code>&lt;form class=&quot;was-validated&quot;&gt;
        &lt;div class=&quot;mb-3&quot;&gt;
            &lt;label for=&quot;validationTextarea&quot; class=&quot;form-label&quot;&gt;Textarea&lt;/label&gt;
            &lt;textarea class=&quot;form-control&quot; id=&quot;validationTextarea&quot; placeholder=&quot;Required example textarea&quot;
                required&gt;&lt;/textarea&gt;
            &lt;div class=&quot;invalid-feedback&quot;&gt;
                Please enter a message in the textarea.
            &lt;/div&gt;
        &lt;/div&gt;

        &lt;div class=&quot;form-check mb-3&quot;&gt;
            &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;validationFormCheck1&quot; required&gt;
            &lt;label class=&quot;form-check-label&quot; for=&quot;validationFormCheck1&quot;&gt;Check this checkbox&lt;/label&gt;
            &lt;div class=&quot;invalid-feedback&quot;&gt;Example invalid feedback text&lt;/div&gt;
        &lt;/div&gt;

        &lt;div class=&quot;form-check&quot;&gt;
            &lt;input type=&quot;radio&quot; class=&quot;form-check-input&quot; id=&quot;validationFormCheck2&quot; name=&quot;radio-stacked&quot; required&gt;
            &lt;label class=&quot;form-check-label&quot; for=&quot;validationFormCheck2&quot;&gt;Toggle this radio&lt;/label&gt;
        &lt;/div&gt;
        &lt;div class=&quot;form-check mb-3&quot;&gt;
            &lt;input type=&quot;radio&quot; class=&quot;form-check-input&quot; id=&quot;validationFormCheck3&quot; name=&quot;radio-stacked&quot; required&gt;
            &lt;label class=&quot;form-check-label&quot; for=&quot;validationFormCheck3&quot;&gt;Or toggle this other radio&lt;/label&gt;
            &lt;div class=&quot;invalid-feedback&quot;&gt;More example invalid feedback text&lt;/div&gt;
        &lt;/div&gt;

        &lt;div class=&quot;mb-3&quot;&gt;
            &lt;select class=&quot;form-select&quot; required aria-label=&quot;select example&quot;&gt;
                &lt;option value=&quot;&quot;&gt;Open this select menu&lt;/option&gt;
                &lt;option value=&quot;1&quot;&gt;One&lt;/option&gt;
                &lt;option value=&quot;2&quot;&gt;Two&lt;/option&gt;
                &lt;option value=&quot;3&quot;&gt;Three&lt;/option&gt;
            &lt;/select&gt;
            &lt;div class=&quot;invalid-feedback&quot;&gt;Example invalid select feedback&lt;/div&gt;
        &lt;/div&gt;

        &lt;div class=&quot;mb-3&quot;&gt;
            &lt;input type=&quot;file&quot; class=&quot;form-control&quot; aria-label=&quot;file example&quot; required&gt;
            &lt;div class=&quot;invalid-feedback&quot;&gt;Example invalid form file feedback&lt;/div&gt;
        &lt;/div&gt;

        &lt;div class=&quot;mb-3&quot;&gt;
            &lt;button class=&quot;btn btn-primary&quot; type=&quot;submit&quot; disabled&gt;Submit form&lt;/button&gt;
        &lt;/div&gt;
    &lt;/form&gt;</code>
                                </pre>
                              </div>

                            </div>
                          </div>
                        </div>                        <!-- end col -->
                      </div>
                      <!-- end row -->

                      <div class="row">
                        <div class="col-lg-12">
                          <div class="card">
                            <div class="card-header align-items-center d-flex">
                              <h4 class="card-title mb-0 flex-grow-1">Tooltips</h4>
                              <div class="flex-shrink-0">
                                <div class="form-check form-switch form-switch-right form-switch-md">
                                  <label for="FormVaidationTooltip" class="form-label text-muted">Show Code</label>
                                  <input class="form-check-input code-switcher" type="checkbox" id="FormVaidationTooltip"></input>
                                </div>
                              </div>
                            </div>                            <!-- end card header -->

                            <div class="card-body">
                              <p class="text-muted">If your form layout allows it, you can swap the <code>.{valid|invalid}-feedback</code> classes for <code>.{valid|invalid}-tooltip</code> classes to display validation feedback in a styled tooltip. Be sure to have a parent with <code>position: relative</code> on it for tooltip positioning. In the example below, our column classes have this already, but your project may require an alternative setup.</p>

                              <div class="live-preview">
                                <form class="row g-3 needs-validation" novalidate="">
                                  <div class="col-md-4 position-relative">
                                    <label for="validationTooltip01" class="form-label">First name</label>
                                    <input type="text" class="form-control" id="validationTooltip01" value="Mark" required=""/>
                                    <div class="valid-tooltip">
                                                        Looks good!
                                    </div>
                                  </div>
                                  <div class="col-md-4 position-relative">
                                    <label for="validationTooltip02" class="form-label">Last name</label>
                                    <input type="text" class="form-control" id="validationTooltip02" value="Otto" required=""/>
                                    <div class="valid-tooltip">
                                                        Looks good!
                                    </div>
                                  </div>
                                  <div class="col-md-4 position-relative">
                                    <label for="validationTooltipUsername" class="form-label">Username</label>
                                    <div class="input-group has-validation">
                                      <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
                                      <input type="text" class="form-control" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" required=""/>
                                      <div class="invalid-tooltip">
                                                            Please choose a unique and valid username.
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-md-6 position-relative">
                                    <label for="validationTooltip03" class="form-label">City</label>
                                    <input type="text" class="form-control" id="validationTooltip03" required=""/>
                                    <div class="invalid-tooltip">
                                                        Please provide a valid city.
                                    </div>
                                  </div>
                                  <div class="col-md-3 position-relative">
                                    <label for="validationTooltip04" class="form-label">State</label>
                                    <select class="form-select" id="validationTooltip04" required="">
                                      <option selected="" disabled="" value="">Choose...</option>
                                      <option>...</option>
                                    </select>
                                    <div class="invalid-tooltip">
                                                        Please select a valid state.
                                    </div>
                                  </div>
                                  <div class="col-md-3 position-relative">
                                    <label for="validationTooltip05" class="form-label">Zip</label>
                                    <input type="text" class="form-control" id="validationTooltip05" required=""/>
                                    <div class="invalid-tooltip">
                                                        Please provide a valid zip.
                                    </div>
                                  </div>
                                  <div class="col-12">
                                    <button class="btn btn-primary" type="submit">Submit form</button>
                                  </div>
                                </form>
                              </div>
                              <div class="d-none code-view">
                                <pre class="language-markup">
                                  <code>&lt;form class=&quot;row g-3 needs-validation&quot; novalidate&gt;
        &lt;div class=&quot;col-md-4 position-relative&quot;&gt;
            &lt;label for=&quot;validationTooltip01&quot; class=&quot;form-label&quot;&gt;First name&lt;/label&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationTooltip01&quot; value=&quot;Mark&quot; required&gt;
            &lt;div class=&quot;valid-tooltip&quot;&gt;
                Looks good!
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-md-4 position-relative&quot;&gt;
            &lt;label for=&quot;validationTooltip02&quot; class=&quot;form-label&quot;&gt;Last name&lt;/label&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationTooltip02&quot; value=&quot;Otto&quot; required&gt;
            &lt;div class=&quot;valid-tooltip&quot;&gt;
                Looks good!
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-md-4 position-relative&quot;&gt;
            &lt;label for=&quot;validationTooltipUsername&quot; class=&quot;form-label&quot;&gt;Username&lt;/label&gt;
            &lt;div class=&quot;input-group has-validation&quot;&gt;
                &lt;span class=&quot;input-group-text&quot; id=&quot;validationTooltipUsernamePrepend&quot;&gt;@&lt;/span&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationTooltipUsername&quot; aria-describedby=&quot;validationTooltipUsernamePrepend&quot; required&gt;
                &lt;div class=&quot;invalid-tooltip&quot;&gt;
                    Please choose a unique and valid username.
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-md-6 position-relative&quot;&gt;
            &lt;label for=&quot;validationTooltip03&quot; class=&quot;form-label&quot;&gt;City&lt;/label&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationTooltip03&quot; required&gt;
            &lt;div class=&quot;invalid-tooltip&quot;&gt;
                Please provide a valid city.
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-md-3 position-relative&quot;&gt;
            &lt;label for=&quot;validationTooltip04&quot; class=&quot;form-label&quot;&gt;State&lt;/label&gt;
            &lt;select class=&quot;form-select&quot; id=&quot;validationTooltip04&quot; required&gt;
                &lt;option selected disabled value=&quot;&quot;&gt;Choose...&lt;/option&gt;
                &lt;option&gt;...&lt;/option&gt;
            &lt;/select&gt;
            &lt;div class=&quot;invalid-tooltip&quot;&gt;
                Please select a valid state.
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-md-3 position-relative&quot;&gt;
            &lt;label for=&quot;validationTooltip05&quot; class=&quot;form-label&quot;&gt;Zip&lt;/label&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;validationTooltip05&quot; required&gt;
            &lt;div class=&quot;invalid-tooltip&quot;&gt;
                Please provide a valid zip.
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-12&quot;&gt;
            &lt;button class=&quot;btn btn-primary&quot; type=&quot;submit&quot;&gt;Submit form&lt;/button&gt;
        &lt;/div&gt;
    &lt;/form&gt;</code>
                                </pre>
                              </div>

                            </div>
                          </div>
                        </div>                        <!-- end col -->

                      </div>
                      <!-- end row -->

                    </div>

                  </div>                  <!-- container-fluid -->

                </div>
              </div>
            </div>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>


        <xsl:call-template name="igrp-page-helpers"/>

        <!-- page includes JS -->

        <!-- prismjs plugin -->
        <script src="{$path}/libs/prismjs/prism.js"></script>

        <script src="{$themePath}/assets/js/pages/form-validation.init.js"></script>



        <xsl:call-template name="igrp-scripts"/>



      </body>
    </html>
  </xsl:template>

  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1515664208567"/>

  <xsl:include href="../xsl/tmpl/parts.common.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.head.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.scripts.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.footer.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.sidebar.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.header.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
