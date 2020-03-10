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
        <div class="section green darken-1" id="index-banner">
            <div class="container">
                <!--<br><br>-->
                <h1 class="header center white-text">Chemical Compound</h1>
                <div class="row center white-text">
                    <img class="responsive-img circle" src="media/cocaine.png">
                    <br><br>
                    <a class="waves-effect waves-light btn green accent-4 white-text">Fill out information from pubchem</a>
                </div>
                <!--
                    <div class="row center">
                        <a href="http://materializecss.com/getting-started.jsp" id="download-button" class="btn-large waves-effect waves-light green darken-3">Get Started</a>
                    </div>
                    <br><br>
                -->
            </div>
        </div>


        <div class="section" id="index-banner">
            <div class="container">
                <div class="row">
                    <div class="center">
                        <ul class="tabs">
                            <li class="tab col s3 black-text">
                                <a href="#genInfo" class="active flow-text">General Information</a>
                            </li>
                            <li class="tab col s3">
                                <a href="#chemInfo" class="flow-text">Chemical Information</a>
                            </li>
                            <li class="tab col s3">
                                <a href="#compSynonyms" class="flow-text">Compound Synonyms</a>
                            </li>
                            <li class="tab col s3">
                                <a href="#bioAct" class="flow-text">Biological Activities</a>
                            </li>
                        </ul>
                    </div>
                    <div id="genInfo" class="row center">
                        <div class="col s6 offset-s3">
                            <table class="highlight">
                                <thead>
                                    <tr>
                                        <td colspan=3>
                                            <h4 class="center">General Information</h4>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>Common Name</th>
                                        <td>Common Name</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>IUPAC Name</th>
                                        <td>IUPAC Name</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>Canonical SMILES</th>
                                        <td>Canonical SMILES</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>Formula</th>
                                        <td>Formula</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>InChl</th>
                                        <td>InChl</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>InChl key</th>
                                        <td>InChl key</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>Chemical Class</th>
                                        <td>Chemical Class</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="chemInfo" class="row center">
                        <div class="col s6 offset-s3">
                            <table class="highlight">
                                <thead>
                                    <tr>
                                        <td colspan=3>
                                            <h4 class="center">Chemical Information</h4>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>Molecular Weight</th>
                                        <td>Molecular Weight</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>XLogP</th>
                                        <td>XLogP</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>TPSA</th>
                                        <td>TPSA</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>H-Bond Acceptors</th>
                                        <td>H-Bond Acceptors</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>H-Bond Donor</th>
                                        <td>H-Bond Donor</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                    <tr>
                                        <th>Rotatable Bonds</th>
                                        <td>Rotatable Bonds</td>
                                        <td><i class="material-icons">edit</i></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="compSynonyms" class="row center">
                        <div class="col s6 offset-s3">
                            <table class="highlight">
                                <thead>
                                    <tr>
                                        <th>
                                           <h4>Compound Synonyms</h4> 
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Compound Synonyms</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="bioAct" class="row center">
                        <div class="col s6 offset-s3">
                            <table class="highlight">
                                <thead>
                                    <tr>
                                        <th>
                                           <h4>Biological Activies</h4> 
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Biological Activities</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section green accent-4" id="index-banner">
            <div class="container">
                <table class="highlight">
                <thead>
                    <tr>
                        <th>Plant Name</th>
                        <th>Genus</th>
                        <th>Family</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Plant Name</td>
                        <td>Genus</td>
                        <td>Family</td>
                    </tr>
                </tbody>
            </table>
            </div>
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
            $(document).ready(function(){
                $('.tabs').tabs();
            });
        </script>
    </body>
</html>