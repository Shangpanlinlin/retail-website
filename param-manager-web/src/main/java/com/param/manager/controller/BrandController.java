package com.param.manager.controller;

import java.util.List;

import com.param.pojo.TbBrand;
import com.param.sellerproducts.service.BrandService;
import entity.PageResult;
import entity.Result;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;

@RestController // will return JSON accord to the convention that define restFull API should be
@RequestMapping("/brand")
public class BrandController {

    @Reference
    private BrandService brandService;

    @RequestMapping("/findAll")
    public List<TbBrand> findAll(){
        return brandService.findAll();
    }


    @RequestMapping("/findPage")
    public PageResult findPage(int pageNum, int pageSize){
        return brandService.findPage(pageNum,pageSize);

    }

    @RequestMapping("/save")
    public Result addBrand( @RequestBody TbBrand tbBrand){
        try{
            brandService.addBrand(tbBrand);
            return new Result(true,null);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,e.getMessage());
        }
    }

    @RequestMapping("/edit")
    public Result editBrand( @RequestBody TbBrand tbBrand){
        try{
            brandService.editBrand(tbBrand);
            return new Result(true,null);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,e.getMessage());
        }
    }

    @RequestMapping("/findOne")  //RestController will make all return become JSON
    public TbBrand findOne(long id){
        return brandService.findOne(id);
    }

    @RequestMapping("/delete")
    public Result editBrand( long[] ids){
        try{
            brandService.deleteBrands(ids);
            return new Result(true,null);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,e.getMessage());
        }
    }

    @RequestMapping("/search")
    public PageResult findPage(@RequestBody TbBrand tbBrand,  int pageNum, int pageSize){
        return brandService.findPage(tbBrand, pageNum,pageSize);

    }
}

