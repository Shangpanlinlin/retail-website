//controller level
app.controller("brandController",function($scope,$controller,brandService){

    $controller("baseController",{$scope:$scope});//继承
    $scope.searchEntity={};
    $scope.findPage = function(page,size){
        brandService.findPage(page,size,$scope.searchEntity).success(function(response){
            $scope.paginationConf.totalItems = response.totalNum;
            $scope.list = response.list;
        });
    };

    $scope.findOne = function(id){
        brandService.findOne(id).success(function(response){
            $scope.entity = response;
        });
    };

    $scope.dele = function(){
        brandService.dele($scope.selectedIds).success(function (response) {
            if(response.success){
                $scope.reloadList();
                $scope.selectedIds=[];
            }else{
                alert(response.message);
            }
        });
    };

    $scope.save = function(){
        var object;
        if($scope.entity.id != null){
            object = brandService.edit($scope.entity);
        }else{
            object = brandService.save($scope.entity);
        }
        object.success(function (response) {
            if(response.success){
                $scope.reloadList();
            }else{
                alert("Add new brand information failed");
            }
        });
    };

});