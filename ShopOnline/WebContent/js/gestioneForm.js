function validazioneRegistrazione () {
	var nome = document.getElementById('nome').value;
	var cognome = document.getElementById('cognome').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
    if(nome != '' & cognome != '' & username != '' & password != '') {
    	
    	return true;
    }else{
    	document.getElementById('alert').style.display = 'block';
	    return false;
	    
    }
	
}

function validazioneLogin() {
	
	var username = document.getElementById('username');
	var password = document.getElementById('password');
	var controllo = true ;
	if(username.value == '') {
		controllo = false;
		username.classList.add('alert-danger');
	}else {
		username.classList.remove('alert-danger');
		username.classList.add('alert-success');
		
	}
	
	if(password.value == '') {
		controllo = false;
		password.classList.add('alert-danger');
	}else {
		password.classList.remove('alert-danger');
		password.classList.add('alert-success');
		
	}
	if(!controllo){
		document.getElementById('alert').style.display = 'block';
		
	}
	
	return controllo;
}