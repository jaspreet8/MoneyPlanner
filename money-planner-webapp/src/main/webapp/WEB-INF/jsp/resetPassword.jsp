<!DOCTYPE html>
<html lang="en">
<head>
 	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="commonHeader.jsp" /> 
	<title>Reset Password</title>
</head>
<style>
</style>
<body>
<div id="parent">
   <!--==========================
      Header
      ============================-->
   <header id="reset-password-header" >
      <div class="container">
         <div id="logo" class="pull-left">
            <h1><a href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() %>" class="scrollto">Money Planner</a></h1>
         </div>
      </div>
   </header>
   <!-- #header -->
   <div class="container-fluid reset">
      <div class="row">
         <div class="col-md-4 col-md-offset-4 d-block mx-auto">
            <div class="text-center">
               <div class="img-center">
                  <img class="reset-password-img" src="<%= request.getContextPath() %>/resources/img/forgot-password.png"/>
               </div>
               <h2 class="text-center mt-4">Reset Password</h2>
               <p>Enter your new password here.</p>
               <div v-if="currentSection == 'resetPassword'" class="panel-body">
                  <input v-validate="'required|min:8|max:32|verify_password'" data-vv-name="New Password"  v-model="newPassword" data-vv-scope="resetScope"	ref="newPassword"			
                     :class="{'password-content':newPassword.length !=0,'is-invalid':submitted && errors.has('resetScope.New Password')}" tabindex="1" autofocus 
                     :type="showNewPassword ? 'text' : 'password'" id="form-password" class="form-control password">
                  <span v-bind:class="{'floating-label-password-focus':newPassword.length != 0,'floating-label-password':newPassword.length == 0}" >New Password</span>
                  <button v-show="newPassword.length > 0 && showNewPassword == false" v-on:click="showNewPassword = true" id="showNewPassword" 						
                     class="show-eye" type="button"><i class="ion-eye"></i></button>
                  <button v-show="newPassword.length > 0 && showNewPassword == true" v-on:click="showNewPassword = false" id="hideNewPassword" 
                     class="hide-eye" type="button" ><i class="ion-eye-disabled"></i></button>
                  <div v-if="submitted && errors.has('resetScope.New Password')" class="text-danger signup-error">{{ errors.first('resetScope.New Password') }}</div>
                  <input v-validate="'required|confirmed:newPassword'" data-vv-name="Confirm Password"  v-model="confirmPassword" data-vv-scope="resetScope"				
                     :class="{'password-content':confirmPassword.length !=0,'is-invalid':submitted && errors.has('resetScope.Confirm Password')}"  tabindex="2"
                     :type="showConfirmPassword ? 'text' : 'password'" id="form-password-confirm" class="form-control password">
                  <span v-bind:class="{'floating-label-password-focus':confirmPassword.length != 0,'floating-label-password':confirmPassword.length == 0}" >Confirm Password</span>
                  <button v-show="confirmPassword.length > 0 && showConfirmPassword == false" v-on:click="showConfirmPassword = true" id="showConfirmPassword" 						
                     class="show-eye" type="button"><i class="ion-eye"></i></button>
                  <button v-show="confirmPassword.length > 0 && showConfirmPassword == true" v-on:click="showConfirmPassword = false" id="hideConfirmPassword" 
                     class="hide-eye" type="button" ><i class="ion-eye-disabled"></i></button>
                  <div v-if="submitted && errors.has('resetScope.Confirm Password')" class="text-danger signup-error">{{ errors.first('resetScope.Confirm Password') }}</div>
                  <div class="text-center">
                     <button type="button" @click="resetPassword('resetScope')"class="btn blue-gradient btn-block btn-rounded" tabindex="3">Reset Password</button>
                  </div>
               </div>
               <div v-if="currentSection == 'resetPasswordSuccess'" >
               	Password has been reset successfully.
               	Please login with new password.
               	 <button type="button" click="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() %>" class="btn blue-gradient btn-block btn-rounded" tabindex="3">Reset Password</button>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</body>
<script>
var error = '${error}';
var resetToken = '${resetToken}';
if(error != ""){
	showErrorSnackbar(error);
}
Vue.use(VeeValidate);
var app = new Vue({
    el: '#parent',
    data: {
		newPassword:"",
		confirmPassword:"",
		showNewPassword: false,
		showConfirmPassword: false,
		currentSection: 'resetPassword',  //Possible values are signIn and forgetPassword
		submitted: false,
    },
    methods: {
    	resetPassword: function(scope){
	debugger;    		
  		  var vm = this;
  		  vm.submitted = true;
            vm.$validator.validateAll(scope).then(valid => {
                if (valid) {
                	var passwordResetDTO = {
               	    	newPassword : vm.newPassword,
               	    	confirmPassword : vm.confirmPassword,
               	    	resetToken : resetToken
                   	};            	
                	
                	 $.ajax({
               		  type: "POST",                		  
               		  url: "/web/resetPassword",
               		  contentType: "application/json",
               	      data: JSON.stringify(passwordResetDTO),
               		  success: function(){
               			  vm.currentSection = 'resetPasswordSuccess';
               		  },
               	   	  error: function(response){
               	   		  if(response.responseJSON.field != null){
                    	   	  	vm.errors.add({field:response.responseJSON.field,msg:response.responseJSON.message,scope:'resetScope'});
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
</script>
</html>