package cn.com.xiaoyaoji.plugin.util;

import cn.com.xiaoyaoji.core.common.Constants;
import cn.com.xiaoyaoji.core.plugin.Plugin;
import cn.com.xiaoyaoji.core.plugin.PluginInfo;
import cn.com.xiaoyaoji.core.plugin.PluginManager;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

/**
 * Author : zhanglianwei
 * Create : 2018/3/7 18:16
 * Update : 2018/3/7 18:16
 * Descriptions : 新的插件加载器
 *
 * @author zhanglw
 */
@Component
public class PluginTools {

    private static Logger logger = LoggerFactory.getLogger(PluginTools.class);

    /**
     * 加载Plugin
     *
     * @param pluginJsonFile plugin json文件
     */
    private static void loadPlugin(File pluginJsonFile) {
        if (pluginJsonFile == null || !pluginJsonFile.exists()) {
            return;
        }
        ClassLoader classLoader = ClassLoader.getSystemClassLoader();
        try (InputStream in = new FileInputStream(pluginJsonFile)) {
            String content = IOUtils.toString(in, Constants.UTF8.displayName());
            List<PluginInfo> pluginInfos = JSON.parseObject(content, new TypeReference<List<PluginInfo>>() {
            });
            for (PluginInfo pluginInfo : pluginInfos) {
                Plugin plugin = (Plugin) classLoader.loadClass(pluginInfo.getClazz()).newInstance();
                plugin.setPluginInfo(pluginInfo);
                pluginInfo.setPlugin(plugin);
                PluginManager.getInstance().register(pluginInfo);
            }
        } catch (Exception e) {
            logger.error(pluginJsonFile.getAbsolutePath(), e);
        }
    }

    @PostConstruct
    public void initPlugin() {

        String pluginPath = PluginTools.class.getClassLoader().getResource("plugins").getPath();
        // 加载文档类型json
        loadPlugin(new File(pluginPath + File.separator + "doc-plugin.json"));
        loadPlugin(new File(pluginPath + File.separator + "login-plugin.json"));
        loadPlugin(new File(pluginPath + File.separator + "pdf-plugin.json"));
    }

}
