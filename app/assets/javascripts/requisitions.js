function traer(){
	
	let url = `http://localhost:3000/ordens`
	var request = new XMLHttpRequest()

	request.open('GET', url, true)
	request.onload = function() {
	  // Begin accessing JSON data here
	  var data = JSON.parse(this.response)
	  if (request.status >= 200 && request.status < 400) {
	    data.forEach(order => {
	      console.log(data);	
	      document.getElementById("parrafo").innerHTML += `<li>Pedido numero: ${order.id} Codigo: ${order.code} Estatus: ${order.status} Cliente: ${order.client_id}</li>`;
	    })
	  } else {
	    console.log('error')
	  }
	}

	request.send()
}	

function status(){
	
	
}	