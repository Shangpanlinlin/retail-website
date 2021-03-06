 //控制层 
app.controller('itemCatController' ,function($scope,$controller ,itemCatService, typeTemplateService){
	
	$controller('baseController',{$scope:$scope});//继承
	
    //读取列表数据绑定到表单中  
	$scope.findAll=function(){
		itemCatService.findAll().success(
			function(response){
				$scope.list=response;
			}			
		);
	}    
	
	//分页
	$scope.findPage=function(page,rows){			
		itemCatService.findPage(page,rows).success(
			function(response){
				$scope.list=response.rows;	
				$scope.paginationConf.totalItems=response.total;//更新总记录数
			}			
		);
	}
	
	//查询实体 
	$scope.findOne=function(id){				
		itemCatService.findOne(id).success(
			function(response){
				$scope.entity= response;					
			}
		);				
	}
	
	//保存 
	$scope.save=function(){				
		var serviceObject;//服务层对象
		var parent;
		if($scope.entity_2 != null){
			$scope.entity.parentId  = $scope.entity_2.id;
			parent = $scope.entity_2;
		}else if($scope.entity_1 != null){
			$scope.entity.parentId = $scope.entity_1.id;
			parent = $scope.entity_1
		} else {
            $scope.entity.parentId = 0;
            parent = {id:0}
		}
		if($scope.entity.id!=null){//如果有ID
			serviceObject=itemCatService.update( $scope.entity ); //修改  
		}else{
			serviceObject=itemCatService.add( $scope.entity  );//增加 
		}				
		serviceObject.success(
			function(response){
				if(response.success){
					//重新查询 
		        	$scope.selectList(parent);//重新加载
				}else{
					alert(response.message);
				}
			}		
		);				
	}
	
	 
	//批量删除 
	$scope.dele=function(){			
		//获取选中的复选框			
		itemCatService.dele( $scope.selectedIds ).success(
			function(response){
				if(response.success){
                    var parent;
                    if($scope.entity_2 != null){
                        parent = $scope.entity_2;
                    }else if($scope.entity_1 != null){
                        parent = $scope.entity_1
                    } else {
                        parent = {id:0}
                    }
					$scope.selectedIds=[];
                    $scope.selectList(parent);//重新加载
				}						
			}		
		);				
	}
	
	$scope.searchEntity={};//定义搜索对象 
	
	//搜索
	$scope.search=function(page,rows){			
		itemCatService.search(page,rows,$scope.searchEntity).success(
			function(response){
				$scope.list=response.rows;	
				$scope.paginationConf.totalItems=response.total;//更新总记录数
			}			
		);
	}

	$scope.findByParentId=function (id) {
		itemCatService.findByParentId(id).success(function(response){
			$scope.list = response;
		});
    }

    $scope.grade=1;//默认为1级
    //设置级别
    $scope.setGrade=function(value){
        $scope.grade=value;
    }
    //读取列表
    $scope.selectList=function(p_entity){
        if($scope.grade==1){//如果为1级
            $scope.entity_1=null;
            $scope.entity_2=null;
        }
        if($scope.grade==2){//如果为2级
            $scope.entity_1=p_entity;
            $scope.entity_2=null;
        }
        if($scope.grade==3){//如果为3级
            $scope.entity_2=p_entity;
        }
        $scope.findByParentId(p_entity.id);	//查询此级下级列表
    }

    $scope.findTypeTemplateList = function(){
    	typeTemplateService.selectOptionList().success(
    		function(response){
              $scope.typeTemplateList = {data:response}
		});
	}





});	
