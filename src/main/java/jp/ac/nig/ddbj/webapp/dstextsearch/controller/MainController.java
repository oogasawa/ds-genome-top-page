package jp.ac.nig.ddbj.webapp.dstextsearch.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.StringBufferInputStream;
import java.util.TreeMap;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

/**
 * Controller that demonstrates tiles mapping, reguest parameters and path variables.
 * 
 * @author Mark Meany
 */
@Controller
public class MainController {
	private Log log = LogFactory.getLog(this.getClass());

	@Value("${datafile}")
	String datafile;

	@Value("${baseurl}")
	String baseUrl;

	@Value("${jbrowseurl}")
	String jbrowseUrl;

	@Value("${textsearchurl}")
	String textsearchUrl;

	@Value("${blasturl}")
	String blastUrl;

	@Value("${blaturl}")
	String blatUrl;


    @RequestMapping(value = "/", method=GET)
	public ModelAndView home() {

    	TreeMap<String, String> model = parse();

    	model.put("jbrowseUrl", baseUrl + "/" + jbrowseUrl);
    	model.put("textsearchUrl", baseUrl + "/" + textsearchUrl);
    	model.put("blastUrl", baseUrl + "/" + blastUrl);
    	model.put("blatUrl", baseUrl + "/" + blatUrl);

    	return new ModelAndView("site.homepage", model);
	}


	public TreeMap<String, String> parse() {
    	// Dummy implementation.
    	TreeMap<String, String> model = new TreeMap<>();
    	return model;
	}


	/*
	@RequestMapping(value = "/greet", method=RequestMethod.GET)
	public ModelAndView greet(@RequestParam(value = "name", required=false, defaultValue="World!")final String name, final Model model) {
		log.info("Controller has been invoked with Request Parameter name = '" + name + "'.");
		return new ModelAndView("site.greeting", "name", name);
	}
	*/

	@RequestMapping(value = "/greet/{name}", method=RequestMethod.GET)
	public ModelAndView greetTwoWays(@PathVariable(value="name") final String name, final Model model) {
		log.info("Controller has been invoked with Path Variable name = '" + name + "'.");
		return new ModelAndView("site.greeting", "name", name);
	}

}
