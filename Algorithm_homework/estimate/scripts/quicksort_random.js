// Quicksort 랜덤 피봇 구현
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
    
    var pivotpoint = Math.floor(Math.random() * (high - low)) + low;
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
var random5000 = function() {
    var a = [[],[]];
    var b = [];
    for (var k = 0;k < 30;k++) {
        var t4 = performance.now();
	    myQuicksort(ranNums(5000));
        var t5 = performance.now();
        a.push([k],[t5 - t4]);
        b.push(t5-t4);
    } 
    return a, b;
}
console.log(random5000());