function postFormSubmit(path, params, method) {
	method = method || "post"; // Set method to post by default if not specified.

	var form = document.createElement("form");
	form.setAttribute("method", method);
	form.setAttribute("action", path);

	for(var key in params) {
		if(params.hasOwnProperty(key)) {
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			hiddenField.setAttribute("value", params[key]);

			form.appendChild(hiddenField);
		}
	}
	document.body.appendChild(form);
	form.submit();
}

function showSnackbar(message) {
	var iDiv = document.createElement('div');
	var message = document.createTextNode(message); 
	iDiv.appendChild(message); 
	iDiv.id = 'snackbar';
	iDiv.className = 'snackbar';
	document.body.appendChild(iDiv);
	setTimeout(function(){ 
		$('body').find('div.snackbar').remove();
	}, 4000);
}

function showErrorSnackbar(message) {
	var iDiv = document.createElement('div');
	var message = document.createTextNode(message); 
	iDiv.appendChild(message); 
	iDiv.id = 'snackbar';
	iDiv.className = 'snackbar error';
	document.body.appendChild(iDiv);
	setTimeout(function(){ 
		$('body').find('div.snackbar').remove();
	}, 8000);
}

VeeValidate.Validator.extend('verify_password', {
	getMessage: field => `The password must contain at least: 1 uppercase letter, 1 lowercase letter, 1 number, and one special character (E.g. , . _ & ? etc)`,
	validate: value => {
		var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
		return strongRegex.test(value);
	}
});

