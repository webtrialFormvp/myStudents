<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacher.aspx.cs" Inherits="webpage_teacher" %>

<!DOCTYPE html>

<html><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>ece-有趣之管理</title>
 
<script type="text/javascript" async="" src="http://www.google-analytics.com/ga.js"></script><script async="" src="//ajax.cloudflare.com/cdn-cgi/nexp/dok3v=f2befc48d1/cloudflare.min.js"></script><script type="text/javascript">
//<![CDATA[
try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:0,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok3v=1613a3a185/"},atok:"6029b686738b840a3318c4fe0fed6342",petok:"8efafe9eed91261a332b7fadb241d8f0ec700e28-1482920633-1800",zone:"adbee.technology",rocket:"0",apps:{"ga_key":{"ua":"UA-49262924-2","ga_bs":"2"}}}];!function(a,b){a=document.createElement("script"),b=document.getElementsByTagName("script")[0],a.async=!0,a.src="//ajax.cloudflare.com/cdn-cgi/nexp/dok3v=f2befc48d1/cloudflare.min.js",b.parentNode.insertBefore(a,b)}()}}catch(e){};
//]]>
</script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

 
 
<link rel="stylesheet" type="text/css" href="../font-awesome-4.4.0/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="../css/jquery.nanoscroller/css/nanoscroller.css">
 
<link rel="stylesheet" type="text/css" href="../css/teacher/theme_styles.css">
 
<link type="image/x-icon" href="favicon.png" rel="shortcut icon">
 
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript">
/* <![CDATA[ */
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-49262924-2']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

(function(b){(function(a){"__CF"in b&&"DJS"in b.__CF?b.__CF.DJS.push(a):"addEventListener"in b?b.addEventListener("load",a,!1):b.attachEvent("onload",a)})(function(){"FB"in b&&"Event"in FB&&"subscribe"in FB.Event&&(FB.Event.subscribe("edge.create",function(a){_gaq.push(["_trackSocial","facebook","like",a])}),FB.Event.subscribe("edge.remove",function(a){_gaq.push(["_trackSocial","facebook","unlike",a])}),FB.Event.subscribe("message.send",function(a){_gaq.push(["_trackSocial","facebook","send",a])}));"twttr"in b&&"events"in twttr&&"bind"in twttr.events&&twttr.events.bind("tweet",function(a){if(a){var b;if(a.target&&a.target.nodeName=="IFRAME")a:{if(a=a.target.src){a=a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);b=0;for(var c;c=a[b];++b)if(c.indexOf("url")===0){b=unescape(c.split("=")[1]);break a}}b=void 0}_gaq.push(["_trackSocial","twitter","tweet",b])}})})})(window);
/* ]]> */
</script>
<style type="text/css">
    .cf-hidden { display: none; }
     .cf-invisible { visibility: hidden; }
    .user-profile-bio-field {
        width: 420px;
        height: 5.35em;
        min-height: 0;
    }
</style>

      </head>
<body class="theme-whbl  pace-done" >
  
<div id="theme-wrapper">
<header class="navbar" id="header-navbar">
<div class="container">
<a href="index.html" id="logo" class="navbar-brand">
    <span>ece管理信息系统</span>
<img src="../images/Icons.32x32.hdlogo.png" alt="ece" class="normal-logo logo-white"> 

</a>
<div class="clearfix">

<div class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs">
<ul class="nav navbar-nav pull-left">
<li>
<a class="btn" id="make-small-nav">
<i class="fa fa-bars"></i>
</a>
</li>
</ul>
</div>
<div class="nav-no-collapse pull-right" id="header-nav">
<ul class="nav navbar-nav pull-right">
<li class="mobile-search">
<a class="btn">
<i class="fa fa-search"></i>
</a>
<div class="drowdown-search">
<form role="search">
<div class="form-group">
<input type="text" class="form-control" placeholder="Search...">
<i class="fa fa-search nav-search-icon"></i>
</div>
</form>
</div>
</li>
<li class="dropdown hidden-xs">
<a class="btn dropdown-toggle" data-toggle="dropdown">
<i class="fa fa-warning"></i>
<span class="count">8</span>
</a>
</li>
<li class="dropdown hidden-xs">
<a class="btn dropdown-toggle" data-toggle="dropdown">
<i class="fa fa-envelope-o"></i>
<span class="count">16</span>
</a>
<ul class="dropdown-menu notifications-list messages-list">
<li class="pointer">

</li>


<li class="item">
<a href="#">

</a>
</li>
<li class="item-footer">
</li>
</ul>
 </li>
<li class="hidden-xs">
<a class="btn">
<i class="fa fa-cog"></i>
</a>
</li> 
<li class="dropdown profile-dropdown"  >
<a href="#" class="dropdown-toggle" data-toggle="dropdown">
<img src="../images/avatar1_50.jpg" alt="">
<span class="hidden-xs"></span> 
    <b class="caret"></b>

</a>
</li>

</ul>
</div>
</div>
</div>
</header>
<div id="navinfo" class="container">
<div class="row">
<div id="nav-col">
<section id="col-left" class="col-left-nano">
<div id="col-left-inner" class="col-left-nano-content">
<div id="user-left-box" class="clearfix hidden-sm hidden-xs">
<img alt="" src="../images/avatar1_50.jpg">
<div class="user-box"  >
<span class="name">
{{navinfo.Username}}</span>
<span class="status">
<i class="fa fa-circle"></i> 在线
</span>
</div>
</div>
<div class="collapse navbar-collapse navbar-ex1-collapse" id="sidebar-nav">
<ul class="nav nav-pills nav-stacked">
<li class="active">
    <a href="index.html">
    <i class="fa fa-dashboard"></i>
    <span>个人信息</span>
    </a>
</li>
<li>
    <a href="#" class="dropdown-toggle">
        <i class="fa fa-table"></i>
        <span>课程安排</span>
        
    </a>
</li>

<li>
<a href="#" class="dropdown-toggle">
<i class="fa fa-bar-chart-o"></i>
<span>成绩管理</span>
<i class="fa fa-chevron-circle-right drop-icon"></i>
</a>
<ul class="submenu">
<li>
<a href="graphs-morris.html">
成绩输入
</a>
</li>


</ul>
</li>
</ul>
</div>
</div>
</section>
</div>
<div id="content-wrapper">
<div class="row" style="opacity: 1;">
<div class="col-lg-12">
<div class="row">
<div class="col-lg-12">
<ol class="breadcrumb">
<li><a href="#">首页</a></li>
<li class="active"><span>个人信息</span></li>
</ol>
<h1></h1>
</div>
   <div class="col-lg-3"></div>
   <div  class="col-lg-5">     
      <label for="user_profile_name">用户名</label>
      <input class="form-control" v-bind:value="navinfo.Username" type="text" id="user_profile_name" name="user[profile_name]" size="30" />      
    </div>
     <div class="col-lg-4"></div>
  </div>
    <div class="row">
     <div class="col-lg-3"></div>
      <div  class="col-lg-5">     
      <label for="user_profile_name">联系方式</label>
      <input class="form-control" v-bind:value="navinfo.Telephone" type="text" id="user_tel" name="user[tel]" size="30" type="text"  />      
    </div>
  </div>
    <div class="row">
         <div class="col-lg-3"></div>
     <div  class="col-lg-5">     
      <label for="user_profile_name">家庭住址</label>
      <input class="form-control" type="tel"   v-bind:value="navinfo.Address" id="user_address" name="user[address]" size="30" type="text" ></input>      
    </div>
          </div>
    <div class="row">
     <div class="col-lg-3"></div>
     <div  class="col-lg-5">     
      <label for="user_profile_name">备注</label>
      <textarea class="form-control user-profile-bio-field" cols="40" data-input-max-length="160" data-warning-text="{{remaining}} remaining" id="user_profile_bio" name="user[profile_bio]" placeholder="Tell a little about yourself" rows="20">
{{navinfo.Remark}}</textarea>    
    </div>
         </div>
    <div class="row">
      <div class="col-lg-3"></div>
     <div  class="conversation-content col-lg-5 ">
        <br>     
    <p><button type="submit" class="btn btn-success pull-right">更新</button></p>
         </div>
    </div>
    
</div>
</div>
<footer id="footer-bar" class="row" style="opacity: 1;">
<p id="footer-copyright" class="col-xs-12">
© 2016 <a href="http://www.ece.com/" target="_blank">test</a>. Powered by hzhgis.
</p>
</footer>
</div>
</div>
</div>
</div>

 <script src="../js/jquery-3.1.1.js"></script>


<script src="../js/teacher/jquery.nanoscroller.min.js"></script>
<script src="../js/teacher/demo.js"></script>  

<script src="../js/teacher/jquery.slimscroll.min.js"></script>

 
<script src="../js/teacher/scripts.js"></script>

<script src="../js/bootstrap.min.js"></script>
<script src="../../js/vue.js"></script>
<script src="../js/top/topinfo.js"></script>


</body></html>
