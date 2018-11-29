package com.param.pojogroup;

import com.param.pojo.TbGoods;
import com.param.pojo.TbGoodsDesc;
import com.param.pojo.TbItem;

import java.io.Serializable;

public class Goods implements Serializable {

    private TbGoods goods;  //SPU
    private TbGoodsDesc goodsDesc; //SPU extend information
    private TbItem item; //SKU list

    public TbGoods getGoods() {
        return goods;
    }

    public void setGoods(TbGoods goods) {
        this.goods = goods;
    }

    public TbGoodsDesc getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(TbGoodsDesc goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public TbItem getItem() {
        return item;
    }

    public void setItem(TbItem item) {
        this.item = item;
    }
}
