package com.param.sellerproducts.service;

import com.param.pojo.TbBrand;
import entity.PageResult;
import entity.Result;

import java.util.List;
import java.util.Map;

public interface BrandService {
    List<TbBrand> findAll();

    PageResult findPage(int pageNum, int pageSize);

    void addBrand(TbBrand tbBrand);

    TbBrand findOne(long id);

    void editBrand(TbBrand tbBrand);

    void deleteBrands(long[] ids);

    PageResult findPage(TbBrand tbBrand, int pageNum, int pageSize);

    List<Map> findBrandOptions();
}
