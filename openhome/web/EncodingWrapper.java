package cc.openhome.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncodingWrapper extends HttpServletRequestWrapper {
    private String ENCODING;	//构造函数先把ENCODING获取
    public EncodingWrapper(HttpServletRequest request, String ENCODING) {    	
        super(request);// 将request交给父类，以便于调用对应方法的时候，将其输出
        this.ENCODING = ENCODING;
    }
    
    @Override
    public String getParameter(String name) {	//获取方法的名字
        String value = getRequest().getParameter(name);	//获取参数
        if(value != null) {
            try {
                byte[] b = value.getBytes("ISO-8859-1");//对b内的东西用ISO-8859-1编码,value是返回的字符串
                value = new String(b, ENCODING);
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException(e);   
            }
        }
        return value;
    }
    
    

}
