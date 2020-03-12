<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>NatPro - Materialize</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>
    <body>
        <nav class="white" role="navigation">
            <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">NatPro</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="1mainpage.jsp">Home</a></li>
                    <li><a href="2upload.jsp">Upload</a></li>
                    <li><a href="3add.jsp">Add</a></li>
                    <li><a href="4validation.jsp">Validation</a></li>
                    <li><a href="5search.jsp" class="white-text green darken-3">Search</a></li>
                    <li><a href="6view.jsp">View</a></li>
                </ul>

                <ul id="nav-mobile" class="sidenav">
                    <li><a href="1mainpage.jsp">Home</a></li>
                    <li><a href="2upload.jsp">Upload</a></li>
                    <li><a href="3add.jsp">Add</a></li>
                    <li><a href="4validation.jsp">Validation</a></li>
                    <li><a href="5search.jsp" class="white-text green darken-3">Search</a></li>
                    <li><a href="6view.jsp">View</a></li>
                </ul>
                <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        <div class="section no-pad-bot" id="index-banner">
            <div class="container">
                <!--<br><br>-->
                <h1 class="header center green-text text-darken-3">Search</h1>
                <div class="row center">
                    <h6>Search for plants, chemical compound, etc.</h6>
                </div>
                <br><br>
                <div class="row">
                	<a class="col s3 offset-s9 waves-effect waves-light btn green darken-3" onclick="switchSearch()" id="switchSearch">Switch to advanced search</a>
                </div>
                <form class="row" action="5asearchresults.jsp" id="normSearch">
                    <div class="input-field col s9">
                        <i class="material-icons prefix">search</i>
                        <input id="searchInput" class="materialize-textarea" type="text">
                        <label for="searchInput">Search</label>
                    </div>
                    <div class="input-field col s3">
                        <select class="browser-default">
                            <option value="" disabled selected>Choose your option</option>
                            <option value="1">plant common name</option>
                            <option value="2">plant scientific name</option>
                            <option value="3">genus</option>
                            <option value="4">family</option>
                            <option value="5">chemical compound</option>
                            <option value="6">location</option>
                            <option value="7">biological activites</option>
                        </select>
                    </div>
                    <input type="submit" class="waves-effect waves-light btn center green darken-3 col s4 offset-s4" id="btnSubmit" value="search">
                </form>
                <form id="advSearch" action="" class="row" >
                	<div class="input-field col s12">
                        <i class="material-icons prefix">search</i>
                        <input id="searchInput" class="materialize-textarea" type="text">
                        <label for="searchInput">Search</label>
                    </div>
                    
                    <div class="row">
                    	<h6>Search for only:</h6><br>
                    	<label class="">
                    		<input type="checkbox" class="filled-in">
                    		<span>Plant Name</span>
                    	</label>
                    	<label class="">
                    		<input type="checkbox" class="filled-in">
                    		<span>Common Plant Name</span>
                    	</label>
                    	<label class="">
                    		<input type="checkbox" class="filled-in">
                    		<span>Genus</span>
                    	</label>
                    	<label class="">
                    		<input type="checkbox" class="filled-in">
                    		<span>Family</span>
                    	</label>
                    	<label class="">
                    		<input type="checkbox" class="filled-in">
                    		<span>Chemical Compound</span>
                    	</label>
                    </div>
                    <div class="row">
                    	<h6>Plant Part Usage</h6><br>
                    	<div class="input-field col s8">
	                        <i class="material-icons prefix">search</i>
	                        <input id="searchInput" class="materialize-textarea" type="text">
	                        <label for="searchInput">Search</label>
	                    </div>
	                    <div class="col s1">
	                    	<h6>for</h6>
	                    </div>
	                    <div class="input-field col s3">
	                        <select class="browser-default">
	                            <option value="" disabled selected>Choose plant part</option>
	                            <option value="1">stem</option>
	                            <option value="2">bark</option>
	                            <option value="3">sarcotesta</option>
	                            <option value="4">endotesta</option>
	                            <option value="5">roots</option>
	                            <option value="6">leaf</option>
	                        </select>
	                    </div>
                    </div>
                    <input type="submit" class="waves-effect waves-light btn center green darken-3 col s4 offset-s4" id="btnSubmit" value="search">
                </form>
            </div>
        </div>


        <div class="container">
            <div class="section">

                <!--   Icon Section   -->
                <div class="row">
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center light-blue-text"><i class="material-icons">flash_on</i></h2>
                            <h5 class="center">Speeds up development</h5>

                            <p class="light">We did most of the heavy lifting for you to provide a default stylings that incorporate our custom components. Additionally, we refined animations and transitions to provide a smoother experience for developers.</p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
                            <h5 class="center">User Experience Focused</h5>

                            <p class="light">By utilizing elements and principles of Material Design, we were able to create a framework that incorporates components and animations that provide more feedback to users. Additionally, a single underlying responsive system across all platforms allow for a more unified user experience.</p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>
                            <h5 class="center">Easy to work with</h5>

                            <p class="light">We have provided detailed documentation as well as specific code examples to help new users get started. We are also always open to feedback and can answer any questions a user may have about Materialize.</p>
                        </div>
                    </div>
                </div>

            </div>
            <br><br>
        </div>

        <footer class="page-footer green darken-3">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                    <h5 class="white-text">Company Bio</h5>
                    <p class="grey-text text-lighten-4">We are a team of college students who are working on this prototype.</p>


                    </div>
                    <div class="col l3 s12">
                        <h5 class="white-text">Team</h5>
                        <ul>
                            <li><a class="white-text" href="#!">Altea</a></li>
                            <li><a class="white-text" href="#!">Dagdag</a></li>
                            <li><a class="white-text" href="#!">Embestro</a></li>
                            <li><a class="white-text" href="#!">Ong</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright green darken-4">
                <div class="container">
                    Made by <a class="orange-text text-lighten-3" href="http://materializecss.com">Materialize</a>
                </div>
            </div>
        </footer>


        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>
        <script>
            $(document).ready(function() {
                $('select').formSelect();
            })
            
            function switchSearch() {
            	var nSearch = document.getElementById("normSearch");
            	var aSearch = document.getElementById("advSearch");
            	var sSearch = document.getElementById("switchSearch");
            	
            	if (nSearch.style.display == "none" && aSearch.style.display == "block") {
            		aSearch.style.display = "none";
            		nSearch.style.display = "block";
            		sSearch.textContent = "switch to advanced search";
            	}
            	else {
            		aSearch.style.display = "block";
            		nSearch.style.display = "none";
            		sSearch.textContent = "switch to normal search";
            	}
            	
            }
        </script>
    </body>
</html>