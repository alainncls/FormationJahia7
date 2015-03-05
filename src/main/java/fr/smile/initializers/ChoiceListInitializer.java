package fr.smile.initializers;

import org.jahia.services.content.JCRPropertyWrapper;
import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.ValueImpl;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.services.content.nodetypes.renderer.AbstractChoiceListRenderer;
import org.jahia.services.content.nodetypes.renderer.ModuleChoiceListRenderer;
import org.jahia.services.render.RenderContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.PropertyType;
import javax.jcr.RepositoryException;
import javax.jcr.Value;
import java.util.*;

public class ChoiceListInitializer extends AbstractChoiceListRenderer implements ModuleChoiceListInitializer, ModuleChoiceListRenderer {

    private static final Logger logger = LoggerFactory.getLogger(ChoiceListInitializer.class);

    private String key;

    private List<String> colors = Arrays.asList("red", "white", "black");
    private List<String> colors_fr = Arrays.asList("roux", "blanc", "noir");

    /**
     * {@inheritDoc}
     */
    public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param, List<ChoiceListValue> values, Locale locale, Map<String, Object> context) {

        List<ChoiceListValue> myChoiceList = new ArrayList<ChoiceListValue>();

        if (context == null) {
            return myChoiceList;
        }
        
        
        int i = 0;
        for (String color : getColors(locale)) {
            myChoiceList.add(new ChoiceListValue( color, Integer.toString(i) ) );
            i++;
        }

        //Return the list
        return myChoiceList;
    }

    /**
     * {@inheritDoc}
     */
    public void setKey(String key) {
        this.key = key;
    }

    /**
     * {@inheritDoc}
     */
    public String getKey() {
        return key;
    }

    public List<String> getColors(Locale locale) {
        return (locale.getLanguage() == Locale.FRENCH.getLanguage())?colors_fr:colors;
    }

    /**
     * {@inheritDoc}
     */
    public String getStringRendering(RenderContext context, JCRPropertyWrapper propertyWrapper) throws RepositoryException {
        final StringBuilder sb = new StringBuilder();

        List<String> colorList = getColors(context.getUILocale());
        int i;

        if (propertyWrapper.isMultiple()) {
            final Value[] values = propertyWrapper.getValues();
            for (Value value : values) {
                i = Integer.parseInt(value.getString());
                sb.append(colorList.get(i)).append(", ");
            }
        } else {
            i = Integer.parseInt(propertyWrapper.getValue().getString());
            sb.append(colorList.get(i));
        }

        return sb.toString();
    }

    /**
     * {@inheritDoc}
     */
    public String getStringRendering(Locale locale, ExtendedPropertyDefinition propDef, Object propertyValue) throws RepositoryException {
        int i = (Integer)propertyValue;
        return getColors(locale).get(i);
    }
}
