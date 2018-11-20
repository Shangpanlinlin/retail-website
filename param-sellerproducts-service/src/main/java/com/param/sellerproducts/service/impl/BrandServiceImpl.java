package com.param.sellerproducts.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.param.mapper.TbBrandMapper;
import com.param.pojo.TbBrand;
import com.param.pojo.TbBrandExample;
import com.param.sellerproducts.service.BrandService;
import entity.PageResult;
import entity.Result;
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

    @Override
    public PageResult findPage(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        Page<TbBrand> page = (Page<TbBrand>) mapper.selectByExample(null);
        return new PageResult(page.getTotal(),page.getResult());
    }

    @Override
    public void addBrand(TbBrand tbBrand) {
       mapper.insert(tbBrand);
    }

    @Override
    public TbBrand findOne(long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public void editBrand(TbBrand tbBrand) {
        mapper.updateByPrimaryKey(tbBrand);
    }

    @Override
    public void deleteBrands(long[] ids) {
        for (long id : ids) {
            mapper.deleteByPrimaryKey(id);
        }
    }

    @Override
    public PageResult findPage(TbBrand tbBrand, int pageNum, int pageSize) {

        PageHelper.startPage(pageNum,pageSize);

        TbBrandExample example = new TbBrandExample();

        if(tbBrand != null){
            TbBrandExample.Criteria criteria = example.createCriteria();
            if(tbBrand.getName() != null && tbBrand.getName().length()>0)
                criteria.andNameLike("%" + tbBrand.getName() + "%");
            if(tbBrand.getFirstChar() != null && tbBrand.getFirstChar().length() > 0)
                criteria.andFirstCharLike("%" + tbBrand.getFirstChar() + "%");
        }

        Page<TbBrand> page = (Page<TbBrand>) mapper.selectByExample(example);
        return new PageResult(page.getTotal(),page.getResult());
    }
}
