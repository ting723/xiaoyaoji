package cn.com.xiaoyaoji.plugin.login;

/**
 * @author: zhoujingjie
 * @Date: 16/9/2
 */
public class BaseAccessToken {
    private String access_token;

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public BaseAccessToken(String access_token) {
        this.access_token = access_token;
    }

    public BaseAccessToken() {
    }
}
