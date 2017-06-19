let targets = [[1,2],
               [1,3],
               [1,4],
               [1,5],
               [2,5],
               [3,5],
               [3,4],
               [3,3],
               [4,3],
               [6,3]];
document.addEventListener("DOMContentLoaded",function(){
  targets.forEach(function(target){
    document.querySelector(`tr:nth-child(${target[0]}) td:nth-child(${target[1]})`).classList.add('active');
  });
});