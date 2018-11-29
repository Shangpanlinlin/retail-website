import com.qiniu.common.Zone;
import util.QiNiuUtils;

public class QiNiuYunTest {

    static String  path = "/Users/panlinlin/Desktop/snapshot/123.png";

    public static void upload(){
        String credential = QiNiuUtils.getUploadCredential();
        QiNiuUtils.fileUpload(Zone.zone0(),credential,path);
    }

    /*
    *
    *
    *
    *
Fof3IU4MlDtM37Sbr6rPInwlH8ue
Fof3IU4MlDtM37Sbr6rPInwlH8ue
p12bgfv4l.bkt.clouddn.com

p12bgfv4l.bkt.clouddn.com
    *
    * */

    public static String getUrl(){
        String url = QiNiuUtils.publicFile("Fof3IU4MlDtM37Sbr6rPInwlH8ue","p12bgfv4l.bkt.clouddn.com");
        return url;
    }

    public static void main(String[] args) {
        //System.out.println(getUrl());
            upload();
    }
}
