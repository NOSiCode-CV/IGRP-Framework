<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" autoFlush="true"%>
<%@ page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ready">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="SHORTCUT ICON" href="/IGRP/images/IGRP/IGRP2.3/assets/img/favicon.ico">
      <link rel="mask-icon" href="/IGRP/images/IGRP/IGRP2.3/assets/img/safari-pinned-tab.svg" color="#5bbad5">
      <title>IGRP</title>
      <link rel="stylesheet" href="/IGRP/images/IGRP/IGRP2.3/core/normalize/normalize.css" media="all" onload="if(media!='all')media='all'">
      <link rel="stylesheet" href="/IGRP/images/IGRP/IGRP2.3/core/bootstrap/3.3.7/css/bootstrap.min.css" media="all" onload="if(media!='all')media='all'">
      <link rel="stylesheet" href="/IGRP/images/IGRP/IGRP2.3/themes/bs.columns.css" media="all" onload="if(media!='all')media='all'">
      <link rel="stylesheet" href="/IGRP/images/IGRP/IGRP2.3/themes/bs.class.css" media="all" onload="if(media!='all')media='all'">
      <link rel="stylesheet" href="/IGRP/images/IGRP/IGRP2.3/themes/style.css">
      <link rel="stylesheet" type="text/css" href="/IGRP/images/IGRP/IGRP2.3/core/igrp/form/igrp.forms.css" media="all" onload="if(media!='all')media='all'">
      <script src="/IGRP/images/IGRP/IGRP2.3/core/promise/promise.min.js"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/moment/moment.min.js" async="async"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/jquery/3.3.1/jquery.min.js"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/jquery/2.1/jquery-migrate.min.js"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/bootstrap/3.3.7/js/bootstrap.min.js" async="async"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/bootstrap/plugins/toolkit/bootstrap-toolkit.min.js"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/bootstrap/plugins/notify/bootstrap-notify.min.js" async="async"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/bootstrap/plugins/validation/js/jquery.validate.js"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/IGRP.events.class.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/IGRP.jsutils.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/IGRP.class.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/IGRP.defaults.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/IGRP.core.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/globalmodal/IGRP.globalModal.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/iframenav/IGRP.iframeNav.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/targets/IGRP.targets.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/tree/IGRP.tree.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/sidebar/IGRP.sidebar.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/searchlist/IGRP.searchlist.js" charset="UTF-8"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/rightpanel/rightpanel.js" async="async"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/themes/IGRP.themes.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/scrolltop/IGRP.scrolltop.js?v=1292736963797178033"></script><script src="/IGRP/images/IGRP/IGRP2.3/core/igrp/xml.xslt/xml.xsl.transform.js?v=1292736963797178033"></script><script encode="utf-8" src="/IGRP/images/IGRP/IGRP2.3/core/igrp/IGRP.handler.js?v=1292736963797178033"></script><script>
         $.IGRP.component('colorPalettes',{
           colors : [
           
             {
               value:"cp-fresh",
               label:"fresh",
               color:"#4ABDAC",
               text :"white"
             },
             {
               value:"cp-vermillion",
               label:"vermillion",
               color:"#FC4A1A",
               text :"white"
             },
             {
               value:"cp-orange",
               label:"orange",
               color:"#F79E02",
               text :"white"
             },
             {
               value:"cp-starrynight",
               label:"starrynight",
               color:"#0375BA",
               text :"white"
             },
             {
               value:"cp-irises",
               label:"irises",
               color:"#007849",
               text :"white"
             },
             {
               value:"cp-palegold",
               label:"palegold",
               color:"#C0B283",
               text :"white"
             },
             {
               value:"cp-powder",
               label:"powder",
               color:"#66B9BF",
               text :"white"
             },
             {
               value:"cp-tan",
               label:"tan",
               color:"#EEAA7B",
               text :"white"
             },
             {
               value:"cp-fuschia",
               label:"fuschia",
               color:"#A239CA",
               text :"white"
             },
             {
               value:"cp-lavendar",
               label:"lavendar",
               color:"#6D7993",
               text :"white"
             },
             {
               value:"cp-ink",
               label:"ink",
               color:"#062F4F",
               text :"white"
             },
             {
               value:"cp-embers",
               label:"embers",
               color:"#B82601",
               text :"white"
             },
             {
               value:"cp-electric",
               label:"electric",
               color:"#3CC47C",
               text :"white"
             },
             {
               value:"cp-black",
               label:"black",
               color:"#000",
               text :"white"
             },
             {
               value:"cp-rustyred",
               label:"rustyred",
               color:"#984B43",
               text :"white"
             },
             {
               value:"cp-blush",
               label:"blush",
               color:"#EB6E80",
               text :"white"
             },
             {
               value:"cp-petal",
               label:"petal",
               color:"#D48CF8",
               text :"white"
             },
             {
               value:"cp-field",
               label:"field",
               color:"#B37D4E",
               text :"white"
             },
             {
               value:"cp-mint",
               label:"mint",
               color:"#B4DBC0",
               text :"white"
             },
             {
               value:"cp-magenta",
               label:"magenta",
               color:"#F81B8A",
               text :"white"
             },
             {
               value:"cp-yellow",
               label:"yellow",
               color:"#F5CE28",
               text :"white"
             },
             {
               value:"cp-cyan",
               label:"cyan",
               color:"#43C0F6",
               text :"white"
             },
             {
               value:"cp-jewel",
               label:"jewel",
               color:"#5F0F4E",
               text :"white"
             },
             {
               value:"cp-stylish",
               label:"stylish",
               color:"#557A95",
               text :"white"
             },
             {
               value:"cp-citrus",
               label:"citrus",
               color:"#A4A71E",
               text :"white"
             }
           ]
         });
         
         
      </script><script>
         var path = '/IGRP/images/IGRP/IGRP2.3';
         $(document).ready( $.IGRP.init );
      </script>
   </head>
   
     <body class="fixed-nav old-v fluid sidebar-off" template="" has-menu="true" page="Form" app="igrp"> 
       <nav id="igrp-top-nav" class="navbar navbar-fixed-top" bg-color="1">
         <a class="navbar-brand col-sm-3 col-md-2" href="#"><img src="/IGRP/images/IGRP/IGRP2.3/themes/default/img/logo2.svg"><span class=""><b>IGRP</b></span></a>
         <div id="side-bar-ctrl"><i class="fa fa-navicon"></i></div>
         <div id="igrp-app-title" class="" style="max-width: 847.75px;">Integrated Government Resource Planning</div>
         <ul id="igrp-top-menu" class="hidden-xs nav navbar-nav navbar-right">
           <!--   <li alt="Home" title="Home"><a href="webapps?r=igrp/DefaultPage/index&amp;dad=igrp" target="_self"><i class="fa fa-home"></i></a></li> -->
           <!--   <li alt="Settings" title="Settings"><a href="#" target="modal" close="refresh"><img src="/IGRP/images/IGRP/IGRP2.3/assets/img/english_flag.png" style="width: 26px;padding-bottom: 3px;"><span class=""><b>Nositeste</b></span></a></li> -->
            <li alt="Sair" title="Sair"><a href="app/webapps?r=igrp/login/logout" target="_self"><i class="fa fa-sign-out"></i></a></li> 
         </ul>
      </nav>
      
      <form>
         <div class="container-fluid">
             <div class="row"> 
               <!-- <div class="col-md-2 col-sm-3 sidebar tree-list" id="igrp-sidebar">
                  <div class="side-bar-ctrl visible-xs clearfix"><i class="fa fa-navicon pull-right"></i></div>
                  <div class="igrp-sidebar-menu-search-wrapper"><input class="form-control igrp-search-list" placeholder="Pesquisar Menu..." search-list="#igrp-sidebar ul.treeview-menu li a" search-attr="text" search-item-parent=".treeview" search-item-wrapper=".treeview-menu" type="text"></div>
                  <ul class="nav nav-sidebar">
                     <li parent-id="igrp-1" class="treeview"><a href="webapps?r=igrp/Migrate/index&amp;dad=igrp" target="_self" item-id="igrp-1-1"><span>Migrate IGRP</span><span class="nav-bar-active" bg-color="2"></span></a></li>
                     <li parent-id="igrp-2" class="treeview"><a href="webapps?r=igrp_studio/Partilhageral/index&amp;dad=igrp" target="_self" item-id="igrp-2-2"><span>Share Page</span><span class="nav-bar-active" bg-color="2"></span></a></li>
                     <li parent-id="igrp-3" class="treeview"><a href="webapps?r=igrp/Settings/index&amp;dad=igrp" target="_self" item-id="igrp-3-3"><span>My Account</span><span class="nav-bar-active" bg-color="2"></span></a></li>
                     <li parent-id="igrp-4" class="treeview"><a href="webapps?r=igrp/_CONS_PROC/index&amp;dad=igrp" target="_self" item-id="igrp-4-4"><span>Browse process</span><span class="nav-bar-active" bg-color="2"></span></a></li>
                     <li parent-id="igrp-5" class="treeview"><a href="webapps?r=igrp/Gestaodeacesso/index&amp;dad=igrp" target="_self" item-id="igrp-5-5"><span>Access Management</span><span class="nav-bar-active" bg-color="2"></span></a></li>
                  </ul>
               </div>--> 
               <div class="col-sm-12 col-md-12 main with-search" id="igrp-contents">
                  <div class="content"> 
                     <div class="row row-fluid">
                        <nav class="navbar navbar-default" role="navigation">
                           <div class="container-fluid">
                              <div class="form-group" id="searcher">
                                 <div class="input-group"><input class="form-control" id="" placeholder="Pesquisar " type="text"><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-search"></i></button></span><span class="input-group-btn"><button type="button" class="btn btn-default searcher-clean"><i class="fa fa-times"></i></button></span></div>
                              </div>
                           </div>
                        </nav>
                     </div>
                     <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                           <div class="gen-tab-holder nav-tabs-custom" tab-template="clean" id="igrp-apps-1">
                              <ul class="nav nav-tabs">
                                 <li class="active" rel="minhas_aplicacoes"><a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#minhas_aplicacoes"><span>Meus Ambientes</span></a></li>
                                 <li rel="outras_apps"><a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#outras_apps"><span></span></a></li>
                              </ul>
                              <div class="tab-content">
                                 <div class="tab-pane gen-rows-holder active" id="minhas_aplicacoes" rel="minhas_aplicacoes">
                                    <div class="row " id="row-fc3bde21">
                                       <div class="gen-column col-sm-12">
                                          <div class="gen-inner">
                                            
                                            
                                            
                                            <%!
												List<String> mylinks = new ArrayList<String>();
												String token = "";
											%>
											<%
												String json = (String)session.getAttribute("__links");
												JSONObject jsonObject = new JSONObject(json);
												JSONArray jsonArray = jsonObject.getJSONArray("myLinks");
												token = jsonObject.getString("token");
												
												for(int i = 0; i < jsonArray.length(); i++){ 
													if(jsonArray.get(i).toString().contains("0_45") || jsonArray.get(i).toString().contains("0_47") || jsonArray.get(i).toString().contains("0_58"))
														mylinks.add(jsonArray.get(i).toString()); 
												}
											%>
	
											<% 
											
											Collections.sort(mylinks);
											
											for(int i = 0; i < mylinks.size(); i++) { 
												String aux =  mylinks.get(i); 
												String link = "https://" + mylinks.get(i) + "/igrpoauth2sso?_t=" + token;
												link = link.replace("0_45", "-").replace("0_47", "/").replace("0_58", ":");
												aux = aux.replace("0_45", "-").replace("0_47", "/").replace("0_58", ":");
												
											%>   
											
										     <div class="col-md-3 col-sm-6 col-xs-12 apps-col">
                                                <a href="<%=link%>" class="igrp-app-block clear clearfix" search-content="<%=aux%>">
                                                   <div class="app-img"><img src="/IGRP/images/IGRP/IGRP2.3/assets/img/loginLogo.svg"></div>
                                                   <div class="app-title"><span><%=aux%></span></div>
                                                   <div class="app-desc"><span>Server</span></div>
                                                </a>
                                             </div>
                                             
										    <% 
										    	} 
	
											mylinks.clear();
											
										    %>
                                            
                                             
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="tab-pane gen-rows-holder" id="outras_apps" rel="outras_apps">
                                    <div class="row " id="row-fc3bde21">
                                       <div class="gen-column col-sm-12">
                                          <div class="gen-inner"></div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div id="igrp-apps-1" class="igrp-home-search-res"></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div id="igrp-global-modal" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header"><span class="title"></span><button type="button" class="close" data-dismiss="modal">×</button></div>
                  <div class="modal-body"></div>
                  <div class="modal-footer"></div>
               </div>
            </div>
            <div style="display:none!important">
               <text id="confirm-text"></text>
            </div>
         </div>
         <div class="modal fade right" id="igrp-right-panel">
            <div class="modal-dialog">
               <div class="igrp-right-panel-close" data-dismiss="modal"><i class="fa fa-times"></i></div>
               <div class="modal-content"><iframe id="igrp-right-panel-iframe"></iframe></div>
               <div class="loader"></div>
            </div>
         </div>
         <igrp-variables class="hidden invisible">
            <igrp-page-title class="hidden">Home</igrp-page-title>
         </igrp-variables>
         <button class="btn btn-default" id="igrp-go-up" target="scroll_to_top" bg-color="primary" style="display: none;"><i class="fa fa-arrow-up"></i></button>
         <div class="modal fade" data-backdrop="static" tabindex="-1" id="igrp-iframe-nav" role="dialog">
            <div class="iframe-nav-close"><i class="fa fa-close"></i></div>
            <div class="modal-dialog"><iframe></iframe></div>
            <div class="loader"></div>
         </div> 
         <link rel="stylesheet" href="/IGRP/images/IGRP/IGRP2.3/core/fontawesome/4.7/css/font-awesome.css" media="all" onload="if(media!='all')media='all'">
         <style>
            a,.clickable,.btn-link{
            color:;
            }
            a:hover,
            .clickable:hover,
            a:focus,
            .clickable:focus,
            .btn-link:focus,
            .btn-link:hover{
            color:;
            }
            [bg-color="primary"]{
            background-color:#337ab7!important;
            }
            [active-bg-color="primary"].active{
            background-color:#337ab7!important;
            }
            [style-listener="true"].active [active-bg-color="primary"]{
            background-color : #337ab7!important;
            }
            [border-color="primary"]{
            border-color:#337ab7!important;
            }
            [border-color="primary"]{
            border-color:;
            }
            [text-color="primary"]{
            color:#337ab7;
            }
            [active-text-color="primary"].active,
            .active [active-text-color="primary"]{
            color:#337ab7!important;
            }
            .btn-primary{
            background-color:#337ab7;
            border-color:transparent;
            }
            [bg-color="secondary"]{
            background-color:#2a699e!important;
            }
            [active-bg-color="secondary"].active{
            background-color:#2a699e!important;
            }
            [style-listener="true"].active [active-bg-color="secondary"]{
            background-color : #2a699e!important;
            }
            [border-color="secondary"]{
            border-color:#2a699e!important;
            }
            [bg-hover="secondary"]:hover{
            background-color:#173c5d;
            }
            [border-color="secondary"]{
            border-color:;
            }
            [text-color="secondary"]{
            color:#2a699e;
            }
            [active-text-color="secondary"].active,
            .active [active-text-color="secondary"]{
            color:#2a699e!important;
            }
            .btn-secondary{
            background-color:#2a699e;
            border-color:transparent;
            }
            .btn-secondary:hover,
            .btn-secondary.focus, 
            .btn-secondary:focus{
            background-color:#173c5d
            }
            .btn-secondary:hover,
            .btn-secondary.focus, 
            .btn-secondary:focus{
            color:white
            }
            .checkbox-switch input:checked + .slider{
            background-color: #337ab7!important;
            }
            [active-text-color="primary"].active,
            .active [active-text-color="primary"]{
            color:#337ab7!important;
            }
            /*formgen*/
            #igrp-form-gen #gen-views-ctrl ul li.active, #igrp-form-gen .gen-viewers-toolbar .btn{
            color:#337ab7!important; 
            } 
            .list-group-item.active{
            background:#337ab7!important;
            }
         </style>
         <link rel="stylesheet" type="text/css" href="/IGRP/images/IGRP/IGRP2.3/core/colorpalettes/old-palettes.css" media="all" onload="if(media!='all')media='all'">
         <style>
            .cp-fresh {
            background: #4ABDAC!important;
            border-color: #4ABDAC!important;
            color: white!important;
            }
            .cp-fresh-text {
            color: #4ABDAC!important;
            }
            .cp-vermillion {
            background: #FC4A1A!important;
            border-color: #FC4A1A!important;
            color: white!important;
            }
            .cp-vermillion-text {
            color: #FC4A1A!important;
            }
            .cp-orange {
            background: #F79E02!important;
            border-color: #F79E02!important;
            color: white!important;
            }
            .cp-orange-text {
            color: #F79E02!important;
            }
            .cp-starrynight {
            background: #0375BA!important;
            border-color: #0375BA!important;
            color: white!important;
            }
            .cp-starrynight-text {
            color: #0375BA!important;
            }
            .cp-irises {
            background: #007849!important;
            border-color: #007849!important;
            color: white!important;
            }
            .cp-irises-text {
            color: #007849!important;
            }
            .cp-palegold {
            background: #C0B283!important;
            border-color: #C0B283!important;
            color: white!important;
            }
            .cp-palegold-text {
            color: #C0B283!important;
            }
            .cp-powder {
            background: #66B9BF!important;
            border-color: #66B9BF!important;
            color: white!important;
            }
            .cp-powder-text {
            color: #66B9BF!important;
            }
            .cp-tan {
            background: #EEAA7B!important;
            border-color: #EEAA7B!important;
            color: white!important;
            }
            .cp-tan-text {
            color: #EEAA7B!important;
            }
            .cp-fuschia {
            background: #A239CA!important;
            border-color: #A239CA!important;
            color: white!important;
            }
            .cp-fuschia-text {
            color: #A239CA!important;
            }
            .cp-lavendar {
            background: #6D7993!important;
            border-color: #6D7993!important;
            color: white!important;
            }
            .cp-lavendar-text {
            color: #6D7993!important;
            }
            .cp-ink {
            background: #062F4F!important;
            border-color: #062F4F!important;
            color: white!important;
            }
            .cp-ink-text {
            color: #062F4F!important;
            }
            .cp-embers {
            background: #B82601!important;
            border-color: #B82601!important;
            color: white!important;
            }
            .cp-embers-text {
            color: #B82601!important;
            }
            .cp-electric {
            background: #3CC47C!important;
            border-color: #3CC47C!important;
            color: white!important;
            }
            .cp-electric-text {
            color: #3CC47C!important;
            }
            .cp-black {
            background: #000!important;
            border-color: #000!important;
            color: white!important;
            }
            .cp-black-text {
            color: #000!important;
            }
            .cp-rustyred {
            background: #984B43!important;
            border-color: #984B43!important;
            color: white!important;
            }
            .cp-rustyred-text {
            color: #984B43!important;
            }
            .cp-blush {
            background: #EB6E80!important;
            border-color: #EB6E80!important;
            color: white!important;
            }
            .cp-blush-text {
            color: #EB6E80!important;
            }
            .cp-petal {
            background: #D48CF8!important;
            border-color: #D48CF8!important;
            color: white!important;
            }
            .cp-petal-text {
            color: #D48CF8!important;
            }
            .cp-field {
            background: #B37D4E!important;
            border-color: #B37D4E!important;
            color: white!important;
            }
            .cp-field-text {
            color: #B37D4E!important;
            }
            .cp-mint {
            background: #B4DBC0!important;
            border-color: #B4DBC0!important;
            color: white!important;
            }
            .cp-mint-text {
            color: #B4DBC0!important;
            }
            .cp-magenta {
            background: #F81B8A!important;
            border-color: #F81B8A!important;
            color: white!important;
            }
            .cp-magenta-text {
            color: #F81B8A!important;
            }
            .cp-yellow {
            background: #F5CE28!important;
            border-color: #F5CE28!important;
            color: white!important;
            }
            .cp-yellow-text {
            color: #F5CE28!important;
            }
            .cp-cyan {
            background: #43C0F6!important;
            border-color: #43C0F6!important;
            color: white!important;
            }
            .cp-cyan-text {
            color: #43C0F6!important;
            }
            .cp-jewel {
            background: #5F0F4E!important;
            border-color: #5F0F4E!important;
            color: white!important;
            }
            .cp-jewel-text {
            color: #5F0F4E!important;
            }
            .cp-stylish {
            background: #557A95!important;
            border-color: #557A95!important;
            color: white!important;
            }
            .cp-stylish-text {
            color: #557A95!important;
            }
            .cp-citrus {
            background: #A4A71E!important;
            border-color: #A4A71E!important;
            color: white!important;
            }
            .cp-citrus-text {
            color: #A4A71E!important;
            }
         </style>
         <link rel="stylesheet" href="/IGRP/images/IGRP/IGRP2.3/core/igrp/rightpanel/rightpanel.css" media="all" onload="if(media!='all')media='all'">
         <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,300i" rel="stylesheet" type="text/css" media="all" onload="if(media!='all')media='all'">
      </form>
      <link rel="stylesheet" type="text/css" href="/IGRP/images/IGRP/IGRP2.3/core/igrp/form/igrp.forms.css" media="all" onload="if(media!='all')media='all'">
      <link rel="stylesheet" type="text/css" href="/IGRP/images/IGRP/IGRP2.3/core/igrp/table/dataTables.bootstrap.css" media="all" onload="if(media!='all')media='all'">
      <link rel="stylesheet" type="text/css" href="/IGRP/images/IGRP/IGRP2.3/core/igrp/table/igrp.tables.css" media="all" onload="if(media!='all')media='all'">
      <link rel="stylesheet" type="text/css" href="/IGRP/images/IGRP/IGRP2.3/plugins/tabs/igrp.tabs.css" media="all" onload="if(media!='all')media='all'">
      <script type="text/javascript" src="/IGRP/images/IGRP/IGRP2.3/core/igrp/form/igrp.forms.js"></script><script type="text/javascript" src="/IGRP/images/IGRP/IGRP2.3/core/igrp/home/igrp.home.js"></script>
      <div class="responsive-bootstrap-toolkit">
         <div class="device-xs visible-xs visible-xs-block"></div>
         <div class="device-sm visible-sm visible-sm-block"></div>
         <div class="device-md visible-md visible-md-block"></div>
         <div class="device-lg visible-lg visible-lg-block"></div>
      </div>
   </body>
</html>
