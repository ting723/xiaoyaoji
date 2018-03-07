package cn.com.xiaoyaoji.plugin.docformatter.paragraph2;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;

public class AsianFontProvider extends XMLWorkerFontProvider {

    @Override
    public Font getFont(final String fontname, final String encoding,
                        final boolean embedded, final float size, final int style,
                        final BaseColor color) {
        return new Font(BaseInfo.cjkFont, 10.5f, Font.NORMAL, BaseColor.BLACK);
    }
}