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
        <!-- <a href="#intro"><img src="${contextPath}/resources/img/logo.png" alt="" title="" /></img></a> -->
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
      <a data-toggle="modal" data-target="#loginModal" href="javascript:void(0);" class="btn-login scrollto" >Sign in</a>
	  
	  <!-- Login modal -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
			<!--Content-->
			<div class="modal-content form-elegant">
			  <!--Header-->
			  <div class="modal-header text-center">
				<h3 class="modal-title w-100 dark-grey-text font-weight-bold" id="myModalLabel"><strong>Sign in</strong></h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				</button>
			  </div>
			  <!--Body-->
			  <div class="modal-body mx-4">
				<!--Body-->
				<div class="md-form">
				  <input v-model="email" @focus="emailInput = true" @blur="emailInput = false" type="text" id="form-email" class="form-control email">
				  <span v-bind:class="{'floating-label-email-focus':(emailInput === true || email.length != 0),'floating-label-email':(emailInput === false && email.length == 0)}" >Email address</span>
				</div>

				<div class="md-form">
				  <input v-model="password" @focus="passwordInput = true,showPassword = false" @blur="passwordInput = false,showPassword = ''" :type="showPassword ? 'text' : 'password'" id="form-password" class="form-control password">
				  <span v-bind:class="{'floating-label-password-focus':(passwordInput === true || password.length != 0),'floating-label-password':(passwordInput === false && password.length == 0)}" >Password</span>
           			 <button v-show="password.length > 0 && showPassword == false" v-on:click="showPassword=true" id="showPassword" class="show-eye" type="button"><i class="ion-eye"></i></button>
           			 <button v-show="password.length > 0 && showPassword == true" v-on:click="showPassword=false" id="hidePassword" class="hide-eye" type="button" ><i class="ion-eye-disabled"></i></button>
				  
				  <span class="d-flex justify-content-end forgetPassword"> <a href="#" class="blue-text ml-1">Forgot Password?</a></span>
				</div>

				<div class="text-center mb-3">
				  <button type="button" class="btn blue-gradient btn-block btn-rounded">Sign in</button>
				</div>
				<p class="font-small dark-grey-text pt-2"> or Sign in with:</p>

				<div class="row my-3 d-flex justify-content-center">
				  <!--Facebook-->
				  <button type="button" class="btn btn-white btn-rounded"><i class="fa fa-facebook text-center"></i></button>
				  <!--Twitter-->
				  <button type="button" class="btn btn-white btn-rounded"><i class="fa fa-twitter"></i></button>
				  <!--Google +-->
				  <button type="button" class="btn btn-white btn-rounded"><i class="fa fa-google-plus"></i></button>
				</div>
			  </div>
			  <!--Footer-->
			  <div class="modal-footer mx-5 pt-3 mb-1">
				<p class="font-small grey-text d-flex justify-content-end">Not a member? <a href="#" class="blue-text ml-1">
					Sign Up</a></p>
			  </div>
			</div>
			<!--/.Content-->
		  </div>
		</div>
	  <!-- Login modal -->
	  
	  <a href="#about" class="btn-signup scrollto">Sign Up</a>
    </div>

    <div class="product-screens">

      <div class="product-screen-1" data-aos="fade-up" data-aos-delay="400">
        <img src="${contextPath}/resources/img/product-screen-1.png" alt="">
      </div>

      <div class="product-screen-2" data-aos="fade-up" data-aos-delay="200">
        <img src="${contextPath}/resources/img/product-screen-2.png" alt="">
      </div>

      <div class="product-screen-3" data-aos="fade-up">
        <img src="${contextPath}/resources/img/product-screen-3.png" alt="">
      </div>

    </div>

  </section><!-- #intro -->

  <main id="main" class="main">

    <!--==========================
      About Us Section
    ============================-->
    <section id="about" class="section-bg">
      <div class="container-fluid">
        <div class="section-header">
          <h3 class="section-title">About Us</h3>
          <span class="section-divider"></span>
          <p class="section-description">
            Lorem ipsum dolor sit amet, id ferri delenit oportere quo, sit an dico postea dolorem, sea affert volutpat gloriatur ei. <br>
			Dolore putent aeterno ei vis. Nisl error id qui sea.
          </p>
        </div>

        <div class="row">
          <div class="col-lg-6 about-img" data-aos="fade-right">
            <img src="${contextPath}/resources/img/about-img.jpg" alt="">
          </div>

          <div class="col-lg-6 content" data-aos="fade-left">
            <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elite storium paralate</h2>
            <h3>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h3>
            <p>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ullamco laboris nisi ut aliquip ex ea commodo consequat.
            </p>

            <ul>
              <li><i class="ion-android-checkmark-circle"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
              <li><i class="ion-android-checkmark-circle"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
              <li><i class="ion-android-checkmark-circle"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
            </ul>
          </div>
        </div>

      </div>
    </section><!-- #about -->

    <!--==========================
      Product Featuress Section
    ============================-->
    <section id="features">
      <div class="container">

        <div class="row">

          <div class="col-lg-8 offset-lg-4">
            <div class="section-header" data-aos="fade" data-aos-duration="1000">
              <h3 class="section-title">Product Featuress</h3>
              <span class="section-divider"></span>
            </div>
          </div>

          <div class="col-lg-4 col-md-5 features-img">
            <img src="${contextPath}/resources/img/product-features.png" alt="" data-aos="fade-right" data-aos-easing="ease-out-back">
          </div>

          <div class="col-lg-8 col-md-7 ">

            <div class="row">

              <div class="col-lg-6 col-md-6 box" data-aos="fade-left">
                <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
                <h4 class="title"><a href="">Lorem Ipsum</a></h4>
                <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident clarida perendo.</p>
              </div>
              <div class="col-lg-6 col-md-6 box" data-aos="fade-left" data-aos-delay="100">
                <div class="icon"><i class="ion-ios-flask-outline"></i></div>
                <h4 class="title"><a href="">Dolor Sitema</a></h4>
                <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata noble dynala mark.</p>
              </div>
              <div class="col-lg-6 col-md-6 box" data-aos="fade-left" data-aos-delay="200">
                <div class="icon"><i class="ion-social-buffer-outline"></i></div>
                <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
                <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur teleca starter sinode park ledo.</p>
              </div>
              <div class="col-lg-6 col-md-6 box" data-aos="fade-left" data-aos-delay="300">
                <div class="icon"><i class="ion-ios-analytics-outline"></i></div>
                <h4 class="title"><a href="">Magni Dolores</a></h4>
                <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum dinoun trade capsule.</p>
              </div>
            </div>

          </div>

        </div>

      </div>

    </section><!-- #features -->

    <!--==========================
      Product Advanced Featuress Section
    ============================
    <section id="advanced-features">

      <div class="features-row section-bg">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <img class="advanced-feature-img-right" src="${contextPath}/resources/img/advanced-feature-1.jpg" alt="" data-aos="fade-left">
              <div data-aos="fade-right">
                <h2>Duis aute irure dolor in reprehenderit in voluptate velit esse</h2>
                <h3>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                <p>Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="features-row">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <img class="advanced-feature-img-left" src="${contextPath}/resources/img/advanced-feature-2.jpg" alt="">
              <div data-aos="fade-left">
                <h2>Duis aute irure dolor in reprehenderit in voluptate velit esse</h2>
                <i class="ion-ios-paper-outline" data-aos="fade-left"></i>
                <p data-aos="fade-left">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                <i class="ion-ios-color-filter-outline" data-aos="fade-left" data-aos-delay="200"></i>
                <p data-aos="fade-left" data-aos-delay="200">Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</p>
                <i class="ion-ios-barcode-outline" data-aos="fade-left" data-aos-delay="400"></i>
                <p data-aos="fade-left" data-aos-delay="400">Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="features-row section-bg">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <img class="advanced-feature-img-right" src="${contextPath}/resources/img/advanced-feature-3.jpg" alt="" data-aos="fade-left">
              <div data-aos="fade-right">
                <h2>Duis aute irure dolor in reprehenderit in voluptate velit esse</h2>
                <h3>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
                <i class="ion-ios-albums-outline"></i>
                <p>Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>#advanced-features -->

    <!--==========================
      Call To Action Section
    ============================
    <section id="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 text-center text-lg-left">
            <h3 class="cta-title">Call To Action</h3>
            <p class="cta-text"> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center">
            <a class="cta-btn align-middle" href="#">Call To Action</a>
          </div>
        </div>

      </div>
    </section><!-- #call-to-action -->

    <!--==========================
      More Features Section
    ============================
    <section id="more-features" class="section-bg">
      <div class="container">

        <div class="section-header">
          <h3 class="section-title">More Features</h3>
          <span class="section-divider"></span>
          <p class="section-description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
        </div>

        <div class="row">

          <div class="col-lg-6">
            <div class="box" data-aos="fade-right">
              <div class="icon"><i class="ion-ios-stopwatch-outline"></i></div>
              <h4 class="title"><a href="">Lorem Ipsum</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident etiro rabeta lingo.</p>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="box" data-aos="fade-left">
              <div class="icon"><i class="ion-ios-bookmarks-outline"></i></div>
              <h4 class="title"><a href="">Dolor Sitema</a></h4>
              <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata nodera clas.</p>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="box" data-aos="fade-right">
              <div class="icon"><i class="ion-ios-heart-outline"></i></div>
              <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur trinige zareta lobur trade.</p>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="box" data-aos="fade-left">
              <div class="icon"><i class="ion-ios-analytics-outline"></i></div>
              <h4 class="title"><a href="">Magni Dolores</a></h4>
              <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum rideta zanox satirente madera</p>
            </div>
          </div>

        </div>
      </div>
    </section> #more-features -->

    <!--==========================
      Clients
    ============================ -->
    <section id="clients">
      <div class="container">

        <div class="row">

          <div class="col-md-2">
            <img src="${contextPath}/resources/img/clients/client-1.png" alt=""  data-aos="fade-up">
          </div>

          <div class="col-md-2">
            <img src="${contextPath}/resources/img/clients/client-2.png" alt=""  data-aos="fade-up">
          </div>

          <div class="col-md-2">
            <img src="${contextPath}/resources/img/clients/client-3.png" alt=""  data-aos="fade-up">
          </div>

          <div class="col-md-2">
            <img src="${contextPath}/resources/img/clients/client-4.png" alt=""  data-aos="fade-up">
          </div>

          <div class="col-md-2">
            <img src="${contextPath}/resources/img/clients/client-5.png" alt=""  data-aos="fade-up">
          </div>

          <div class="col-md-2">
            <img src="${contextPath}/resources/img/clients/client-6.png" alt=""  data-aos="fade-up">
          </div>

        </div>
      </div>
    </section><!-- #more-features -->
	
    <!--==========================
      Pricing Section
    ============================
    <section id="pricing" class="section-bg">
      <div class="container">

        <div class="section-header">
          <h3 class="section-title">Pricing</h3>
          <span class="section-divider"></span>
          <p class="section-description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="box" data-aos="fade-right">
              <h3>Free</h3>
              <h4><sup>$</sup>0<span> month</span></h4>
              <ul>
                <li><i class="ion-android-checkmark-circle"></i> Quam adipiscing vitae proin</li>
                <li><i class="ion-android-checkmark-circle"></i> Nec feugiat nisl pretium</li>
                <li><i class="ion-android-checkmark-circle"></i> Nulla at volutpat diam uteera</li>
                <li><i class="ion-android-checkmark-circle"></i> Pharetra massa massa ultricies</li>
                <li><i class="ion-android-checkmark-circle"></i> Massa ultricies mi quis hendrerit</li>
              </ul>
              <a href="#" class="get-started-btn">Get Started</a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="box featured" data-aos="fade-up">
              <h3>Business</h3>
              <h4><sup>$</sup>29<span> month</span></h4>
              <ul>
                <li><i class="ion-android-checkmark-circle"></i> Quam adipiscing vitae proin</li>
                <li><i class="ion-android-checkmark-circle"></i> Nec feugiat nisl pretium</li>
                <li><i class="ion-android-checkmark-circle"></i> Nulla at volutpat diam uteera</li>
                <li><i class="ion-android-checkmark-circle"></i> Pharetra massa massa ultricies</li>
                <li><i class="ion-android-checkmark-circle"></i> Massa ultricies mi quis hendrerit</li>
              </ul>
              <a href="#" class="get-started-btn">Get Started</a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="box" data-aos="fade-left">
              <h3>Developer</h3>
              <h4><sup>$</sup>49<span> month</span></h4>
              <ul>
                <li><i class="ion-android-checkmark-circle"></i> Quam adipiscing vitae proin</li>
                <li><i class="ion-android-checkmark-circle"></i> Nec feugiat nisl pretium</li>
                <li><i class="ion-android-checkmark-circle"></i> Nulla at volutpat diam uteera</li>
                <li><i class="ion-android-checkmark-circle"></i> Pharetra massa massa ultricies</li>
                <li><i class="ion-android-checkmark-circle"></i> Massa ultricies mi quis hendrerit</li>
              </ul>
              <a href="#" class="get-started-btn">Get Started</a>
            </div>
          </div>

        </div>
      </div>
    </section><!-- #pricing -->

   <!--==========================
      Our Team Section
    ============================-->
    <section id="team" class="section-bg">
      <div class="container">
        <div class="section-header">
          <h3 class="section-title">Our Team</h3>
          <span class="section-divider"></span>
          <p class="section-description">Software Engineer having 2+ years of experience in Java, Spring, Hibernate, JavaScript.</p>
        </div>
        <div class="row" data-aos="fade-up">
          <div class="col-lg-12 col-md-6">
            <div class="member">
              <div class="pic"><img src="${contextPath}/resources/img/jaspreet.jpg" alt=""></div>
              <h4>Jaspreet Singh Jolly</h4>
              <span></span>
              <div class="social">
                <a href=""><i class="fa fa-twitter"></i></a>
                <a href="https://www.facebook.com/jaspreetsjolly"><i class="fa fa-facebook"></i></a>
                <a href="https://plus.google.com/u/0/108999851823848637021"><i class="fa fa-google-plus"></i></a>
                <a href="https://www.linkedin.com/in/jaspreetsinghjolly/"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>
      </div>
      </div>
    </section><!-- #team -->

    <!--==========================
      Gallery Section
    ============================-->
    <section id="gallery">
      <div class="container-fluid">
        <div class="section-header">
          <h3 class="section-title">Gallery</h3>
          <span class="section-divider"></span>
          <p class="section-description"></p>
        </div>

        <div class="row no-gutters">

          <div class="col-lg-4 col-md-6">
            <div class="gallery-item" data-aos="fade-up">
              <a href="${contextPath}/resources/img/gallery/gallery-1.jpg" class="gallery-popup">
                <img src="${contextPath}/resources/img/gallery/gallery-1.jpg" alt="">
              </a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="gallery-item" data-aos="fade-up">
              <a href="${contextPath}/resources/img/gallery/gallery-2.jpg" class="gallery-popup">
                <img src="${contextPath}/resources/img/gallery/gallery-2.jpg" alt="">
              </a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="gallery-item" data-aos="fade-up">
              <a href="${contextPath}/resources/img/gallery/gallery-3.jpg" class="gallery-popup">
                <img src="${contextPath}/resources/img/gallery/gallery-3.jpg" alt="">
              </a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="gallery-item" data-aos="fade-up">
              <a href="${contextPath}/resources/img/gallery/gallery-4.jpg" class="gallery-popup">
                <img src="${contextPath}/resources/img/gallery/gallery-4.jpg" alt="">
              </a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="gallery-item" data-aos="fade-up">
              <a href="${contextPath}/resources/img/gallery/gallery-5.jpg" class="gallery-popup">
                <img src="${contextPath}/resources/img/gallery/gallery-5.jpg" alt="">
              </a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="gallery-item" data-aos="fade-up">
              <a href="${contextPath}/resources/img/gallery/gallery-6.jpg" class="gallery-popup">
                <img src="${contextPath}/resources/img/gallery/gallery-6.jpg" alt="">
              </a>
            </div>
          </div>

        </div>

      </div>
    </section><!-- #gallery -->


    <!--==========================
      Frequently Asked Questions Section
    ============================-->
    <section id="faq">
      <div class="container">

        <div class="section-header">
          <h3 class="section-title">Frequently Asked Questions</h3>
          <span class="section-divider"></span>
          <p class="section-description">Looking for answers? Most common questions has been answered for you!!</p>
        </div>

        <ul id="faq-list" data-aos="fade-up">
          <li>
            <a data-toggle="collapse" class="collapsed" href="#faq1">Question 1? <i class="ion-android-remove"></i></a>
            <div id="faq1" class="collapse" data-parent="#faq-list">
              <p>
                Answer 1
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq2" class="collapsed">Question 2? <i class="ion-android-remove"></i></a>
            <div id="faq2" class="collapse" data-parent="#faq-list">
              <p>
                Answer 2
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq3" class="collapsed">Question 3?<i class="ion-android-remove"></i></a>
            <div id="faq3" class="collapse" data-parent="#faq-list">
              <p>
                Answer 3
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq4" class="collapsed">Question 4? <i class="ion-android-remove"></i></a>
            <div id="faq4" class="collapse" data-parent="#faq-list">
              <p>
               Answer 4
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq5" class="collapsed">Question 5?<i class="ion-android-remove"></i></a>
            <div id="faq5" class="collapse" data-parent="#faq-list">
              <p>
               Answer 5
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq6" class="collapsed">Question 6? <i class="ion-android-remove"></i></a>
            <div id="faq6" class="collapse" data-parent="#faq-list">
              <p>
                Answer 6
              </p>
            </div>
          </li>

        </ul>

      </div>
    </section><!-- #faq -->

    <!--==========================
      Contact Section
    ============================-->
    <section id="contact">
      <div class="container">
        <div class="row" data-aos="fade-up">

          <div class="col-lg-4 col-md-4">
            <div class="contact-about">
              <h3>Money Planner</h3>
              <p>This website is created just for learning purpose.     
              If you need any help or doubt you can contact me over email.</p>
              <div class="social-links">
                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="info">
              <div>
                <i class="ion-ios-location-outline"></i>
                <p>Money Planner<br>New Delhi - 110001</p>
              </div>

              <div>
                <i class="ion-ios-email-outline"></i>
                <p>jasp********@gmail.com</p>
              </div>

              <div>
                <i class="ion-ios-telephone-outline"></i>
                <p>+91 965******0</p>
              </div>

            </div>
          </div>

          <div class="col-lg-5 col-md-8">
            <div class="form">
              <div id="sendmessage">Your message has been sent. Thank you!</div>
              <div id="errormessage"></div>
              <form action="" method="post" role="form" class="contactForm">
                <div class="form-row">
                  <div class="form-group col-lg-6">
                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                    <div class="validation"></div>
                  </div>
                  <div class="form-group col-lg-6">
                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                    <div class="validation"></div>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                  <div class="validation"></div>
                </div>
                <div class="text-center"><button type="submit" title="Send Message">Send Message</button></div>
              </form>
            </div>
          </div>

        </div>

      </div>
    </section><!-- #contact -->

  </main>

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
    var app = new Vue({
      el: '#parent',
      data: {
        emailInput: false,
		passwordInput: false,
		showPassword: '',
		email:"",
		password:""
      }
    })
  </script>
</html>
