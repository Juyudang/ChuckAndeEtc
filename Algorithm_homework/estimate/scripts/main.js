// Quicksort 첫번째 엘리먼트 피봇 대략 구현
function swap(array, a, b) {
    var temp = array[a];
    array[a] = array[b];
    array[b] = temp;
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

    var pivotpoint = low
    var pivotitem = array[pivotpoint];
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
//  아무튼 만듬
var ranNums = function(amount = 100) {
    var array = [];
    for (var i = 0;i < amount;i++) {
        array.push(i);
    }
    array.sort(function(a, b){return 0.5 - Math.random()});
    return array;
}

///////////////////////////////
var first5000 = function() {
    var a = [[],[]];
    var b = [];
    for (var k = 0;k < 30;k++) {
        var t0 = performance.now();
	    myQuicksort(ranNums(5000));
        var t1 = performance.now();
        a.push([k],[t1 - t0]);
        b.push(t1-t0);
    }
    return a, b;
}
console.log(first5000());