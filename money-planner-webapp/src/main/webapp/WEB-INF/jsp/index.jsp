<!--==========================
This main page consists of following sections:-
   	Header
	Intro
	About us
	Product features
	Clients
	Team
	Gallery
	Faq
	Contact Us
	Footer   
  ============================-->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Money Planner</title>
  <jsp:include page="commonHeader.jsp" /> 
</head>

<body>
<div id="parent">
  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">Money Planner</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="#intro"><img src="<%= request.getContextPath() %>/resources/img/logo.png" alt="" title="" /></img></a> -->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li>
          <li><a href="#about">About Us</a></li>
          <li><a href="#features">Features</a></li>
          <li><a href="#team">Team</a></li>
          <li><a href="#gallery">Gallery</a></li>
          <!-- <li class="menu-has-children"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="menu-has-children"><a href="#">Drop Down 2</a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
              <li><a href="#">Drop Down 5</a></li>
            </ul>
          </li> -->
          <li><a href="#faq">Faq</a></li>
          <li><a href="#contact">Contact Us</a></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->

  <!--==========================
    Intro Section
  ============================-->
  <section id="intro">

    <div class="intro-text">
      <!-- <h2>Welcome to Avilon</h2> -->
      <p>We help you track your incomes and expenses all at one place</p>
      <a data-toggle="modal" data-target="#loginModal" id="signIn" href="javascript:void(0);" class="btn-login scrollto" >Sign In</a>
	  <a data-toggle="modal" data-target="#signupModal" id="signUp" href="javascript:void(0);" class="btn-login scrollto" >Sign Up</a>
	  <!-- Login modal -->
		<div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
			<!--Content-->
			<div v-show="loginOptions.currentSection == 'signIn'" class="modal-content form-elegant-signin">
			  <!--Header-->
			  <div class="modal-header">
				<h3 class="modal-title w-100" id="myModalLabel"><strong>Sign In</strong></h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				</button>
			  </div>
			  <!--Body-->
			  <div data-vv-scope="loginScope" class="modal-body mx-4">
				<!--Body-->
				<div class="md-form">
				  <input v-validate="'required|email'" data-vv-name="Email Address" v-model="loginInfoDTO.email" data-vv-scope="loginScope"				
				  v-bind:class="{'email-content':loginInfoDTO.email.length != 0,'is-invalid':loginOptions.submitted && errors.has('loginScope.Email Address')}" type="text" 					
				  id="form-email" class="form-control email" >
				  <span v-bind:class="{'floating-label-email-focus':(loginInfoDTO.email.length != 0),'floating-label-email':(loginInfoDTO.email.length == 0)}" >
				  		Email Address</span>
				  <span v-if="loginOptions.submitted && errors.has('loginScope.Email Address')" class="text-danger signup-error">{{ errors.first('loginScope.Email Address') }}</span>
				</div>

				<div class="md-form">
				  <input v-validate="'required|min:8|max:32|verify_password'" data-vv-name="Password"  v-model="loginInfoDTO.password" data-vv-scope="loginScope"				
				  		:class="{'password-content':loginInfoDTO.password.length !=0,'is-invalid':loginOptions.submitted && errors.has('loginScope.Password')}"  
				  		:type="loginOptions.showPassword ? 'text' : 'password'" id="form-password" class="form-control password">
				  <span v-bind:class="{'floating-label-password-focus':loginInfoDTO.password.length != 0,'floating-label-password':
				  		loginInfoDTO.password.length == 0}" >Password</span>
				  	 <button v-show="loginInfoDTO.password.length > 0 && loginOptions.showPassword == false" v-on:click="loginOptions.showPassword = true" id="showPassword" 						
				  	 class="show-eye" type="button"><i class="ion-eye"></i></button>
           			 <button v-show="loginInfoDTO.password.length > 0 && loginOptions.showPassword == true" v-on:click="loginOptions.showPassword = false" id="hidePassword" 
           			 class="hide-eye" type="button" ><i class="ion-eye-disabled"></i></button>
           			 <div v-if="loginOptions.submitted && errors.has('loginScope.Password')" class="text-danger signup-error">{{ errors.first('loginScope.Password') }}</div>
				</div>
				<div class="login-error" id="loginError"></div>
				<span class="forgetPassword"><a href="javascript:void(0);" v-on:click="loginOptions.currentSection = 'forgetPassword'" class="blue-text">Forgot Password?</a></span>
				<div class="signInOptions">
					<div class="text-center">
					  <button type="button" @click="completeLogin('loginScope')"class="btn blue-gradient btn-block btn-rounded">SIGN IN</button>
					</div>
					<p class="font-small dark-grey-text pt-2"> or Sign in with:</p>
	
					<div class="row my-3 d-flex justify-content-center">
					  <!--Facebook-->
					  <button type="button" onclick="location.href='${pageContext.request.contextPath}/social/facebookLogin'" class="btn btn-white btn-rounded social-button">
					  <i class="fa fa-facebook text-center"></i></button>
					  <!--Twitter-->
					  <button type="button" onclick="location.href='${pageContext.request.contextPath}/social/linkedInLogin'" class="btn btn-white btn-rounded social-button">
					  <i class="fa fa-linkedin"></i></button>
					  <!--Google +-->
					  <button type="button" onclick="location.href='${pageContext.request.contextPath}/social/googleLogin'" class="btn btn-white btn-rounded social-button">
					  <i class="fa fa-google-plus"></i></button>
					</div>
				</div>
			  </div>
			  <!--Footer-->
			  <div class="modal-footer not-member">
				<span class="font-small grey-text">Not a member? 
				<a href="javascript:void(0);" data-dismiss="modal" data-toggle="modal" data-target="#signupModal" 					
					class="blue-text ml-1">Sign Up</a></span>
			  </div>
			</div>
			<div v-show="loginOptions.currentSection == 'forgetPassword'" class="modal-content form-elegant-signin">
				<!--Header-->
				<div class="modal-header img-center">
					<img class="reset-password-img" src="<%= request.getContextPath() %>/resources/img/forgot-password.png"/>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				 </div>
				<div class="modal-body mx-4">
					<div>
						<h3>Trouble Signing In?</h3>
						<p class="reset-password-content"><span>Enter your email and we'll send you</span><span>a link to reset your password.</span></p>
					</div>
					<div class="md-form">
					  <input v-validate="'required|email'" data-vv-name="Email Address" v-model="loginInfoDTO.email" data-vv-scope="forgetPasswordScope"				
					  v-bind:class="{'email-content':loginInfoDTO.email.length != 0,'is-invalid':loginOptions.submitted && errors.has('forgetPasswordScope.Email Address')}" type="text" 					
					  id="form-email-reset" class="form-control email" >
					  <span v-bind:class="{'floating-label-email-focus':(loginInfoDTO.email.length != 0),'floating-label-email':(loginInfoDTO.email.length == 0)}" >
					  		Email Address</span>
					  <span v-if="loginOptions.submitted && errors.has('forgetPasswordScope.Email Address')" class="text-danger signup-error">{{ errors.first('forgetPasswordScope.Email Address') }}</span>
					  <span v-if="loginOptions.passwordReset" class="reset-password-success">You've successfully requested a new password reset!</span> 
					</div>
					<div class="resetPasswordOptions">
						<div class="text-center">
						 <button type="button" @click="sendPasswordResetLink('forgetPasswordScope')" class="btn blue-gradient btn-block btn-rounded">Reset Password</button>
						 <!--  <button type="button" class="btn blue-gradient btn-block btn-rounded">Send SignIn Link</button> -->
						</div>
						<p class="optional font-small dark-grey-text pt-2"> OR</p>
						<div>
						   <a href="javascript:void(0);" data-dismiss="modal" data-toggle="modal" data-target="#signupModal" class="blue-text ml-1">Create New Account</a>
						</div>
						<div class="back-signIn">
						   <a href="javascript:void(0);" v-on:click="loginOptions.currentSection = 'signIn'">Back To Sign In</a>
						</div>
				   </div>
				</div>
			</div>
			<!--Content-->
			
		  </div>
		</div>
	  <!-- Login modal -->
	  
	  
	   <!-- SignUp modal -->
	   <div class="modal" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		  <div class="modal-dialog" role="document">
			<!--Content-->
			<div class="modal-content form-elegant-signup">
			  <!--Header-->
			  <div class="modal-header">
				<h3 class="modal-title w-100" id="myModalLabel1"><strong>Sign Up</strong></h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				</button>
			  </div>
			  <!--Body-->
			  <div data-vv-scope="signupScope" class="modal-body mx-4">
				<!--Body-->
				<div class="md-form">
				  <input v-validate="'required|max:32'" data-vv-name="Name" v-model="loginInfoDTO.name" data-vv-scope="signupScope"					
				    v-bind:class="{'name-content':loginInfoDTO.name.length != 0, 'is-invalid':signupOptions.submitted && errors.has('signupScope.Name')}" type="text" 					
				  	id="form-name-signup" class="form-control name">
				  <span v-bind:class="{'floating-label-name-focus':(loginInfoDTO.name.length != 0),'floating-label-name':(loginInfoDTO.name.length == 0)}" >
				  		Name</span>
				  <span v-if="signupOptions.submitted && errors.has('signupScope.Name')" class="text-danger signup-error">{{ errors.first('signupScope.Name') }}</span>
				</div>
				
				<div class="md-form">
				  <input v-validate="'required|email'" data-vv-name="Email Address" v-model="loginInfoDTO.email" data-vv-scope="signupScope"					
				  v-bind:class="{'email-content':loginInfoDTO.email.length != 0,'is-invalid':signupOptions.submitted && errors.has('signupScope.Email Address')}" type="text" 					
				  id="form-email-signup" class="form-control email" >
				  <span v-bind:class="{'floating-label-email-focus':(loginInfoDTO.email.length != 0),'floating-label-email':(loginInfoDTO.email.length == 0)}" >
				  		Email Address</span>
				  <span v-if="signupOptions.submitted && errors.has('signupScope.Email Address')" class="text-danger signup-error">{{ errors.first('signupScope.Email Address') }}</span>
				</div>

				<div class="md-form">
				  <input v-validate="'required|min:8|max:32|verify_password'" data-vv-name="Password" v-model="loginInfoDTO.password" data-vv-scope="signupScope"					
				  		:class="{'password-content':loginInfoDTO.password.length !=0,'is-invalid': signupOptions.submitted && errors.has('signupScope.Password')}"  
				  		:type="signupOptions.showPassword ? 'text' : 'password'" id="form-password-signup" class="form-control password">
				  <span v-bind:class="{'floating-label-password-focus':loginInfoDTO.password.length != 0,'floating-label-password':
				  		loginInfoDTO.password.length == 0}" >Password</span>
				  	 <button v-show="loginInfoDTO.password.length > 0 && signupOptions.showPassword == false" v-on:click="signupOptions.showPassword=true" id="showPassword" 						
				  	 class="show-eye" type="button"><i class="ion-eye"></i></button>
           			 <button v-show="loginInfoDTO.password.length > 0 && signupOptions.showPassword == true" v-on:click="signupOptions.showPassword=false" id="hidePassword" 						
           			 class="hide-eye" type="button" ><i class="ion-eye-disabled"></i></button>
           			 <div v-if="signupOptions.submitted && errors.has('signupScope.Password')" class="text-danger signup-error">{{ errors.first('signupScope.Password') }}</div>
				</div>
				
				<div class="signUpOptions">
					<div class="text-center">
					  <button type="button" @click="completeSignup('signupScope')" class="btn blue-gradient btn-block btn-rounded">SIGN UP</button>
					</div>
					<!-- <p class="font-small dark-grey-text pt-2"> or Sign up with:</p>
	
					<div class="row d-flex justify-content-center">
					  Facebook
					  <button type="button" class="btn btn-white btn-rounded social-button"><i class="fa fa-facebook text-center"></i></button>
					  Twitter
					  <button type="button" class="btn btn-white btn-rounded social-button"><i class="fa fa-twitter"></i></button>
					  Google +
					  <button type="button" class="btn btn-white btn-rounded social-button"><i class="fa fa-google-plus"></i></button>
					</div> -->
				</div>
			  </div>
			  <!--Footer-->
			  <div class="modal-footer not-member">
				<span class="font-small grey-text">Already a member? 
				<a href="javascript:void(0);" data-dismiss="modal" data-toggle="modal" data-target="#loginModal" class="blue-text ml-1">Sign In</a></span>
			  </div>
			</div>
			<!--Content-->
			
		  </div>
		</div>
	   <!-- SignUp modal -->
	  
    </div>

    <div class="product-screens">

      <div class="product-screen-1" data-aos="fade-up" data-aos-delay="400">
        <img src="<%= request.getContextPath() %>/resources/img/product-screen-1.png" alt="">
      </div>
      <div class="product-screen-2" data-aos="fade-up" data-aos-delay="200">
        <img src="<%= request.getContextPath() %>/resources/img/product-screen-2.png" alt="">
      </div>
      <div class="product-screen-3" data-aos="fade-up">
        <img src="<%= request.getContextPath() %>/resources/img/product-screen-3.png" alt="">
      </div>

    </div>

  </section><!-- #intro -->

  <jsp:include page="indexContent.jsp" />
  <!--==========================
    Footer
  ============================-->
  <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 text-lg-left text-center">
          <div class="copyright">
            &copy; Copyright <strong>Money Planner</strong>. All Rights Reserved
          </div>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Avilon
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
        <div class="col-lg-6">
          <nav class="footer-links text-lg-right text-center pt-2 pt-lg-0">
            <a href="#intro" class="scrollto">Home</a>
            <a href="#about" class="scrollto">About</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Use</a>
          </nav>
        </div>
      </div>
    </div>
  </footer><!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
</div>

</body>
 <script>
 	var errors = '${errors}';
 	var activeScreen = '${activeScreen}';
 	var logout = '${logout}';
 	var loginInfoDTO = '${loginInfoDTO}';
 	Vue.use(VeeValidate);

 	$(document).on('hidden.bs.modal','#loginModal', function () {
		app.loginOptions.submitted = false;
		app.loginInfoDTO.email='';
		app.loginInfoDTO.password='';
 	});
 	
 	$(document).on('hidden.bs.modal','#signupModal', function () {
		app.signupOptions.submitted = false;
		app.loginInfoDTO.email='';
		app.loginInfoDTO.password='';
		app.loginInfoDTO.name='';
		app.signupOptions.submitted=false;
 	});
    var app = new Vue({
      el: '#parent',
      data: {
		loginInfoDTO:{
			email:"",
			password:"",
			name:""
		},
		loginOptions:{
			showPassword: false,
			currentSection: 'signIn',  //Possible values are signIn and forgetPassword
			forgetPassword:'', //TODO
			submitted: false,
			passwordReset: false
		},
		signupOptions:{
			showPassword: false,
			submitted: false
		}
      },
      methods: {
    	  completeLogin: function(scope){
    		  var vm = this;
    		  vm.loginOptions.submitted = true;
              vm.$validator.validateAll(scope).then(valid => {
                  if (valid) {
                      postFormSubmit('/login',vm.loginInfoDTO);
                  }
              });
    	  },    	  
    	  completeSignup: function(scope){
    		  var vm = this;
    		  vm.signupOptions.submitted = true;
              vm.$validator.validateAll(scope).then(valid => {
                  if (valid) {
                      postFormSubmit('/web/registration',vm.loginInfoDTO);
                  }
              });
    	  },
    	  sendPasswordResetLink: function(scope){
    		  var vm = this;
    		  vm.loginOptions.submitted = true;
              vm.$validator.validateAll(scope).then(valid => {
                  if (valid) {
                	  $.ajax({
                		  type: "POST",                		  
                		  url: "/web/forgetPassword?email="+vm.loginInfoDTO.email,
                		  success: function(){
                			  vm.loginOptions.passwordReset = true;
                		  },
                	   	  error: function(response){
                	   		  if(response.responseJSON.field != null){
                     	   	  		vm.errors.add({field:response.responseJSON.field,msg:response.responseJSON.message,scope:'forgetPasswordScope'});
                	   		  }else{
                	   			showErrorSnackbar(response.responseJSON.message);
                	   		  }
                	   		  
                	   	  }
                		});
                  }
              });
    	  }
      }
    });
    if(loginInfoDTO != ''){
 		app.loginInfoDTO = JSON.parse(loginInfoDTO);
 	}
    if(errors != '' && activeScreen != ''){
 		$('a#'+activeScreen).click();
		if(activeScreen == 'signIn'){
			app.loginOptions.submitted = true;
			$("#loginError").addClass("show");
			$("#loginError").append(errors);
			setTimeout(function() { 
				$("#loginError").removeClass("show"); 
			}, 10000);
			app.loginError = errors;
		}else if(activeScreen == 'signUp'){
			app.signupOptions.submitted = true;
			$.each(JSON.parse(errors), function( index, value ) {
				app.errors.add({field:value.field,msg:value.message,scope:'signupScope'});
			});
		}
 		
 	}
 	
 	if(logout != ''){
 		showSnackbar(logout);
 	}
  </script>
</html>
