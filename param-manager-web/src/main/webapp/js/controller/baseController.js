 //品牌控制层 
app.controller('baseController' ,function($scope){
    //分页控件配置
    $scope.paginationConf = {
        currentPage: 1,
        totalItems: 10,
        itemsPerPage: 10,
        perPageOptions: [10, 20, 30, 40, 50],
        onChange: function(){
            $scope.reloadList();
        }
    };

    $scope.reloadList = function(){
        $scope.findPage($scope.paginationConf.currentPage,$scope.paginationConf.itemsPerPage);
    };

    $scope.selectedIds = []
    $scope.updateSelection = function($event, id){
        if($event.target.checked){
            $scope.selectedIds.push(id);
        }else{
            var index = $scope.selectedIds.indexOf(id);
            $scope.selectedIds.splice(index, 1);
        }
    };

    $scope.jsonToString = function(jsonString, key){
        var object =   JSON.parse(jsonString);
        var value = "";
        for(i=0; i < object.length; i++){
            if(i>0){
                value += ", "+object[i][key];
            }
            else
                value += object[i][key];
        }
        return value;
    }
});	