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
                                                        <h4 class="card-title mb-0 flex-grow-1">Checkbox</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="default" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="default"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-6">
                                                                    <div>
                                                                        <p class="text-muted fw-medium">Default Checkbox</p>
                                                                        <p class="text-muted">Use <code>type="checkbox"</code> attribute to set a checkbox and add <code>checked</code>attribute to set a checkbox checked by default.</p>
                                                                        <div class="form-check mb-2">
                                                                            <input class="form-check-input" type="checkbox" id="formCheck1"/>
                                                                            <label class="form-check-label" for="formCheck1">
                                                            Default checkbox
                                                                            </label>
                                                                        </div>
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="formCheck2" checked=""/>
                                                                            <label class="form-check-label" for="formCheck2">
                                                            Checked checkbox
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-lg-4 col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <p class="text-muted fw-medium">Disabled Checkbox</p>
                                                                        <p class="text-muted">Use <code>disabled</code> attribute to set a checkbox disabled and add <code>checked</code> attribute to set a checkbox checked by default.</p>
                                                                        <div>
                                                                            <div class="form-check form-check-right mb-2">
                                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled=""/>
                                                                                <label class="form-check-label" for="flexCheckDisabled">
                                                                Disabled checkbox
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div>
                                                                            <div class="form-check form-check-right">
                                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedDisabled" checked="" disabled=""/>
                                                                                <label class="form-check-label" for="flexCheckCheckedDisabled">
                                                                Disabled checked checkbox
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-lg-4 col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <p class="text-muted fw-medium">Checkbox Right</p>
                                                                        <p class="text-muted">Use <code>form-check-right</code> class to form-check class to set a checkbox on the right side.</p>
                                                                        <div class="form-check form-check-right mb-2">
                                                                            <input class="form-check-input" type="checkbox" name="formCheckboxRight" id="formCheckboxRight1" checked=""/>
                                                                            <label class="form-check-label" for="formCheckboxRight1">
                                                            Form Radio Right
                                                                            </label>
                                                                        </div>
                                                                        <div>
                                                                            <div class="form-check form-check-right">
                                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedRightDisabled" checked="" disabled=""/>
                                                                                <label class="form-check-label" for="flexCheckCheckedRightDisabled">
                                                                Disabled checked checkbox
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <p class="text-muted fw-medium">Indeterminate</p>
                                                                        <div>
                                                                            <div class="form-check">
                                                                                <input class="form-check-input" type="checkbox" value="" id="defaultIndeterminateCheck"/>
                                                                                <label class="form-check-label" for="defaultIndeterminateCheck">
                                                                Indeterminate checkbox
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Base Example --&gt;
&lt;div class=&quot;form-check mb-2&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck1&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck1&quot;&gt;
        Default checkbox
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck2&quot; checked=&quot;&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck2&quot;&gt;
        Checked checkbox
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Disabled Checkbox --&gt;
&lt;div class=&quot;form-check form-check-right mb-2&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; name=&quot;formCheckboxRight&quot; id=&quot;formCheckboxRight1&quot; checked=&quot;&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheckboxRight1&quot;&gt;
        Form Radio Right
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div&gt;
    &lt;div class=&quot;form-check form-check-right&quot;&gt;
        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;flexCheckCheckedDisabled&quot; checked disabled&gt;
        &lt;label class=&quot;form-check-label&quot; for=&quot;flexCheckCheckedDisabled&quot;&gt;
            Disabled checked checkbox
        &lt;/label&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Form Checkbox Right --&gt;
&lt;div class=&quot;form-check form-check-right mb-2&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; name=&quot;formCheckboxRight&quot; id=&quot;formCheckboxRight1&quot; checked=&quot;&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheckboxRight1&quot;&gt;
        Form Radio Right
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div&gt;
    &lt;div class=&quot;form-check form-check-right&quot;&gt;
        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;flexCheckCheckedDisabled&quot; checked disabled&gt;
        &lt;label class=&quot;form-check-label&quot; for=&quot;flexCheckCheckedDisabled&quot;&gt;
            Disabled checked checkbox
        &lt;/label&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Indeterminate --&gt;
&lt;div class=&quot;form-check&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;flexCheckIndeterminate&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexCheckIndeterminate&quot;&gt;
      Indeterminate checkbox
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end col -->
                                        </div>


                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Custom Checkboxes</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="custom-checkboxes-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="custom-checkboxes-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div>

                                                                        <p class="text-muted">Use <code>form-check-</code> class with below-mentioned color variation to set a color checkbox.</p>
                                                                        <!-- Bootstrap Custom Checkboxes color -->
                                                                        <div>
                                                                            <div class="form-check mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck6" checked=""/>
                                                                                <label class="form-check-label" for="formCheck6">
                                                                Checkbox Primary
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-secondary mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck7" checked=""/>
                                                                                <label class="form-check-label" for="formCheck7">
                                                                Checkbox Secondary
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-success mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck8" checked=""/>
                                                                                <label class="form-check-label" for="formCheck8">
                                                                Checkbox Success
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-warning mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck9" checked=""/>
                                                                                <label class="form-check-label" for="formCheck9">
                                                                Checkbox Warning
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-danger mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck10" checked=""/>
                                                                                <label class="form-check-label" for="formCheck10">
                                                                Checkbox Danger
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-info mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck11" checked=""/>
                                                                                <label class="form-check-label" for="formCheck11">
                                                                Checkbox Info
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-dark">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck12" checked=""/>
                                                                                <label class="form-check-label" for="formCheck12">
                                                                Checkbox Dark
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <p class="text-muted">Use <code>form-check-outline</code> class and <code>form-check-</code> class with below-mentioned color variation to set a color checkbox with outline.</p>
                                                                        <!-- Bootstrap Custom Outline Checkboxes -->
                                                                        <div>
                                                                            <div class="form-check form-check-outline form-check-primary mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck13" checked=""/>
                                                                                <label class="form-check-label" for="formCheck13">
                                                                Checkbox Outline Primary
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-outline form-check-secondary mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck14" checked=""/>
                                                                                <label class="form-check-label" for="formCheck14">
                                                                Checkbox Outline Secondary
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-outline form-check-success mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck15" checked=""/>
                                                                                <label class="form-check-label" for="formCheck15">
                                                                Checkbox Outline Success
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-outline form-check-warning mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck16" checked=""/>
                                                                                <label class="form-check-label" for="formCheck16">
                                                                Checkbox Outline Warning
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-outline form-check-danger mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck17" checked=""/>
                                                                                <label class="form-check-label" for="formCheck17">
                                                                Checkbox Outline Danger
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-outline form-check-info mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck18" checked=""/>
                                                                                <label class="form-check-label" for="formCheck18">
                                                                Checkbox Outline Info
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-check form-check-outline form-check-dark">
                                                                                <input class="form-check-input" type="checkbox" id="formCheck19" checked=""/>
                                                                                <label class="form-check-label" for="formCheck19">
                                                                Checkbox Outline Dark
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Custom Checkboxes Color --&gt;
&lt;div class=&quot;form-check mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck6&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck6&quot;&gt;
        Checkbox Primary
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-secondary mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck7&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck7&quot;&gt;
        Checkbox Secondary
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-success mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck8&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck8&quot;&gt;
        Checkbox Success
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <Code>&lt;div class=&quot;form-check form-check-warning mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck9&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck9&quot;&gt;
        Checkbox Warning
    &lt;/label&gt;
&lt;/div&gt;</Code>
                                                                <code>&lt;div class=&quot;form-check form-check-danger mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck10&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck10&quot;&gt;
        Checkbox Danger
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-info mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck11&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck11&quot;&gt;
        Checkbox Info
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-dark mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck12&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck12&quot;&gt;
        Checkbox Dark
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-light&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck12&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck12&quot;&gt;
        Checkbox Light
    &lt;/label&gt;
&lt;/div&gt;</code>


                                                                <code>&lt;!-- Custom Outline Checkboxes --&gt;
&lt;div class=&quot;form-check form-check-outline form-check-primary mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck13&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck13&quot;&gt;
        Checkbox Outline Primary
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-outline form-check-secondary mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck14&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck14&quot;&gt;
        Checkbox Outline Secondary
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-outline form-check-success mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck15&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck15&quot;&gt;
        Checkbox Outline Success
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-outline form-check-warning mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck16&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck16&quot;&gt;
        Checkbox Outline Warning
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <Code>&lt;div class=&quot;form-check form-check-outline form-check-danger mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck17&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck17&quot;&gt;
        Checkbox Outline Danger
    &lt;/label&gt;
&lt;/div&gt;</Code>
                                                                <code>&lt;div class=&quot;form-check form-check-outline form-check-info mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck18&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck18&quot;&gt;
        Checkbox Outline Info
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-outline form-check-dark mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck19&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck19&quot;&gt;
        Checkbox Outline Dark
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-outline form-check-light mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;formCheck20&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formCheck20&quot;&gt;
        Checkbox Outline light
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Radios</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="radios-btn-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="radios-btn-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-6">
                                                                    <div>
                                                                        <p class="text-muted fw-medium">Default Radios</p>
                                                                        <p class="text-muted">Use <code>type="radio"</code> attribute to set a radio button and add <code>checked</code> attribute to set a radio checked by default.</p>
                                                                        <div class="form-check mb-2">
                                                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"/>
                                                                            <label class="form-check-label" for="flexRadioDefault1">
                                                            Default radio
                                                                            </label>
                                                                        </div>
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked=""/>
                                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                            Default checked radio
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-lg-4 col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <p class="text-muted fw-medium">Disabled Radios</p>
                                                                        <p class="text-muted">Use <code>disabled</code> attribute to set a radio button disabled and add <code>checked</code> attribute to set a radio checked by default.</p>
                                                                        <div class="form-check mb-2">
                                                                            <input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioDisabled" disabled=""/>
                                                                            <label class="form-check-label" for="flexRadioDisabled">
                                                            Disabled radio
                                                                            </label>
                                                                        </div>
                                                                        <div>
                                                                            <div class="form-check">
                                                                                <input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioCheckedDisabled" checked="" disabled=""/>
                                                                                <label class="form-check-label" for="flexRadioCheckedDisabled">
                                                                Disabled checked radio
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-lg-4 col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <p class="text-muted fw-medium">Radio Right</p>
                                                                        <p class="text-muted">Use <code>form-check-right</code> class to form-check class to set a radio button on the right side.</p>
                                                                        <div class="form-check form-check-right mb-2">
                                                                            <input class="form-check-input" type="radio" name="formradioRight" id="formradioRight1"/>
                                                                            <label class="form-check-label" for="formradioRight1">
                                                            Form Radio Right
                                                                            </label>
                                                                        </div>
                                                                        <div>
                                                                            <div class="form-check form-check-right">
                                                                                <input class="form-check-input" type="radio" value="" name="formradioRight" id="flexCheckCheckedDisabled2" checked="" disabled=""/>
                                                                                <label class="form-check-label" for="flexCheckCheckedDisabled2">
                                                                Disabled checked radio
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Base Radios --&gt;
&lt;div class=&quot;form-check mb-2&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;flexRadioDefault&quot; id=&quot;flexRadioDefault1&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexRadioDefault1&quot;&gt;
        Default radio
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;flexRadioDefault&quot; id=&quot;flexRadioDefault2&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexRadioDefault2&quot;&gt;
        Default checked radio
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Disabled Radios --&gt;
&lt;div class=&quot;form-check mb-2&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;flexRadioDisabled&quot; id=&quot;flexRadioDisabled&quot; disabled&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexRadioDisabled&quot;&gt;
      Disabled radio
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div&gt;
    &lt;div class=&quot;form-check&quot;&gt;
        &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;flexRadioDisabled&quot; id=&quot;flexRadioCheckedDisabled&quot; checked disabled&gt;
        &lt;label class=&quot;form-check-label&quot; for=&quot;flexRadioCheckedDisabled&quot;&gt;
          Disabled checked radio
        &lt;/label&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Form Radio Right --&gt;
&lt;div class=&quot;form-check form-check-right mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradioRight&quot; id=&quot;formradioRight1&quot; checked=&quot;&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight1&quot;&gt;
        Form Radio Right
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div&gt;
    &lt;div class=&quot;form-check form-check-right&quot;&gt;
        &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; value=&quot;&quot; id=&quot;flexCheckCheckedDisabled&quot; checked disabled&gt;
        &lt;label class=&quot;form-check-label&quot; for=&quot;flexCheckCheckedDisabled&quot;&gt;
            Disabled checked radio
        &lt;/label&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Custom Radio</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="custom-radio-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="custom-radio-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div>
                                                                        <p class="text-muted">Use <code>form-check-</code> class with below-mentioned color variation to set a color radio.</p>

                                                                        <div class="form-check form-radio-primary mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor1" id="formradioRight5" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight5">
                                                            Radio Primary
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-secondary mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor2" id="formradioRight6" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight6">
                                                            Radio Secondary
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-success mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor3" id="formradioRight7" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight7">
                                                            Radio Success
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-warning mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor4" id="formradioRight8" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight8">
                                                            Radio Warning
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-danger mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor5" id="formradioRight9" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight9">
                                                            Radio Danger
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-info mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor6" id="formradioRight10" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight10">
                                                            Radio Info
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-dark">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor7" id="formradioRight11" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight11">
                                                            Radio Dark
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <p class="text-muted">Use <code>form-check-outline</code> class and <code>form-check-</code> class with below-mentioned color variation to set a color radio with outline.</p>

                                                                        <div class="form-check form-radio-outline form-radio-primary mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor9" id="formradioRight13" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight13">
                                                            Radio Outline Primary
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-outline form-radio-secondary mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor10" id="formradioRight14" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight14">
                                                            Radio Outline Secondary
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-outline form-radio-success mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor11" id="formradioRight15" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight15">
                                                            Radio Outline Success
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-outline form-radio-warning mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor12" id="formradioRight16" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight16">
                                                            Radio Outline Warning
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-outline form-radio-danger mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor13" id="formradioRight17" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight17">
                                                            Radio Outline Danger
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-outline form-radio-info mb-3">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor14" id="formradioRight18" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight18">
                                                            Radio Outline Info
                                                                            </label>
                                                                        </div>

                                                                        <div class="form-check form-radio-outline form-radio-dark">
                                                                            <input class="form-check-input" type="radio" name="formradiocolor15" id="formradioRight19" checked=""/>
                                                                            <label class="form-check-label" for="formradioRight19">
                                                            Radio Outline Dark
                                                                            </label>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Custom Radio Color --&gt;
&lt;div class=&quot;form-check form-radio-primary mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor1&quot; id=&quot;formradioRight5&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight5&quot;&gt;
        Radio Primary
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-secondary mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor2&quot; id=&quot;formradioRight6&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight6&quot;&gt;
        Radio Secondary
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-success mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor3&quot; id=&quot;formradioRight7&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight7&quot;&gt;
        Radio Success
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-warning mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor4&quot; id=&quot;formradioRight8&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight8&quot;&gt;
        Radio Warning
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-danger mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor5&quot; id=&quot;formradioRight9&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight9&quot;&gt;
        Radio Danger
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-info mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor6&quot; id=&quot;formradioRight10&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight10&quot;&gt;
        Radio Info
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-dark mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor7&quot; id=&quot;formradioRight11&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight11&quot;&gt;
        Radio Dark
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-light&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor8&quot; id=&quot;formradioRight12&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight12&quot;&gt;
        Radio light
    &lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Custom Outline Radio --&gt;
&lt;div class=&quot;form-check form-radio-outline form-radio-primary mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor9&quot; id=&quot;formradioRight13&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight13&quot;&gt;
        Radio Outline Primary
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-outline form-radio-secondary mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor10&quot; id=&quot;formradioRight14&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight14&quot;&gt;
        Radio Outline Secondary
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-outline form-radio-success mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor11&quot; id=&quot;formradioRight15&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight15&quot;&gt;
        Radio Outline Success
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-outline form-radio-warning mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor12&quot; id=&quot;formradioRight16&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight16&quot;&gt;
        Radio Outline Warning
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-outline form-radio-danger mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor13&quot; id=&quot;formradioRight17&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight17&quot;&gt;
        Radio Outline Danger
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-outline form-radio-info mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor14&quot; id=&quot;formradioRight18&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight18&quot;&gt;
        Radio Outline Info
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-outline form-radio-dark mb-3&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor15&quot; id=&quot;formradioRight19&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight19&quot;&gt;
        Radio Outline Dark
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-radio-outline form-radio-light&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;formradiocolor16&quot; id=&quot;formradioRight20&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;formradioRight20&quot;&gt;
        Radio Outline light
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Switches</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="switches-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="switches-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-6">
                                                                    <div>
                                                                        <p class="text-muted fw-medium">Deafult Switchs</p>
                                                                        <p class="text-muted">Use <code>form-switch</code> class to form-check class to set a switch and add <code>checked</code> attribute to set a switch checked by default.</p>
                                                                        <div class="form-check form-switch mb-2">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault"/>
                                                                            <label class="form-check-label" for="flexSwitchCheckDefault">Default switch input</label>
                                                                        </div>

                                                                        <div class="form-check form-switch">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked=""/>
                                                                            <label class="form-check-label" for="flexSwitchCheckChecked">Checked switch input</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-lg-4 col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <p class="text-muted fw-medium">Disabled Switchs</p>
                                                                        <p class="text-muted">Use <code>disabled</code> attribute to set a radio button disabled and add <code>checked</code> attribute to set a switch checked by default.</p>
                                                                        <div class="form-check form-switch mb-2">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDisabled" disabled=""/>
                                                                            <label class="form-check-label" for="flexSwitchCheckDisabled">Switch input</label>
                                                                        </div>

                                                                        <div class="form-check form-switch">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckCheckedDisabled1" checked="" disabled=""/>
                                                                            <label class="form-check-label" for="flexSwitchCheckCheckedDisabled1">Disabled checked switch input</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-lg-4 col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <p class="text-muted fw-medium">Switch Right</p>
                                                                        <p class="text-muted">Use <code>form-check-right</code> class to form-check class to set a switch button on the right side.</p>
                                                                        <div>
                                                                            <div class="form-check form-switch form-check-right mb-2">
                                                                                <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckRightDisabled" checked=""/>
                                                                                <label class="form-check-label" for="flexSwitchCheckRightDisabled">Switch Right input</label>
                                                                            </div>
                                                                        </div>

                                                                        <div>
                                                                            <div class="form-check form-switch form-check-right">
                                                                                <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckCheckedDisabled2" disabled=""/>
                                                                                <label class="form-check-label" for="flexSwitchCheckCheckedDisabled2">Disabled checked switch input</label>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-lg-4 col-md-6">
                                                                    <div class="mt-3">
                                                                        <p class="text-muted fw-medium">Switch sizes</p>
                                                                        <p class="text-muted">Use <code>form-switch-md</code> class to set a medium size switch button and <code>form-switch-lg</code> class to form-check class to set a large size switch button respectively. No such class is required for small size switch button.</p>

                                                                        <div class="form-check form-switch mb-3" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="customSwitchsizesm" checked=""/>
                                                                            <label class="form-check-label" for="customSwitchsizesm">Small Size Switch</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-md mb-3" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="customSwitchsizemd"/>
                                                                            <label class="form-check-label" for="customSwitchsizemd">Medium Size Switch</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-lg" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="customSwitchsizelg" checked=""/>
                                                                            <label class="form-check-label" for="customSwitchsizelg">Large Size Switch</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Base Switchs --&gt;
&lt;div class=&quot;form-check form-switch&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;flexSwitchCheckDefault&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexSwitchCheckDefault&quot;&gt;Default switch checkbox input&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;flexSwitchCheckChecked&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexSwitchCheckChecked&quot;&gt;Checked switch checkbox input&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Disabled Switchs --&gt;
&lt;div class=&quot;form-check form-switch&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;flexSwitchCheckDisabled&quot; disabled&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexSwitchCheckDisabled&quot;&gt;Disabled switch checkbox input&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;flexSwitchCheckCheckedDisabled&quot; checked disabled&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexSwitchCheckCheckedDisabled&quot;&gt;Disabled checked switch checkbox input&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Form Switch Right --&gt;
&lt;div class=&quot;form-check form-switch form-check-right&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;flexSwitchCheckRightDisabled&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexSwitchCheckRightDisabled&quot;&gt;Disabled switch checkbox input&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch form-check-right&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;flexSwitchCheckCheckedDisabled&quot; disabled&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;flexSwitchCheckCheckedDisabled&quot;&gt;Disabled checked switch checkbox input&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Switch sizes --&gt;
&lt;div class=&quot;form-check form-switch&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;customSwitchsizesm&quot; checked=&quot;&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;customSwitchsizesm&quot;&gt;Small Size Switch&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-md&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;customSwitchsizemd&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;customSwitchsizemd&quot;&gt;Medium Size Switch&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-lg&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;customSwitchsizelg&quot; checked=&quot;&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;customSwitchsizelg&quot;&gt;Large Size Switch&lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Switches Color</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="switches-color-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="switches-color-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>form-check-</code> class with below-mentioned color variation to set a color switch.</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div>
                                                                        <div class="form-check form-switch mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck1" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck1">Switch Default</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-secondary mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck2" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck2">Switch Secondary</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-success mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck3" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck3">Switch Success</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-warning mb-2 mb-md-0">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck4" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck4">Switch Warning</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-md-6">
                                                                    <div>
                                                                        <div class="form-check form-switch form-switch-danger mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck5" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck5">Switch Danger</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-info mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck6" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck6">Switch Info</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-dark mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck7" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck7">Switch Dark</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Switches Color --&gt;
&lt;div class=&quot;form-check form-switch&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck1&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck1&quot;&gt;Switch Default&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-secondary&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck2&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck2&quot;&gt;Switch Secondary&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-success&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck3&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck3&quot;&gt;Switch Success&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-warning&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck4&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck4&quot;&gt;Switch Warning&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-danger&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck5&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck5&quot;&gt;Switch Danger&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-info&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck6&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck6&quot;&gt;Switch Info&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-dark&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck7&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck7&quot;&gt;Switch Dark&lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                    <!--end card-body-->
                                                </div>
                                                <!--end card-->
                                            </div>                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Custom Switches</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="custom-switches-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="custom-switches-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>form-switch-custom</code> class &amp; <code>form-switch-</code> class with below-mentioned color variation to set a color radius.</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div>
                                                                        <div class="form-check form-switch form-switch-custom form-switch-primary mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck9" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck9">Switch Primary</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-custom form-switch-secondary mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck10" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck10">Switch Secondary</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-custom form-switch-success mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck11" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck11">Switch Success</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-custom form-switch-warning mb-2 mb-md-0">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck12" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck12">Switch Warning</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-md-6">
                                                                    <div class="mt-4 mt-md-0">
                                                                        <div class="form-check form-switch form-switch-custom form-switch-danger mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck13" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck13">Switch Danger</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-custom form-switch-info mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck14" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck14">Switch Info</label>
                                                                        </div>

                                                                        <div class="form-check form-switch form-switch-custom form-switch-dark mb-3">
                                                                            <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck15" checked=""/>
                                                                            <label class="form-check-label" for="SwitchCheck15">Switch Dark</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Custom Switches --&gt;
&lt;div class=&quot;form-check form-switch form-switch-custom form-switch-primary&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck9&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck9&quot;&gt;Switch Default&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <Code>&lt;div class=&quot;form-check form-switch form-switch-custom form-switch-secondary&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck10&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck10&quot;&gt;Switch Secondary&lt;/label&gt;
&lt;/div&gt;</Code>

                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-custom form-switch-success&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck11&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck11&quot;&gt;Switch Success&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-custom form-switch-warning&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck12&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck12&quot;&gt;Switch Warning&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-custom form-switch-danger&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck13&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck13&quot;&gt;Switch Danger&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-custom form-switch-info&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck14&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck14&quot;&gt;Switch Info&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;form-check form-switch form-switch-custom form-switch-dark&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck15&quot; checked&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck15&quot;&gt;Switch Dark&lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                    <!--end card-body-->
                                                </div>
                                                <!--end card-->
                                            </div>                                            <!-- end col -->
                                        </div>                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Inline Checkbox &amp; Radios</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="Inline-shocade" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="Inline-shocade"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>form-check-inline</code> class to form-check class to set horizontally align checkboxes, radios, or switches.</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    <div class="mt-4 mt-lg-0">
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option1"/>
                                                                            <label class="form-check-label" for="inlineCheckbox6">1</label>
                                                                        </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option2"/>
                                                                            <label class="form-check-label" for="inlineCheckbox7">2</label>
                                                                        </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option3" disabled=""/>
                                                                            <label class="form-check-label" for="inlineCheckbox8">3 (disabled)</label>
                                                                        </div>
                                                                    </div>
                                                                </div>                                                                <!-- end col -->

                                                                <div class="col-lg-4">
                                                                    <div class="mt-4 mt-lg-0">
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions1" id="inlineRadio1" value="option1"/>
                                                                            <label class="form-check-label" for="inlineRadio1">1</label>
                                                                        </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio2" value="option2"/>
                                                                            <label class="form-check-label" for="inlineRadio2">2</label>
                                                                        </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions3" id="inlineRadio3" value="option3" disabled=""/>
                                                                            <label class="form-check-label" for="inlineRadio3">3 (disabled)</label>
                                                                        </div>
                                                                    </div>
                                                                </div>                                                                <!-- end col -->

                                                                <div class="col-lg-4">
                                                                    <div class="mt-4 mt-lg-0">
                                                                        <div class="form-check form-switch form-check-inline" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="inlineswitch5"/>
                                                                            <label class="form-check-label" for="inlineswitch5">1</label>
                                                                        </div>
                                                                        <div class="form-check form-switch form-check-inline" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="inlineswitch6"/>
                                                                            <label class="form-check-label" for="inlineswitch6">2</label>
                                                                        </div>
                                                                        <div class="form-check form-switch form-check-inline" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="inlineswitchdisabled2" disabled=""/>
                                                                            <label class="form-check-label" for="inlineswitchdisabled2">2</label>
                                                                        </div>
                                                                    </div>
                                                                </div>                                                                <!-- end col -->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Inline Checkbox --&gt;
&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox1&quot; value=&quot;option1&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineCheckbox1&quot;&gt;1&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox2&quot; value=&quot;option2&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineCheckbox2&quot;&gt;2&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox3&quot; value=&quot;option3&quot; disabled&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineCheckbox3&quot;&gt;3 (disabled)&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Inline Radios --&gt;
&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions1&quot; id=&quot;inlineRadio1&quot; value=&quot;option1&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineRadio1&quot;&gt;1&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions2&quot; id=&quot;inlineRadio2&quot; value=&quot;option2&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineRadio2&quot;&gt;2&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions3&quot; id=&quot;inlineRadio3&quot; value=&quot;option3&quot; disabled&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineRadio3&quot;&gt;3 (disabled)&lt;/label&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Inline Switches --&gt;
&lt;div class=&quot;form-check form-switch form-check-inline&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;inlineswitch&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineswitch&quot;&gt;1&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-check-inline&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;inlineswitch1&quot;&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineswitch1&quot;&gt;2&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-check-inline&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;inlineswitchdisabled&quot; disabled&gt;
    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineswitchdisabled&quot;&gt;2&lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                    <!--end card-body-->
                                                </div>
                                                <!--end card-->
                                            </div>                                            <!-- end col -->
                                        </div>                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Without Labels</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="without-labels-shocade" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="without-labels-shocade"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Omit the wrapping, <code>form-check</code> class for checkboxes, radios, or switches that have no label text. Remember to still provide some form of accessible name for assistive technologies (for instance, using aria-label).</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    <div class="mt-4 mt-lg-0">
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"/>
                                                                        </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"/>
                                                                        </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled=""/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->

                                                                <div class="col-lg-4">
                                                                    <div class="mt-4 mt-lg-0">
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="WithoutinlineRadio1" value="option1"/>
                                                                        </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="WithoutinlineRadio2" value="option2"/>
                                                                        </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="WithoutinlineRadio3" value="option3" disabled=""/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->

                                                                <div class="col-lg-4">
                                                                    <div class="mt-4 mt-lg-0">
                                                                        <div class="form-check form-switch form-check-inline" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="inlineswitch"/>
                                                                        </div>
                                                                        <div class="form-check form-switch form-check-inline" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="inlineswitch1"/>
                                                                        </div>
                                                                        <div class="form-check form-switch form-check-inline" dir="ltr">
                                                                            <input type="checkbox" class="form-check-input" id="inlineswitchdisabled" disabled=""/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!--end row-->
                                                        </div>


                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px">
                                                                <code>&lt;!-- Without labels Checkbox --&gt;
&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox1&quot; value=&quot;option1&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox2&quot; value=&quot;option2&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox3&quot; value=&quot;option3&quot; disabled&gt;
&lt;/div&gt;</code>


                                                                <code>&lt;!-- Without labels Radios --&gt;
&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions&quot; id=&quot;WithoutinlineRadio1&quot; value=&quot;option1&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions&quot; id=&quot;WithoutinlineRadio2&quot; value=&quot;option2&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-check-inline&quot;&gt;
    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions&quot; id=&quot;WithoutinlineRadio3&quot; value=&quot;option3&quot; disabled&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Without labels Switches --&gt;
&lt;div class=&quot;form-check form-switch form-check-inline&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;inlineswitch&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-check-inline&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;inlineswitch1&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;form-check form-switch form-check-inline&quot; dir=&quot;ltr&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;inlineswitchdisabled&quot; disabled&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>

                                                    </div>
                                                    <!--end card-body-->
                                                </div>
                                                <!--end card-->
                                            </div>                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Radio Toggle Buttons</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="radio-toggle-shocade" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="radio-toggle-shocade"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Create button-like checkboxes and radio buttons by using <code>btn</code> styles rather than form-check-label class on the &lt;label&gt; elements. These toggle buttons can further be grouped in a <a href="https://getbootstrap.com/docs/5.1/components/button-group/">button group</a> if needed.</p>
                                                        <div class="live-preview">
                                                            <div class="hstack gap-2 flex-wrap">
                                                                <input type="radio" class="btn-check" name="options" id="option1" checked=""/>
                                                                <label class="btn btn-secondary" for="option1">Checked</label>

                                                                <input type="radio" class="btn-check" name="options" id="option2"/>
                                                                <label class="btn btn-secondary" for="option2">Radio</label>

                                                                <input type="radio" class="btn-check" name="options" id="option3" disabled=""/>
                                                                <label class="btn btn-secondary" for="option3">Disabled</label>

                                                                <input type="radio" class="btn-check" name="options" id="option4"/>
                                                                <label class="btn btn-secondary" for="option4">Radio</label>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Radio toggle buttons   --&gt;
&lt;div class=&quot;hstack gap-2 flex-wrap&quot;&gt;
    &lt;input type=&quot;radio&quot; class=&quot;btn-check&quot; name=&quot;options&quot; id=&quot;option1&quot;  checked&gt;
    &lt;label class=&quot;btn btn-secondary&quot; for=&quot;option1&quot;&gt;Checked&lt;/label&gt;

    &lt;input type=&quot;radio&quot; class=&quot;btn-check&quot; name=&quot;options&quot; id=&quot;option2&quot; &gt;
    &lt;label class=&quot;btn btn-secondary&quot; for=&quot;option2&quot;&gt;Radio&lt;/label&gt;

    &lt;input type=&quot;radio&quot; class=&quot;btn-check&quot; name=&quot;options&quot; id=&quot;option3&quot;  disabled&gt;
    &lt;label class=&quot;btn btn-secondary&quot; for=&quot;option3&quot;&gt;Disabled&lt;/label&gt;

    &lt;input type=&quot;radio&quot; class=&quot;btn-check&quot; name=&quot;options&quot; id=&quot;option4&quot; &gt;
    &lt;label class=&quot;btn btn-secondary&quot; for=&quot;option4&quot;&gt;Radio&lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                    <!--end card-body-->
                                                </div>
                                                <!--end card-->
                                            </div>                                            <!-- end col -->

                                            <div class="col-lg-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Outlined Styles</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="outline-style-shocade" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="outline-style-shocade"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Different variants of <code>btn</code> attribute, such as the various outlined styles, are supported.</p>
                                                        <div class="live-preview">

                                                            <div class="hstack gap-2 flex-wrap">
                                                                <input type="checkbox" class="btn-check" id="btn-check-outlined"/>
                                                                <label class="btn btn-outline-primary" for="btn-check-outlined">Single toggle</label>

                                                                <input type="checkbox" class="btn-check" id="btn-check-2-outlined" checked=""/>
                                                                <label class="btn btn-outline-secondary" for="btn-check-2-outlined">Checked</label>

                                                                <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" checked=""/>
                                                                <label class="btn btn-outline-success" for="success-outlined">Checked success radio</label>

                                                                <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined"/>
                                                                <label class="btn btn-outline-danger" for="danger-outlined">Danger radio</label>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Outlined Styles --&gt;
&lt;div class=&quot;hstack gap-2 flex-wrap&quot;&gt;
    &lt;input type=&quot;checkbox&quot; class=&quot;btn-check&quot; id=&quot;btn-check-outlined&quot;&gt;
    &lt;label class=&quot;btn btn-outline-primary&quot; for=&quot;btn-check-outlined&quot;&gt;Single toggle&lt;/label&gt;

    &lt;input type=&quot;checkbox&quot; class=&quot;btn-check&quot; id=&quot;btn-check-2-outlined&quot; checked&gt;
    &lt;label class=&quot;btn btn-outline-secondary&quot; for=&quot;btn-check-2-outlined&quot;&gt;Checked&lt;/label&gt;

    &lt;input type=&quot;radio&quot; class=&quot;btn-check&quot; name=&quot;options-outlined&quot; id=&quot;success-outlined&quot; checked&gt;
    &lt;label class=&quot;btn btn-outline-success&quot; for=&quot;success-outlined&quot;&gt;Checked success radio&lt;/label&gt;

    &lt;input type=&quot;radio&quot; class=&quot;btn-check&quot; name=&quot;options-outlined&quot; id=&quot;danger-outlined&quot;&gt;
    &lt;label class=&quot;btn btn-outline-danger&quot; for=&quot;danger-outlined&quot;&gt;Danger radio&lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end col -->

                                        </div>
                                        <!-- end row -->

                                    </div>                                    <!-- container-fluid -->

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
<xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
