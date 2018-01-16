<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Agency - HTML5 Booking template</title>

    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
    
    <!-- Bootstrap Social Buttons -->
    <link href="/resources/bootstrap-social.css" rel="stylesheet">

    <!-- Animo css-->
    <link href="/resources/plugins/animo/animate+animo.css" rel="stylesheet" media="screen">

    <link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>
    <!-- Font-Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" type="text/css" href="/resources/assets/css/font-awesome.css" media="screen" /> -->

    <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="assets/css/font-awesome-ie7.css" media="screen" /><![endif]-->

    <!-- Load jQuery -->
    <script src="/resources/assets/js/jquery.v2.0.3.js"></script>




</head>
<body>
<!-- 100% Width & Height container  -->
<div class="login-fullwidith">

	<form id="login" action="loginPost" method="post">
    <!-- Login Wrap  -->
    <div class="login-wrap">
        <a href="/"><img src="/resources/images/logo.png" class="login-img" alt="logo"/></a><br/>
        <div class="login-c1">
            <div class="cpadding50">
                <input type="text" class="form-control logpadding" name="memberEmail" placeholder="UserEmail">
                <br/>
                <input type="password" class="form-control logpadding" name="memberPassword" placeholder="Password">
            </div>
        </div>
        <div class="login-c2">
            <div class="logmargfix">
                <div class="chpadding50">
                    <div class="alignbottom">
                        <button class="btn-search4"  type="submit">로그인</button>
                    </div>
                    <div class="alignbottom2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="useCookie">로그인 상태 유지
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="login-c3">
            <div class="left"><a href="/member/register" class="whitelink">회원가입</a></div>
            <div class="right"><a href="javascript:void();" class="whitelink" onclick="popup();">비밀번호 찾기</a></div>
        </div>
        
        <a href="javascript:void(0)" id="fbBtn" class="btn btn-block btn-social btn-facebook">
			<span class="fa fa-facebook"></span>페이스북으로 계속하기
		</a>
        
    </div>
    </form>

	<form action="/connect/facebook" method="post" id="facebook-form" style="display:none">
		<input type="hidden" name="scope" value="public_profile, email" />
		<button id="socialBtn" type="submit">Sign In with Facebook</button>
	</form>
	
    <!-- End of Login Wrap  -->
    
    <script>
    
    $(document).ready(function(){
  		$("#fbBtn").click(function(){
  			$("#socialBtn").click();
  		});
    });
    
    function popup(){
    	//event.preventDefault();
		
    	var url="/member/findPassword";
    	var option= "resizable=no, scrollbars=no, status=no, width=600, height=400 left=650, top=300";
    	
    	window.open(url, 'findPassword', option);
    }
    
    </script>

</div>
<!-- End of Container  -->

<!-- Javascript  -->
<script src="/resources/assets/js/initialize-loginpage.js"></script>
<script src="/resources/assets/js/jquery.easing.js"></script>
<!-- Load Animo -->
<script src="/resources/plugins/animo/animo.js"></script>
<script>
    function errorMessage(){
        $('.login-wrap').animo( { animation: 'tada' } );
    }
</script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/dist/js/bootstrap.min.js"></script>
</body>
</html>