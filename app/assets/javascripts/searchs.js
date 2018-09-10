var app = angular.module('lawApp', [])


app.controller('searchCtrl', function($scope) {
  $scope.cases = []

  fetch('/cases.json')
  .then(function (data) {
    return data.json()
  })
  .then(function (cases) {
    $scope.cases = cases
  })
});


// styling

function showSearchResults(event) {
  const counterAct = document.getElementById('counter_event');
  const search = document.getElementById('searchResults');

  console.log(search)
  search.classList.remove("disable");
  counterAct.classList.remove("disable");

}

function counterAct() {
  const counterAct = document.getElementById('counter_event');
  const search = document.getElementById('searchResults');
  search.classList.add("disable");
  counterAct.classList.add("disable");
  console.log(counterAct)
}
