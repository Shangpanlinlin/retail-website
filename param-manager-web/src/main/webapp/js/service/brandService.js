//service level
app.service("brandService",function($http){
    this.findPage = function(page,size,entity){
        return $http.post("../brand/search.do?pageNum="+page+"&pageSize="+size,entity);
    };
    this.findOne = function(id){
        return $http.get("../brand/findOne.do?id=" + id);
    } ;
    this.dele = function(ids){
        return $http.get("../brand/delete.do?ids="+ids);
    }
    this.edit = function(entity){
        return $http.post("../brand/edit.do",entity);
    }
    this.save = function(entity){
        return $http.post("../brand/save.do",entity);
    }

});