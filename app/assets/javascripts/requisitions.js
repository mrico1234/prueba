function traer(){
	var request = new XMLHttpRequest()

	request.open('GET', 'http://localhost:3000/ordens', true)
	request.onload = function() {
	  // Begin accessing JSON data here
	  var data = JSON.parse(this.response)

	  if (request.status >= 200 && request.status < 400) {
	    data.forEach(movie => {
	      console.log(movie.id+"--"+movie.code+"--"+movie.branch)
	    })
	  } else {
	    console.log('error')
	  }
	}

	request.send()
}	
