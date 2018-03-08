package cn.com.xiaoyaoji.plugin.doc;

import cn.com.xiaoyaoji.core.plugin.doc.DocEvPlugin;

/**
 * @author zhoujingjie
 *         created on 2017/6/21
 */
public class RichtextDocPlugin extends DocEvPlugin {

    @Override
    public String getEditPage() {
        return "richtext/edit.ftl";
    }

    @Override
    public String getViewPage() {
        return "richtext/view.ftl";
    }

}
