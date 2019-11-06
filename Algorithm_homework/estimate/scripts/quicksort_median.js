// Quicksort 중간값 피봇 구현
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

//랜덤 숫자 배열 생성기
var ranNums = function(amount = 100) {
    var array = [];
    for (var i = 0;i < amount;i++) {
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

//
var median5000 = function() {
    var a = [[],[]];
    var b = [];
    for (var k = 0;k < 30;k++) {
        var t2 = performance.now();
	    myQuicksort(ranNums(5000));
        var t3 = performance.now();
        a.push([k],[t3 - t2]);
        b.push(t3-t2);
    }
    return a, b;
}
console.log(median5000());