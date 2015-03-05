package fr.smile.actions;

import org.jahia.bin.Action;
import org.jahia.bin.ActionResult;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;
import org.jahia.services.content.JCRSessionWrapper;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;
import java.lang.*;

public class Bark extends Action {
	
	private static final Logger logger = LoggerFactory.getLogger(Bark.class);

	public ActionResult doExecute(HttpServletRequest req, RenderContext renderContext, Resource resource, JCRSessionWrapper session, Map<String, List<String>> parameters, URLResolver urlResolver) throws Exception {
		//logger.warn("****" + resource.getNode().getUser() + "****");

		logger.warn("Woof Woof");
		return null;
	}
}