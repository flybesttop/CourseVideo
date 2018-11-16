package Servlet;

import com.zlzkj.core.util.UploadUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

import static com.zlzkj.core.util.Fn.ajaxReturn;

@Controller
@RequestMapping(value = "/upload")
public class uploadServlet {

    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");


    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
    public String uploadImage(HttpServletResponse response, MultipartFile image) {
        Map<String, Object> data = new HashMap<String, Object>();
        String picWeb = ""; // 图片保存名
        if (null != image) {
            Map<String, Object> videoFileInfo = UploadUtils.saveMultipartFile(image);
            if ((Integer) videoFileInfo.get("status") > 0) { // 上传完成
                picWeb = UploadUtils.parseFileUrl(videoFileInfo.get("saveName").toString());
            } else { // 上传出错
                return ajaxReturn(response, null, videoFileInfo.get("errorMsg").toString(), 0);
            }
            data.put("imageUrl", videoFileInfo.get("saveName").toString());
        }
        return ajaxReturn(response, data, "上传完毕", 1);
    }

    @RequestMapping(value = "/uploadFile")
    public String backUploadCourse(HttpServletRequest request, HttpServletResponse response, MultipartFile videoFile, MultipartFile ppt) {
        Map<String, Object> data = new HashMap<String, Object>();
        String picWeb = ""; // 图片保存名
        if (null != videoFile) {
            Map<String, Object> videoFileInfo = UploadUtils.saveMultipartFile(videoFile);
            if ((Integer) videoFileInfo.get("status") > 0) { // 上传完成
                picWeb = UploadUtils.parseFileUrl(videoFileInfo.get("saveName").toString());
            } else { // 上传出错
                return ajaxReturn(response, null, videoFileInfo.get("errorMsg").toString(), 0);
            }
            data.put("videoUrl", videoFileInfo.get("saveName").toString());
        }
        if (null != ppt) {
            Map<String, Object> pptFileInfo = UploadUtils.saveMultipartFile(ppt);
            if ((Integer) pptFileInfo.get("status") > 0) { // 上传完成
                picWeb = UploadUtils.parseFileUrl(pptFileInfo.get("saveName").toString());
            } else { // 上传出错
                return ajaxReturn(response, null, pptFileInfo.get("errorMsg").toString(), 0);
            }
            data.put("pptUrl", pptFileInfo.get("saveName").toString());
        }

        return ajaxReturn(response, data, "上传完毕", 1);
    }


}
