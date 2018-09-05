const content = document.getElementById('content');

const current_url = window.location.href;

const url = current_url + ".json";
// console.log("current_location : " + current_url + ".json");
get_content();


function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}


function get_content() {
	console.log("fetching the json data.")

	fetch(url)
	.then(function(response) {
		return response.json()
	})
	.then(function(text) {
		const new_data = text.content.replace(/\./g,'. <br>')
		console.log(new_data)
		sleep(1000)
		document.getElementById('content').innerHTML = new_data;
	})
	.catch(function(error) {
		console.log('Request failed', error)
	});

}