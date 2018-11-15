package com.param.sellerproducts.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.param.mapper.TbBrandMapper;
import com.param.pojo.TbBrand;
import com.param.sellerproducts.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service  //register the bean as a dubbo service
public class BrandServiceImpl implements BrandService {

    @Autowired
    TbBrandMapper mapper;

    @Override
    public List<TbBrand> findAll() {
        return mapper.selectByExample(null);
    }
}
