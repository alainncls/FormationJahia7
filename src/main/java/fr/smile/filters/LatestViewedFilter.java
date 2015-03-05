package fr.smile.filters;

import java.util.LinkedList;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.filter.AbstractFilter;
import org.jahia.services.render.filter.RenderChain;

public class LatestViewedFilter extends AbstractFilter {

	private static final int maxElements = 50;

	public String prepare(RenderContext renderContext, Resource resource, RenderChain chain) {
		LinkedList<String> latestViewed = (LinkedList<String>)renderContext.getRequest().getSession().getAttribute("latestViewedDogs");
		if (latestViewed == null) {
			latestViewed = new LinkedList<String>();
		}

		String nodePath = resource.getNode().getPath();
		int i = latestViewed.indexOf(nodePath);

		if (i >= 0) {
			latestViewed.remove(i);
		}

		latestViewed.addFirst(nodePath);

		if (latestViewed.size() > maxElements) {
			latestViewed.removeLast();
		}

		renderContext.getRequest().getSession().setAttribute("latestViewedDogs", latestViewed);
		
		return null;
	}
}