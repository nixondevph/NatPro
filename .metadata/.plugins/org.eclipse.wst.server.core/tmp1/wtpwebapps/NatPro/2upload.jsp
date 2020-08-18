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
        <%@include file="includeNavBar.html"%>
        <div class="section no-pad-bot" id="index-banner">
            <div class="container">
                <!--<br><br>-->
                <h1 class="header center green-text text-darken-3">Upload</h1>
                <div class="row center">
                    <h6>Upload your document here</h6>
                    <br>
                    <form action="/NatPro/uploadSERVLET"  method="POST" enctype="multipart/form-data" autocomplete="off">
                        <div class="file-field" input field>
                            <div class="col s6 offset-s3">
                                <div class="waves-effect waves-light btn green darken-1">
                                <span>Browse File/s</span>
                                   	<!--   <input type="file" multiple>-->
                                    <input id="upload"  type="file" name="file-upload"  value="" multiple="multiple" accept=".txt,.pdf">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text" placeholder="Upload your document(s) here">
                                </div>
                            </div>
                            <input type="submit" value="Upload" class="btn waves-effect waves-light green darken-3 col s2 offset-s5" id="btnSubmit">
                        </div>
                    </form>
                    <!--<form action="2acomplete.html" class="">
                        <label for="docFile">Select a file(s):</label>
                        <input type="file" id="docFile" multiple>
                        <br><br>
                        <input type="submit" value="Upload" class="btn waves-effect waves-light green darken-3" id="btnSubmit">
                    </form>-->
                </div>
                <!--
                    <div class="row center">
                        <h5 class="header col s12 light">A modern responsive front-end framework based on Material Design</h5>
                    </div>
                
                    <div class="row center">
                        <a href="http://materializecss.com/getting-started.html" id="download-button" class="btn-large waves-effect waves-light green darken-3">Get Started</a>
                    </div>
                -->
                <br><br>

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

    </body>
</html>