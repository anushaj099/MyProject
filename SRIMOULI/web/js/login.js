var attempt = 3; //Variable to count number of attempts

//Below function Executes on click of login button
function validate(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;

	if ( username === "admin" && password === "Admin#123"){
		alert ("Login successfully");
		window.location="AdminHome.html"; //redirecting to other page
		return false;
	}

	else if ( username === "godown" && password === "Godown#123"){
		alert ("Login successfully");
		window.location="godownLogin.html"; //redirecting to other page
		return false;
	}

	else if ( username === "carding" && password === "Carding#123"){
		alert ("Login successfully");
		window.location="cardingLogin.html"; //redirecting to other page
		return false;
	}

	else if ( username === "drawing" && password === "Drawing#123"){
		alert ("Login successfully");
		window.location="drawingLogin.html"; //redirecting to other page
		return false;
	}

	else if ( username === "openend" && password === "Openend#123"){
		alert ("Login successfully");
		window.location="openendLogin.html"; //redirecting to other page
		return false;
	}

	else if ( username === "quality" && password === "Quality#123"){
		alert ("Login successfully");
		window.location="qualityLogin.html"; //redirecting to other page
		return false;
	}

	else if ( username === "packing" && password === "Packing#123"){
		alert ("Login successfully");
		window.location="packingLogin.html"; //redirecting to other page
		return false;
	}


	else{
		attempt --;//Decrementing by one
		alert("You have left "+attempt+" attempt;");
		
		//Disabling fields after 3 attempts
		if( attempt == 0){
			document.getElementById("username").disabled = true;
			document.getElementById("password").disabled = true;
			document.getElementById("submit").disabled = true;
			return false;
		}
	}
}

function forget(){
		alert("Plaese contact with Nivriti Solutions Global Pvt. Ltd.");
}


