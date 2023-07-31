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
                                                        <h4 class="card-title mb-0 flex-grow-1">Input Example</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="form-grid-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="form-grid-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div class="row gy-4">
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="basiInput" class="form-label">Basic Input</label>
                                                                        <input type="password" class="form-control" id="basiInput"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="labelInput" class="form-label">Input with Label</label>
                                                                        <input type="password" class="form-control" id="labelInput"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="placeholderInput" class="form-label">Input with Placeholder</label>
                                                                        <input type="password" class="form-control" id="placeholderInput" placeholder="Placeholder"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="valueInput" class="form-label">Input with Value</label>
                                                                        <input type="text" class="form-control" id="valueInput" value="Input value"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="readonlyPlaintext" class="form-label">Readonly Plain Text Input</label>
                                                                        <input type="text" class="form-control-plaintext" id="readonlyPlaintext" value="Readonly input" readonly=""/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="readonlyInput" class="form-label">Readonly Input</label>
                                                                        <input type="text" class="form-control" id="readonlyInput" value="Readonly input" readonly=""/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="disabledInput" class="form-label">Disabled Input</label>
                                                                        <input type="text" class="form-control" id="disabledInput" value="Disabled input" disabled=""/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="iconInput" class="form-label">Input with Icon</label>
                                                                        <div class="form-icon">
                                                                            <input type="email" class="form-control form-control-icon" id="iconInput" placeholder="example@gmail.com"/>
                                                                            <i class="ri-mail-unread-line"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="iconrightInput" class="form-label">Input with Icon Right</label>
                                                                        <div class="form-icon right">
                                                                            <input type="email" class="form-control form-control-icon" id="iconrightInput" placeholder="example@gmail.com"/>
                                                                            <i class="ri-mail-unread-line"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="exampleInputdate" class="form-label">Input Date</label>
                                                                        <input type="date" class="form-control" id="exampleInputdate"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="exampleInputtime" class="form-label">Input Time</label>
                                                                        <input type="time" class="form-control" id="exampleInputtime"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="exampleInputpassword" class="form-label">Input Password</label>
                                                                        <input type="password" class="form-control" id="exampleInputpassword" value="44512465"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="exampleFormControlTextarea5" class="form-label">Example Textarea</label>
                                                                        <textarea class="form-control" id="exampleFormControlTextarea5" rows="3"></textarea>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="formtextInput" class="form-label">Form Text</label>
                                                                        <input type="password" class="form-control" id="formtextInput"/>
                                                                        <div id="passwordHelpBlock" class="form-text">
                                                        Must be 8-20 characters long.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="colorPicker" class="form-label">Color Picker</label>
                                                                        <input type="color" class="form-control form-control-color w-100" id="colorPicker" value="#364574"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="borderInput" class="form-label">Input Border Style</label>
                                                                        <input type="text" class="form-control border-dashed" id="borderInput" placeholder="Enter your name"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <label for="exampleDataList" class="form-label">Datalist example</label>
                                                                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Search your country..."/>
                                                                    <datalist id="datalistOptions">
                                                                        <option value="Switzerland"></option>
                                                                        <option value="New York"></option>
                                                                        <option value="France"></option>
                                                                        <option value="Spain"></option>
                                                                        <option value="Chicago"></option>
                                                                        <option value="Bulgaria"></option>
                                                                        <option value="Hong Kong"></option>


                                                                    </datalist>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div>
                                                                        <label for="exampleInputrounded" class="form-label">Rounded Input</label>
                                                                        <input type="text" class="form-control rounded-pill" id="exampleInputrounded" placeholder="Enter your name"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-xxl-3 col-md-6">
                                                                    <div class="form-floating">
                                                                        <input type="text" class="form-control" id="firstnamefloatingInput" placeholder="Enter your firstname"/>
                                                                        <label for="firstnamefloatingInput">Floating Input</label>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 450px;">
                                                                <code>&lt;!-- Basic Input --&gt;
&lt;div&gt;
    &lt;label for=&quot;basiInput&quot; class=&quot;form-label&quot;&gt;Basic Input&lt;/label&gt;
    &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;basiInput&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input with Label --&gt;
&lt;div&gt;
    &lt;label for=&quot;labelInput&quot; class=&quot;form-label&quot;&gt;Input with Label&lt;/label&gt;
    &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;labelInput&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input with Placeholder --&gt;
&lt;div&gt;
    &lt;label for=&quot;placeholderInput&quot; class=&quot;form-label&quot;&gt;Input with Placeholder&lt;/label&gt;
    &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;placeholderInput&quot; placeholder=&quot;Placeholder&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input with Value --&gt;
&lt;div&gt;
    &lt;label for=&quot;valueInput&quot; class=&quot;form-label&quot;&gt;Input with Value&lt;/label&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;valueInput&quot; value=&quot;Input value&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Readonly Plain Text Input --&gt;
&lt;div&gt;
    &lt;label for=&quot;readonlyPlaintext&quot; class=&quot;form-label&quot;&gt;Readonly Plain Text Input&lt;/label&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control-plaintext&quot; id=&quot;readonlyPlaintext&quot; value=&quot;Readonly input&quot; readonly&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Readonly Input --&gt;
&lt;div&gt;
    &lt;label for=&quot;readonlyInput&quot; class=&quot;form-label&quot;&gt;Readonly Input&lt;/label&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;readonlyInput&quot; value=&quot;Readonly input&quot; readonly&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Disabled Input --&gt;
&lt;div&gt;
    &lt;label for=&quot;disabledInput&quot; class=&quot;form-label&quot;&gt;Disabled Input&lt;/label&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;disabledInput&quot; value=&quot;Disabled input&quot; disabled&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input with Icon --&gt;
&lt;div&gt;
    &lt;label for=&quot;iconInput&quot; class=&quot;form-label&quot;&gt;Input with Icon&lt;/label&gt;
    &lt;div class=&quot;form-icon&quot;&gt;
        &lt;input type=&quot;email&quot; class=&quot;form-control form-control-icon&quot; id=&quot;iconInput&quot; placeholder=&quot;example@gmail.com&quot;&gt;
        &lt;i class=&quot;ri-mail-unread-line&quot;&gt;&lt;/i&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input with Icon Right --&gt;
&lt;div&gt;
    &lt;label for=&quot;iconrightInput&quot; class=&quot;form-label&quot;&gt;Input with Icon Right&lt;/label&gt;
    &lt;div class=&quot;form-icon right&quot;&gt;
        &lt;input type=&quot;email&quot; class=&quot;form-control form-control-icon&quot; id=&quot;iconrightInput&quot; placeholder=&quot;example@gmail.com&quot;&gt;
        &lt;i class=&quot;ri-mail-unread-line&quot;&gt;&lt;/i&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input Date --&gt;
&lt;div&gt;
    &lt;label for=&quot;exampleInputdate&quot; class=&quot;form-label&quot;&gt;Input Date&lt;/label&gt;
    &lt;input type=&quot;date&quot; class=&quot;form-control&quot; id=&quot;exampleInputdate&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input Time --&gt;
&lt;div&gt;
    &lt;label for=&quot;exampleInputtime&quot; class=&quot;form-label&quot;&gt;Input Time&lt;/label&gt;
    &lt;input type=&quot;time&quot; class=&quot;form-control&quot; id=&quot;exampleInputtime&quot; value=&quot;08:56 AM&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input Password --&gt;
&lt;div&gt;
    &lt;label for=&quot;exampleInputpassword&quot; class=&quot;form-label&quot;&gt;Input Password&lt;/label&gt;
    &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;exampleInputpassword&quot; value=&quot;44512465&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Example Textarea --&gt;
&lt;div&gt;
    &lt;label for=&quot;exampleFormControlTextarea5&quot; class=&quot;form-label&quot;&gt;Example Textarea&lt;/label&gt;
    &lt;textarea class=&quot;form-control&quot; id=&quot;exampleFormControlTextarea5&quot; rows=&quot;3&quot;&gt;&lt;/textarea&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Form Text --&gt;
&lt;div&gt;
    &lt;label for=&quot;formtextInput&quot; class=&quot;form-label&quot;&gt;Form Text&lt;/label&gt;
    &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;formtextInput&quot;&gt;
    &lt;div id=&quot;passwordHelpBlock&quot; class=&quot;form-text&quot;&gt;
        Must be 8-20 characters long.
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Color Picker --&gt;
&lt;div&gt;
    &lt;label for=&quot;colorPicker&quot; class=&quot;form-label&quot;&gt;Color Picker&lt;/label&gt;
    &lt;input type=&quot;color&quot; class=&quot;form-control form-control-color w-100&quot; id=&quot;colorPicker&quot; value=&quot;#364574&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Input Border Style --&gt;
&lt;div&gt;
    &lt;label for=&quot;borderInput&quot; class=&quot;form-label&quot;&gt;Input Border Style&lt;/label&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control border-dashed&quot; id=&quot;borderInput&quot; placeholder=&quot;Enter your name&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Datalist example --&gt;
&lt;label for=&quot;exampleDataList&quot; class=&quot;form-label&quot;&gt;Datalist example&lt;/label&gt;
&lt;input class=&quot;form-control&quot; list=&quot;datalistOptions&quot; id=&quot;exampleDataList&quot; placeholder=&quot;Search your country...&quot;&gt;
&lt;datalist id=&quot;datalistOptions&quot;&gt;
    &lt;option value=&quot;Switzerland&quot;&gt;
    &lt;option value=&quot;New York&quot;&gt;
    &lt;option value=&quot;France&quot;&gt;
    &lt;option value=&quot;Spain&quot;&gt;
    &lt;option value=&quot;Chicago&quot;&gt;
    &lt;option value=&quot;Bulgaria&quot;&gt;
    &lt;option value=&quot;Hong Kong&quot;&gt;
&lt;/datalist&gt;</code>

                                                                <code>&lt;!-- Rounded Input --&gt;
&lt;div&gt;
    &lt;label for=&quot;exampleInputrounded&quot; class=&quot;form-label&quot;&gt;Rounded Input&lt;/label&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control rounded-pill&quot; id=&quot;exampleInputrounded&quot; placeholder=&quot;Enter your name&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Floating Input --&gt;
&lt;div class=&quot;form-floating&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;firstnamefloatingInput&quot; placeholder=&quot;Enter your firstname&quot;&gt;
    &lt;label for=&quot;firstnamefloatingInput&quot;&gt;Floating Input&lt;/label&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Input Sizing</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="sizing-input-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="sizing-input-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>form-control-lg</code> class to set large size input and Use <code>form-control-sm</code> class to set small size input. No class is needed for default size input.</p>
                                                        <div class="live-preview">
                                                            <div class="row align-items-center g-3">
                                                                <div class="col-lg-4">
                                                                    <input class="form-control form-control-sm" type="text" placeholder=".form-control-sm"/>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-lg-4">
                                                                    <input class="form-control" type="text" placeholder=".form-control"/>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-lg-4">
                                                                    <input class="form-control form-control-lg" type="text" placeholder=".form-control-lg"/>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Form Control Sm --&gt;
&lt;input class=&quot;form-control form-control-sm&quot; type=&quot;text&quot; placeholder=&quot;.form-control-sm&quot;&gt;</code>

                                                                <code>&lt;!-- Form Control Default --&gt;
&lt;input class=&quot;form-control&quot; type=&quot;text&quot; placeholder=&quot;.form-control-sm&quot;&gt;</code>

                                                                <code>&lt;!-- Form Control Lg --&gt;
&lt;input class=&quot;form-control form-control-lg&quot; type=&quot;text&quot; placeholder=&quot;.form-control-sm&quot;&gt;</code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">File Input</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="file-input-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="file-input-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div class="row align-items-center g-3">
                                                                <div class="col-lg-4">
                                                                    <div>
                                                                        <label for="formFile" class="form-label">Default File Input Example</label>
                                                                        <p class="text-muted">Use <code>input</code> attribute with <code>type="file"</code> tag for default file input</p>
                                                                        <input class="form-control" type="file" id="formFile"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-lg-4">
                                                                    <div>
                                                                        <label for="formFileMultiple" class="form-label">Multiple Files Input Example</label>
                                                                        <p class="text-muted">Use <code>multiple</code> attribute within the input attribute to select multiple files.</p>
                                                                        <input class="form-control" type="file" id="formFileMultiple" multiple=""/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-lg-4">
                                                                    <div>
                                                                        <label for="formFileDisabled" class="form-label">Disabled File Input Example</label>
                                                                        <p class="text-muted">Use <code>disabled</code> attribute within the input attribute to disable the file input.</p>
                                                                        <input class="form-control" type="file" id="formFileDisabled" disabled=""/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--end row-->
                                                            <div class="row mt-4 align-items-center g-3">
                                                                <h5 class="fs-14">File Input Sizing</h5>
                                                                <div class="col-lg-4">
                                                                    <div>
                                                                        <label for="formSizeSmall" class="form-label">Small Size File Input Example</label>
                                                                        <p class="text-muted">Use <code>form-control-sm</code> class within the form-control class to set a small size file input.</p>
                                                                        <input class="form-control form-control-sm" id="formSizeSmall" type="file"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div>
                                                                        <label for="formSizeDefault" class="form-label">Default Size File Input Example</label>
                                                                        <p class="text-muted">Use <code>form-control </code>class and <code>type="file"</code> attribute within the input attribute to set a default size file input.</p>
                                                                        <input class="form-control" id="formSizeDefault" type="file"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div>
                                                                        <label for="formSizeLarge" class="form-label">Large Size File Input Example</label>
                                                                        <p class="text-muted">Use <code>form-control-lg</code> class within the form-control class to set a large size file input.</p>

                                                                        <input class="form-control form-control-lg" id="formSizeLarge" type="file"/>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Default File Input Example --&gt;
&lt;div&gt;
    &lt;label for=&quot;formFile&quot; class=&quot;form-label&quot;&gt;Default file input example&lt;/label&gt;
    &lt;input class=&quot;form-control&quot; type=&quot;file&quot; id=&quot;formFile&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Multiple Files Input Example --&gt;
&lt;div&gt;
    &lt;label for=&quot;formFileMultiple&quot; class=&quot;form-label&quot;&gt;Multiple files input example&lt;/label&gt;
    &lt;input class=&quot;form-control&quot; type=&quot;file&quot; id=&quot;formFileMultiple&quot; multiple&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Disabled File Input Example --&gt;
&lt;div&gt;
    &lt;label for=&quot;formFileDisabled&quot; class=&quot;form-label&quot;&gt;Disabled File Input Example&lt;/label&gt;
    &lt;input class=&quot;form-control&quot; type=&quot;file&quot; id=&quot;formFileDisabled&quot; disabled&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- File Input Sizing Small --&gt;
&lt;div&gt;
    &lt;input class=&quot;form-control form-control-sm&quot; id=&quot;formFileSm&quot; type=&quot;file&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- File Input Sizing Default --&gt;
&lt;div&gt;
    &lt;input class=&quot;form-control&quot; id=&quot;formFileSm&quot; type=&quot;file&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- File Input Sizing Large --&gt;
&lt;div&gt;
    &lt;input class=&quot;form-control form-control-lg&quot; id=&quot;formFileSm&quot; type=&quot;file&quot;&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Input Group</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="input-group-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="input-group-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div>
                                                                <h5 class="fs-15">Basic example</h5>
                                                                <p class="text-muted">Use <code>input-group</code> class to div element which contains input attribute to wrap a default input in the group.</p>
                                                                <div class="row g-3">
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <span class="input-group-text" id="basic-addon1">@</span>
                                                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2"/>
                                                                            <span class="input-group-text" id="basic-addon2">@example.com</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <div class="input-group">
                                                                            <span class="input-group-text">$</span>
                                                                            <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)"/>
                                                                            <span class="input-group-text">.00</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username"/>
                                                                            <span class="input-group-text">@</span>
                                                                            <input type="text" class="form-control" placeholder="Server" aria-label="Server"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <span class="input-group-text">With textarea</span>
                                                                            <textarea class="form-control" aria-label="With textarea" rows="2"></textarea>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <label for="basic-url" class="form-label">Your vanity URL</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
                                                                            <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="mt-4">
                                                                <h5 class="fs-15">Wrapping</h5>
                                                                <p class="text-muted">Input groups wrap by default via <code>flex-wrap: wrap</code> in order to accommodate custom form field validation within an input group. You may disable this with <code>flex-nowrap</code> class.</p>
                                                                <div class="input-group flex-nowrap">
                                                                    <span class="input-group-text" id="addon-wrapping">@</span>
                                                                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Basic example --&gt;
&lt;div class=&quot;input-group&quot;&gt;
    &lt;span class=&quot;input-group-text&quot; id=&quot;basic-addon1&quot;&gt;@&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Username&quot; aria-label=&quot;Username&quot; aria-describedby=&quot;basic-addon1&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Recipient's username&quot; aria-label=&quot;Recipient's username&quot; aria-describedby=&quot;basic-addon2&quot;&gt;
    &lt;span class=&quot;input-group-text&quot; id=&quot;basic-addon2&quot;&gt;@example.com&lt;/span&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;$&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Amount (to the nearest dollar)&quot;&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;.00&lt;/span&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Username&quot; aria-label=&quot;Username&quot;&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;@&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Server&quot; aria-label=&quot;Server&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;With textarea&lt;/span&gt;
    &lt;textarea class=&quot;form-control&quot; aria-label=&quot;With textarea&quot; rows=&quot;2&quot;&gt;&lt;/textarea&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;label for=&quot;basic-url&quot; class=&quot;form-label&quot;&gt;Your vanity URL&lt;/label&gt;
&lt;div class=&quot;input-group&quot;&gt;
    &lt;span class=&quot;input-group-text&quot; id=&quot;basic-addon3&quot;&gt;https://example.com/users/&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;basic-url&quot; aria-describedby=&quot;basic-addon3&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Wrapping --&gt;
&lt;div class=&quot;input-group flex-nowrap&quot;&gt;
    &lt;span class=&quot;input-group-text&quot; id=&quot;addon-wrapping&quot;&gt;@&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Username&quot; aria-label=&quot;Username&quot; aria-describedby=&quot;addon-wrapping&quot;&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Input Group Sizing</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="input-group-sizing-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="input-group-sizing-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>input-group-sm</code> class to set a small size input group and <code>input-group-lg</code> class to input-group class to set a large size input group respectively. no such class is required for a default size input group.</p>
                                                        <div class="live-preview">
                                                            <div class="row align-items-center g-3">
                                                                <div class="col-lg-4">
                                                                    <div class="input-group input-group-sm">
                                                                        <span class="input-group-text" id="inputGroup-sizing-sm">Small</span>
                                                                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="input-group">
                                                                        <span class="input-group-text" id="inputGroup-sizing-default">Default</span>
                                                                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="input-group input-group-lg">
                                                                        <span class="input-group-text" id="inputGroup-sizing-lg">Large</span>
                                                                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Input Group Sizing --&gt;
&lt;div class=&quot;input-group input-group-sm&quot;&gt;
    &lt;span class=&quot;input-group-text&quot; id=&quot;inputGroup-sizing-sm&quot;&gt;Small&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Sizing example input&quot; aria-describedby=&quot;inputGroup-sizing-sm&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;span class=&quot;input-group-text&quot; id=&quot;inputGroup-sizing-default&quot;&gt;Default&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Sizing example input&quot; aria-describedby=&quot;inputGroup-sizing-default&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;input-group input-group-lg&quot;&gt;
    &lt;span class=&quot;input-group-text&quot; id=&quot;inputGroup-sizing-lg&quot;&gt;Large&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Sizing example input&quot; aria-describedby=&quot;inputGroup-sizing-lg&quot;&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Multiple Inputs</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="input-group-multiple-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="input-group-multiple-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">While multiple <code>&lt;input&gt;</code>s are supported visually, validation styles are only available for input groups with a single <code>&lt;input&gt;</code>.
                                                        </p>
                                                        <div class="live-preview">
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text">First and last name</span>
                                                                <input type="text" aria-label="First name" class="form-control"/>
                                                                <input type="text" aria-label="Last name" class="form-control"/>
                                                            </div>

                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text">$</span>
                                                                <span class="input-group-text">0.00</span>
                                                                <input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"/>
                                                            </div>

                                                            <div class="input-group">
                                                                <input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"/>
                                                                <span class="input-group-text">$</span>
                                                                <span class="input-group-text">0.00</span>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Multiple Inputs --&gt;
&lt;div class=&quot;input-group mb-3&quot;&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;First and last name&lt;/span&gt;
    &lt;input type=&quot;text&quot; aria-label=&quot;First name&quot; class=&quot;form-control&quot;&gt;
    &lt;input type=&quot;text&quot; aria-label=&quot;Last name&quot; class=&quot;form-control&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;input-group mb-3&quot;&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;$&lt;/span&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;0.00&lt;/span&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Dollar amount (with dot and two decimal places)&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Dollar amount (with dot and two decimal places)&quot;&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;$&lt;/span&gt;
    &lt;span class=&quot;input-group-text&quot;&gt;0.00&lt;/span&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Buttons, Checkboxs and Radios Group</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="input-group-btncheck-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="input-group-btncheck-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div>
                                                                <p class="text-muted">Use any checkbox, radio, or button option within an input group’s addon instead of text. We recommend adding <code>mt-0</code> class to the <code>form-check-input</code> when there’s no visible text next to the input.</p>
                                                                <div class="row g-3">
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <div class="input-group-text">
                                                                                <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input"/>
                                                                            </div>
                                                                            <input type="text" class="form-control" aria-label="Text input with checkbox"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <div class="input-group-text">
                                                                                <input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input"/>
                                                                            </div>
                                                                            <input type="text" class="form-control" aria-label="Text input with radio button"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <button class="btn btn-outline-primary" type="button" id="button-addon1">Button</button>
                                                                            <input type="text" class="form-control" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2"/>
                                                                            <button class="btn btn-outline-success" type="button" id="button-addon2">Button</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <button class="btn btn-primary" type="button">Button</button>
                                                                            <button class="btn btn-success" type="button">Button</button>
                                                                            <input type="text" class="form-control" placeholder="" aria-label="Example text with two button addons"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control" aria-label="Recipient's username with two button addons"/>
                                                                            <button class="btn btn-primary" type="button">Button</button>
                                                                            <button class="btn btn-success" type="button">Button</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Checkbox Input --&gt;
&lt;div class=&quot;input-group&quot;&gt;
    &lt;div class=&quot;input-group-text&quot;&gt;
        &lt;input class=&quot;form-check-input mt-0&quot; type=&quot;checkbox&quot; value=&quot;&quot; aria-label=&quot;Checkbox for following text input&quot;&gt;
    &lt;/div&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Text input with checkbox&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Radio Input --&gt;
&lt;div class=&quot;input-group&quot;&gt;
    &lt;div class=&quot;input-group-text&quot;&gt;
        &lt;input class=&quot;form-check-input mt-0&quot; type=&quot;radio&quot; value=&quot;&quot; aria-label=&quot;Radio button for following text input&quot;&gt;
    &lt;/div&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Text input with radio button&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Buttons Input --&gt;
&lt;div class=&quot;input-group&quot;&gt;
    &lt;button class=&quot;btn btn-outline-primary&quot; type=&quot;button&quot; id=&quot;button-addon1&quot;&gt;Button&lt;/button&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;&quot; aria-label=&quot;Example text with button addon&quot; aria-describedby=&quot;button-addon1&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Recipient's username&quot; aria-describedby=&quot;button-addon2&quot;&gt;
    &lt;button class=&quot;btn btn-outline-success&quot; type=&quot;button&quot; id=&quot;button-addon2&quot;&gt;Button&lt;/button&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;button class=&quot;btn btn-primary&quot; type=&quot;button&quot;&gt;Button&lt;/button&gt;
    &lt;button class=&quot;btn btn-success&quot; type=&quot;button&quot;&gt;Button&lt;/button&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;&quot; aria-label=&quot;Example text with two button addons&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Recipient's username with two button addons&quot;&gt;
    &lt;button class=&quot;btn btn-primary&quot; type=&quot;button&quot;&gt;Button&lt;/button&gt;
    &lt;button class=&quot;btn btn-success&quot; type=&quot;button&quot;&gt;Button&lt;/button&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Buttons with dropdowns</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="input-group-dropdown-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="input-group-dropdown-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <div class="live-preview">
                                                            <div>
                                                                <p class="text-muted">You can use a button with the dropdown toggle to set the file input group.</p>
                                                                <div class="row g-3">
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                                                                            <ul class="dropdown-menu">
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Action</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Another action</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                                                </li>
                                                                                <li>
                                                                                    <hr class="dropdown-divider"/>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Separated link</a>
                                                                                </li>
                                                                            </ul>
                                                                            <input type="text" class="form-control" aria-label="Text input with dropdown button"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control" aria-label="Text input with dropdown button"/>
                                                                            <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                                                                            <ul class="dropdown-menu dropdown-menu-end">
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Action</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Another action</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                                                </li>
                                                                                <li>
                                                                                    <hr class="dropdown-divider"/>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Separated link</a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <div class="input-group">
                                                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                                                                            <ul class="dropdown-menu">
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Action before</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Another action before</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                                                </li>
                                                                                <li>
                                                                                    <hr class="dropdown-divider"/>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Separated link</a>
                                                                                </li>
                                                                            </ul>
                                                                            <input type="text" class="form-control" aria-label="Text input with 2 dropdown buttons"/>
                                                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                                                                            <ul class="dropdown-menu dropdown-menu-end">
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Action</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Another action</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                                                </li>
                                                                                <li>
                                                                                    <hr class="dropdown-divider"/>
                                                                                </li>
                                                                                <li>
                                                                                    <a class="dropdown-item" href="#">Separated link</a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Buttons with dropdowns --&gt;
&lt;div class=&quot;input-group&quot;&gt;
    &lt;button class=&quot;btn btn-primary dropdown-toggle&quot; type=&quot;button&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Dropdown&lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;hr class=&quot;dropdown-divider&quot;&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Text input with dropdown button&quot;&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Text input with dropdown button&quot;&gt;
    &lt;button class=&quot;btn btn-success dropdown-toggle&quot; type=&quot;button&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Dropdown&lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu dropdown-menu-end&quot;&gt;
      &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;hr class=&quot;dropdown-divider&quot;&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;button class=&quot;btn btn-outline-secondary dropdown-toggle&quot; type=&quot;button&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Dropdown&lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action before&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action before&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;hr class=&quot;dropdown-divider&quot;&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
    &lt;input type=&quot;text&quot; class=&quot;form-control&quot; aria-label=&quot;Text input with 2 dropdown buttons&quot;&gt;
    &lt;button class=&quot;btn btn-outline-secondary dropdown-toggle&quot; type=&quot;button&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Dropdown&lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu dropdown-menu-end&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;hr class=&quot;dropdown-divider&quot;&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Custom Forms</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="input-group-custom-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="input-group-custom-showcode"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Input groups include support for custom selects and custom file inputs. Browser default versions of these are not supported.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <h5 class="fs-15 mb-3">Select</h5>
                                                                <div class="row g-3">
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <label class="input-group-text" for="inputGroupSelect01">Options</label>
                                                                            <select class="form-select" id="inputGroupSelect01">
                                                                                <option selected="">Choose...</option>
                                                                                <option value="1">One</option>
                                                                                <option value="2">Two</option>
                                                                                <option value="3">Three</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <select class="form-select" id="inputGroupSelect02">
                                                                                <option selected="">Choose...</option>
                                                                                <option value="1">One</option>
                                                                                <option value="2">Two</option>
                                                                                <option value="3">Three</option>
                                                                            </select>
                                                                            <label class="input-group-text" for="inputGroupSelect02">Options</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <button class="btn btn-outline-primary" type="button">Button</button>
                                                                            <select class="form-select" id="inputGroupSelect03" aria-label="Example select with button addon">
                                                                                <option selected="">Choose...</option>
                                                                                <option value="1">One</option>
                                                                                <option value="2">Two</option>
                                                                                <option value="3">Three</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <select class="form-select" id="inputGroupSelect04" aria-label="Example select with button addon">
                                                                                <option selected="">Choose...</option>
                                                                                <option value="1">One</option>
                                                                                <option value="2">Two</option>
                                                                                <option value="3">Three</option>
                                                                            </select>
                                                                            <button class="btn btn-outline-secondary" type="button">Button</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="mt-4">
                                                                <h5 class="fs-15 mb-3">File Input</h5>
                                                                <div class="row g-3">
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <label class="input-group-text" for="inputGroupFile01">Upload</label>
                                                                            <input type="file" class="form-control" id="inputGroupFile01"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <input type="file" class="form-control" id="inputGroupFile02"/>
                                                                            <label class="input-group-text" for="inputGroupFile02">Upload</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <button class="btn btn-outline-primary" type="button" id="inputGroupFileAddon03">Button</button>
                                                                            <input type="file" class="form-control" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03" aria-label="Upload"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload"/>
                                                                            <button class="btn btn-outline-success" type="button" id="inputGroupFileAddon04">Button</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Select --&gt;
&lt;div class=&quot;input-group&quot;&gt;
    &lt;label class=&quot;input-group-text&quot; for=&quot;inputGroupSelect01&quot;&gt;Options&lt;/label&gt;
    &lt;select class=&quot;form-select&quot; id=&quot;inputGroupSelect01&quot;&gt;
        &lt;option selected&gt;Choose...&lt;/option&gt;
        &lt;option value=&quot;1&quot;&gt;One&lt;/option&gt;
        &lt;option value=&quot;2&quot;&gt;Two&lt;/option&gt;
        &lt;option value=&quot;3&quot;&gt;Three&lt;/option&gt;
    &lt;/select&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;select class=&quot;form-select&quot; id=&quot;inputGroupSelect02&quot;&gt;
        &lt;option selected&gt;Choose...&lt;/option&gt;
        &lt;option value=&quot;1&quot;&gt;One&lt;/option&gt;
        &lt;option value=&quot;2&quot;&gt;Two&lt;/option&gt;
        &lt;option value=&quot;3&quot;&gt;Three&lt;/option&gt;
        &lt;/select&gt;
    &lt;label class=&quot;input-group-text&quot; for=&quot;inputGroupSelect02&quot;&gt;Options&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;button class=&quot;btn btn-outline-primary&quot; type=&quot;button&quot;&gt;Button&lt;/button&gt;
    &lt;select class=&quot;form-select&quot; id=&quot;inputGroupSelect03&quot; aria-label=&quot;Example select with button addon&quot;&gt;
        &lt;option selected&gt;Choose...&lt;/option&gt;
        &lt;option value=&quot;1&quot;&gt;One&lt;/option&gt;
        &lt;option value=&quot;2&quot;&gt;Two&lt;/option&gt;
        &lt;option value=&quot;3&quot;&gt;Three&lt;/option&gt;
    &lt;/select&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;select class=&quot;form-select&quot; id=&quot;inputGroupSelect04&quot; aria-label=&quot;Example select with button addon&quot;&gt;
        &lt;option selected&gt;Choose...&lt;/option&gt;
        &lt;option value=&quot;1&quot;&gt;One&lt;/option&gt;
        &lt;option value=&quot;2&quot;&gt;Two&lt;/option&gt;
        &lt;option value=&quot;3&quot;&gt;Three&lt;/option&gt;
    &lt;/select&gt;
    &lt;button class=&quot;btn btn-outline-secondary&quot; type=&quot;button&quot;&gt;Button&lt;/button&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- File Input --&gt;
&lt;div class=&quot;input-group&quot;&gt;
    &lt;label class=&quot;input-group-text&quot; for=&quot;inputGroupFile01&quot;&gt;Upload&lt;/label&gt;
    &lt;input type=&quot;file&quot; class=&quot;form-control&quot; id=&quot;inputGroupFile01&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;input type=&quot;file&quot; class=&quot;form-control&quot; id=&quot;inputGroupFile02&quot;&gt;
    &lt;label class=&quot;input-group-text&quot; for=&quot;inputGroupFile02&quot;&gt;Upload&lt;/label&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;button class=&quot;btn btn-outline-primary&quot; type=&quot;button&quot; id=&quot;inputGroupFileAddon03&quot;&gt;Button&lt;/button&gt;
    &lt;input type=&quot;file&quot; class=&quot;form-control&quot; id=&quot;inputGroupFile03&quot; aria-describedby=&quot;inputGroupFileAddon03&quot; aria-label=&quot;Upload&quot;&gt;
&lt;/div&gt;</code>
                                                                <code>&lt;div class=&quot;input-group&quot;&gt;
    &lt;input type=&quot;file&quot; class=&quot;form-control&quot; id=&quot;inputGroupFile04&quot; aria-describedby=&quot;inputGroupFileAddon04&quot; aria-label=&quot;Upload&quot;&gt;
    &lt;button class=&quot;btn btn-outline-success&quot; type=&quot;button&quot; id=&quot;inputGroupFileAddon04&quot;&gt;Button&lt;/button&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->

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
