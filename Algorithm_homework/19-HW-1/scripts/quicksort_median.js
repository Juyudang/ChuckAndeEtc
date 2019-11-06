// Quicksort 첫번째 엘리먼트 피봇 대략 구현
function swap(array, a, b) {
    var temp = array[a];
    array[a] = array[b];
    array[b] = temp;
}

function get_median_amongThree(array, low = 0, high = (array.length - 1)) {
    var mid;
    if ((low + high)%2) {
        mid = (low + high + 1)/2;
    } else {
        mid = (low + high)/2;
    }
    if (array[low] > array[mid]) {
        swap(array, low, mid);
    }
    if (array[mid] > array[high]) {
        swap(array, mid, high);
    }
    if (array[low] > array[high]) {
        swap(array, low, high);
    }
    return mid;
}

function myQuicksort(array, low =0, high = (array.length - 1)) {

    if (high > low) 
    {
        var pivotpoint = myPartition(array, low, high);
        myQuicksort(array, low, pivotpoint - 1);
        myQuicksort(array, pivotpoint + 1, high);
    }
    return array;   
}

function myPartition(array, low = 0, high = (array.length - 1)) {

    var pivotpoint = get_median_amongThree(array, low, high);
    var pivotitem = array[pivotpoint];
    array[pivotpoint] = array[low];
    pivotpoint = low;
    array[low] = pivotitem;
    var j = low;

    for(var i = low + 1;i <= high; i++) {
        if(array[i] < pivotitem) {
            j++;
            swap(array, i, j);
        }
    }
    array[pivotpoint] = array[j];
    pivotpoint = j;
    array[j] = pivotitem;

    return pivotpoint;
}

//랜덤 숫자 배열 생성기~~
// 100
var ranNums100 = function() {
    var array = []
    for (var i = 0;i < 100;i++){
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

// 500
var ranNums500 = function() {
    var array = []
    for (var i = 0;i < 500;i++){
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

// 1000
var ranNums1000 = function() {
    var array = []
    for (var i = 0;i < 1000;i++){
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

// 2000
var ranNums2000 = function() {
    var array = []
    for (var i = 0;i < 2000;i++){
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

// 3000
var ranNums3000 = function() {
    var array = []
    for (var i = 0;i < 3000;i++){
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

// 4000
var ranNums4000 = function() {
    var array = []
    for (var i = 0;i < 4000;i++){
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

// 5000
var ranNums5000 = function() {
    var array = []
    for (var i = 0;i < 5000;i++){
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

//  아무튼 만듬
var ranNums = function(amount = 100) {
    var array = [];
    for (var i = 0;i < amount;i++) {
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

function button31_click() {
	console.log(myQuicksort(ranNums(100)));
}

function button32_click() {
	console.log(myQuicksort(ranNums(500)));
}

function button33_click() {
	console.log(myQuicksort(ranNums(1000)));
}

function button34_click() {
	console.log(myQuicksort(ranNums(2000)));
}

function button35_click() {
	console.log(myQuicksort(ranNums(3000)));
}

function button36_click() {
	console.log(myQuicksort(ranNums(4000)));
}
/////////////////////////////////////////////////
var t4 = performance.now();
function button37_click() {
	console.log(myQuicksort(ranNums(5000)));
}
var t5 = performance.now();
console.log("quicksort_first_5000items: " + (t5 - t4) + 'ms');