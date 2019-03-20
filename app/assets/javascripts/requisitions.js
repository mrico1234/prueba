function traer(){
	
	let url = `http://localhost:3000/ordens`
	var request = new XMLHttpRequest()

	request.open('GET', url, true)
	request.onload = function() {
	  // Begin accessing JSON data here
	  var data = JSON.parse(this.response)
	  //let resultado = document.getElementById("resultado")
	  //resultado.innerHtml = '';

	  if (request.status >= 200 && request.status < 400) {
	    data.forEach(order => {
	      //console.log(orden.id+"--"+orden.code+"--"+orden.branch)
	      //console.log(data)
	      //alert(`Pedido numero: ${order.id}\nCódigo: ${order.code} status: ${order.status}`);
	      console.log(data);	
	      document.getElementById("parrafo").innerHTML += `<li>Pedido numero: ${order.id} Codigo: ${order.code} Estatus: ${order.status} Cliente: ${order.client_id}</li>`;
	      

	      
	 
	    })
	  } else {
	    console.log('error')
	  }
	}

	request.send()
}	
