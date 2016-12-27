<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="webservice_Default" %>

<!DOCTYPE html>

<html lang="en"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../images/Icons.hdyslogo.ico">

    <title>ece--有趣之管理</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet">


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../css/signin/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/signin/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <form class="form-signin" id="authform" novalidate>
        <h2 class="form-signin-heading">ece学生信息管理系统</h2>
        <label for="inputEmail" class="sr-only">用户名</label>
        <input type="text" id="inputUser" class="form-control" placeholder="用户名" required="" autofocus="">

        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="密码" required="">
      
          <div class="row">
    <div class="col-lg-4">   
          <label style="font-weight:normal">
            <input type="radio" id="students" value="students" checked="checked"> 学生
          </label>  
  </div>
   <div class="col-lg-4">   
          <label style="font-weight:normal">
            <input type="radio" id="teacher"value="students"> 教师
          </label>  
  </div>
  <div class="col-lg-4">   
          <label style="font-weight:normal">
            <input type="radio" id="mgr" value="students"> 管理员
          </label>  
  </div>
 
</div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="login()">登录</button>
      </form>

    </div> <!-- /container -->

   <script src="../js/jquery-3.1.1.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../js/singin/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript">
        function login() {
            var usertype;
            if (document.getElementById('students').checked)
            {
                usertype = 1;
            }
            if (document.getElementById('teacher').checked) {
                usertype = 2;
            }
            if (document.getElementById('mgr').checked) {
                usertype = 0;
            }
            $.ajax({
                type: "post",
                url: "../../services/login.ashx",
                dataType: "json",
                data: {
                    name: $("#inputUser").val(),
                    password: $("#inputPassword").val(),
                    utype: usertype
                },
                success: function (data) {
                    alert(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //alert(errorThrown);
                }
            });
        }
    </script>

</body>

</html>
