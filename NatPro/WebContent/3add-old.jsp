<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>NatPro - Materialize</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
</head>
<body>
	<%@include file="includeNavBar.html"%>
	<div class="section no-pad-bot" id="index-banner">
		<div class="container">
			<!--<br><br>-->
			<h1 class="header center green-text text-darken-3">Add</h1>
			<div class="row center">
				<h6>Manually add a plant here</h6>
			</div>
			<form action="AddPlantServlet" method="POST" class="row">
				<div class="col s12">
					<h5 class="col s12 center" style="padding-top: 50px">General</h5>
					<div class="input-field col s6 offset-s3">
						<input id="commonPlantName" type="text" class="validate"
							name="commonPlantName"> <label for="commonPlantName">Common
							Plant Name</label>
					</div>
					<div class="input-field col s6">
						<input id="genus" type="text" class="validate" name="genus">
						<label for="genus">Genus</label>
					</div>
					<div class="input-field col s6">
						<input id="family" type="text" class="validate" name="family">
						<label for="family">Family</label>
					</div>
					<div class="col s6" id="scientificNameGroup">
						<div class="input-field">
							<input id="scientificName" type="text" class="validate"
								name="scientificName"> <label for="scientificName">Scientific
								Name</label>
						</div>
						<!--  <a class="btn-small right teal darken-4" id="scientificNameAdd"
							onclick="addSNFields()">Scientific Name<i
							class="material-icons left">add</i></a> -->
					</div>
					<div class="col s6" id="locationGroup">
						<div class="input-field">
							<input id="location" type="text" class="validate" name="location">
							<label for="location">Location</label>
						</div>

						<a class="btn-small right teal darken-4" id="locationAdd"
							onclick="addLFields()">Location<i class="material-icons left">add</i></a>
					</div>
					<div class="row">
						<h5 class="col s12 center" style="padding-top: 50px">Preparation</h5>
						<div id="preparationGroup">
							<div class="input-field col s5">
								<input id="preparation" type="text" class="validate"
									name="preparation[0]"> <label for="preparation">Preparation</label>
								<input type='hidden' name='prepCtr' value='0'>
							</div>

							<div class="input-field col s3">
								<select class="browser-default" name="prepPart[0]">
									<option value="" selected disabled>Choose utilized
										plant part</option>
									<option value="-1">Others (Please write on the right
										side)</option>
									<c:forEach items="${plantPartsList}" var="plantPartsList">
										<option value="${plantPartsList}">${plantPartsList}</option>
									</c:forEach>
								</select>

							</div>

							<div class="col s4" id="illnessGroup">
								<div class="input-field">
									<input id="illness" type="text" class="validate"
										name="illness[0][0]"> <label for="illness">Illness</label>
								</div>

								<a class="btn-small right teal darken-4" id="illnessAdd"
									onclick="addIFields(0)">Illness<i
									class="material-icons left">add</i></a> <input type='hidden'
									name='illnessCtr[0]' value='0'>
							</div>

							<!-- 							<div class="input-field col s2">
								<select class="browser-default">
									<option value="" disabled selected>Choose body part</option>
									<option value="1">Gall Bladder</option>
									<option value="2">Intestines</option>
									<option value="3">Esophagus</option>
									<option value="4">Intestine</option>
									<option value="5">Shoulders</option>
									<option value="6">Buttocks</option>
									<option value="7">Bladder</option>
									<option value="8">Kidneys</option>
									<option value="9">Ovaries</option>
									<option value="10">Stomach</option>
									<option value="11">Thyroid</option>
									<option value="12">Fingers</option>
									<option value="13">Breasts</option>
									<option value="14">Abdomen</option>
									<option value="15">Kidney</option>
									<option value="16">Spleen</option>
									<option value="17">Thymus</option>
									<option value="18">Cheeks</option>
									<option value="19">Tongue</option>
									<option value="20">Throat</option>
									<option value="21">Elbows</option>
									<option value="22">Wrists</option>
									<option value="23">Finger</option>
									<option value="24">Breat</option>
									<option value="25">Thighs</option>
									<option value="26">Calves</option>
									<option value="27">Ankles</option>
									<option value="28">Brain</option>
									<option value="29">Heart</option>
									<option value="30">Liver</option>
									<option value="31">Lungs</option>
									<option value="32">Ovary</option>
									<option value="33">Veins</option>
									<option value="34">Cheek</option>
									<option value="35">Mouth</option>
									<option value="36">Teeth</option>
									<option value="37">Tooth</option>
									<option value="38">Elbow</option>
									<option value="39">Wrist</option>
									<option value="40">Hands</option>
									<option value="41">Spine</option>
									<option value="42">Chest</option>
									<option value="43">Navel</option>
									<option value="44">Thigh</option>
									<option value="45">Knees</option>
									<option value="46">Heels</option>
									<option value="47">Ankle</option>
									<option value="48">Eyes</option>
									<option value="49">Vein</option>
									<option value="50">Head</option>
									<option value="51">Jaw</option>
									<option value="52">Chin</option>
									<option value="53">Ears</option>
									<option value="54">Nose</option>
									<option value="55">Neck</option>
									<option value="56">Arms</option>
									<option value="57">Hand</option>
									<option value="58">Hips</option>
									<option value="59">Legs</option>
									<option value="60">Knee</option>
									<option value="61">Calf</option>
									<option value="62">Heel</option>
									<option value="63">Foot</option>
									<option value="64">Feet</option>
									<option value="65">Toes</option>
									<option value="66">Eye</option>
									<option value="67">Jaw</option>
									<option value="68">Ear</option>
									<option value="69">Arm</option>
									<option value="70">Hip</option>
									<option value="71">Leg</option>
									<option value="72">Toe</option>
								</select>
							</div> -->


							<a class="btn-small teal darken-4 center col s6 offset-s3"
								id="preparationAdd" onclick="addPFields(0)">Preparation<i
								class="material-icons left">add</i></a>
						</div>
					</div>
					<div class="col s12" id="speciesGroup">
						<h5 class="col s12 center" style="padding-top: 50px">Species</h5>
						<div class="input-field col s6">
							<select class="browser-default" name="plantPart[0]"
								onchange="speciesPartOtherEnable(0)" id="speciesPart">
								<option value="" selected disabled>Choose plant part</option>
								<option value="-1">Others (Please write on the right
									side)</option>
								<c:forEach items="${plantPartsList}" var="plantPartsList">
									<option value="${plantPartsList}">${plantPartsList}</option>
								</c:forEach>
							</select> <input type='hidden' name='speciesCtr' value='0'>
						</div>
						<div class="col s6">
							<div class="input-field">
								<input id="speciesPartOther" type="text" class="validate"
									disabled required name="plantPartOther"> <label
									for="speciesPartOther">Other Plant Part</label>
							</div>
						</div>

						<div class="row" id="chemicalCompoundGroup">
							<div class="input-field col s6 offset-s1">
								<input id="chemicalCompound" type="text" class="validate"
									name="compound[0][0]"> <label for="chemicalCompound">Chemical
									Compound</label> <a class="btn-small right teal darken-4"
									id="chemicalCompoundAdd" onclick="addCCFields(0)">Chemical
									Compound<i class="material-icons left">add</i>
								</a>
							</div>
							<input type='hidden' name='lengthCC0' value='0'>
							<div class="col s12" id="biologicalActivityGroup">
								<div class="input-field col s6 offset-s2">
									<input id="biologicalActivity" type="text" class="validate"
										name="bioAct[0][0][0]"> <label
										for="biologicalActivity">Biological Activity</label> <a
										class="btn-small right teal darken-4"
										id="biologicalActivityAdd" onclick="addBAFields(0,0,0)">Biological
										Activities<i class="material-icons left">add</i>
									</a>
								</div>
								<div class="input-field col s4">
									<input id="cellLine" type="text" class="validate"
										name="cellLine[0][0][0]"> <label for="cellLine">CellLine</label>
								</div>
								<input type='hidden' name='bioCellCC0' value='0'>
								<input type='hidden' name='lengthBC[0][0]' value='0'>
							</div>
						</div>
						<a class="btn-small teal darken-4 center col s6 offset-s3"
							id="speciesAdd" onclick="addSFields(0)">Species<i
							class="material-icons left">add</i></a>
					</div>
				</div>
				<input type="submit" id="btnSubmit"
					class="waves-effect waves-light btn green darken-3 center col s6 offset-s3">
			</form>
			<br> <br>

		</div>
	</div>


	<div class="container">
		<div class="section">

			<!--   Icon Section   -->
			<div class="row">
				<div class="col s12 m4">
					<div class="icon-block">
						<h2 class="center light-blue-text">
							<i class="material-icons">flash_on</i>
						</h2>
						<h5 class="center">Speeds up development</h5>

						<p class="light">We did most of the heavy lifting for you to
							provide a default stylings that incorporate our custom
							components. Additionally, we refined animations and transitions
							to provide a smoother experience for developers.</p>
					</div>
				</div>

				<div class="col s12 m4">
					<div class="icon-block">
						<h2 class="center light-blue-text">
							<i class="material-icons">group</i>
						</h2>
						<h5 class="center">User Experience Focused</h5>

						<p class="light">By utilizing elements and principles of
							Material Design, we were able to create a framework that
							incorporates components and animations that provide more feedback
							to users. Additionally, a single underlying responsive system
							across all platforms allow for a more unified user experience.</p>
					</div>
				</div>

				<div class="col s12 m4">
					<div class="icon-block">
						<h2 class="center light-blue-text">
							<i class="material-icons">settings</i>
						</h2>
						<h5 class="center">Easy to work with</h5>

						<p class="light">We have provided detailed documentation as
							well as specific code examples to help new users get started. We
							are also always open to feedback and can answer any questions a
							user may have about Materialize.</p>
					</div>
				</div>
			</div>

		</div>
		<br> <br>
	</div>

	<footer class="page-footer green darken-3">
	<div class="container">
		<div class="row">
			<div class="col l6 s12">
				<h5 class="white-text">Company Bio</h5>
				<p class="grey-text text-lighten-4">We are a team of college
					students who are working on this prototype.</p>


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
			Made by <a class="orange-text text-lighten-3"
				href="http://materializecss.com">Materialize</a>
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
		});

		var speciestPartsList = "${speciesPartsList}";

		var snCtr, lCtr, pbpCtr, iCtr, baclCtr, ccCtr, sCtr;
		snCtr = lCtr = pbpCtr = iCtr = baclCtr = ccCtr = sCtr = 0;

		var speciesArr = [ 0 ];
		var speciesArr2 = [ [ 0 ] ]
		var compArr = [ 0 ];
		var prepArr = [ 0 ];

		function addSNFields() {

			//remove button add
			$('#scientificNameAdd').remove();

			//increases counter (para di mag overlap sa ibang names)
			snCtr++;

			var inputField = "<div class=\"input-field\">"
					+ "<input id=\"scientificName" + snCtr +"\" type=\"text\" class=\"validate\">"
					+ "<label for=\"scientificName" + snCtr +"\">Scientific Name"
					+ " (" + snCtr + ")" + "</label>" + "</div>";
			var buttonAdd = "<a class=\"btn-small right teal darken-4\" id=\"scientificNameAdd\" onclick=\"addSNFields()\">Scientific Name<i class=\"material-icons left\">add</i></a>";

			//adds new field + button add
			$('#scientificNameGroup').append(inputField, buttonAdd);
		}

		function addLFields() {
			$('#locationAdd').remove();
			lCtr++;

			var inputField = "<div class=\"input-field\">"
					+ "<input id=\"location" + lCtr +"\" type=\"text\" class=\"validate\" name=\"location\" >"
					+ "<label for=\"location" + lCtr +"\">Location" + " ("
					+ lCtr + ")" + "</label>" + "</div>";
			var buttonAdd = "<a class=\"btn-small right teal darken-4\" id=\"locationAdd\" onclick=\"addLFields()\">Location<i class=\"material-icons left\">add</i></a>";

			$('#locationGroup').append(inputField, buttonAdd);
		}

		function addIFields(pValue) {
			prepArr[pValue]++;
			var buttonAddText = "#illnessAdd" + pValue;

			if (pValue == 0) {
				$('#illnessAdd').remove();
			} else {
				$(buttonAddText).remove();
			}

			iCtr++;

			var inputField = "<div class=\"input-field\">"
					+ "<input id=\"illness" + iCtr +"\" type=\"text\" class=\"validate\" name='illness["+pValue+"]["+prepArr[pValue]+"]'>"
					+ "<label for=\"illness" + iCtr +"\">Illness"
					+ " ("
					+ iCtr
					+ ")"
					+ "</label>"
					+ "</div>"
					+ "<input type='hidden' name='illnessCtr["+pValue+"]' value='"+prepArr[pValue]+"'>";
			if (pValue == 0) {
				var buttonAdd = "<a class=\"btn-small right teal darken-4\" id=\"illnessAdd\" onclick=\"addIFields("
						+ pValue
						+ ")\">Illness<i class=\"material-icons left\">add</i></a>";
			} else {
				var buttonAdd = "<a class=\"btn-small right teal darken-4\" id=\"illnessAdd"
						+ pValue
						+ "\" onclick=\"addIFields("
						+ pValue
						+ ")\">Illness<i class=\"material-icons left\">add</i></a>";
			}

			var groupAddText = "#illnessGroup" + pValue;

			if (pValue == 0) {
				$('#illnessGroup').append(inputField, buttonAdd);
			} else {
				$(groupAddText).append(inputField, buttonAdd);
			}
		}

		function addPFields(pValue) {
			prepArr.push(0);
			console.log(prepArr);
			/* console.log(pValue+1); */
			var buttonAddText = "#preparationAdd" + pValue;

			if (pValue == 0) {
				$('#preparationAdd').remove();
			} else
				$(buttonAddText).remove();

			pbpCtr++;
			iCtr++;

			var inputUtilizedPlant = "<div class=\"input-field col s3\">"
					+ "<select class=\"browser-default\" name='prepPart["
					+ (pValue + 1)
					+ "]'>"
					+ "<option value=\"\" disabled selected>Choose utilized plant part</option>"
					+ "<option value=\"-1\">Others (Please write on the right side)</option>"
					+ "<c:forEach items='${plantPartsList}' var='plantPartsList'>"
					+ "<option value=\"${plantPartsList}\">${plantPartsList}</option>"
					+ "</c:forEach>" + "</select>" + "</div>";

			var inputPreparation = "<div class=\"input-field col s5\">"
					+ "<input id=\"preparation" + pbpCtr
					+ "\" type=\"text\" class=\"validate\" name=\"preparation["
					+ (pValue + 1) + "]\">"
					+ "<label for=\"preparation" + pbpCtr +"\">Preparation"
					+ " (" + pbpCtr + ")" + "</label>" + "</div>"
					+ "<input type='hidden' name='prepCtr' value='"+(pValue+1)+"'>";
			/* var inputBodyPart = "<div class=\"input-field col s2\">"
					+ "<select class=\"browser-default\">"
					+ "<option value=\"\" disabled selected>Choose body part</option>"
					+ "<option value=\"1\">Gall Bladder</option>"
					+ "<option value=\"2\">Intestines</option>"
					+ "<option value=\"3\">Esophagus</option>"
					+ "<option value=\"4\">Intestine</option>"
					+ "<option value=\"5\">Shoulders</option>"
					+ "<option value=\"6\">Buttocks</option>"
					+ "<option value=\"7\">Bladder</option>"
					+ "<option value=\"8\">Kidneys</option>"
					+ "<option value=\"9\">Ovaries</option>"
					+ "<option value=\"10\">Stomach</option>"
					+ "<option value=\"11\">Thyroid</option>"
					+ "<option value=\"12\">Fingers</option>"
					+ "<option value=\"13\">Breasts</option>"
					+ "<option value=\"14\">Abdomen</option>"
					+ "<option value=\"15\">Kidney</option>"
					+ "<option value=\"16\">Spleen</option>"
					+ "<option value=\"17\">Thymus</option>"
					+ "<option value=\"18\">Cheeks</option>"
					+ "<option value=\"19\">Tongue</option>"
					+ "<option value=\"20\">Throat</option>"
					+ "<option value=\"21\">Elbows</option>"
					+ "<option value=\"22\">Wrists</option>"
					+ "<option value=\"23\">Finger</option>"
					+ "<option value=\"24\">Breat</option>"
					+ "<option value=\"25\">Thighs</option>"
					+ "<option value=\"26\">Calves</option>"
					+ "<option value=\"27\">Ankles</option>"
					+ "<option value=\"28\">Brain</option>"
					+ "<option value=\"29\">Heart</option>"
					+ "<option value=\"30\">Liver</option>"
					+ "<option value=\"31\">Lungs</option>"
					+ "<option value=\"32\">Ovary</option>"
					+ "<option value=\"33\">Veins</option>"
					+ "<option value=\"34\">Cheek</option>"
					+ "<option value=\"35\">Mouth</option>"
					+ "<option value=\"36\">Teeth</option>"
					+ "<option value=\"37\">Tooth</option>"
					+ "<option value=\"38\">Elbow</option>"
					+ "<option value=\"39\">Wrist</option>"
					+ "<option value=\"40\">Hands</option>"
					+ "<option value=\"41\">Spine</option>"
					+ "<option value=\"42\">Chest</option>"
					+ "<option value=\"43\">Navel</option>"
					+ "<option value=\"44\">Thigh</option>"
					+ "<option value=\"45\">Knees</option>"
					+ "<option value=\"46\">Heels</option>"
					+ "<option value=\"47\">Ankle</option>"
					+ "<option value=\"48\">Eyes</option>"
					+ "<option value=\"49\">Vein</option>"
					+ "<option value=\"50\">Head</option>"
					+ "<option value=\"51\">Jaw</option>"
					+ "<option value=\"52\">Chin</option>"
					+ "<option value=\"53\">Ears</option>"
					+ "<option value=\"54\">Nose</option>"
					+ "<option value=\"55\">Neck</option>"
					+ "<option value=\"56\">Arms</option>"
					+ "<option value=\"57\">Hand</option>"
					+ "<option value=\"58\">Hips</option>"
					+ "<option value=\"59\">Legs</option>"
					+ "<option value=\"60\">Knee</option>"
					+ "<option value=\"61\">Calf</option>"
					+ "<option value=\"62\">Heel</option>"
					+ "<option value=\"63\">Foot</option>"
					+ "<option value=\"64\">Feet</option>"
					+ "<option value=\"65\">Toes</option>"
					+ "<option value=\"66\">Eye</option>"
					+ "<option value=\"67\">Jaw</option>"
					+ "<option value=\"68\">Ear</option>"
					+ "<option value=\"69\">Arm</option>"
					+ "<option value=\"70\">Hip</option>"
					+ "<option value=\"71\">Leg</option>"
					+ "<option value=\"72\">Toe</option>" + "</select>"
					+ "</div>"; */
			var inputIllness = "<div class=\"col s4\" id=\"illnessGroup" + pbpCtr +"\">"
					+ "<div class=\"input-field\">"
					+ "<input id=\"illness"
					+ iCtr
					+ "\" type=\"text\" class=\"validate\" name='illness["
					+ (pValue + 1)
					+ "][0]'>"
					+ "<label for=\"illness" + iCtr +"\">Illness"
					+ " ("
					+ iCtr
					+ ")"
					+ "</label>"
					+ "</div>"
					+ "<input type='hidden' name='illnessCtr["
					+ (pValue + 1)
					+ "]' value='"
					+ prepArr[pValue]
					+ "'>"
					+ "<a class=\"btn-small right teal darken-4\" id=\"illnessAdd"
					+ pbpCtr
					+ "\" onclick=\"addIFields("
					+ pbpCtr
					+ ")\">Illness<i class=\"material-icons left\">add</i></a>"
					+ "</div>";
			var buttonAdd = "<a class=\"btn-small teal darken-4 center col s6 offset-s3\" id=\"preparationAdd"
					+ pbpCtr
					+ "\" onclick=\"addPFields("
					+ pbpCtr
					+ ")\">Preparation<i class=\"material-icons left\">add</i></a>";

			$('#preparationGroup').append(inputPreparation, inputUtilizedPlant,
			/* inputBodyPart, */inputIllness, buttonAdd);

		}

		function addBAFields(pValue, sVal, cVal) {
			var buttonAddText = "#biologicalActivityAdd" + pValue;
			speciesArr2[sVal][cVal]++;
			console.log(speciesArr2);
			if (pValue == 0) {
				$('#biologicalActivityAdd').remove();
			} else {
				$(buttonAddText).remove();
			}

			baclCtr++;

			if (pValue == 0) {
				var inputAppend = "<div class=\"input-field col s6 offset-s2\">"
						+ "<input id=\"biologicalActivity" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"bioAct["+sVal+"]["+cVal+"]["+speciesArr2[sVal][cVal]+"]\">"
						+ "<label for=\"biologicalActivity" + baclCtr +"\">Biological Activity"
						+ " ("
						+ baclCtr
						+ ")"
						+ "</label>"
						+

						"<a class=\"btn-small right teal darken-4\" id=\"biologicalActivityAdd\" onclick=\"addBAFields("
						+ pValue
						+ ","
						+ sVal
						+ ","
						+ cVal
						+ ")\">Biological Activities<i class=\"material-icons left\">add</i></a>"
						+ "</div>"
						+ "<div class=\"input-field col s4\">"
						+ "<input id=\"cellLine" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"cellLine["+sVal+"]["+cVal+"]["+speciesArr2[sVal][cVal]+"]\">"
						+ "<label for=\"cellLine" + baclCtr +"\">CellLine"
						+ " ("
						+ baclCtr
						+ ")"
						+ "</label>"
						+ "</div>"
						+ "<input type='hidden' name='lengthBC["+sVal+"]["+cVal+"]' value='"+speciesArr2[sVal][cVal]+"'>";

				$('#biologicalActivityGroup').append(inputAppend);
			} else {
				var inputAppend = "<div class=\"input-field col s6 offset-s2\">"
						+ "<input id=\"biologicalActivity" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"bioAct["+sVal+"]["+cVal+"]["+speciesArr2[sVal][cVal]+"]\">"
						+ "<label for=\"biologicalActivity" + baclCtr +"\">Biological Activity"
						+ " ("
						+ baclCtr
						+ ")"
						+ "</label>"
						+

						"<a class=\"btn-small right teal darken-4\" id=\"biologicalActivityAdd"
						+ pValue
						+ "\" onclick=\"addBAFields("
						+ pValue
						+ ","
						+ sVal
						+ ","
						+ cVal
						+ ")\">Biological Activities<i class=\"material-icons left\">add</i></a>"
						+ "</div>"
						+ "<div class=\"input-field col s4\">"
						+ "<input id=\"cellLine" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"cellLine["+sVal+"]["+cVal+"]["+speciesArr2[sVal][cVal]+"]\">"
						+ "<label for=\"cellLine" + baclCtr +"\">CellLine"
						+ " ("
						+ baclCtr
						+ ")"
						+ "</label>"
						+ "</div>"
						+ "<input type='hidden' name='lengthBC["+sVal+"]["+cVal+"]' value='"+speciesArr2[sVal][cVal]+"'>";
				;

				var inputGroupText = "#biologicalActivityGroup" + pValue;

				$(inputGroupText).append(inputAppend);
			}
		}

		function addCCFields(pValue) {
			speciesArr[pValue]++;
			speciesArr2[pValue].push(0);
			console.log(speciesArr2);
			var buttonAddText = "#chemicalCompoundAdd" + pValue;

			if (pValue == 0) {
				$('#chemicalCompoundAdd').remove();
			} else {
				$(buttonAddText).remove();
			}
			ccCtr++;
			baclCtr++;

			if (pValue == 0) {
				var inputChemicalCompound = "<div class=\"input-field col s6 offset-s1\">"
						+ "<input id=\"chemicalCompound" + ccCtr +"\" type=\"text\" class=\"validate\" name=\"compound["+pValue+"]["+speciesArr[pValue]+"]\"  >"
						+ "<label for=\"chemicalCompound" + ccCtr +"\">Chemical Compound"
						+ " ("
						+ ccCtr
						+ ")"
						+ "</label>"
						+

						"<a class=\"btn-small right teal darken-4\" id=\"chemicalCompoundAdd\" onclick=\"addCCFields("
						+ pValue
						+ ")\">Chemical Compound<i class=\"material-icons left\">add</i></a>"
						+ "</div>"
						+ "<input type='hidden' name='compoundCtr' value='"+ccCtr+"'>"
						+ "<input type='hidden' name='lengthCC"+pValue+"' value='"+speciesArr[pValue]+"'>";
				var inputBiologicalActivity = "<div class=\"col s12\" id=\"biologicalActivityGroup" + ccCtr + "\">"
						+ "<div class=\"input-field col s6 offset-s2\">"
						+ "<input id=\"biologicalActivity" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"bioAct["+pValue+"]["+speciesArr[pValue]+"][0]\">"
						+ "<label for=\"biologicalActivity" + baclCtr +"\">Biological Activity"
						+ " ("
						+ baclCtr
						+ ")"
						+ "</label>"
						+

						"<a class=\"btn-small right teal darken-4\" id=\"biologicalActivityAdd"
						+ ccCtr
						+ "\" onclick=\"addBAFields("
						+ ccCtr
						+ ","
						+ pValue
						+ ","
						+ speciesArr[pValue]
						+ ")\">Biological Activities<i class=\"material-icons left\">add</i></a>"
						+ "</div>"
						+ "<div class=\"input-field col s4\">"
						+ "<input id=\"cellLine" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"cellLine["+pValue+"]["+speciesArr[pValue]+"][0]\">"
						+ "<label for=\"cellLine" + baclCtr +"\">CellLine"
						+ " ("
						+ baclCtr
						+ ")"
						+ "</label>"
						+ "</div>"
						+ "<input type='hidden' name='lengthBC["+pValue+"]["+speciesArr[pValue]+"]' value='"+speciesArr2[pValue][speciesArr[pValue]]+"'>";
				+"</div>";

				$('#chemicalCompoundGroup').append(inputChemicalCompound,
						inputBiologicalActivity);
			} else {
				var inputChemicalCompound = "<div class=\"input-field col s6 offset-s1\">"
						+ "<input id=\"chemicalCompound" + ccCtr +"\" type=\"text\" class=\"validate\" name=\"compound["+pValue+"]["+speciesArr[pValue]+"]\" >"
						+ "<label for=\"chemicalCompound" + ccCtr +"\">Chemical Compound"
						+ " ("
						+ ccCtr
						+ ")"
						+ "</label>"
						+

						"<a class=\"btn-small right teal darken-4\" id=\"chemicalCompoundAdd"
						+ pValue
						+ "\" onclick=\"addCCFields("
						+ pValue
						+ ")\">Chemical Compound<i class=\"material-icons left\">add</i></a>"
						+ "</div>"
						+ "<input type='hidden' name='lengthCC"+pValue+"' value='"+speciesArr[pValue]+"'>";
				var inputBiologicalActivity = "<div class=\"col s12\" id=\"biologicalActivityGroup" + ccCtr + "\">"
						+ "<div class=\"input-field col s6 offset-s2\">"
						+ "<input id=\"biologicalActivity" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"bioAct["+pValue+"]["+speciesArr[pValue]+"][0]\">"
						+ "<label for=\"biologicalActivity" + baclCtr +"\">Biological Activity"
						+ " ("
						+ baclCtr
						+ ")"
						+ "</label>"
						+

						"<a class=\"btn-small right teal darken-4\" id=\"biologicalActivityAdd"
						+ ccCtr
						+ "\" onclick=\"addBAFields("
						+ ccCtr
						+ ","
						+ pValue
						+ ","
						+ speciesArr[pValue]
						+ ")\">Biological Activities<i class=\"material-icons left\">add</i></a>"
						+ "</div>"
						+ "<div class=\"input-field col s4\">"
						+ "<input id=\"cellLine" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"cellLine["+pValue+"]["+speciesArr[pValue]+"][0]\">"
						+ "<label for=\"cellLine" + baclCtr +"\">CellLine"
						+ " ("
						+ baclCtr
						+ ")"
						+ "</label>"
						+ "</div>"
						+ "<input type='hidden' name='lengthBC["+pValue+"]["+speciesArr[pValue]+"]' value='"+speciesArr2[pValue][speciesArr[pValue]]+"'>";
				+"</div>";

				var inputGroupText = "#chemicalCompoundGroup" + pValue;

				$(inputGroupText).append(inputChemicalCompound,
						inputBiologicalActivity);
			}

		}
		function addSFields(pValue) {
			speciesArr.push(0);
			speciesArr2.push([ 0 ]);
			console.log(speciesArr2);
			var buttonAddText = "#speciesAdd"+pValue;
			
			console.log(pValue);
			if (pValue == 0) {
				$('#speciesAdd').remove();
			} else {
				$(buttonAddText).remove();
			}

			sCtr++;
			ccCtr++;
			baclCtr++;
	
			var inputSpecies = "<div class=\"input-field col s6\">"
					+ "<select class=\"browser-default\" onchange=\"speciesPartOtherEnable("
					+ sCtr
					+ ")\" id=\"speciesPart"
					+ sCtr
					+ "\" name=\"plantPart["
					+ sCtr
					+ "]\">"
					+ "<option value=\"\" disabled selected>Choose plant part</option>"
					+ "<option value=\"-1\">Others (Please write on the right side)</option>"
					+ "<c:forEach items='${plantPartsList}' var='plantPartsList'>"
					+ "<option value=\"${plantPartsList}\">${plantPartsList}</option>"
					+ "</c:forEach>"
					+ "</select>"
					+ "</div>"
					+ "<div class=\"col s6\">"
					+ "<div class=\"input-field\">"
					+ "<input id=\"speciesPartOther" + sCtr +"\" type=\"text\" class=\"validate\" disabled required>"
					+ "<label for=\"speciesPartOther" + sCtr +"\">Other Species Part"
					+ " ("
					+ sCtr
					+ ")"
					+ "</label>"
					+ "</div>"
					+ "</div>"
					+ "<input type='hidden' name='speciesCtr' value='"+sCtr+"'>";

			var inputChemicalCompound = "<div class=\"row\" id=\"chemicalCompoundGroup" + sCtr + "\">"
					+ "<div class=\"input-field col s6 offset-s1\">"
					+ "<input id=\"chemicalCompound" + ccCtr + "\" type=\"text\" class=\"validate\" name=\"compound["+sCtr+"]["+speciesArr[pValue]+"]\">"
					+ "<label for=\"chemicalCompound" + ccCtr + "\">Chemical Compound"
					+ " ("
					+ ccCtr
					+ ")"
					+ "</label>"
					+

					"<a class=\"btn-small right teal darken-4\" id=\"chemicalCompoundAdd"
					+ sCtr
					+ "\" onclick=\"addCCFields("
					+ sCtr
					+ ")\">Chemical Compound<i class=\"material-icons left\">add</i></a>"
					+ "</div>"
					+ "<input type='hidden' name='lengthCC"+sCtr+"' value='"+speciesArr[pValue]+"'>"
					+ "<div class=\"col s12\" id=\"biologicalActivityGroup" + ccCtr + "\">"
					+ "<div class=\"input-field col s6 offset-s2\">"
					+ "<input id=\"biologicalActivity" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"bioAct["+sCtr+"]["+speciesArr[pValue]+"][0]\">"
					+ "<label for=\"biologicalActivity" + baclCtr +"\">Biological Activity"
					+ " ("
					+ baclCtr
					+ ")"
					+ "</label>"
					+ "<a class=\"btn-small right teal darken-4\" id=\"biologicalActivityAdd"
					+ ccCtr
					+ "\" onclick=\"addBAFields("
					+ ccCtr
					+ ","
					+ sCtr
					+ ","
					+ speciesArr[pValue]
					+ ")\">Biological Activities<i class=\"material-icons left\">add</i></a>"
					+ "</div>"
					+ "<div class=\"input-field col s4\">"
					+ "<input id=\"cellLine" + baclCtr +"\" type=\"text\" class=\"validate\" name=\"cellLine["+sCtr+"]["+speciesArr[pValue]+"][0]\">"
					+ "<label for=\"cellLine" + baclCtr +"\">CellLine"
					+ " ("
					+ baclCtr
					+ ")"
					+ "</label>"
					+ "</div>"
					+ "<input type='hidden' name='lengthBC["+sCtr+"]["+speciesArr[pValue]+"]' value='"+speciesArr2[sCtr][speciesArr[pValue]]+"'>";
			+"</div>" + "</div>";

			var inputButtonAdd = "<a class=\"btn-small teal darken-4 center col s6 offset-s3\" id=\"speciesAdd\" onclick=\"addSFields("
					+ sCtr
					+ ")\">Species<i class=\"material-icons left\">add</i></a>";

			$('#speciesGroup').append(inputSpecies, inputChemicalCompound,
					inputButtonAdd);
		}

		function speciesPartOtherEnable(pValue) {
			var optionSpeciesPartText = "speciesPart" + pValue;
			var optionSelected;

			if (pValue == 0) {
				$('speciesPart').remove();
				optionSelected = document.getElementById('speciesPart').value;
			} else {
				$(optionSpeciesPartText).remove();
				optionSelected = document.getElementById(optionSpeciesPartText).value;
			}

			if (optionSelected == -1) {
				if (pValue == 0)
					$('#speciesPartOther').prop("disabled", false);
				else {
					var speciesPartOtherText = "#speciesPartOther" + pValue;
					$(speciesPartOtherText).prop("disabled", false);
				}
			} else {
				if (pValue == 0)
					$('#speciesPartOther').prop("disabled", true);
				else {
					var speciesPartOtherText = "#speciesPartOther" + pValue;
					$(speciesPartOtherText).prop("disabled", true);
				}
			}
		}
	</script>
</body>
</html>