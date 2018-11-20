package entity;

import java.io.Serializable;
import java.util.List;

public class PageResult implements Serializable {

    private long totalNum;
    private List list;

    public PageResult(long totalNum, List list) {
        this.totalNum = totalNum;
        this.list = list;
    }

    public long getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(long totalNum) {
        this.totalNum = totalNum;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }
}
