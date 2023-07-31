<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <xsl:call-template name="igrp-head"/>
        <style/>
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

                  <div class="row">
                    <div class="col-lg-12">
                      <xsl:if test="rows/content/messages/message">
                        <xsl:for-each select="rows/content/messages/message">
                          <div class="alert alert-{@type} alert-border-left alert-dismissible fade show" role="alert">
                            <i class="ri-check-line me-3 align-middle"></i> 
                            <xsl:value-of select="."></xsl:value-of>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                          </div>
                        </xsl:for-each>
                      </xsl:if>
                      <div class="card" id="leadsList">
                 
                        <div class="card-header border-0">

                          <div class="row g-4 align-items-center">
                            <div class="col-sm-3">
                              <div class="search-box">
                                <input type="text" class="form-control search" placeholder="Pesquisar..."/>
                                <i class="ri-search-line search-icon"></i>
                              </div>
                            </div>
                            <div class="col-sm-auto ms-auto">
                              <div class="hstack gap-2">
                                <button class="btn btn-soft-danger d-none" onClick="deleteMultiple()">
                                  <i class="ri-delete-bin-2-line"></i>
                                </button>
                                <button type="button" class="btn btn-light" data-bs-toggle="offcanvas" href="#offcanvasExample">
                                  <i class="ri-filter-3-line align-bottom me-1"></i> Filtrar</button>
                                <button type="button" class="btn btn-primary add-btn" data-bs-toggle="modal" id="create-btn" data-bs-target="#showModal">
                                  <i class="ri-mail-send-line align-bottom me-1"></i>Convidar</button>
                                <span class="dropdown d-none">
                                  <button class="btn btn-soft-info btn-icon fs-14" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="ri-settings-4-line"></i>
                                  </button>
                                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li>
                                      <a class="dropdown-item" href="#">Copy</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#">Move to pipline</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#">Add to exceptions</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#">Switch to common form view</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#">Reset form view to default</a>
                                    </li>
                                  </ul>
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="card-body">
                          <div>
                            <div class="table-responsive table-card">
                              <table class="table align-middle table-hover" id="customerTable">
                                <thead class="table-light">
                                  <tr>
                                    <th scope="col" style="width: 50px;">Estado</th>
                                    <th class="sort" data-sort="name">Nome</th>
                                    <th class="sort" data-sort="username">Username</th>
                                    <th class="sort" data-sort="email">E-mail</th>
                                    <th class="sort" data-sort="profile">App/Org/Perfil</th>
                                    <th class="" ></th>
                                  </tr>
                                </thead>
                                <tbody class="list form-check-all">
                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" checked="" role="switch" id="flexSwitchCheckDefault"/>
                                          </div>
                                        </div>
                                      </th>
                                      <td class="name">
                                        <div class="d-flex align-items-center">
                                          <div class="flex-shrink-0 d-none">
                                            <img src="{$themePath}/assets/images/users/avatar-10.jpg" alt="" class="avatar-xxs rounded-circle image_src object-cover"/>
                                          </div>
                                          <div class="flex-grow-1 ms-2 name" style="min-width:140px;">
                                            <xsl:value-of select="nominho"/>
                                          </div>
                                        </div>
                                      </td>
                                      <td class="username"><xsl:value-of select="nome"/></td>
                                      <td class="email"><xsl:value-of select="tb_email"/></td>
                                      <td class="profile"><xsl:value-of select="perfile"/></td>
                                      <td>
                                        <ul class="list-inline hstack gap-2 mb-0">
                                          <li class="list-inline-item edit" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Associar Menu">
                                            <a href="javascript:void(0);" class="text-muted d-inline-block">
                                              <i class="ri-menu-line fs-16"></i>
                                            </a>
                                          </li>
                                          <li class="list-inline-item edit" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Transação">
                                            <a href="javascript:void(0);" class="text-muted d-inline-block">
                                              <i class="ri-arrow-left-right-line fs-16"></i>
                                            </a>
                                          </li>

                                          <li class="list-inline-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Eliminar">
                                            <a class="remove-item-btn" data-bs-toggle="modal" href="#deleteRecordModal">
                                              <i class="ri-delete-bin-fill align-bottom text-muted"></i>
                                            </a>
                                          </li>
                                        </ul>
                                      </td>
                                    </tr>
                                  </xsl:for-each>
                                  
                                
                                </tbody>
                              </table>
                              <div class="noresult" style="display: none">
                                <div class="text-center">
                                  <lord-icon src="https://cdn.lordicon.com/msoeawqm.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:75px;height:75px"></lord-icon>
                                  <h5 class="mt-2">Sorry! No Result Found</h5>
                                  <p class="text-muted mb-0">We've searched more than 150+ leads We did not find any leads for you search.</p>
                                </div>
                              </div>
                            </div>
                            <div class="d-flex justify-content-end mt-4">
                              <div class="pagination-wrap hstack gap-2">
                                <a class="page-item pagination-prev disabled" href="#">
                                                Anterior
                                </a>
                                <ul class="pagination listjs-pagination mb-0"></ul>
                                <a class="page-item pagination-next" href="#">
                                                Próxima
                                </a>
                              </div>
                            </div>
                          </div>

                          <div class="modal fade" id="showModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">
                                <div class="modal-header bg-light p-3">
                                  <h5 class="modal-title" id="exampleModalLabel">Convidar Utilizador</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
                                </div>
                                <form action="IGRP-gestao-utilizadores-confirm.xml">
                                  <div class="modal-body">
                                    <input type="hidden" id="id-field" />
                                    <div class="row g-3">

                                      <div class="col-lg-12">
                                        <div>
                                          <label for="company_name-field" class="form-label">E-mail</label>
                                          <input type="email" id="company_name-field" class="form-control" placeholder="" required="" />
                                        </div>
                                      </div>
                                      <!--end col-->
                                      <div class="col-lg-12">
                                        <div>
                                          <label for="leads_score-field" class="form-label">Organização</label>
                                          <select class="form-control">
                                            <option>-- Selecionar --</option>
                                            <option value="1">IGRP</option>
                                          </select>
                                        </div>
                                      </div>

                                      <!--end col-->
                                    </div>
                                    <!--end row-->
                                  </div>
                                  <div class="modal-footer">
                                    <div class="hstack gap-2 justify-content-end">
                                      <button type="button" class="btn btn-light" data-bs-dismiss="modal">Fechar</button>
                                      <button type="submit" class="btn btn-primary" id="add-btn">Convidar</button>

                                    </div>
                                  </div>
                                </form>
                              </div>
                            </div>
                          </div>
                          <!--end modal-->

                          <!-- Modal -->
                          <div class="modal fade zoomIn" id="deleteRecordModal" tabindex="-1" aria-labelledby="deleteRecordLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close"></button>
                                </div>
                                <div class="modal-body p-5 text-center">
                                  <lord-icon src="https://cdn.lordicon.com/gsqxdxog.json" trigger="loop" colors="primary:#405189,secondary:#f06548" style="width:90px;height:90px"></lord-icon>
                                  <div class="mt-4 text-center">
                                    <h4 class="fs-semibold">Tem certeza?</h4>
                                    <p class="text-muted fs-14 mb-4 pt-1">Está prestes a eliminar o utilizador</p>
                                    <div class="hstack gap-2 justify-content-center remove">

                                      <button class="btn btn-link link-success fw-medium text-decoration-none" id="deleteRecord-close" data-bs-dismiss="modal">
                                        <i class="ri-close-line me-1 align-middle"></i> Fechar</button>
                                      <button class="btn btn-danger" id="delete-record">Sim, Confirmar!!</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!--end modal -->


                          <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                            <div class="offcanvas-header bg-light">
                              <h5 class="offcanvas-title" id="offcanvasExampleLabel">Filtrar Utilizadores</h5>
                              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                            </div>
                            <!--end offcanvas-header-->
                            <form action="" class="d-flex flex-column justify-content-end h-100">
                              <div class="offcanvas-body">
                                <div class="mb-4">
                                  <label  class="form-label text-muted text-uppercase fw-semibold mb-3">Username</label>
                                  <input type="text" class="form-control" />
                                </div>

                                <div class="mb-4">
                                  <label class="form-label text-muted text-uppercase fw-semibold mb-3">E-mail</label>
                                  <input type="email" class="form-control" />
                                </div>
                                <div class="mb-4">
                                  <label class="form-label text-muted text-uppercase fw-semibold mb-3">Aplicação</label>
                                  <select class="form-control select2" id="form_1_aplicacao" name="p_aplicacao" placeholder="" disabled="" maxlength="50" igrp-remote="?r=fkzUyQimUqFg4StT4y9wGXPIYUXZOp15pkjYFHXen9s=&amp;dad=application_example" tabindex="-1" aria-hidden="true">
                                    <option value="" label="-- Selecionar --">-- Selecionar --</option>
                                    <option value="397" label="Application Example" selected="">Demo App</option>
                                    <option value="375" label="App Mobilidade Elétrica">App Mobilidade Elétrica</option>
                                    <option value="357" label="NOSICA G2">NOSICA G2</option>
                                    <option value="354" label="Câmara Municipal de São Filipe - SIMPLE">Câmara Municipal de São Filipe - SIMPLE</option>
                                    <option value="353" label="Sistema de Informação Tributária (SIT) - IVA">Sistema de Informação Tributária (SIT) - IVA</option>
                                    <option value="347" label="SIMPLE GLOBAL">SIMPLE GLOBAL</option>
                                    <option value="330" label="UI UX Apps">UI UX Apps</option>
                                    <option value="321" label="NOSiGIS">NOSiGIS</option>
                                    <option value="319" label="Eleições GIS">Eleições GIS</option>
                                    <option value="306" label="portondinosilha">portondinosilha</option>
                                    <option value="288" label="Sistema Gestão de Desempenho">Sistema Gestão de Desempenho</option>
                                    <option value="257" label="IGRP Global Tests">IGRP Global Tests</option>
                                    <option value="256" label="BVCPI - Bolsa Valores CV Portal investimento">BVCPI - Bolsa Valores CV Portal investimento</option>
                                    <option value="237" label="INPS PORTON">INPS PORTON</option>
                                    <option value="229" label="Cmara Municipal de Boa Vista - SIMPLE">Cmara Municipal de Boa Vista - SIMPLE</option>
                                    <option value="221" label="Recursos Humanos - Global">Recursos Humanos - Global</option>
                                    <option value="215" label="eSAJ">eSAJ</option>
                                    <option value="211" label="UIF">UIF</option>
                                    <option value="69" label="SIS">SIS</option>
                                    <option value="8" label="My App">My App</option>
                                    <option value="3" label="IGRP Studio">IGRP Studio</option>
                                  </select>
                                </div>
                                <div class="mb-4">
                                  <label for="datepicker-range" class="form-label text-muted text-uppercase fw-semibold mb-3">Aplicação</label>
                                  <select
                                    class="form-control select2 select2-hidden-accessible"
                                    id="form_1_organica"
                                    name="p_organica"
                                    placeholder=""
                                    maxlength="100"
                                    tabindex="-1"
                                    aria-hidden="true"
                                  >
                                    <option value="">-- Selecionar --</option>
                                    <option value="284" selected="">IGRP</option>
                                  </select>

                                </div>



                              </div>
                              <!--end offcanvas-body-->
                              <div class="offcanvas-footer border-top p-3 text-center hstack gap-2">
                                <button class="btn btn-light w-100">Limpar Filtro</button>
                                <button type="submit" class="btn btn-primary w-100">Filtrar</button>
                              </div>
                              <!--end offcanvas-footer-->
                            </form>
                          </div>
                          <!--end offcanvas-->




                        </div>
                      </div>

                    </div>
                    <!--end col-->
                  </div>

                </div>
              </div>
            </div>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>
        <xsl:call-template name="igrp-page-helpers"/>
        <!-- list.js min js -->
        <script src="assets/libs/list.js/list.min.js"></script>
        <script src="assets/libs/list.pagination.js/list.pagination.min.js"></script>

        <!-- Sweet Alerts js -->
        <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
        <!-- crm leads init -->
        <script src="assets/js/pages/crm-leads.init.js"></script>
        <xsl:call-template name="igrp-scripts"/>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.common.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.head.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.header.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.scripts.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.footer.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.sidebar.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=22"/>
</xsl:stylesheet>
